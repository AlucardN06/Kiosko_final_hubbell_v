-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2024 at 10:45 PM
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
-- Database: `id19951970_localhost`
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
-- Table structure for table `approvals`
--

CREATE TABLE `approvals` (
  `id` int(11) NOT NULL,
  `proposal_id` varchar(255) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `action` enum('Aprobado','Rechazado') NOT NULL,
  `reject_reason` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `proposal_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `Genero` varchar(50) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Posicion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `citas_cupos`
--

CREATE TABLE `citas_cupos` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `cupos` int(11) DEFAULT NULL,
  `razon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `citas_cupos`
--

INSERT INTO `citas_cupos` (`id`, `fecha`, `cupos`, `razon`) VALUES
(3, '2024-07-27', 7, 'Donacion de sangre'),
(4, '2024-08-05', 19, 'Chequeo de Hipertension');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `date`, `location`, `description`, `image`) VALUES
(14, 'Dia de las madres', '2024-05-31', 'Fwfq', 'Wqqwrdw', 'uploads/Fondo1.jpeg'),
(15, 'Dfewf', '2024-05-31', 'Fwqdq', 'Wdqwd', 'uploads/IMG_0001.jpeg'),
(16, 'Fcc', '2024-05-31', 'fctfcf', 'Ugvfvtyfug', 'uploads/IMG_0035.jpeg'),
(20, 'asa', '2024-06-21', 'sda', 'sadsd', 'uploads/Fondo.jpeg'),
(22, 'Alalal', '2024-08-31', 'Slsls', 'Slslsls', 'uploads/1000072425.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `extravios`
--

CREATE TABLE `extravios` (
  `id` int(11) NOT NULL,
  `numero_reloj` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `costo` decimal(10,2) DEFAULT 40.00,
  `pendiente` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extravios_sodexo`
--

CREATE TABLE `extravios_sodexo` (
  `id` int(11) NOT NULL,
  `numero_reloj` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `motivo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pendiente` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `extravios_sodexo`
--

INSERT INTO `extravios_sodexo` (`id`, `numero_reloj`, `nombre`, `fecha_hora`, `motivo`, `pendiente`) VALUES
(2, '118849', ' Diana Laura Berdeja Carrillo', '2024-07-26 23:43:22', 'Vencimiento', 1),
(3, '128768', ' Maribel Sarahi Leyva Novella', '2024-08-01 20:10:54', 'Vencimiento', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fechas_disponibles`
--

CREATE TABLE `fechas_disponibles` (
  `Id` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Cupos` int(11) NOT NULL,
  `Posicion` varchar(255) DEFAULT NULL,
  `vacan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fechas_disponibles`
--

INSERT INTO `fechas_disponibles` (`Id`, `Fecha`, `Cupos`, `Posicion`, `vacan_id`) VALUES
(25, '2024-07-26', 2, 'operador', 31);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `file_name`, `file_path`) VALUES
(4, 'Menu-Semanal.jpg', 'uploads/Menu-Semanal.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `operators`
--

CREATE TABLE `operators` (
  `id` int(11) NOT NULL,
  `supervisor_reloj_number` varchar(255) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `supervisor_id` int(11) NOT NULL,
  `supervisor_firstname` varchar(255) DEFAULT NULL,
  `supervisor_lastname` varchar(255) DEFAULT NULL,
  `schedule` varchar(255) NOT NULL,
  `proposal_date` date NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `plant` varchar(255) NOT NULL,
  `colony` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `week_number` int(11) DEFAULT NULL,
  `hours_worked` decimal(5,2) DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `extra_time_reason` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `operators`
--

INSERT INTO `operators` (`id`, `supervisor_reloj_number`, `employee_id`, `supervisor_id`, `supervisor_firstname`, `supervisor_lastname`, `schedule`, `proposal_date`, `firstname`, `lastname`, `area`, `plant`, `colony`, `username`, `week_number`, `hours_worked`, `start_time`, `end_time`, `extra_time_reason`, `department`) VALUES
(261, '74051', 4780, 4820, ' Maribel', 'Duran Navarro', '09:52-21:50', '2024-08-15', ' Manuel Eduardo', 'Romero Meza', 'Asistente De RH', '1', 'Sauzal DB', '97106', NULL, NULL, '09:52:00', '21:50:00', 'FWF', 'HUS'),
(263, '74051', 4779, 4820, ' Maribel', 'Duran Navarro', '13:16-01:16', '2024-08-03', ' Francisco Emmanuel', 'Rodriguez Zubiate', 'Asistente De RH', '1', 'Solidaridad', '86646', NULL, NULL, '13:16:00', '01:16:00', 'inventario', 'HUS'),
(264, '74051', 4780, 4820, ' Maribel', 'Duran Navarro', '13:16-01:16', '2024-08-03', ' Manuel Eduardo', 'Romero Meza', 'Asistente De RH', '1', 'Sauzal DB', '97106', NULL, NULL, '13:16:00', '01:16:00', 'inventario', 'HUS');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `question_id`, `text`) VALUES
(1, 3, 'fasfa'),
(2, 3, 'dsdsadsadas'),
(3, 3, 'sdsada'),
(4, 3, 'asdsdas'),
(5, 13, 'sadsad'),
(6, 13, 'sadsda'),
(7, 14, 'asdsada'),
(8, 20, 'sdsdsd');

-- --------------------------------------------------------

--
-- Table structure for table `pdfs`
--

CREATE TABLE `pdfs` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pdfs`
--

INSERT INTO `pdfs` (`id`, `file_name`, `file_path`) VALUES
(7, 'PROCESO PROMOCION IDL.pdf', 'uploads/PROCESO PROMOCION IDL.pdf'),
(8, 'PROCESO PROMOCION SALARY.pdf', 'uploads/PROCESO PROMOCION SALARY.pdf'),
(9, 'Movimiento de Promocion Editable.pdf', 'uploads/Movimiento de Promocion Editable.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `type` enum('textbox','single','multiple') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `survey_id`, `text`, `type`) VALUES
(1, 1, 'ffjasdjsida', ''),
(2, 1, '', 'single'),
(3, 1, '', ''),
(4, 1, 'sdsadasd', ''),
(5, 1, '', 'multiple'),
(6, 1, 'sdasd', ''),
(7, 1, '', 'textbox'),
(8, 1, 'sadad', ''),
(9, 1, '', 'textbox'),
(10, 1, 'asdsdas', ''),
(11, 1, '', 'textbox'),
(12, 2, 'sadad', ''),
(13, 2, '', 'single'),
(14, 2, 'asdsdas', ''),
(15, 2, '', 'textbox'),
(16, 2, 'asdasdasd', ''),
(17, 2, '', 'multiple'),
(18, 2, 'dsadsa', ''),
(19, 2, '', 'textbox'),
(20, 3, 'sdsada', ''),
(21, 3, '', 'single'),
(22, 4, 'Nombre', ''),
(23, 4, '', 'textbox'),
(24, 4, 'Apellido', ''),
(25, 4, '', 'textbox'),
(26, 4, 'Tipo de sangre', ''),
(27, 4, '', 'single'),
(28, 4, '', ''),
(29, 4, '', ''),
(30, 4, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `recomendaciones`
--

CREATE TABLE `recomendaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `genero` enum('Masculino','Femenino','Prefiero no decirlo') NOT NULL,
  `posicion` varchar(255) NOT NULL,
  `confirmNumber` varchar(10) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `registro_citas`
--

CREATE TABLE `registro_citas` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `plant` varchar(255) DEFAULT NULL,
  `Supervisor_name` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `razon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registro_citas`
--

INSERT INTO `registro_citas` (`id`, `firstname`, `lastname`, `username`, `area`, `plant`, `Supervisor_name`, `department`, `fecha`, `razon`) VALUES
(4, ' Diana Laura', 'Berdeja Carrillo', '118849', 'Asistente De RH', '1', 'Maribel Duran Navarro', 'HUS', '2024-07-27', 'Donacion de sangre'),
(5, ' Manuel Eduardo', 'Romero Meza', '97106', 'Asistente De RH', '1', 'Maribel Duran Navarro', 'HUS', '2024-07-27', 'Donacion de sangre'),
(6, 'Mirian Yesenia ', 'Cabrera', '548', 'Directora de RH', '1', '', '', '2024-07-27', 'Donacion de sangre'),
(7, ' Maribel Sarahi', 'Leyva Novella', '128768', 'Operador General', '1', 'Fabiola Ramon', 'HUS', '2024-07-27', 'Donacion de sangre'),
(8, ' Maribel Sarahi', 'Leyva Novella', '128768', 'Operador General', '1', 'Fabiola Ramon', 'HUS', '2024-08-05', 'Chequeo de Hipertension');

-- --------------------------------------------------------

--
-- Table structure for table `reposiciones`
--

CREATE TABLE `reposiciones` (
  `id` int(11) NOT NULL,
  `numero_reloj` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `pendiente` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reposiciones`
--

INSERT INTO `reposiciones` (`id`, `numero_reloj`, `nombre`, `fecha_hora`, `pendiente`) VALUES
(2, '118849', ' Diana Laura Berdeja Carrillo', '2024-07-26 23:43:10', 1),
(3, '128768', ' Maribel Sarahi Leyva Novella', '2024-08-01 20:12:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reposiciones_sodexo`
--

CREATE TABLE `reposiciones_sodexo` (
  `id` int(11) NOT NULL,
  `numero_reloj` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `motivo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pendiente` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `votacion_enabled` tinyint(1) DEFAULT 0,
  `votacion_ena` tinyint(1) NOT NULL DEFAULT 0,
  `votacion_ant` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `votacion_enabled`, `votacion_ena`, `votacion_ant`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `surveys`
--

CREATE TABLE `surveys` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `surveys`
--

INSERT INTO `surveys` (`id`, `title`, `description`, `created_at`) VALUES
(1, 'Donacion Sanguinea', 'dafasf', '2024-07-03 14:53:58'),
(2, 'Donacion Sanguinea', 'fawf', '2024-07-03 14:54:38'),
(3, 'asdad', 's', '2024-07-03 14:56:42'),
(4, 'Donacion Sanguinea', 'si', '2024-07-03 15:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `temporary_approvals`
--

CREATE TABLE `temporary_approvals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `approve_user_id` int(11) NOT NULL,
  `expiration_time` datetime NOT NULL,
  `username` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `temporary_approvals`
--

INSERT INTO `temporary_approvals` (`id`, `user_id`, `approve_user_id`, `expiration_time`, `username`) VALUES
(47, 4820, 4783, '2024-07-27 17:44:53', '74051');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `colony` varchar(255) DEFAULT NULL,
  `position` varchar(50) NOT NULL,
  `area` varchar(50) NOT NULL,
  `plant` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `supervisor_name` varchar(255) DEFAULT NULL,
  `supervisor_reloj_number` varchar(50) NOT NULL,
  `deparment` varchar(50) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `colony`, `position`, `area`, `plant`, `username`, `password`, `birthdate`, `supervisor_name`, `supervisor_reloj_number`, `deparment`, `fecha_ingreso`) VALUES
(6, 'Jose', 'Gonzalez', 'Las torres', 'B', 'Moldeo', '2', '44554', '$2y$10$M6wTImepPXbBJUpcvOc4vO3M1Ty/KEfZNqsFFqtBKdx/m241R6O.i', '1998-08-18', 'Chum lee', '', NULL, NULL),
(4777, ' Mayra Cristina', 'Hernandez Flores', 'Riveras del Bravo', 'A', 'Asistente De RH', '1', '60708', '$2y$10$iVxUoBQl0FeJK1wnlHHwee1ITYF8ux9mc7KfkkvtCDC8sDdrMrbja', '1990-01-20', 'Guillermina Martinez Herrera', '70557', 'HUS', '2018-04-02'),
(4778, ' Ivet Del Carmen', 'Mauricio Delgado', 'Olivia Espinoza', 'A', 'Asistente De RH', '1', '84585', '$2y$10$rxKzDkb34f0xBntQMYE1aOv/iYUfrCwin/.fwNfSzwZtBqqzdvOgO', '1980-10-22', 'Guillermina Martinez Herrera', '70557', 'HUS', '2005-03-01'),
(4779, ' Francisco Emmanuel', 'Rodriguez Zubiate', 'Solidaridad', 'A', 'Asistente De RH', '1', '86646', '$2y$10$38pxd3j1SbmLa4kmzmA5VeY8wB71wHRHzyJp8FLp/jQll8zFkgBcW', '1989-12-14', 'Maribel Duran', '74051', 'HUS', '2019-05-27'),
(4780, ' Manuel Eduardo', 'Romero Meza', 'Sauzal DB', 'A', 'Asistente De RH', '1', '97106', '$2y$10$WeHuSKjkvd72NYQKMyj7t..rqJ5HcjTzLVrxFHzu3vN13anQaC2t.', '1994-03-09', 'Maribel Duran', '74051', 'HUS', '2020-06-15'),
(4781, ' Elizabeth', 'Cardenas Parga', 'Praderas de los Oasis', 'A', 'Asistente De RH', '1', '109079', '$2y$10$uVO.OXNEF866casPcBR05.66/H8mZimv3kGYLa7y.DyTyoALGKiRO', '1992-07-15', 'Guillermina Martinez Herrera', '70557', 'HUS', '2021-08-19'),
(4782, ' Diana Michelle', 'Hernandez Oviedo', 'Paraje de Oriente', 'A', 'Asistente De RH', '1', '109095', '$2y$10$zoDcdHsAtpfUPhKJ30Rjju95Ae1FuPg/Y5fiBkym/jd.eSlEPMcYC', '1996-05-08', 'Mayra Lizette LÃ³pez Contreras', '70709', 'HUS', '2021-08-20'),
(4783, ' Diana Laura', 'Berdeja Carrillo', 'Jardinez de satelite', 'A', 'Asistente De RH', '1', '118849', '$2y$10$UqgubHB3g.w.2GwoZF5amudaKPV20GDdN/NhmlISZgOMIDUuz2yWC', '1998-09-11', 'Maribel Duran', '74051', 'HUS', '2022-11-01'),
(4784, ' Lesli Judith', 'Rodriguez Caballero', 'Paraje de Oriente', 'A', 'Asistente De RH', '1', '119943', '$2y$10$e3.pvlQNtk/AGrskSTi0GetPcOuqwmEqTzf2xc7axU8XqHQ8Vopg2', '1996-07-09', 'Mirian Yesenia Cabrera', '548', 'HUS', '2023-01-16'),
(4785, ' Manuel Alejandro', 'Marmolejo Gutierrez', 'Infonavit Solidaridad', 'A', 'Asistente De RH', '1', '121614', '$2y$10$4VP3MZNapToZiVOmXooku.RU15KMAwVGWBBZ77vBHogIiQXAQGbLK', '1990-05-28', 'Victor Josue Moctezuma Gates', '61122', 'HUS', '2023-05-11'),
(4786, ' Jonathan Alejandro', 'Hernandez Palos', 'Infonavit Salvarcar', 'A', 'Asistente De RH', '1', '122386', '$2y$10$ewMyTsK2e88B1gCKeUEDhurugl6G6sgsnljNXtQY4k3HNSVzUKQna', '1993-08-11', 'Victor Josue Moctezuma Gates', '61122', 'HUS', '2023-07-10'),
(4787, ' Blanca Azucena', 'Castro Rios', 'Cond Moradas Del Porvenir', 'A', 'Asistente De RH', '1', '124312', '$2y$10$hGl08KV2uNUBBnHLgbLK3ewt0b0y24Py7mZcx5T/nTPlrH40oDKRO', '1996-12-28', 'Mayra Lizette LÃ³pez Contreras', '70709', 'HUS', '2023-10-16'),
(4788, ' Oscar Fernando', 'Garavito Loya', 'Ampliacion Aeropuerto', 'A', 'Asistente De RH', '1', '127644', '$2y$10$lxoL/WnvMwkk9ApcUx/JN.qc3rXqLM3Ty6LEyT.IXJMQvhYdmrucO', '1989-01-05', 'Mayra Lizette LÃ³pez Contreras', '70709', 'HUS', '2024-02-26'),
(4789, ' Janet', 'Solorzano Ferrari', 'Alicia Carrillo', 'AB', 'HUMAN RESOURCES OP SERV LEADER', '1', '22578', '$2y$10$7Hyr8XJ5Fik9tTig58sNU.5XlEpVK.oOwfhMEGl5qHbg.TPJ.yCea', '1978-10-18', 'Pamela Johnson', '11640', 'HUS', '2022-01-31'),
(4790, ' Jose Refugio', 'Diaz Verdeja', 'Paseos del Alba', 'AB', 'Superintendente de Produccion', '1', '24705', '$2y$10$eJ36VOjFL4XUSiOKC4qiouda9R/NzXUb8sK0rjWyIhGihHChTqb1C', '1969-01-10', 'John Brown', '2875', 'HES', '1995-05-15'),
(4791, ' Juan Luis', 'Ordaz Martinez', 'Ampliacion Aeropuerto', 'AB', 'Superintendente De Mantenimiento', '1', '24710', '$2y$10$h3KmmnKUmlgbc/1K126FKeVVuSqTYDG4kBBhx8xk2AYgxRrgcFC9e', '1977-03-08', 'Duran Camacho, Noel Roberto', '25668', 'HUS', '1998-05-18'),
(4792, ' Fernando', 'Martinez Gonzalez', 'Hacienda las Lajas', 'AB', 'Superintendente de Manufactura', '1', '24731', '$2y$10$jx0HUA44fEx8fjHedI6rMekMxZGtS7Cm1isxCsayp6btzdOa2Didy', '1971-09-11', 'Ivan Valero', '24932', 'HES', '1996-09-02'),
(4793, ' Lilia Veronica', 'Sosa Rascon', 'Del Real', 'AB', 'Gerente de Mejora Continua', '1', '24858', '$2y$10$JZ3FpDpxiKX4rEvf2tidv.n5gTR.cS.85QaRGtEK4FRzBcNCmtFe2', '1979-02-14', 'Shyam Gangadharan', '76925', 'HES', '2000-09-05'),
(4794, ' Francisco Javier', 'Castillo Rivera', 'Lomas del Rey', 'AB', 'Superintendente de Calidad', '1', '24880', '$2y$10$tnFvrpeiJ2PhRNrgxzq2VudrZQuWgxjK3YiIfm7jskdjDRIe2aCFm', '1979-04-07', 'Vitor Oliveira', '1510', 'HES', '2002-10-07'),
(4795, ' Jose Alfredo', 'Erives Ontiveros', 'Reserva sur', 'AB', 'Gerente de Aduanas y Logistica', '1', '24922', '$2y$10$nLpbW8TiIVjyQzHacqXgr.CxXWQnWQKznEee7E72FYI7eqZqU/ipq', '1977-03-04', 'Silvia Patricia Carrillo Orozc', '101146', 'HUS', '2005-05-18'),
(4796, ' Antonio Eduardo', 'Aveytia BaÃ±uelos', 'Las Aldabas', 'AB', 'Gerente de Materiales Sr', '2', '25076', '$2y$10$vAjHB0xqRwAsfMplZnVi2.H9BItvJAVZhzpPQ4Kx.3ydBpLZAHli2', '1977-08-14', 'Arturo Jairhzino Hamilton Olag', '75691', 'HUS II', '2007-11-14'),
(4797, ' Jose Ramon', 'Leyva Corral', 'Fracc. Paseo de las Palma', 'AB', 'Superintendente de Ingenieria', '2', '25229', '$2y$10$MQc43uWDIV8W8SuvgLZDC.bVO0tkhhrn4jqqBgHQ9k23nTGUZT7L6', '1976-05-22', 'Arturo Jairhzino Hamilton Olag', '75691', 'HUS II', '2010-09-27'),
(4798, ' Juan Ramon', 'Becerra Ramirez', 'Galeana Hermenegildo', 'AB', 'Superintendente de Produccion', '2', '25259', '$2y$10$oMpZeXNizm90o17iWq15a.2NHPGLPR41oIj7UZbMG6gOzHFKLudfi', '1984-07-27', 'Arturo Jairhzino Hamilton Olag', '75691', 'HUS II', '2011-01-24'),
(4799, ' Jose Luis', 'Favela Alvarado', 'Montealto', 'AB', 'Superintendente de Tool Room', '1', '25333', '$2y$10$ataB0X9DkV2gldZpCZnb.uur4Zj3SSpD2MHPybW6EN6meOFi8nH8O', '1966-03-23', 'Ivan Valero', '24932', 'HES', '2024-04-22'),
(4800, ' Sergio Yocet', 'Galvan Orozco', 'Santa Monica', 'AB', 'Superintendente de Aduanas', '1', '25369', '$2y$10$/SnaRFCDCBYv2WE9u8RnteelHhn1inLJriBtQ9QZPz0n1VtMLQ1iC', '1985-08-08', 'Erives Ontiveros, Jose Alfredo', '24922', 'HUS', '2016-10-17'),
(4801, ' Hector Javier', 'Barcenas Avila', 'Fraccionamiento Valle del', 'AB', 'Superintendente de Aduanas', '1', '25379', '$2y$10$iwewMIUGGhLqekGkFqbxE.hrxTi7NqntZYzBTYWuF2pG3d4SIWQNm', '1974-01-05', 'Erives Ontiveros, Jose Alfredo', '24922', 'HUS', '2011-11-09'),
(4802, ' Noel Roberto', 'Duran Camacho', 'Paseo de los Virreyes', 'AB', 'Gerente de Ingenieria y Mtto', '1', '25668', '$2y$10$3ABnYqcumo/ihUSnAnz0tuXIjtWkZ3LNFTDr6czZFEH5sxxmBR3dC', '1971-12-02', 'Shyam Gangadharan', '76925', 'HUS', '2002-10-21'),
(4803, ' Cesar Manuel', 'Enriquez Rodriguez', 'Rincones de Oriente', 'AB', 'Superintendente de Produccion', '2', '25784', '$2y$10$YOvQVJdYeW88eOTy4fp4EOp8KHkqbeRneL28JM3icTmvtOGNWapDW', '1972-10-27', 'Arturo Jairhzino Hamilton Olag', '75691', 'HUS II', '2008-02-08'),
(4804, ' Maria Gabriela', 'Flores Morales', 'Vistas del bravo 3', 'AB', 'Gerente de Contabilidad de Costos', '1', '37732', '$2y$10$cG1sQtqCquCh7.J51ayq.etGlUAijxM8Kph/dG79/7dHvJfZGHM.q', '1987-09-22', 'Rachel Reynolds', '65952', 'HES', '2021-08-18'),
(4805, ' Omar', 'Santillan Bojorquez', 'Paseos de las Palmas', 'AB', 'Superintendente Ing Procesos', '1', '41562', '$2y$10$aT.OqSEqmp5jQvBBFuoM8e2MbtT1wkbcETYojv6TAmqioDMSkjASO', '1977-01-19', 'John Brown', '2875', 'HES', '2016-06-13'),
(4806, ' Rene', 'Sanchez Cordova', 'Fracc Jardines de San Pa', 'AB', 'Superintendente de Produccion', '1', '41563', '$2y$10$xd2ZH/Gv3rY8O7RiFNBDGO.nddxuoXI1KVoPrKB0WMC8sG9igLvge', '1980-01-19', 'John Brown', '2875', 'HES', '2016-04-04'),
(4807, ' Jorge Luis', 'Reyna Malaga', 'Colinas del Sur', 'AB', 'Superintendente de Produccion', '1', '46058', '$2y$10$gqib1WDQl8aVSABM0YloVuiehIZd7VaDzlgel7/.jU0MJyns25vbK', '1975-04-17', 'John Brown', '2875', 'HES', '2017-06-19'),
(4808, ' Gabriela Anahi', 'Sagarnaga Rodriguez', 'Topacio Residencial', 'AB', 'Production Manager', '1', '60675', '$2y$10$8WC/RDdHT88JM0xm4T7lH.biefJ9/rFl/WnS3CuxSYHzQk0SsJ07u', '1989-03-07', 'David Melchor', '74076', 'HES', '2018-02-19'),
(4809, ' Victor Josue', 'Moctezuma Gates', 'Las Torres', 'AB', 'Hrbp Lider Recursos Humanos', '1', '61122', '$2y$10$sKieIlIDxXe225K0VZiGjuZRPCwdvskYbLQck7x1GuUVcnbM2ve9u', '1988-09-23', 'Mirian Yesenia Cabrera', '548', 'HUS', '2018-10-22'),
(4810, ' Abril Azeneth', 'Ibarra Franco', 'Country Senecu', 'AB', 'Gerente de Calidad', '1', '68171', '$2y$10$LQnhQ6lToRq5vG11w4oa8.NoiI3kK.HwSgv8MgvNLtIKK1QEx5p2.', '1981-02-28', 'Valles Rodriguez Ramon Eduardo', '98382', 'HUS', '2021-12-06'),
(4811, ' Guillermina', 'Martinez Herrera', 'Veneros Residencial', 'AB', 'Hrbp Lider Recursos Humanos', '1', '70557', '$2y$10$1w5M/KqA/w6GC10WWDkQvuU9j6/wKXTzaq8ZkA3NxG2WAwZpafosa', '1971-07-02', 'Mirian Yesenia Cabrera', '548', 'HUS', '2022-06-06'),
(4812, ' Cynthia Guadalupe', 'NuÃ±ez Diaz', 'Insurgentes', 'AB', 'Gerente de Finanzas', '1', '70902', '$2y$10$Xu/BfRoDpXJaXlJnoVUWYOo/7p07MareC2VC/21peHWzaSXserTMm', '1986-10-05', 'Alicia Trejo Franco', '76773', 'HUS', '2022-07-04'),
(4813, ' Fernando', 'De la O Alvarez', 'Paseo Santa Monica', 'AB', 'Superintendente De Mantenimiento', '1', '70963', '$2y$10$t5DrxG8Xcd7XxLSKeUO2qeCcQc8M5476w5LODyMlPn57roS9Zs/52', '1976-11-28', 'Duran Camacho, Noel Roberto', '25668', 'HUS', '2022-07-11'),
(4814, ' Norma Angelica', 'Moreno ', 'Fraccionamiento Tecnologi', 'AB', 'Superintendente de Produccion', '1', '71094', '$2y$10$1/kto8R9Yykw2zE1aAYQXul6aAf.IKtbCr5TmSs.K3LS5JskHh1QG', '1971-01-16', 'Cesar Javier Armendariz Moriel', '73910', 'HUS', '2022-07-18'),
(4815, ' Alejandro', 'Jauregui Sanchez', 'Barcena', 'AB', 'Superintendente De Mantenimiento', '2', '71145', '$2y$10$lkhUvSh6PrPVUGRSDsBmBOJ4KUAhXLNVr/TqIlos4DvhmiFS9.n.K', '1987-10-01', 'Arturo Jairhzino Hamilton Olag', '75691', 'HUS II', '2022-07-25'),
(4816, ' Raymundo', 'Fernandez Delgado', 'Jardines de San Carlos I', 'AB', 'Superintendente de Produccion', '1', '71226', '$2y$10$iT1FC3g8aWQNDoGR4jllz.td6b9qUWfdmd7wSudvQDJ8j7qGIk84W', '1994-07-29', 'Adalberto Suarez Marin', '66069', 'HUS', '2022-08-01'),
(4817, ' Guillermo', 'Moreno Salcido', 'Paseo del Real', 'AB', 'Superintendente de Produccion', '1', '72011', '$2y$10$YNNREc0E3h6iw0fbtcZIoO6I9Nei/5QldNmDMjsTvGIZoZEywiogC', '1972-12-17', 'Adalberto Suarez Marin', '66069', 'HUS', '2022-09-26'),
(4818, ' Cesar Javier', 'Armendariz Moriel', 'Hacienda la Cantera', 'AB', 'Gerente Focus Factory', '1', '73910', '$2y$10$iA79H6WmCe2MWMWM/hGF2.JRXk4jNTvhn0IL8uVpGZosGZl4HNDuO', '1977-08-18', 'Valles Rodriguez Ramon Eduardo', '98382', 'HUS', '2023-02-27'),
(4819, ' Tito', 'Melendez Martinez', 'Canto de Palermo', 'AB', 'Superintendente de Produccion', '2', '74040', '$2y$10$K289vHia/Jt5C2ESIPL6YeEo3OjW1QkzNBkWAJPvLFQHN5pjS6KTS', '1981-02-18', 'Arturo Jairhzino Hamilton Olag', '75691', 'HUSII', '2023-03-13'),
(4820, ' Maribel', 'Duran Navarro', 'Fracc. Quintas del Valle', 'AB', 'Hrbp Lider Recursos Humanos', '1', '74051', '$2y$10$Zsn9jMG9zuMhkU2SlxYizuZUVuijejH/ddH1swkQHg3P96mhxcK2m', '1974-05-05', 'Mirian Yesenia Cabrera', '548', 'HUS', '2023-03-21'),
(4821, ' Hugo Alberto', 'Gurrola Rodriguez', 'Paseo Santa Monica', 'AB', 'Gerente de Mejora Continua', '1', '75403', '$2y$10$TsFlaOyYu6wQvs.9cENDkerB0nBt5QcP9vc52RqJgTGeJThMPUMwy', '1982-07-16', 'Shyam Gangadharan', '76925', 'HUS', '2023-07-03'),
(4822, ' Arturo Jairhzino', 'Hamilton Olague', 'Hacienda de Los Nogales', 'AB', 'Gerente de Operaciones', '2', '75691', '$2y$10$oIG6dLaRi28x49eJYgT4l.kfg/3/z9Qxpnjs8aBiXoy.0OkdxN0h.', '1976-01-01', 'Hernandez Ortega Victor', '96695', 'HUS II', '2023-07-31'),
(4823, ' Nallely', 'Alvarado Aguirre', 'Reserva del Valle', 'AB', 'Gerente de Calidad', '2', '76513', '$2y$10$rn5GlTS8u9Yv53jKcHkTu.AyoGd7OXAM4C6.5d2f12jz1kXhi.PW2', '1980-02-07', 'Arturo Jairhzino Hamilton Olag', '75691', 'HUS II', '2023-09-11'),
(4824, ' Alicia', 'Trejo Franco', 'Salvarcar', 'AB', 'Finance Director', '1', '76773', '$2y$10$P1auNiHjXVO9G/VDaT4eQ.KEb3D6qCj8V8r0S7mFADbxUuImQDguq', '1970-12-25', 'Donna Figueiredo,', '72028', 'HUS', '2023-10-09'),
(4825, ' Shyam', 'Gangadharan ', 'Bosque de Chapultepec', 'AB', 'Regional Engineering Lean and Innovation Manager', '1', '76925', '$2y$10$nwf5mp02lDhCXLKE8Yazwu2ny6tKHamBVav67w9GCYZN4H8aprc4G', '1977-07-07', 'Hernandez Ortega Victor', '96695', 'HUS', '2023-10-23'),
(4826, ' Jose Rodolfo', 'AcuÃ±a Lopez', 'El Llano', 'AB', 'Regional HSE Manager', '1', '78080', '$2y$10$ZjVKwFmNdT0HNF.b8ATm5eFD5FcmA.NQq9ZMD3g7zPODNctFnrp5i', '1983-05-07', 'Hernandez Ortega Victor', '96695', 'HUS', '2024-02-26'),
(4827, ' Victor', 'Hernandez Ortega', 'Haciendas de la Paloma', 'AB', 'Regional VP of Operations', '1', '96695', '$2y$10$ya4mB8LzAS9sL40z49w41O7wSA7a6ubT.B/AONsPhUvkpJfDJ4wXq', '1972-11-11', 'David B. Smith', '12122', 'HUS', '2020-06-01'),
(4828, ' Ramon Eduardo', 'Valles Rodriguez', 'Cerrada Cipreses', 'AB', 'Gerente de Planta', '1', '98382', '$2y$10$6.2ZiTX/mCmftG1l/hX6ZeRRIH2IuzYUH6kEN3/aH4djZvZEnr/CW', '1975-11-23', 'Hernandez Ortega Victor', '96695', 'HUS', '2020-08-10'),
(4829, ' Jaime Humberto', 'Valenzuela Carbajal', 'Urbi Alameda Versalles', 'AB', 'Superintendente de Produccion', '1', '99153', '$2y$10$Bre13Lv/qFdFThiesB.8C.ArG33JXj3mrEyWHi7MwAQ3SwRScW.OK', '1988-06-08', 'Cesar Javier Armendariz Moriel', '73910', 'HUS', '2020-08-31'),
(4830, ' Gustavo Eduardo', 'Muro Soto', 'Hacienda del Nogal', 'AB', 'Warehouse Superintendent', '1', '101050', '$2y$10$k./7Okl9bzrtM9GXMJJ9p.tMlC9x/JBKir/3gX.f6scYm5Ja5Hg4a', '1976-03-08', 'Alan Pando', '75499', 'HUS', '2020-11-17'),
(4831, ' Silvia Patricia', 'Carrillo Orozco', 'Montecarlo', 'AB', 'Supply Chain Regional Manager', '1', '101146', '$2y$10$1eIzYQwlTgUJk2BTVAcT1OCi4QjoRVIF1m5zaVAPAlXnXAtL693Zm', '1976-11-03', 'Hernandez Ortega Victor', '96695', 'HUS', '2020-11-23'),
(4832, ' Luis Leopoldo', 'Villegas Vielmas', 'Paseos del Alba', 'AB', 'Gerente de Operaciones', '1', '300450', '$2y$10$q/zg9.ivqkwZwadDnehBMuFnIQrXtmmn4Z8MB6.xe.s5sHASVNI4u', '1973-11-21', 'David Melchor', '74076', 'HES', '2024-04-15'),
(4833, ' Jorge De Jesus', 'Dominguez Chairez', 'JARDINES DE SAN FCO', 'AB', 'Superintendente de Produccion', '1', '300801', '$2y$10$o1kRT1nJK0eoGN7pZSnBs.gTUlToSgl.gJEFGlYZd2P8i.OV2VT8.', '1975-04-04', 'Adalberto Suarez Marin', '66069', 'HUS', '2024-05-27'),
(4835, ' Francisco Javier', 'Urquiza Arredondo', 'Angel Trias', 'B', 'Supervisor de Almacen', '1', '24754', '$2y$10$pTQtYLfzvfPVNqKPpW4rM..VOjDG9czBEj1L5X9.VMy5X900gorFm', '1967-09-21', 'Jorge Herrera Ortiz', '75952', 'HES', '1997-08-20'),
(4836, ' Ramiro', 'Rodriguez Celaya', 'Praderas del Sur', 'B', 'Analista de Calidad', '1', '24790', '$2y$10$TxQbjnA60v3OROKDqY3CPOvrEd6b8Q8MLXIKrQ4F1jSMQAydh7c3G', '1967-03-03', 'Abril Azeneth Ibarra Franco', '68171', 'HUS', '1998-11-03'),
(4837, ' Arturo', 'Arellano Mota', 'Valle del Bravo', 'B', 'Supervisor de Produccion', '1', '24791', '$2y$10$OifFRsIx4BMA0TFhBxGI6unuR/Ehfdfdx0MGGDXhBIh8GEml3dN/i', '1965-03-18', 'Adalberto Suarez Marin', '66069', 'HUS', '1998-11-07'),
(4838, ' Maria De los Angeles', 'Cruz Romero', 'Amp. Nueva Galeana', 'B', 'Supervisor de Contabilidad', '1', '24839', '$2y$10$Lufyag6otVdAeGSii6k0RuvvxOIPL3Kn5TTubwXzm8IsnbVf8rtkm', '1976-11-01', 'MagaÃ±a Benavides, Maria Del Co', '24862', 'HUS', '2000-06-05'),
(4839, ' Maria Del Consuelo', 'MagaÃ±a Benavides', 'Paseos del Bosque', 'B', 'Accounting Manager', '1', '24862', '$2y$10$kgI3NoLAF.9JBqwWkWATEuvG83d/qhrVviQOTcCDK1I6SK1pit1fa', '1976-10-23', 'Alicia Trejo Franco', '76773', 'HUS', '2000-10-03'),
(4840, ' Ivan', 'Valero Ortega', 'Mision de los Lagos', 'B', 'Project Manager', '1', '24932', '$2y$10$neSVvQymgq7X0QNi/VXqNORX5w37/9/d3UlzTSp.FGnd.8PTk4UKu', '1978-09-02', 'Craig Leary', '300703', 'HES', '2023-06-05'),
(4841, ' Santiago', 'NuÃ±ez Maldonado', 'Parajes del Sur', 'B', 'Supervisor de Produccion', '2', '25336', '$2y$10$637iX9q7HP8.lM5Kj6y4GOZw.8dcbBSVNmIgcdLEom2rx9joFoTri', '1975-07-08', 'Leyva Corral, Jose Ramon', '25229', 'HUS II', '2023-04-20'),
(4842, ' Jesus Miguel', 'Rodriguez Rodarte', 'Jardines de San Carlos', 'B', 'Supervisor de Produccion', '1', '25437', '$2y$10$VTkuSNtMgxRnoXptDzUUDuplqCd2ANQxBmZ7dlAG3JMsB56DFdzji', '1976-12-24', 'Luis Leopoldo Villegas Vielmas', '300450', 'HES', '2023-09-04'),
(4843, ' Raul', 'Zamora Arellano', 'Praderas de la Sierra', 'B', 'Ingeniero de Manufactura', '1', '25584', '$2y$10$USAf3wvWDK.Wf/edChe4CeDd77iUrl7L3HDKO0bF8UhpunW7cZqMy', '1976-05-28', 'Norma Angelica Moreno', '71094', 'HUS', '2000-01-25'),
(4844, ' Lilia', 'Falcon MuÃ±oz', 'Oasis Revolucion', 'B', 'Master Planner', '1', '25685', '$2y$10$nlrX3NhWNrufU6D3frp.xeB1hBCEujgsgMFdFynXx3R160U11rVJK', '1965-01-01', 'Alan Pando', '75499', 'HUS', '2003-09-25'),
(4845, ' Sergio', 'Sotelo Miranda', 'Frente Independencia 2', 'B', 'Comprador Lider', '1', '25732', '$2y$10$937KdPcWe3sbdshjVPiZzuEzUsh/ulxZbtQzbwNJmLf/CxogXPh8a', '1975-02-17', 'Alan Pando', '75499', 'HUS', '2006-01-06'),
(4846, ' Julian', 'Mata Castro', 'Roma', 'B', 'Project Manager', '1', '25755', '$2y$10$doZ/2b1m83/1rFJI/NImTuXblLkqLSJpO8ioU6rcVakrrINOiHEcu', '1979-11-28', 'Craig Leary', '300703', 'HES', '2012-09-24'),
(4847, ' Mario', 'Chairez Anaya', 'Jardines Satelite', 'B', 'Planeador Maestro', '2', '25757', '$2y$10$97d/EAtWzMpet2aMPR23Denz642912b.Q5q3RR4ygTNmgA8lXZmzK', '1970-07-10', 'Aveytia Banuelos, Antonio Edua', '25076', 'HUS II', '2007-04-23'),
(4848, ' Eduardo Alonso', 'Aguilar Flores', 'Rinconada de las Torres', 'B', 'Supervisor de Produccion', '1', '25788', '$2y$10$ZHVuuMVuNwx7mCmcJrwICuOw1R50r62rLMX2z0J2ybif2U631ui6y', '1968-11-07', 'Valenzuela Carbajal Jaime Humb', '99153', 'HUS', '2008-03-10'),
(4849, ' Alfredo', 'Gonzalez Lopez', 'Privata Residencial', 'B', 'Supervisor de Produccion', '1', '26334', '$2y$10$nGP0yTaeODmvnqQxvpd/pevqfiIfnX30F62Ld4sotnJC8WgPJ8lsu', '1966-07-26', 'Norma Angelica Moreno', '71094', 'HUS', '2013-02-25'),
(4850, ' Helder', 'Contreras CastaÃ±eda', 'Colonial del Sur', 'B', 'Supervisor de Produccion', '2', '26336', '$2y$10$Kf8Cy/JDLKRNfJ0xzqUbBOadRwh0mLeLF3RMYfeKnRSpHM1EvNlg2', '1983-07-20', 'Enriquez Rodriguez, Cesar Manu', '25784', 'HUS II', '2013-03-04'),
(4851, ' Abelardo', 'Reyes Hernandez', 'Paseo de Santa Monica', 'B', 'Supervisor de Produccion', '2', '26384', '$2y$10$9lvYhZH.Ta3EE.2TPNdEn.cj8EiHDPnLfi4qPXojMm3.8eJlpSYAq', '1973-04-02', 'Enriquez Rodriguez, Cesar Manu', '25784', 'HUS II', '2012-10-22'),
(4852, ' Roberto', 'Salazar Resendez', 'El Marquis', 'B', 'Supervisor de Produccion', '2', '26438', '$2y$10$yCZuhQS9FN01V4bXSQaQKOIYUYhozXpe65ZCt9mg5b9LKgpFzQZGO', '1972-04-15', 'Enriquez Rodriguez, Cesar Manu', '25784', 'HUS II', '2013-05-15'),
(4853, ' Paulino', 'Revolorio Ponce', 'Parajes del Sol', 'B', 'Supervisor de Produccion', '2', '26485', '$2y$10$UHQTrNzXvHL/Fuvq5gSFAe9W8r.XmjFNtuoQW6x/7T7D2QAUvyOrG', '1971-08-30', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2013-06-05'),
(4854, ' Erik', 'Garcia Gaucin', 'Mirador', 'B', 'Supervisor de Produccion', '2', '28228', '$2y$10$MiIbRdq129jp.u6y8Dsj7O432sL6P6g8X1flBJQqEifNrNseRNSza', '1981-03-06', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2013-08-05'),
(4855, ' Jose Luis', 'Perez Sandoval', 'Fracc. Bonanza', 'B', 'Supervisor de Produccion', '2', '28925', '$2y$10$SdvqoQrJT8OrLrmwE65AyOWm9xAJVTMmz.UuDR0nlivOmqZPs0Obq', '1969-08-08', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2013-11-13'),
(4856, ' Alan Omar', 'Escobedo Gonzalez', 'Aguilas de Zaragoza', 'B', 'Supervisor de Produccion', '2', '32976', '$2y$10$u06dAC.v5iHkX81RWhoOPOtwRKg4faR/d1tlqSfWS0JtRvoTxEam.', '1996-01-24', 'Enriquez Rodriguez, Cesar Manu', '25784', 'HUS II', '2014-08-04'),
(4857, ' Hector', 'Porras Alvidrez', 'Puesta del Sol', 'B', 'Ingeniero de Calidad', '2', '33328', '$2y$10$ue51Qe3/y/pQC.P73PDI2uH.8KvuXIsexVYC3uqs1zLACVWQQGkk2', '1968-05-17', 'Nallely Alvarado Aguirre', '76513', 'HUS II', '2014-08-15'),
(4858, ' Misael', 'Purata Enriquez', 'Paseo de Santa Monica', 'B', 'Ingeniero de Manufactura', '2', '33458', '$2y$10$WFXPgunUIcILEguy0op5bORBbscoL.wWgwPjSrS7leDpgLmloXIaK', '1968-01-21', 'Leyva Corral, Jose Ramon', '25229', 'HUS II', '2014-07-23'),
(4859, ' Maria Guadalupe', 'Aldaba Graciano', 'Salvarcar', 'B', 'Purchasing Leader', '2', '40956', '$2y$10$Mycw6SRCXaDwsZAuAjdZR.vu4hjMuUWPCAPsspp6uf9kcdDiKFp0e', '1979-09-27', 'Aveytia Banuelos, Antonio Edua', '25076', 'HUS II', '2016-05-11'),
(4860, ' Abraham', 'Ronquillo Corral', 'Jardines del bosque', 'B', 'Master Planner', '1', '42681', '$2y$10$DYSbfghRyfAa4gFbXG4/0uHqEuU61zl9/k59JfGkYMbqpBub8S4Ae', '1981-11-09', 'Alan Pando', '75499', 'HUS', '2016-09-19'),
(4861, ' Cesar Eduardo', 'Alvarez Gallegos', 'Urbi Villa del Cedro', 'B', 'Supervisor de Produccion', '2', '45085', '$2y$10$xPaA11ooDN4RZYr4CScYaeCxdCj.m0wUIPHOHfVU7qd8YTvmWCFF6', '1979-05-18', 'Tito Melendez Martinez', '74040', 'HUS II', '2017-03-13'),
(4862, ' Jesus', 'Castro Molina', 'Las Gladiolas', 'B', 'Supervisor de Mantenimiento', '1', '46787', '$2y$10$pefl5NVYm108z2Pwxdf0Bu5eFXSwE6mUqQYy2Xf.KZL7IQQ63r.YS', '1980-05-23', 'Fernando De La O Alvarez', '70963', 'HUS', '2014-12-11'),
(4863, ' Alejandra Del Carmen', 'Guerrero Cervantes', 'Las lilas III', 'B', 'Supervisor de Produccion', '1', '59948', '$2y$10$bL493bmjItGNdhxEKVdvv.GeOWQEf7.HzCH5xgyvdU3XQE8bknnkq', '1985-09-09', 'Norma Angelica Moreno', '71094', 'HUS', '2010-04-20'),
(4864, ' Oscar', 'Garcia De Jesus', 'Puerto santa fe(los barri', 'B', 'Ingeniero de Calidad', '1', '59965', '$2y$10$Bs5DRKpTIfdEQAsFhCz9BOwNIlLmX13q2xjpWLGz9VeX/GR8Em4jy', '1984-10-27', 'Castillo Rivera, Francisco Jav', '24880', 'HES', '2011-01-05'),
(4865, ' Mario Alberto', 'Rosales Terrazas', 'Los Portales', 'B', 'Supervisor de Produccion', '1', '60889', '$2y$10$.N59AoyVk2AtO6YcCU/GtOSy6FGZaO0CWcu0U.feNRCOaptR4CAX.', '1966-12-01', 'Norma Angelica Moreno', '71094', 'HUS', '2018-07-18'),
(4866, ' Maria Eloisa', 'Barron Salas', 'Heroes de la Revolucion', 'B', 'Supervisor de Produccion', '1', '61631', '$2y$10$ORYOxkFLaApL59xWJFKQI.do0nPY1sh1UYlLFt6bbnu75Ahfkvo1y', '1991-09-06', 'Raymundo Fernandez Delgado', '71226', 'HUS', '2012-03-13'),
(4867, ' Braulio', 'Varona Hernandez', 'Ciudad Moderna', 'B', 'Supervisor de Produccion', '1', '61651', '$2y$10$LcGfIBt.xdvqZ1urRRtTneWXhjgEoBgz1S916xFZdOseSnT.O/0Vi', '1979-02-06', 'Adalberto Suarez Marin', '66069', 'HUS', '2013-03-19'),
(4868, ' Mauro', 'Sanchez Valenzuela', 'Los Portales', 'B', 'Supervisor de Mantenimiento', '1', '61715', '$2y$10$VI2jHUurRz7W8QTJ7QRbo.3XJJ7IP7OEz8/thmamvHjQt.Jb7eDxC', '1975-05-31', 'Fernando De La O Alvarez', '70963', 'HUS', '2015-02-20'),
(4869, ' Jose Merced', 'Gallegos Torres', 'Parajes del Sol', 'B', 'Supervisor de Almacen', '2', '61749', '$2y$10$s18rZHUG4R03c5InydnHBOi17qZd9I27CmwLy6rhdNHaIfVfZ6Z6O', '1968-03-06', 'Aveytia Banuelos, Antonio Edua', '25076', 'HUS II', '2008-05-22'),
(4870, ' Luis Abel', 'Aguirre Ortiz', 'San Francisco', 'B', 'Supervisor de Mantenimiento', '1', '61762', '$2y$10$xAs5n.dLDG5HUEVocMmxXeuKfgv0y1Oo.5zRz31Ys1UcOMP1QCZi2', '1974-07-15', 'Fernando De La O Alvarez', '70963', 'HUS', '2008-10-13'),
(4871, ' Romulo', 'Lopez Vazquez', 'Parajes del Sol', 'B', 'Supervisor de Produccion', '1', '61770', '$2y$10$0IX5vVsUnu64oJvAXaK3teqoTgfIemuXpWu6uwGXGjtgSQsNHIyk2', '1977-03-28', 'Norma Angelica Moreno', '71094', 'HUS', '2009-02-09'),
(4872, ' Lucia', 'Gutierrez Perez', 'Complejo Roma', 'B', 'Supervisor de Produccion', '2', '61812', '$2y$10$qtkjceH8rdL.kDxUJq5LVe5Zg4xIFHLe9ShFUEpzaEVud3pZy.L1W', '1989-11-20', 'Tito Melendez Martinez', '74040', 'HUS II', '2011-05-09'),
(4873, ' Javier', 'Martinez Acosta', 'jardines de san francisco', 'B', 'Supervisor de Produccion', '2', '61908', '$2y$10$CMHDuS3q4X3GBeE68Xylv.Nd75X/ZyW9Gwjt00H3bgMacxx1NINzG', '1986-09-28', 'Enriquez Rodriguez, Cesar Manu', '25784', 'HUS II', '2014-09-22'),
(4874, ' Jose Guadalupe', 'Talamantes Antunez', 'Rinconada de las Torres', 'B', 'Ingeniero de Manufactura', '2', '62051', '$2y$10$wZPZrS9j6dQfmIroGW2uFucDGaPhDricvaTTlDfGbyaNbTSRSElzm', '1975-12-12', 'Leyva Corral, Jose Ramon', '25229', 'HUS II', '2018-07-18'),
(4875, ' Adalberto', 'Suarez Marin', 'Reserva del Valle', 'B', 'Focus Factory Manager', '1', '66069', '$2y$10$wT6A3nxo.Z1pqLcCc1zmA.agHgFXKT/Ai9gcI.cOKKgROM7D9qfQ6', '1978-09-06', 'Valles Rodriguez Ramon Eduardo', '98382', 'HUS', '2021-07-14'),
(4876, ' Jorge Alejandro', 'Ayabar Diaz', 'La Cuesta', 'B', 'Generalista de Recursos Humanos', '1', '66945', '$2y$10$fgxcc0jVyX5vz5PTLuEmj.t8Efa55X3hWn1R5fgM8/aYKZm6lxMO.', '1990-01-24', 'Mayra Lizette LÃ³pez Contreras', '70709', 'HUS', '2021-09-13'),
(4877, ' Bacilio Abel', 'Rocha Carrillo', 'Valle Sur', 'B', 'Supervisor de Almacen', '2', '68476', '$2y$10$zGDPhPjxr.XDGvCIQOuJHOCH9h12JAk52PS494RJ.dEWiNlB2TVeq', '1969-06-14', 'Aveytia Banuelos, Antonio Edua', '25076', 'HUS II', '2022-01-04'),
(4878, ' Jesus Francisco', 'Moreno Banda', 'Amplacion Aeropuerto', 'B', 'Supervisor de Produccion', '1', '69340', '$2y$10$9Vyf3.OmT0a6zQGIXFNccOt3P6mar/SF52UYZvAkExfkFaPNi211u', '1975-09-27', 'Norma Angelica Moreno', '71094', 'HUS', '2022-03-07'),
(4879, ' Rigoberto', 'Hernandez Gramillo', 'Paseos del Alba', 'B', 'Supervisor De Aduanas', '1', '69348', '$2y$10$LOIQ5q2ksUfHYP9dWDv7Ces6aqv0KzbKesTShiPIAxXqLh4IRAA8i', '1992-02-01', 'Galvan Orozco, Sergio Yocet', '25369', 'HUS', '2022-03-07'),
(4880, ' Jose Jesus', 'Meza Jimenez', 'Parajes de San Isidro', 'B', 'Supervisor de Produccion', '1', '70699', '$2y$10$SAkr3f7HmK9UnrINVmUaPOWXFwMEDqlguI2UA.7w09L2jdadmabFW', '1970-04-13', 'Valenzuela Carbajal Jaime Humb', '99153', 'HUS', '2022-06-13'),
(4881, ' Mayra Lizette', 'LÃ³pez Contreras', 'Tres Cantos segunda secci', 'B', 'Organizational Development Sr Supervisor', '1', '70709', '$2y$10$IsxiMTszLwvVyivKn6E46e6tqAjqzQQhIKiY.9nJvqy8ljNRb85jy', '1984-08-18', 'Mirian Yesenia Cabrera', '548', 'HUS', '2022-06-20'),
(4882, ' Veronica Georgina', 'Guzman Villegas', 'Oriente Miraloma Sector E', 'B', 'Senior MRO Buyer', '1', '70842', '$2y$10$xek2vlYFHy.WV5c/F6Dw2eu2fcnAlPppvq0NmtmaMaQcXK6EOeCM.', '1972-04-23', 'Silvia Patricia Carrillo Orozc', '101146', 'HUS', '2022-06-27'),
(4883, ' Humberto', 'Hicks Martinez', 'Rinconada de las Flores', 'B', 'Supervisor de Almacen', '1', '71193', '$2y$10$OYcnKLbSM3Opfh9VF.zXoOmCvcs2rYQePYTlXG5.7OuLTXECKb.lS', '1971-06-16', 'Gustavo Eduardo Muro Soto', '101050', 'HUS', '2022-08-01'),
(4884, ' Enrique', 'Velarde Inostroza', 'Terrazas del Valle', 'B', 'Supervisor de Produccion', '1', '71208', '$2y$10$r0EwULuNLX8oFgo./Q18fOwzzANiAWBl2WFWwKRvdvFSXxOMe6/9a', '1981-11-29', 'Guillermo Moreno', '72011', 'HUS', '2022-07-28'),
(4885, ' Maria de los Angeles', 'Jurado Ramirez', 'Fraccionamineto Yolanda', 'B', 'Quality Engineer SR', '1', '71575', '$2y$10$zwudZpz2ibkt7FM/o1fEQeaSEFxmVC2p91nV1p90/5CiZZDHwXbiK', '1972-09-15', 'Abril Azeneth Ibarra Franco', '68171', 'HUS', '2022-08-29'),
(4886, ' Jorge Luis', 'Rios Ramirez', 'Las Haciendas', 'B', 'Supervisor de Produccion', '1', '71668', '$2y$10$.KmXs8mZSRrbqP7n3zLeH.sWZqIuTAgK0PxZtuId2F.hBsb/JeM6W', '1978-09-04', 'Guillermo Moreno', '72011', 'HUS', '2022-08-29'),
(4887, ' Santiago', 'Pacheco Antonio', 'Colinas del sur', 'B', 'Supervisor de Produccion', '2', '72187', '$2y$10$L5SZ5yupXRT1VpN5j2AOsema3HUibUk1xYpCfLyP1plYRp3Y8tNWa', '1988-10-12', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2022-10-03'),
(4888, ' Mario Alberto', 'Chacon Jaquez', 'Residencial La Florida', 'B', 'Ingeniero de Calidad', '2', '72893', '$2y$10$6aQ7y1rCFe9jV3/TvmzOj.iB/DeQdNiaWUcYdrUUIp2iQPShIYbY6', '1967-03-16', 'Nallely Alvarado Aguirre', '76513', 'HUS II', '2022-12-05'),
(4889, ' David', 'Garcia Urbina', 'Vista hermosa', 'B', 'Materials Management Systems Architect', '1', '72919', '$2y$10$bwLerN5RfDZXMMJsKVfcA.FK5bziN6KjtbIz8OXjd125114wGs.re', '1978-09-12', 'James Powell', '36288', 'HES', '2022-12-12'),
(4890, ' Gabriel Francisco', 'Olague Perea', 'Fracc. Pradera dorada', 'B', 'Production Manager Permold', '1', '73157', '$2y$10$pA92I9ts78zqEZiKoyPR4OqZyh/i1j6vdJr5ET4aE2gO3M7G19Fyi', '1971-12-15', 'Valles Rodriguez Ramon Eduardo', '98382', 'HUS', '2023-01-03'),
(4891, ' Jesus Gerardo', 'Lopez Solis', 'Paraje de Oriente', 'B', 'Supervisor de Produccion', '1', '73653', '$2y$10$A3eHOn5azBaqKoLuzUBSsevkJuLkWDRRaGlAlJvoYiDqlw/S8E9Sa', '1986-04-26', 'Guillermo Moreno', '72011', 'HUS', '2023-02-10'),
(4892, ' Omar', 'Rodriguez Rivera', 'AmpliaciÃ³n Aeropuerto', 'B', 'Security Superintendent', '1', '73804', '$2y$10$pGGS57etYS/83Ss0Zz8Owu.B21z.f.btsmLdHpTtXGNv8oEDzAk5u', '1979-04-13', 'Jose Rodolfo AcuÃ±a Lopez', '78080', 'HUS', '2023-02-21'),
(4893, ' Gustavo', 'MacÃ­as Sandoval', 'Manuel Valdez', 'B', 'Ingeniero de Producto', '1', '73857', '$2y$10$odBeLaM9VhwmcR62kVYK8.rZ09ykSPQUidmDswfhiGInBg.FSW6LG', '1984-10-21', 'Adalberto Suarez Marin', '66069', 'HUS', '2023-02-23'),
(4894, ' Daniel de Jesus', 'Favela Najera', 'Azteca', 'B', 'Supervisor de Produccion', '1', '73913', '$2y$10$.6WD5fCvny7CbIahm7P3Q.Xo84/tPPY2Zc/A2PP7X3Ao3s9ByRFbu', '1991-01-02', 'Guillermo Moreno', '72011', 'HUS', '2023-02-27'),
(4895, ' Cynthia Belinda', 'Marquez MarÃ­n', 'Jardines Residencial', 'B', 'Asistente de Director', '1', '74541', '$2y$10$4pGCrMXbXqUkL1FuYH/3T.wk9SddAUxoMA5gLwqZSlFTSbFtjbnUu', '1998-03-21', 'Hernandez Ortega Victor', '96695', 'HUS', '2023-04-20'),
(4896, ' Jose Julian', 'Ruiz Salinas', 'Colonial del Valle', 'B', 'Quality Engineer SR', '1', '74929', '$2y$10$nT3h8Tutk1fWaSWhZ/HR2OU/BZL/bhLBVBg9KB2f/V/KYvvlWGJIi', '1975-09-24', 'Abril Azeneth Ibarra Franco', '68171', 'HUS', '2023-05-29'),
(4897, ' Carlos Javier', 'Gonzalez Cordova', 'Hacienda las Torres', 'B', 'Supervisor de Produccion', '1', '75402', '$2y$10$xFZWWZHIMEZb9FY1R0vS4O1j8IM4e.GB27z96T0sUnAugdfPlv9pe', '1967-05-13', 'Raymundo Fernandez Delgado', '71226', 'HUS', '2023-06-26'),
(4898, ' Alan Ivan', 'Pando Pando', 'San Lorenzo', 'B', 'Senior Materials Manager', '1', '75499', '$2y$10$w1w.Fpvmu1f4uqyvSaCYxOIKpR8I2afteCUwsAtTD3rLwxBWa0P/u', '1978-08-08', 'Valles Rodriguez Ramon Eduardo', '98382', 'HUS', '2023-07-03'),
(4899, ' Ramon Rene', 'Montes NaÃ±ez', 'Villa Hermosa', 'B', 'Supervisor de Produccion', '1', '75649', '$2y$10$2pMBr0AppLTZRhB0xa04PuW4OAhgHNQx1fR6VPbxDv0QRFHvqwTFG', '1983-07-20', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2023-07-10'),
(4900, ' Mario Antonio', 'Soriano Romero', 'Fuentes del Valle', 'B', 'Cost Accountant Supervisor', '1', '75688', '$2y$10$x2DWyUy/C/jzfE/Hf/9pmeGPe.UT.b1VjLPgCZsreETlzJOVv6Gly', '1988-01-17', 'Cynthia Guadalupe NuÃ±ez DÃ­az', '70902', 'HUS', '2023-07-24'),
(4901, ' Cynthia Karen', 'Cisneros Medina', 'La Rosita', 'B', 'Cost Accountant Supervisor', '2', '75689', '$2y$10$x29PumtqdD.b1XF/o.M56.ap5.4Ij2hIpDj5kPSUsZKEa.RMRkq4S', '1994-10-25', 'Flores Morales Maria Gabriela', '37732', 'HUS II', '2023-07-24'),
(4902, ' Jorge Luis', 'Herrera Ortiz', 'Quintas del Valle', 'B', 'MATERIALS MANAGER', '1', '75952', '$2y$10$r3prJp9nFd9ytmDsEyVdA.KkXftyuU/8l5UHL8/tmyzwQEiq/mTJe', '1972-04-28', 'David Melchor', '74076', 'HES', '2023-08-07'),
(4903, ' Carlos Leonel', 'Martinez Zapata', 'Vista del Valle', 'B', 'Supervisor de Produccion', '1', '76083', '$2y$10$/8B3RqFr8XJZ54I3NKCOH.XI8WKSpct64TSveVUy.auQZYjEyfgle', '1973-09-23', 'Guillermo Moreno', '72011', 'HUS', '2023-08-14'),
(4904, ' Israel', 'RodrÃ­guez Andrade', 'Loma Blanca', 'AB', 'Communication Diversity and CSR Supervisor', '1', '77183', '$2y$10$3mxd4vq1tDFABlBvCED0a.Urd23aOofPAWqRmS8a2DhZYJ7Ul48we', '1982-11-30', 'Mirian Yesenia Cabrera', '548', 'HUS', '2023-11-13'),
(4905, ' Jorge Abraham', 'Aguilar Gaspar', 'Oriente Complexo Cielo', 'B', 'Supervisor de Produccion', '1', '77372', '$2y$10$hOxJuwOfxT0muqeoepV9rubyvz402AyDAEDn23JiGTW2moGb4EuVK', '1972-03-16', 'Luis Leopoldo Villegas Vielmas', '300450', 'HES', '2023-11-27'),
(4906, ' Jaime', 'Estrada Renteria', 'Colinas de Juarez', 'B', 'Ingeniero de Manufactura', '1', '77575', '$2y$10$/up4/lzkujjXm9sqCYusz..orSGml07V1I4U/BANJWdH4fpWHbG9.', '1990-04-18', 'Adalberto Suarez Marin', '66069', 'HUS', '2024-01-02'),
(4907, ' Daniel Alejandro', 'Terrazas Montes', 'Santa Monica', 'B', 'Focus Factory Manager', '1', '77773', '$2y$10$49HHamJrhCSau8PHQZ7Znetd28iH.RNu3uKBCH12eoNx.S6T9S572', '1984-06-13', 'Valles Rodriguez Ramon Eduardo', '98382', 'HUS', '2024-01-29'),
(4908, ' Fabiola', 'Ramon Carlos', 'Senderos de San Isidro', 'B', 'Supervisor de Produccion', '1', '84289', '$2y$10$D4VuYYDXAdT9Jqb4iROjm.i39tl42ZWa04FSWxj5LQ6HSzczFPMc2', '1991-01-20', 'Norma Angelica Moreno', '71094', 'HUS', '2019-01-22'),
(4909, ' Ricardo Joel', 'Trejo Lopez', 'Praderas del Sur', 'B', 'Supervisor de Embarques', '2', '84444', '$2y$10$5bbj2crAlHRSQ/r5/3F.MuqY/sQm/8XGIiTR3IASmQHpzG9FaqU2e', '1975-10-13', 'Aveytia Banuelos, Antonio Edua', '25076', 'HUS II', '1995-06-14'),
(4910, ' Esteban', 'Vazquez Salto', 'Aguilas de Zaragoza', 'B', 'Supervisor de Calidad', '1', '84463', '$2y$10$kyVfTmnVGvAPTBKJyx073elthzrx6El5.E7sStLNNiqpq1KNLFN4i', '1972-10-27', 'Castillo Rivera, Francisco Jav', '24880', 'HES', '1997-01-13'),
(4911, ' Gerson Alberto', 'Gonzalez Ortega', 'Parajes del Sur', 'B', 'Ingeniero de Calidad', '2', '84541', '$2y$10$Cn2aTx5jBjD88EGCg.kXcOqrWCPX2n/jiduIl0B6xC4CuukkBtRx2', '1980-08-10', 'Nallely Alvarado Aguirre', '76513', 'HUS II', '2002-05-07'),
(4912, ' Haydee', 'Garcia Varela', 'Ignacio Aldama', 'B', 'Supervisor de Nominas', '1', '86547', '$2y$10$yM9iv9cSm2eMa0WFS5kNROtj4MRbR5DWoZXQgqzJ2rxPsug21Dpzq', '1972-05-09', 'Hugo Pinales', '91442', 'HUS', '2019-07-08'),
(4913, ' Armando', 'Reyes Maldonado', 'Jardines del Aeropuerto', 'B', 'Quality Engineer III', '1', '86641', '$2y$10$lmmGtQQdWYvwxtK2.zAwxeIodKu1c9zhqgmmkpw8G/xiDoPIA3scy', '1993-12-18', 'Abril Azeneth Ibarra Franco', '68171', 'HUS', '2019-05-22'),
(4914, ' Brayan Alexis', 'Parga Rangel', 'Cerrada del Sur', 'B', 'Ingeniero EHS', '1', '86782', '$2y$10$LFJntwbNmjiApFzt.S5/9uw5oQF0to.XmJ6GCpxo2.FWtm61Bkuyi', '1997-08-28', 'Jose Rodolfo AcuÃ±a Lopez', '78080', 'HUS', '2019-06-28'),
(4915, ' Sergio', 'Ortiz Cortez', 'Praderas de la Sierra', 'B', 'Supervisor de Produccion', '2', '86825', '$2y$10$BlOIpxSZK0OkLxCFKRrh2e6PA7jmMgPixOFmQtib5rBYWREHytiG2', '1965-12-12', 'Norma Angelica Moreno', '71094', 'HUS', NULL),
(4916, ' Jose Concepcion', 'Salazar Silva', 'Horizontes del Sur', 'B', 'Supervisor de Nominas', '1', '86917', '$2y$10$CcZx.CLqPHnAHiRsZ9u6GOdmv7iewgmb9/hdiSlf7uKUAPbqIh/SC', '1969-01-01', 'Hugo Pinales', '91442', 'HUS', '2019-07-26'),
(4917, ' Rogelio', 'Guitron Lozoya', 'Mezquital', 'B', 'Ingeniero de Manufactura', '2', '86928', '$2y$10$eA52TNyxiPFL6LXH4EOkNOsHzacf9VcwOZxTxu6IKJjuL26C6m.wq', '1997-05-07', 'Leyva Corral, Jose Ramon', '25229', 'HUS II', '2019-05-27'),
(4918, ' Reynaldo Manuel', 'Mendoza Soriano', 'Riveras del Bravo', 'B', 'Ingeniero de Manufactura', '2', '88736', '$2y$10$1pRp7HkMYF3gOIl3zh/BZu1WJ1Dic34z4QAsnVNnTfy7.BYuOHRQm', '1997-10-27', 'Leyva Corral, Jose Ramon', '25229', 'HUS II', '2019-11-25'),
(4919, ' Juan Antonio', 'Hernandez Villanueva', 'Complexo Cielo', 'B', 'Supervisor de Mantenimiento', '2', '95945', '$2y$10$YKRkOttITYaIW/ZWjeBx1emeUq9TlnPBZ1rB0XCDJVkN8KeR0QW16', '1975-03-22', 'Alejandro Jauregui Sanchez', '71145', 'HUS II', '2020-03-30'),
(4920, ' Cecilia Jaqueline', 'Adame Camacho', 'Oriente Paraje de San Isi', 'B', 'Supervisor de Produccion', '2', '97655', '$2y$10$BgFVO23MC2E7vmuarnW.3u9yaMf6CR6m9T22OUj87SCwjmsH2xF1y', '1994-11-22', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2020-07-02'),
(4921, ' Saul', 'Arellano Escobar', 'Cerrada de Tarso', 'B', 'Supervisor de Produccion', '1', '97722', '$2y$10$LpB2uXOnWpNIdb0NafXKFuVOchJQeWEoD0K/E9wqBxHALgRAm4D4q', '1981-01-30', 'Guillermo Moreno', '72011', 'HUS', '2020-07-06'),
(4922, ' Pablo Alberto', 'Olivas Vargas', 'Las ViÃ±as', 'B', 'Supervisor de Produccion', '2', '98097', '$2y$10$M9dY9YOIchRzKI2KHNUC4ulsudOEgkUIkVbmZyTVN6jo0YnnmL3Wm', '1981-03-31', 'Tito Melendez Martinez', '74040', 'HUS II', '2020-07-20'),
(4923, ' Miguel Aaron', 'Regalado Jasso', 'Campestre Virreyes', 'B', 'Supervisor de Produccion', '2', '98275', '$2y$10$XsVKM8G3Pl5CcLfDpwMedelUtADXqnXFd6LFChIPWz.u45FUIgwnK', '1995-11-11', 'Enriquez Rodriguez, Cesar Manu', '25784', 'HUS II', '2020-07-27'),
(4924, ' Raul', 'Resendez Gardner', 'Paseos del Alba', 'B', 'Supervisor de Almacen', '1', '98277', '$2y$10$WtBdJ00.iD0vLD6kdR7wVuSefI1g/m31ozTLBC9SQdfQhcJcUl9G2', '1990-07-20', 'Gustavo Eduardo Muro Soto', '101050', 'HUS', '2020-07-27'),
(4925, ' Abel', 'Fernandez Delgado', 'Portales de San Pedro', 'B', 'Supervisor de Produccion', '1', '98716', '$2y$10$Sn/cmWyK.1OY9jWvC0S8p.VcuJatNdcB6JYohz5Z.hgawWSTvr/Cu', '1986-05-06', 'Adalberto Suarez Marin', '66069', 'HUS', '2020-08-13'),
(4926, ' Israel', 'Saenz Martinez', 'Hidalgo', 'B', 'Supervisor de Almacen', '1', '99501', '$2y$10$QGUbn0TMwO3YKdIaRpbI3Oof8OgiO0lnYr3QC4KscRfnNhsyfe3Ra', '1987-02-20', 'Gustavo Eduardo Muro Soto', '101050', 'HUS', '2020-09-14'),
(4927, ' Mario Alberto', 'Camacho Salcedo', 'Colinas del Sur', 'B', 'Supervisor de Produccion', '1', '99866', '$2y$10$x0seYjCgXArXfnrPAzYSOOEVf5YTSmSlUDGPVrJKowAUH3w8oDqbm', '1973-04-08', 'Guillermo Moreno', '72011', 'HUS', '2020-09-28'),
(4928, ' Ruben', 'NuÃ±ez Adame', 'Parajes del Sur', 'B', 'Supervisor de Mantenimiento II', '2', '100370', '$2y$10$qTSfrqQAstWtlAC791HGwOPEC8/ieq6WZMdQNPBWPTClFtUozyn6.', '1984-03-03', 'Alejandro Jauregui Sanchez', '71145', 'HUS II', '2020-10-20'),
(4929, ' Vania Guadalupe', 'Garcia Flores', 'Cerradas de Alamo II, Eta', 'B', 'Supervisor de Produccion', '1', '100540', '$2y$10$tAwwdXleYIBJanEXhOs6BOYU1xAnMoNfts8YHQNmNQrnD/RHUYG7K', '1992-12-13', 'Raymundo Fernandez Delgado', '71226', 'HUS', '2020-10-28'),
(4930, ' Karla Alejandra', 'Saucedo Pacheco', 'Portales de San Pedro', 'B', 'Supervisor de Produccion', '1', '102643', '$2y$10$6bkINhiv4gszrYdIj4F2BuJXgF4l12V.oGdA3v5ICkCS9ZVysr4Ci', '1990-06-01', 'Norma Angelica Moreno', '71094', 'HUS', '2021-02-10'),
(4931, ' Eduardo Ivan', 'Heredia Bernal', 'Medanos', 'B', 'Supervisor de Produccion', '1', '104824', '$2y$10$8m0WSCjzhXhmSyd7egx64udXsq8jy/8wmubl1xUCU5bReZKHtNymS', '1991-02-22', 'Valenzuela Carbajal Jaime Humb', '99153', 'HUS', '2021-03-18'),
(4932, ' Rogelio', 'Arellano Unzueta', 'Hacienda del Nogal', 'B', 'Ingeniero de Manufactura', '1', '105818', '$2y$10$1xXw.CHPJl2/cZmWU4/BiO2dIXsMal35iy8DM9hg5BejrC0Iog2n.', '1999-08-19', 'Guillermo Moreno', '72011', 'HUS', '2022-08-29'),
(4933, ' Jesus Abraham', 'Gonzalez Lopez', 'Lomas de San Jose', 'B', 'Supervisor de Produccion', '1', '106563', '$2y$10$HHmaINjuB.kU74iE9gqyFOvgdVAXruLPofsqS06UbP/qeHhYReg8W', '1995-01-17', 'Guillermo Moreno', '72011', 'HUS', '2021-05-24'),
(4934, ' Luis Alberto', 'Moreno Kolb', 'Rincones Salvarcar', 'B', 'Supervisor de Produccion', '1', '106582', '$2y$10$GtgE4D061S8nEoAlKqdXIu4b.V1GyvVKa9tkXOZ2tSn8EnqoJDxfq', '1975-01-18', 'Adalberto Suarez Marin', '66069', 'HUS', '2021-05-24'),
(4935, ' Briseida Carmelita', 'Grajeda Bosques', 'Paraje de San Isidro', 'B', 'Supervisor De ProducciÃ³n', '2', '106779', '$2y$10$83VCctg8lhCz1VSjQjCW1OCC6ddQML8/Kn5hz5OiF85g/byy5ce92', '1987-06-26', 'Jose Rodolfo AcuÃ±a Lopez', '78080', 'HUS II', '2021-05-31'),
(4936, ' Jessica Alejandra', 'Aguilar Gutierrez', 'Paseo de Santa Monica', 'B', 'EHS Engineer', '1', '109077', '$2y$10$Z/XMtIibsVpXoRBblUOFt.Dtme.JFdjjfVNN.xzY54seqdb0p0fom', '1995-05-15', 'Jose Rodolfo AcuÃ±a Lopez', '78080', 'HUS', '2021-08-19'),
(4937, ' Jorge Eduardo', 'Ruiz Garcia', 'Jardines de San Francisco', 'B', 'EHS Engineer', '1', '121008', '$2y$10$sWkIXKOhwo0sKIo5UX1Hd.k6bfTj/i4ylfrKl9Dr0Rm.49fXid6bi', '1988-02-20', 'Jose Rodolfo AcuÃ±a Lopez', '78080', 'HUS', '2023-03-27'),
(4938, ' Diana Mariel', 'Demorey Carrasco', 'Las Acequias', 'B', 'Ingeniero de Calidad', '1', '128213', '$2y$10$4WYIzV3Qh0iQIuSG59zA/OmNZX17o1gO7MjJmGeHoeIf/PvHV.zjC', '1997-04-01', 'Maria De Los Angeles Jurado Ra', '71575', 'HUS', '2024-04-08'),
(4939, ' Briseida Del Carmen', 'Bautista Tolentino', 'Misiones del Real', 'B', 'Supervisor de Produccion', '1', '300011', '$2y$10$/Xrb5bTd27bowW3f1fVL3exEz5Uwr5QCDHZjbnqrvaNzHBkBihPeG', '1997-05-09', 'Norma Angelica Moreno', '71094', 'HUS', '2024-02-29'),
(4940, ' Kevin Adrian', 'Martinez Orozco', 'Cienega Residencial', 'B', 'Supervisor de Calidad', '1', '300062', '$2y$10$tqnxHhKquC8QL43orFCNS.7oj/AYWD1lXZCaKBTbDWtoiY2vB4Cly', '1993-11-12', 'Abril Azeneth Ibarra Franco', '68171', 'HUS', '2024-03-11'),
(4941, ' Angelica', 'ZuÃ±iga Loera', 'Medanos', 'C', 'Asistente de Finanzas', '1', '29702', '$2y$10$Q626bmvLheYIiHnuFKI3ieeqAH2FJPgfeF0OrN.erXm9eyn7x.Uaq', '1977-03-14', 'Maria Cruz Romero', '24839', 'HUS', '2014-02-06'),
(4942, ' Perla Roxana', 'Guzman Hernandez', 'Praderas del sur', 'C', 'Asistente de Supervisor', '1', '60253', '$2y$10$OL2R4TzGfIEwPxS6nibhe.CWA7XMWxrU/QxmwcQY.yQMQOzOcIPoa', '1987-03-18', 'Adalberto Suarez Marin', '66069', 'HUS', '2016-07-19'),
(4943, ' Diana Valeria', 'Salazar Roldan', 'Horizontes del Sur', 'C', 'Asistente de Supervisor', '1', '61077', '$2y$10$1dyWj/GTlmhMonZDWPJaI.Bufjb8XajDqq1DydY.v0Jo1gQgaf.Qi', '1998-07-19', 'Guillermo Moreno', '72011', 'HUS', '2018-10-04'),
(4944, ' Sanjuana', 'Arauz Ochoa', 'Manuel Clouthier', 'C', 'Asistente de Supervisor', '1', '61414', '$2y$10$o1qRdePUY4VEJuaeTbP2.OZYMD9JFU2vn8RG0oYljrIcaFCx2hssW', '1979-05-18', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2015-10-07'),
(4945, ' Juan Fidel', 'Velazquez Carreto', 'Olivia Espinoza de Bermud', 'C', 'Asistente de Supervisor', '1', '61500', '$2y$10$paD5HVYWt14Fcqw724RsSuzZf10TiTbzjDq3JNqZ6cFlcmN9YO3M.', '1977-11-27', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2023-10-30'),
(4946, ' Fernando', 'Ortiz Hernandez', 'Horizontes del Sur', 'C', 'Asistente de Supervisor', '1', '61588', '$2y$10$rujPg.nqNea5MzxDmly22.QLnLVbVT7vEul8v6srqYWbwCoDZlW0u', '1972-09-04', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2010-09-13'),
(4947, ' Luis Felipe', 'Cabrales Facio', 'Pradera del Oriente', 'C', 'Asistente de Supervisor', '1', '61619', '$2y$10$mGHOhjLfjssrmPC9J.K3X.Se6T0b53urf/zBJU7czxjyJzfTLBTli', '1990-04-08', 'Briseida Bautista Tolentino', '300011', 'HUS', '2011-09-05'),
(4948, ' Humberto Iram', 'Hernandez Torres', 'Praderas del Sur', 'C', 'Asistente de Supervisor', '1', '61667', '$2y$10$/s9TnK84qaX.P.mKaUm1KeDcSnHMcdxcP.mCvbS4IaC4H2j4F6P3G', '1969-09-22', 'Rodriguez Celaya, Ramiro', '24790', 'HUS', '2014-01-15'),
(4949, ' Francisco Javier', 'Dominguez Espinosa', 'Los Barrios', 'C', 'Asistente de Supervisor', '1', '61787', '$2y$10$vwgVKIaEeld4JWNk1aLyPel9gtmNK2C7OI/HR8rAKJh.l4foJE99e', '1979-10-11', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2017-06-05'),
(4950, ' Francisca', 'Marquez Urieta', 'Portal del Roble', 'C', 'Asistente de Supervisor', '1', '61796', '$2y$10$GeYHOSz0QCkSvH0bM2c5XuQdntzIRQReAoG1vaD.uQD8tYeyNd0zu', '1980-10-04', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2010-08-30'),
(4951, ' Tombly', 'Gonzalez Rosas', 'Hacienda de las Torres Un', 'C', 'Asistente de Supervisor', '1', '84469', '$2y$10$C22G4/8Hs2nsJ7JWD07foOh7m6HasWl7iU7Kw/Qfka2JxNO7RhdZq', '1977-02-27', 'Martinez Gonzalez Fernando', '24731', 'HES', '1997-03-17'),
(4952, ' Juan Carlos', 'Alonso Palmeros', 'Riberas del Bravo', 'C', 'Asistente de Supervisor', '1', '95356', '$2y$10$r7wHXkk.nhcQAY56VjRPoOtFMw5dzWP6UxRhei9WkixBvQRnAaPrG', '1977-12-13', 'Jose Ruiz', '74929', 'HUS', '2020-02-28'),
(4953, ' Brian Alexis', 'Leyva Najera', 'Carlos Castillo Peraza', 'C', 'Asistente de Supervisor', '1', '104808', '$2y$10$HkrfLYRUGtmlIJq9YXsIFeWgmTEOToyUYY2JwRELT1DfaVZaAqKZu', '1996-09-23', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2021-03-18'),
(4954, ' Karla Alejandra', 'Holguin Arteaga', 'Norte Crucero', 'C', 'Asistente de Gerencia', '2', '116149', '$2y$10$2I64ENGX45QLbjQxJwaAa.zvBh.Y9yb/gOYwsL5kIPryyogsX6A6y', '1996-06-10', 'Arturo Jairhzino Hamilton Olag', '75691', 'HUS II', '2022-07-11'),
(4955, ' Ana Arleth', 'Escobedo Larreta', 'Hacienda de las Torres', 'C', 'Asistente de Supervisor', '1', '117582', '$2y$10$6qZW2VzEoviRZHyyPYZFquj1HcSysm/thK8MKzTpLUONWcMwEXlFW', '2000-10-04', 'Cesar Javier Armendariz Moriel', '73910', 'HUS', '2022-08-25'),
(4956, ' Marlen', 'Lopez Garcia', 'El Campanario Cuatro Sigl', 'C', 'Asistente de Gerencia', '1', '121722', '$2y$10$ilxUEM9NmpIS5LMicsBpsegMDSS4dYLRrlZxL4A4SZS3hL2U3fp9m', '2000-01-20', 'Valles Rodriguez Ramon Eduardo', '98382', 'HUS', '2023-05-18'),
(4957, ' Pedro', 'Cortes Leon', 'Jose Marti', 'C', 'Asistente de Compras MRO', '1', '121981', '$2y$10$hOV8CsKOMiw962pOwdyRiOv8v9iPiZXwPrxLtLcHA60.xYSCINFL2', '1997-12-14', 'Veronica Georgina Guzman Ville', '70842', 'HUS', '2023-06-05'),
(4958, ' Bertha Alicia', 'Rios Ramos', 'Fracc. Santa Anita', 'C', 'Asistente de Nominas', '1', '24699', '$2y$10$UcuDVpE5E8b3x4gUzMv/F.YEv55D2AMJxF4Lp0vv4Rt3AVJc4QeIC', '1964-12-16', 'Garcia Varela, Haydee', '86547', 'HUS', '1984-06-21'),
(4959, ' Jorge', 'Perez Marquez', 'Hacienda de las Torres Un', 'C', 'Planeador', '1', '24714', '$2y$10$.GR.hUkeff421igiVGbRNup6s99G23LlQOwGmniEqhmPQrC0R/1vG', '1975-02-18', 'Jorge Herrera Ortiz', '75952', 'HES', '1995-11-28'),
(4960, ' Ana Luisa', 'Garcia Acosta', 'Paseos del Alba', 'A', 'Enfermera', '1', '24745', '$2y$10$JNdqsHFlrHPVJftpdEnJNOdFve/qMU9lLq/lvX/1mHx8IO5p9pTWm', '1971-09-14', 'Victor Josue Moctezuma Gates', '61122', 'HUS', '2013-06-20'),
(4961, ' Martin', 'Santos Gonzalez', 'Roma', 'C', 'Ingeniero de Manufactura Jr', '1', '24786', '$2y$10$phRGRfaLgdCa5LaRaZU4t.SEzx9ZK39y3AhyIGVasSPmdoi5ILR5a', '1976-03-29', 'Norma Angelica Moreno', '71094', 'HUS', '1998-09-28'),
(4962, ' Maria Elena', 'Rodriguez Hernandez', 'El Fortin', 'C', 'Comprador', '1', '24861', '$2y$10$uF0Dx.uTH7L9InkwhSpax.eFQcNQERHHRzDB2qgPoCngAC1WnHFau', '1973-09-16', 'Veronica Georgina Guzman Ville', '70842', 'HUS', '2000-09-27'),
(4963, ' Cesar Andres', 'Carpio Carlos', 'Horizontes del Sur', 'B', 'Supervisor De Aduanas', '1', '24977', '$2y$10$r0gtQYM1wLVlMyv3dalvyun.gGwmykVuRUu6HB2z8JTDeymSI42Bm', '1982-11-24', 'Hector Javier Barcenas Avila', '25379', 'HUS', '2006-04-17'),
(4964, ' Doris Patricia', 'Hernandez CermeÃ±o', 'Toribio Ortega', 'A', 'Enfermera', '1', '24998', '$2y$10$KzQAizkT/0BuHmZfPsgUP.bnRxhuIfQfrZD/xSjGWOKsI5k4TeZ5.', '1972-01-11', 'Victor Josue Moctezuma Gates', '61122', 'HUS', '2006-06-09'),
(4965, ' Gabriela', 'Martinez Guerra', 'Las Aldabas', 'C', 'Supply Chain Analyst', '1', '25051', '$2y$10$Rh7p0XhrFh8fATuU2FLIaO9bXA/WULYOCu/AKkChl838J7xjKgV9q', '1969-03-24', 'Silvia Patricia Carrillo Orozc', '101146', 'HUS', '2007-04-23'),
(4966, ' Delia', 'Adame Arellano', 'Independencia 2', 'C', 'PLANNER', '1', '25193', '$2y$10$ex1KQMaNANL7dwrAONyJfOdecho8LE530n8QHo8jVvxjIhkZiKUhS', '1976-08-15', 'Jorge Herrera Ortiz', '75952', 'HES', '2024-04-01'),
(4967, ' Rosalina', 'Medrano Rodriguez', 'Torres del Sur', 'A', 'Enfermera', '1', '25200', '$2y$10$DwVrOco8kZE.ncun/iaqheNauft2px7unDg1jtFpuLpX8OCBHm5EO', '1967-06-11', 'Victor Josue Moctezuma Gates', '61122', 'HUS', '2009-12-14'),
(4968, ' Ruth Areli', 'Ramos Rodriguez', 'El Campanario', 'C', 'Customs Analyst', '1', '25448', '$2y$10$O99xzQrYs55WlWWnfm0FnOzmtAjQD2V/s/EKnSwQhhInqxETEMREu', '1987-10-27', 'Galvan Orozco, Sergio Yocet', '25369', 'HUS', '2013-03-04'),
(4969, ' Liliana', 'Fernandez Velazquez', 'Fracc.Paseos de Santa Mon', 'C', 'Especialista en Aduanas', '1', '25449', '$2y$10$ynAcVEBxiXiIx0wOnf.t6OVbI0FXiM4LGz1.FmELamOW19kp.gcGS', '1974-02-06', 'Rigoberto Hernandez Gramillo', '69348', 'HUS', '2013-03-04'),
(4970, ' Yaremi', 'Montelongo MuÃ±oz', 'Praderas de la Sierra', 'C', 'Planeador', '1', '25516', '$2y$10$K/SzAwPLLZJYUq5cDytSzOglOk2t0o5dgWsT1KhqPkXa.Kthdglk6', '1982-02-02', 'Jorge Herrera Ortiz', '75952', 'HES', '2008-10-08'),
(4971, ' Juan Luis', 'Camacho Castillo', 'Horizontes del Sur', 'C', 'Ingeniero de Manufactura Jr', '1', '25643', '$2y$10$LuZZMhsezjT0mQIF9hQc0unaTeTwmBRSfUbK6r0zrCfXIhYPFtlsm', '1974-08-25', 'Valenzuela Carbajal Jaime Humb', '99153', 'HUS', '2001-08-20'),
(4972, ' Ruben Ernesto', 'Martinez Minjares', 'Melchor Ocampo', 'C', 'Ingeniero de Manufactura', '1', '25791', '$2y$10$5TBjK5ZsP.PGEeaCNQCtSOVToUKNMJwsY8C9eCl9BefQu8qAgufse', '1974-02-07', 'Norma Angelica Moreno', '71094', 'HUS', '2008-04-14'),
(4973, ' Janeth', 'Gutierrez Vazquez', 'Fracc. Sendas Residencial', 'C', 'Planeador', '1', '25897', '$2y$10$aOb5qhtHX8dFadaB4uUttOPrM2UTKl67q43SwpxO.GFeLS83iw4w.', '1975-08-23', 'Abraham Ronquillo Corral', '42681', 'HUS', '2010-11-02'),
(4974, ' Aaron Efrain', 'Chavez Vazquez', 'Parajes de San Isidro', 'C', 'Planeador', '2', '26586', '$2y$10$EnkkBCqjb6PvQOhzFNp1F./SUXN/2rHmK598PxUW8QXlIp.eRQB1y', '1983-10-20', 'Mario Chairez Anaya', '25757', 'HUS II', '2013-06-24'),
(4975, ' Emmanuel Antonio', 'Garcia Espinosa', 'Paseo de Santa Monica', 'C', 'Comprador', '1', '26754', '$2y$10$AfrsXvWdbpXophDfve7Qd.dCRzbxERsAMlu7b5k1APqtwY3UhYQUq', '1980-07-28', 'Veronica Georgina Guzman Ville', '70842', 'HUS', '2013-07-02'),
(4976, ' Jessica', 'Gutierrez Reyes', 'JARDINES DE SANTA CLARA 7', 'C', 'Planeador', '1', '28630', '$2y$10$G.LImvhBUUyyYjIgRw/Lr.tVKWbhpu2Hwn.ZglK04KsgjMCK9Ycne', '1982-10-27', 'Abraham Ronquillo Corral', '42681', 'HUS', '2013-10-14'),
(4977, ' Oscar Ronset', 'Ramirez Salas', 'Hacienda del Sol', 'C', 'Esp Estrategico Cuentas Nac', '1', '33982', '$2y$10$MZwMmwOmBkcg0oDozkr5W.GKmJ1ungrs.5WTLEnD0HjD1yhYB/WZe', '1973-04-15', 'Robert Michael Jagoe', '41548', 'HES', '2011-03-01'),
(4978, ' Lenica Gabriela', 'Lopez Rivera', 'Sierra Grande', 'C', 'Customs Analyst', '1', '37833', '$2y$10$8D1WKaWxVqDIuQzoPxKYo.poD/kkFUQVyEYWzAW3Ks7PN45Be0WZS', '1992-07-01', 'Galvan Orozco, Sergio Yocet', '25369', 'HUS', '2015-06-25'),
(4979, ' Ivan Alejandro', 'Vazquez Miranda', 'Residencial Aguacaliente', 'C', 'Continuous Improvement Manager', '1', '37966', '$2y$10$L1B.wXmyU99hrIzXK4bScuDullzKy7jvuqbYjT0EpkxkWbQk0CJoa', '1992-01-23', 'Ryan Morgan', '21924', 'HES', '2022-01-31'),
(4980, ' Katia Berenice', 'Saavedra Kell', 'Del Valle', 'C', 'Comprador', '1', '38076', '$2y$10$b4COFJ3BxFzY9M3oAN1sPe3tsA/nohySMfvNjKjslY6OsjKU80ad.', '1983-10-28', 'Jorge Herrera Ortiz', '75952', 'HES', '2014-10-13'),
(4981, ' Andres', 'Lopez Santiago', 'Colinas del Sur', 'C', 'Customs Analyst', '1', '41650', '$2y$10$5/2ZX0Uc.JhwYCNZdaoyxeTweKnRXJORN5Wl7XnVPTZqSVQK6gdfy', '1971-10-20', 'Galvan Orozco, Sergio Yocet', '25369', 'HUS', '2016-07-04');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `colony`, `position`, `area`, `plant`, `username`, `password`, `birthdate`, `supervisor_name`, `supervisor_reloj_number`, `deparment`, `fecha_ingreso`) VALUES
(4982, ' Yesenia', 'Hernandez Velasquez', 'Sur Hacienda de las Torre', 'C', 'Ingeniero de Procesos', '1', '42189', '$2y$10$j0BtVJpngUc32hkPM1nd1udKdrUvDOv9W3SeEPAO5JjJCzBLsoTe.', '1989-10-22', 'Norma Angelica Moreno', '71094', 'HUS', '2022-06-20'),
(4983, ' Sebastian', 'Meza Camacho', 'Loma Dorada', 'C', 'Data Inventory Analyst', '1', '44021', '$2y$10$bNOdvOA0XHmTn3yTrq6VNeHXkmZHMvWY2rFizmxUXGpOW8CWIPqem', '1985-04-01', 'Marilyn Rivera', '8421', 'HES', '2022-01-31'),
(4984, ' Miguel Angel', 'Hernandez Reyes', 'Horizontes del Sur', 'C', 'Ingeniero de Procesos', '1', '46059', '$2y$10$3g8io5qKIfEssRuF3cBUQe1ZFQU8jXoT6/Pfi4S3u23CnOX6AmOJ2', '1966-07-12', 'Ivan Valero', '24932', 'HES', '2017-06-26'),
(4985, ' Blanca Estela', 'Retana Molina', 'Colonia Soliradidad', 'C', 'Especialista de Aduanas Jr', '1', '46924', '$2y$10$ZWJOiE7MZPMGhIZL7HBbauuWsu/Xx9YHOHsVpR9RepZ//sfrhScum', '1979-08-15', 'Hector Javier Barcenas Avila', '25379', 'HUS', '2016-12-27'),
(4986, ' Ana Lilia', 'Gutierrez Arias', 'Heroes de la Revolucion', 'C', 'Sup de Cuentas X Pagar USA', '1', '59981', '$2y$10$quYsTBmsbK6veQsFP3TR4uDSobRiGa.uB6XAA.MNbvebKpNB7aaxW', '1990-09-21', 'Maria Cruz Romero', '24839', 'HUS', '2011-03-22'),
(4987, ' Omar Karim', 'Vazquez Navarro', 'praderas del sur', 'C', 'Ingeniero de Manufactura', '1', '60063', '$2y$10$tyaDpBH1Y.qaykOnu7l1pOJOaHvVhGFtlt94Y7onwX2s4Rc72SK56', '1985-01-09', 'Raymundo Fernandez Delgado', '71226', 'HUS', '2014-05-28'),
(4988, ' Diana Ivette', 'Ceniceros Araujo', 'Erendira', 'A', 'Enfermera', '1', '60155', '$2y$10$ZuJL0Y29Sa5y1Azs4rKiEO8mv7WS50i61azGS1OfNnXrMafO3mC12', '1986-05-13', 'Victor Josue Moctezuma Gates', '61122', 'HUS', '2015-08-31'),
(4989, ' Adriana', 'Flores Cuellar', 'Bosque Bonito', 'C', 'Planeador', '2', '60206', '$2y$10$SgDoE/YJe8OjlVr2PgZRgucrNyCkRpVVYFGsoQRxvM79iIiXi.fvK', '1990-05-23', 'Mario Chairez Anaya', '25757', 'HUS II', '2022-08-29'),
(4990, ' Bruno Jose', 'Caldera Alonso', 'El Fortin', 'C', 'Ingeniero de mejora continua Jr', '2', '60222', '$2y$10$E.S6NNxgHA4gmFNJ5M706.fMwNfR5Cd6s0Sv/OZYCdoerlLd6YtsG', '1993-01-15', 'Shyam Gangadharan', '76925', 'HUS II', '2016-04-05'),
(4991, ' David Esteban', 'Bermudez Ayala', 'Frontera Nueva', 'C', 'Demand Analyst III', '1', '60252', '$2y$10$RO15D27cf/zPVJZKYc/EeOeH.glA5U1oy8Q1nFSxLqYTZv/Kr/wV2', '1989-05-30', 'Silvia Patricia Carrillo Orozc', '101146', 'HUS', '2016-07-18'),
(4992, ' Denis Adriana', 'Devora Tenorio', 'Misiones del Real', 'A', 'Enfermera', '1', '60297', '$2y$10$crnYi.22GM8o/JbZAWDN1.XXAD0C5YADd2k/SJeAojN.c3o2Ofo3m', '1992-07-04', 'Victor Josue Moctezuma Gates', '61122', 'HUS', '2016-09-27'),
(4993, ' Sandra Angelina', 'Villanueva Holguin', 'Infonavit Jarudo', 'A', 'Enfermera', '1', '60500', '$2y$10$T7e5eAPa/ytK.2nrk7PfeOPgavOddNWj86npgy4.ZF8z2hzQJHuEy', '1985-06-23', 'Victor Josue Moctezuma Gates', '61122', 'HUS', '2017-06-12'),
(4994, ' Brianda Analy', 'Avila Moreno', 'Independencia 2', 'C', 'Especialista en Aduanas', '1', '60611', '$2y$10$Na7wrIxiwQ4TyGTkRbHzNenOcD1Pz6u2Fn6/xAZ99AoXxXrQNUcHO', '1990-11-26', 'Hector Javier Barcenas Avila', '25379', 'HUS', '2018-01-02'),
(4995, ' Ernesto', 'Perales Reyes', 'Buenos Aires', 'C', 'Especialista en Aduanas', '1', '60731', '$2y$10$fusAep5ew6w6DKtOx6Ytf.Q6AaLAB6D3EOP0IxWTgxR8B53YG/.M2', '1982-09-15', 'Hector Javier Barcenas Avila', '25379', 'HUS', '2018-04-23'),
(4996, ' Karla Marisol', 'Castro Valles', 'Hacienda Giralda', 'C', 'Product Engineer', '1', '60778', '$2y$10$wDDHP/wCx/z2gnJwGosL3OgiUPfUADVY4L7VruX0JHyC55mTH7UX2', '1983-03-31', 'Valles Rodriguez Ramon Eduardo', '98382', 'HUS', '2018-05-28'),
(4997, ' Victoria Jaqueline', 'Campos Soto', 'Morelos 2', 'C', 'MRO Buyer', '1', '60800', '$2y$10$BjFlX2GtGVgtw35OYC4uBefj.k2XVX4uHBM3y6wO1rk6rNPOPXk/G', '1998-12-23', 'Veronica Georgina Guzman Ville', '70842', 'HUS', '2018-06-08'),
(4998, ' Cynthia', 'Cervantes Hernandez', 'Hacienda de las Torres', 'C', 'Especialista en Aduanas', '1', '60999', '$2y$10$dH8uOYmKk.CiXP4P1a3Qre6SYw76qT5s1PiR0k.GwoOMKfYVGKUf.', '1996-10-18', 'Hector Javier Barcenas Avila', '25379', 'HUS', '2018-09-03'),
(4999, ' Hector Daniel', 'Garcia Altamira', 'Libertad', 'C', 'Planeador', '1', '61575', '$2y$10$68LFgUYGV5htq82T6FPjPuvAvltK3.tGF.SKjQhN/mSQt2iiOsjsO', '1982-06-29', 'Falcon Munoz, Lilia', '25685', 'HUS', '2010-02-11'),
(5000, ' Rosa Margarita', 'Castro Chairez', 'Jardines de Santa Clara', 'C', 'Comprador', '2', '61979', '$2y$10$Z55Aciejj/WtxJLBvYfv2uaS8rhoTOoQMYI4Llj2culdFJ8553Kia', '1980-07-25', 'Maria Guadalupe Aldaba Gracian', '40956', 'HUS II', '2018-09-24'),
(5001, ' Paloma Michelle', 'Torres Hernandez', 'Pradera Dorada', 'C', 'Ingeniero de Mejora Continua', '2', '62140', '$2y$10$eNJgLrXesTQZke.MOMAszOv76DJ1kaU38Im2XRuIjdZowN1VJop16', '1990-09-24', 'Shyam Gangadharan', '76925', 'HUS II', '2018-11-12'),
(5002, ' Adrian', 'Barraza Herrera', 'Fracc. Brio Residencial', 'C', 'Planner Buyer', '1', '65550', '$2y$10$.fcCCfzObYIUgtQhzAZdD.HOfwslLvsG9L22nYwHF3VJCa.R3LPni', '1991-10-15', 'Abraham Ronquillo Corral', '42681', 'HUS', '2021-05-31'),
(5003, ' Eduardo Alejandro', 'Gamez Ayala', 'Fracc. Quintas Alameda', 'C', 'Ingeniero de Procesos', '1', '65619', '$2y$10$aWDGqMW8D712seVtXozDwesQEqS9IFYk8ZJLhOmiKoc3zkFRUawJa', '1988-02-26', 'Norma Angelica Moreno', '71094', 'HUS', '2021-06-07'),
(5004, ' Betsabe', 'Castro Gonzalez', 'Norte Infonavit', 'C', 'Comprador', '1', '68705', '$2y$10$YU8FQfMsgqnfPWEssw5C.ehuNe8GJhjG6XhEQ3bkpdgZwXB89Y7ym', '1994-11-05', 'Veronica Georgina Guzman Ville', '70842', 'HUS', '2022-01-24'),
(5005, ' Janeth', 'Cuellar Gonzalez', 'Hacienda de las Torres', 'C', 'Especialista en Aduanas', '1', '69821', '$2y$10$9BDowHRoSN/ok2zSGw8RuOrKscIy65D7Zp.R87pZxrRUqlzj0aXQy', '1995-12-19', 'Hector Javier Barcenas Avila', '25379', 'HUS', '2022-04-12'),
(5006, ' Ernesto', 'Sanchez De La Cruz', 'Fovissste Chamizal', 'C', 'Comprador', '1', '71080', '$2y$10$LVA/CyrG6pF6EzweXhFy5OHdalvdLcxHA/f7XYw4pa2uASddOLhzK', '1983-01-13', 'Sotelo Miranda, Sergio', '25732', 'HUS', '2022-07-18'),
(5007, ' Micaela', 'Silva Coss', 'El Granjero', 'C', 'Planeador', '1', '71546', '$2y$10$xzrx5W8tuVeh07EqU3lnt.m85BCVpIjyqY3FagzCtojOT8gJvw2De', '1972-11-06', 'Falcon Munoz, Lilia', '25685', 'HUS', '2022-08-23'),
(5008, ' Monica', 'Salinas Chavez', 'Topacio', 'C', 'Planeador', '1', '71650', '$2y$10$qwxM.SZfn5uDX2ZslQbhAu.boi5Lc5QoP2Rrgo8F9lW0GZlWdtSw.', '1983-02-14', 'Abraham Ronquillo Corral', '42681', 'HUS', '2022-08-29'),
(5009, ' Victor Manuel', 'Cerrillo Cardiel', 'Satelite', 'C', 'Ingeniero de Automatizacion', '1', '71735', '$2y$10$9/OLHzpl57jD3wnG5jd8oe3HPDp0NGs9O8CZtAcAbekvZBJHf1miS', '1990-12-08', 'Duran Camacho, Noel Roberto', '25668', 'HUS', '2022-09-05'),
(5010, ' Jesus Alberto', 'Sosa Oaxaca', 'Lomas del Rey', 'C', 'Comprador', '1', '71874', '$2y$10$jt9ErZfwFpKzLj68BzOqCe6yV4qh1v.dmVkpO78gUPOfNnDaaOreq', '1985-08-30', 'Sotelo Miranda, Sergio', '25732', 'HUS', '2022-09-19'),
(5011, ' Dianelly', 'Miranda Carreon', 'Jardines de San Francisco', 'C', 'Planner II', '1', '72233', '$2y$10$MbuUCWohDUCn7ebBNp7viObiyhHNV9vGPCkqUvVx89NxGH4UwdAuK', '1986-10-17', 'Abraham Ronquillo Corral', '42681', 'HUS', '2022-10-10'),
(5012, ' David', 'Molina Hernandez', 'Fracc. Las Torres', 'C', 'Planeador', '1', '72441', '$2y$10$HbQQ6DE09o.4RSvWolEhhu1H/RloZkULiUKQw/eFeTL5YTLRUO2p.', '1990-12-13', 'Falcon Munoz, Lilia', '25685', 'HUS', '2022-10-25'),
(5013, ' Ernesto Miguel', 'Flores Lucio', 'Puerta del Sol 2S', 'C', 'Director Operations Finance', '1', '72477', '$2y$10$yCUHt9k7rGxHtwg0DJD98ODtdFYurtmkkM/27KDvT2MUNr5LoYw5y', '1987-07-08', 'Barry Paolino', '17851', 'HES', '2022-10-24'),
(5014, ' Nubia', 'Delgado Rodarte', 'Jardines de Aragon', 'C', 'Esp de Cuentas por Pagar', '1', '73078', '$2y$10$m3IXr44ajgb32f7gJgtA/eVK3j6PYw3PqAL2bDMtufP958wsO9XHO', '1977-12-21', 'Maria Cruz Romero', '24839', 'HUS', '2022-12-19'),
(5015, ' Jenny Adriana', 'Gonzalez MuÃ±oz', 'Torres del PRI', 'C', 'Contador De Costos', '1', '73168', '$2y$10$Xos/Q1C5XK0NKuiwklc.xuwC3JpBuzgyA.XLDdPKVuvv/lH3dnuni', '1992-10-22', 'Flores Morales Maria Gabriela', '37732', 'HES', '2023-01-03'),
(5016, ' Christiaan Ericson Guadalupe', 'Van Ingen Lucero', 'Floresta de San Jose', 'C', 'Procurement Efficiency Analyst', '1', '73340', '$2y$10$633o8QLPnCsbdL/SCdUQg.xQcw6bhs8s3CM4fhrsnutwsvEpzjwm2', '1993-01-21', 'Marilyn Rivera', '8421', 'HES', '2023-01-23'),
(5017, ' Joaquin Alejandro', 'Del Rio Betancourt', 'Fracc Villas Solares II', 'C', 'Commodity Manager', '1', '73479', '$2y$10$HSepaWdB1p566K4OrJwv2.XBM73mseHF.xr632zi.MVtLmEY7O0ES', '1972-11-02', 'Al Carl', '101447', 'HES', '2023-01-30'),
(5018, ' Samuel Rodrigo', 'NuÃ±ez Barajas', 'Las viÃ±as', 'C', 'Planner II', '1', '73780', '$2y$10$e3lY.wlu9IbOuv01sCFUc.alOhoPRpXXEoqrG5kGvNlPSLxKQJnxK', '1987-03-13', 'Abraham Ronquillo Corral', '42681', 'HUS', '2023-02-20'),
(5019, ' Sergio Alberto', 'PiÃ±a Padilla', 'Oriente Zaragoza', 'C', 'Product Engineer', '1', '73971', '$2y$10$Dje/fgjh53PDY4hzx3LjQ.B1JSdb7EJeVqEzJ9evFl2ZC6Vcx6y2K', '1990-09-13', 'Jason Labhart', '27532', 'HUS', '2023-03-06'),
(5020, ' Alejandro', 'Andrade Lujan', 'San Angel', 'C', 'Buyer II', '1', '74036', '$2y$10$PysWcdrxbckHswWh4zxDSumQ8AicnxISEHuT54/rX3Xdi9.C4keqW', '1987-08-27', 'Sotelo Miranda, Sergio', '25732', 'HUS', '2023-03-13'),
(5021, ' Janet Cecilia', 'Carreon Alderete', 'Complejo Roma', 'C', 'Sup de Cuentas X Pagar USA', '1', '74145', '$2y$10$CYxUSZVm4rLHiRcWqgwgfOD1P9oSxrao/ji9UGEh23913.n2MV95q', '1980-03-26', 'Maria Cruz Romero', '24839', 'HUS', '2023-03-21'),
(5022, ' Jesus Maria', 'Maynez Martinez', 'Fracc. San Patricio III', 'C', 'Procurement Efficiency Analyst', '1', '74248', '$2y$10$4juL6wGd2C3iFHZhvzl43u4cGyA.r3sCZGvWQdgNDJUxJNC/.ybLq', '1985-11-26', 'Marilyn Rivera', '8421', 'HES', '2023-04-03'),
(5023, ' Salma Dali', 'Espinoza Casas', 'Salvaterra', 'C', 'Payroll Systems Administrator Mexico', '1', '74341', '$2y$10$EcGTjtieb7miwFfhYfiIHOmlY13cIuSjpKsLPzsgguHDL7cubAEfm', '1996-11-06', 'Hugo Pinales', '91442', 'HUS', '2023-04-10'),
(5024, ' Alain', 'Zamora Basurto', 'Ciudad JuÃ¡rez', 'C', 'Ingeniero de Calidad', '2', '74574', '$2y$10$XRvbpRPHWgJCjApZiuQbAui1zBhUjPXMHHorwA5F2QwBVO6AsPtyS', '1995-12-11', 'Nallely Alvarado Aguirre', '76513', 'HUS II', '2023-04-24'),
(5025, ' Luis Daniel', 'Valenzuela Mora', 'Parajes de Oriente', 'C', 'PRODUCTION SUPERINTENDENT', '1', '74607', '$2y$10$2yF6TVJw0g5kXjPocj01v..h7wyK/NEeZDLb36aKk7fgdgaqdekhC', '1980-12-03', 'Cesar Javier Armendariz Moriel', '73910', 'HUS', NULL),
(5026, ' Victor Enrique', 'Meraz Orquiz', 'La Cuesta', 'C', 'Sourcing Manager', '1', '74937', '$2y$10$KNOQe91wEOUt/Cqi8rerROlqZWJNX9eCajm4RWyFC8nEvttN2cFNu', '1969-02-21', 'Chris Keyes', '80396', 'HUS', '2023-05-29'),
(5027, ' Manuel Alfonso', 'Diaz Castro', 'Villas Costa Rica', 'C', 'Demand and Supply Chain Specialist', '1', '75068', '$2y$10$HURM57VoZuHWJsuRAtFOROTNccyuc4rXmeXQde4Ef49JNpoq8ATnS', '1984-01-28', 'David Garcia', '72919', 'HES', '2023-06-08'),
(5028, ' Maria Isabel', 'Castorena Venegas', 'Manuel Paredes', 'C', 'Inventory Flow and Warehousing Specialist', '1', '75069', '$2y$10$BagSPpjEIXunG80PkHXAaeb9I7Z/CjGxPckcSILLKRmrkmJGodqNC', '1964-08-28', 'David Garcia', '72919', 'HES', '2023-06-05'),
(5029, ' Kevin Alonso', 'Rodriguez Lopez', 'Hacienda de las Torres', 'C', 'Especialista de HR Ops', '1', '75221', '$2y$10$pbxnR7oUJ9.Pl7qblWm4Nuup1r98dXwaVoNAylzECvhy95j.2aiwq', '1999-11-03', 'Solorzano Ferrari Janet', '22578', 'HUS', '2023-06-12'),
(5030, ' Alondra', 'Hernandez Pantoja', 'Hacienda de las Torres', 'C', 'Asistente de Nominas', '1', '75223', '$2y$10$3H957suD08mvOzpLHMoW/uHjymDX4nDKszY8VD/ShonVBYsljxVrG', '1998-10-06', 'Salazar Silva Jose Concepcion', '86917', 'HUS', '2023-06-12'),
(5031, ' Luis Bryan', 'Vazquez Chavez', 'Belisa Residencial', 'C', 'Sourcing Manager Indirect', '1', '75283', '$2y$10$JKBVZXIH6WGBq35YyVKjn.4IUz5k8YU3vGIREKSheifju/cQi3Bm6', '1993-08-24', 'Carrie Ham', '56388', 'HUS', '2023-06-26'),
(5032, ' Adriana', 'Flores BaÃ±uelos', 'Felipe Angeles', 'C', 'Especialista en Aduanas', '1', '75501', '$2y$10$Xzyk5cwguVVE7gnLAaxhG.E8tQALDSZinzEvW1qqIHMREm4yNm8Nq', '1994-07-19', 'Hector Javier Barcenas Avila', '25379', 'HUS', '2023-07-03'),
(5033, ' Sergio De Jesus', 'Torres Hernandez', 'Pie de Casa El Granjero', 'C', 'Contador de Cuentas por Pagar', '1', '75677', '$2y$10$Wg1eZQBDk8XKx7/UrU.p9.WcxifK4lTSOYj8N/j0j/lZMl.5KMIba', '1992-06-11', 'Flores Morales Maria Gabriela', '37732', 'HES', '2023-07-31'),
(5034, ' Francisco Bernardo', 'Galvan Garcia', 'Anahuac', 'D', 'Supplier Quality Engineer', '1', '75859', '$2y$10$xZP6QSyua8LGMxKUbHqJJ.pgTOygv0XLYdlbri0EfsbNwawlaI2kO', '1974-04-03', 'Kula Ravichandran', '80483', 'HUS', '2023-07-31'),
(5035, ' Elizabeth', 'Juarez Hernandez', 'INFONAVIT AMPLIACION AERO', 'C', 'Especialista de HR Ops', '1', '76360', '$2y$10$Zbp0So6y9JOQ46dLg0d2SO7nKDpgPO84LF07.TEDdiqfrddzYM.i.', '1985-09-18', 'Solorzano Ferrari Janet', '22578', 'HUS', '2023-09-11'),
(5036, ' Hector Guerrero', 'Ramirez Ortiz', 'Oriente Urbialameda Versa', 'C', 'Planeador', '1', '76449', '$2y$10$ry/paP6cu1nDfl3XOqryQuGVqEKF6eEHca26YBVZ4QADTb2jY5iZG', '1982-12-12', 'Falcon Munoz, Lilia', '25685', 'HUS', '2023-09-04'),
(5037, ' Flavio', 'Marrero Rodriguez', 'Valle del Sol', 'C', 'Planner Buyer', '1', '76674', '$2y$10$AkgkICiG6X0n4RXaANiJ2OPXxUlBsiizZn41kVgubUZ9lkU4VOWAW', '1973-07-15', 'Jorge Herrera Ortiz', '75952', 'HES', '2023-09-25'),
(5038, ' Paulina', 'Carreon Caraveo', 'San Rafael', 'C', 'LMS Specialist', '1', '76675', '$2y$10$V2kyGdYINn2Sn2P95rVzkOLfC4vgm2ANwbtjO0XM19qijQ6X81.ai', '1983-10-10', 'Gregory Hamluk', '44547', 'HUS', '2023-10-09'),
(5039, ' Juan Benjamin', 'Pak Ramirez', 'COUNTRY SENECU', 'C', 'Ingeniero de Manufactura', '1', '76688', '$2y$10$6oDjOwkXpBZ3N7C1VMRcVetiWa2fEtSoUZecjqpGNl.Eb6kLHMUzi', '2000-08-30', 'Valles Rodriguez Ramon Eduardo', '98382', 'HUS', '2023-09-25'),
(5040, ' Wendy Sugey', 'Mojica Espinoza', 'Hacienda de las Torres Un', 'B', 'Supervisor de KPO', '1', '76977', '$2y$10$RH22O..R/4Qt540G1Oz6T.bZfdHcFknQDDtchvakuxFl/7oE6cnji', '1991-11-07', 'Hugo Gurrola', '75403', 'HUS', '2023-10-23'),
(5041, ' Iaan Alejandro', 'Nevarez Macias', 'Aurea Residencial', 'C', 'Ingeniero de Manufactura', '1', '77170', '$2y$10$6W403W/n7lMVKZXz4s2oeuddJWpBJO.4SCpZ6a0gGc9lavDjvpMSS', '1990-11-20', 'Ivan Valero', '24932', 'HES', '2023-11-13'),
(5042, ' Mario Luis', 'Martinez Cebrian', 'Bosque Alto', 'C', 'Production Planning Shop Floor Control Specialist', '1', '77632', '$2y$10$fLDfMw1zsJuDRxUFiT6Th.WBgSKl4Xnkg09G5eNw4Vdn5mGYvqXdO', '1981-09-20', 'David Garcia', '72919', 'HES', '2024-01-08'),
(5043, ' Gerardo', 'Hernandez Gonzalez', 'Roma', 'AB', 'Supervisor de Recursos Humanos', '1', '77884', '$2y$10$HkezbE0Z6OAYtDoza8afJeBf19bLCiieHCiALYGKb/NpaYPxGNRJe', '1972-10-24', 'Mirian Yesenia Cabrera', '548', 'HUS', '2024-01-29'),
(5044, ' Karen Alejandra', 'Rivera Gonzalez', 'Puesta del Sol', 'C', 'Especialista de HR Ops', '1', '78027', '$2y$10$5PuUT4XE1w6jcHKeOskEiuMPbsG0GgIMcxvHkNzGcAt.bReaH6hyi', '1999-11-10', 'Solorzano Ferrari Janet', '22578', 'HUS', '2024-02-19'),
(5045, ' Rosa Nohemi', 'Molina Nodal', 'Paseos del Alba', 'C', 'Analista de Cadena de Suministro', '1', '78118', '$2y$10$i1.k8lcmFLhsyUg8yCyYe.wphKOKlewh2qAg8YKodZ.nwFcRj/RcW', '1988-02-15', 'Al Carl', '101447', 'HES', '2024-03-04'),
(5046, ' Xochitl Nataly', 'MuÃ±oz Flores', 'Oasis Revolucion I', 'C', 'Planeador', '1', '84388', '$2y$10$11zMOM5rBr5rsCs/mhShD.Kp3HQnHMZNfZteItZvHNT98HVAgiyae', '1994-11-05', 'Falcon Munoz, Lilia', '25685', 'HUS', '2019-02-18'),
(5047, ' AndrÃ© CÃ©drick', 'Rosa Felix', 'Colinas de Agua Caliente', 'D', 'Senior Bussiness Process Digitalization Developer', '1', '85745', '$2y$10$R2SdRV6pcm4yoYHgGWjduOjU2OrsD4gtQcg.sDNr8PGHVjC1rMy/6', '1997-01-01', 'James Powell', '36288', 'HES', '2022-01-31'),
(5048, ' Estuardo', 'Deras Ramos', 'Fracc. Urbi quinta granad', 'C', 'Ingeniero de Procesos', '1', '86580', '$2y$10$ytq1jE6VzdLwMU4pjd1Pe.Xuv9b8JVcegnc8P/1nPAWM8f.MsS1AC', '1997-01-04', 'Norma Angelica Moreno', '71094', 'HUS', '2022-12-12'),
(5049, ' Adriana', 'Borrego Torres', 'Oriente Simon Rodriguez', 'C', 'Contador De Costos', '1', '86783', '$2y$10$P1BRAfHtMDGcjoMV2JxsueKPbFfisIKxlOYG5.K5CdxZe9yUDv/LW', '1997-10-02', 'Mario Soriano Romero', '75688', 'HUS', '2020-03-30'),
(5050, ' Karina Andrea', 'Flores Gurrola', 'Infonavit Juarez Nuevo', 'C', 'Planner I', '1', '86803', '$2y$10$VM0c0iHHjGxtDKOCnWCww.GLAgE05eMQ2v4TOE76bUVPm/5sThQwO', '1996-03-21', 'Falcon Munoz, Lilia', '25685', 'HUS', '2019-07-01'),
(5051, ' Jorge Alberto', 'Lopez BaÃ±uelos', 'Hacienda de los Nogales', 'C', 'Planeador', '1', '88690', '$2y$10$25u/2J0lcaL1wr4YRDP2..xVEmkSswN541GKq4Rtqvi.GtTYANSVW', '1968-12-23', 'Abraham Ronquillo Corral', '42681', 'HUS', '2019-11-18'),
(5052, ' Manuel', 'Avila Vazquez', 'Santa Teresa', 'C', 'Especialista de HR Ops', '1', '88826', '$2y$10$g5x2aLunw76DSpNXaYJRdepIABUMgzVKWmV5khppY5AzmIEib4oJ2', '1988-02-12', 'Solorzano Ferrari Janet', '22578', 'HUS', '2020-01-06'),
(5053, ' Gloria Aurely', 'Sarmiento Coronel', 'Morelos II', 'C', 'Especialista de HR Ops', '1', '88827', '$2y$10$cXNwkaRGSMxkKqVl2SPbju4peF/S4WPzAdyZ2AjD3PYgtzH3KAsZi', '1989-11-13', 'Solorzano Ferrari Janet', '22578', 'HUS', '2020-01-06'),
(5054, ' Lorenza Marisol', 'Amaya Flores', 'Praderas del Sur', 'C', 'Asistente de Nominas', '1', '94797', '$2y$10$JF9.vqVafWZ.ymuCdqwcyO4LgA8tYB0BKFPtjeNSdPQh9iWC4y65.', '1995-06-06', 'Garcia Varela, Haydee', '86547', 'HUS', '2020-01-27'),
(5055, ' Erika Yulissa', 'Hernandez Aguilar', 'Residencial Gardeno', 'C', 'Ingeniero de Procesos de Fundicion', '1', '95298', '$2y$10$pgqlwmqNbyEu0Yh/0vePoOL3.ieuyfHaeGqt0Js4hB1V1qLO7IDsy', '1997-02-14', 'Guillermo Moreno', '72011', 'HUS', '2020-02-25'),
(5056, ' Flor Edith', 'Olivas Loera', 'Manuel Gomez Morin', 'C', 'Cost Accounting', '1', '95832', '$2y$10$2Ksq2gaFNPyoDGwVANEi7OF/YhMuprXReIy5AhsWW0ylc.QrUo5Tu', '1992-03-23', 'Mario Soriano Romero', '75688', 'HUS', '2020-03-23'),
(5057, ' Brenda Guadalupe', 'Devora MuÃ±oz', 'Paseo Arboleda Residencia', 'B', 'Supervisor de Produccion', '1', '96747', '$2y$10$.Wb7cUYITBWdi4YJC9rPYObEASFvBi2XrwoqWzqRPmYZA3z5XxdTa', '1996-12-12', 'Norma Angelica Moreno', '71094', 'HUS', '2020-06-01'),
(5058, ' Jovany Alfredo', 'Cuevas Dominguez', 'Paseos del Alba', 'D', 'Master Planner', '1', '97902', '$2y$10$u0R8gtln1.DlJZnHriC2lul9E8WmRZk.2NymrMSdf1Qy2p1aIMABe', '1992-01-08', 'Alan Pando', '75499', 'HUS', '2020-07-13'),
(5059, ' Luis Gerardo', 'Lozoya IÃ±iguez', 'Jardines de Aragon', 'C', 'Buyer II', '1', '97908', '$2y$10$IOgd8Qiz4sFQzo/frxCz0umGfabP4qyc2vXHC2tENmdx3p8MFfPAK', '1990-03-02', 'Sotelo Miranda, Sergio', '25732', 'HUS', '2020-07-13'),
(5060, ' Melisa Edith', 'Gonzalez Mercado', 'Hda. de las Torres', 'C', 'Asistente de Nominas', '1', '98041', '$2y$10$SuRRRa1uoEVjjRVxZTOLiuX4/vmm4QAPiMWWzMU0Ao.JIk.QdzDwy', '1998-10-20', 'Salazar Silva Jose Concepcion', '86917', 'HUS', '2020-07-16'),
(5061, ' Brenda Valeria', 'Sanchez Garcia', 'La Cuesta', 'C', 'Inventory Analyst', '1', '99308', '$2y$10$tmQmuY/4pNYDC9GMoBp.AO3knHbrP2pskuZq2dQBzi.AbfrE4/6uO', '1997-07-27', 'Mario Soriano Romero', '75688', 'HUS', '2020-09-08'),
(5062, ' Omar', 'Vazquez Inostroza', 'Praderas de los Oasis', 'C', 'Customs Analyst', '1', '100228', '$2y$10$vMUmygb8ZBleyvvSTM68Y.aeU9PoEmKCt5k.aduOk0vpHilt6frv2', '1992-09-21', 'Galvan Orozco, Sergio Yocet', '25369', 'HUS', '2020-10-14'),
(5063, ' Flor Berenice', 'Hernandez Cazares', 'Oasis Sur', 'C', 'Comprador', '1', '100937', '$2y$10$qbEgbY5I48nPdyebnjJPrOHtVR3GLsIx.ZuW80.rnVaX3DBT/23PC', '1986-05-31', 'Sotelo Miranda, Sergio', '25732', 'HUS', '2020-11-11'),
(5064, ' Jose', 'Adame Perez', 'Heroes de la Revolucion', 'C', 'Assoc Mfg Engineer', '1', '110426', '$2y$10$qsmQzEBTIXOOUVFxqKEUOu877f9Ai2of5VhfluhZEizbdzETXnKoO', '1998-03-30', 'Ivan Valero', '24932', 'HES', '2021-10-18'),
(5065, ' Miguel Angel', 'Ramirez Jurado', 'Vilago', 'C', 'Ingeniero de Manufactura', '1', '117260', '$2y$10$6ioOB9P.Vbkbuc1d8BAQpuRvop1oR0enJjuyvb/I1vvvOBH2IVdrC', '1989-09-13', 'Norma Angelica Moreno', '71094', 'HUS', '2022-08-08'),
(5066, ' Joaquin', 'Ponce Murillo', 'Las Gladiolas', 'C', 'Ingeniero EHS', '1', '118610', '$2y$10$WM4IZ0sSuhLJ3TAWB.TeduPYGMfwPTVp3qZwGRGCkX8qRhEiGMcWq', '1993-09-09', 'Jose Rodolfo AcuÃ±a Lopez', '78080', 'HUS', '2022-10-10'),
(5067, ' Alan David', 'Rodriguez Arellano', 'Salvarcar', 'C', 'Especialista de HR Ops', '1', '300055', '$2y$10$oif1MGTwXuaFqcJfmQaEu.DBhiwUdycEG2w8cr9ejqqPX9ZAtIDu.', '2001-07-26', 'Solorzano Ferrari Janet', '22578', 'HUS', '2024-03-11'),
(5068, ' Alejandro', 'Alonso Jimenez', 'Jardines Residencial', 'C', 'Ingeniero de Procesos', '1', '300722', '$2y$10$4JscKl7Cc9ER6ACAYR3aEOcAFzRNceyJBbLKDjCwoEPSG1HzGEHu6', '1987-05-23', 'Adalberto Suarez Marin', '66069', 'HUS', '2024-05-13'),
(5069, 'Andrea', 'Gutierrez', 'El centro', 'D', 'Fundicion', '1', '22333', '$2y$10$TD65xEXU0CGQqfrBiVNtOuiSu8Rml.Wh/QByXLkFf/PYNOlZsAzre', '2024-05-30', 'Julian Perez ', '55663', NULL, NULL),
(5070, ' Sergio', 'De la Rosa Hernandez', 'Parajes del Valle', 'D', 'Almacenista', '1', '27407', '$2y$10$tZGS807jvfji5ORGQh/5.OZbOSkQhBuxuYgvXNBOGSCHTv.Q5.pqC', '1978-12-04', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2013-07-24'),
(5071, ' Fabiola Danahy', 'Azpeitia Ortega', 'Valle de Santiago', 'D', 'Operador De Procesos', '2', '29709', '$2y$10$cJft5NfXYWN3aeCroNOK6OPs1A4nKHnq3kZD/B.GgJnLZ4ecEeReS', '1993-06-07', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2014-02-03'),
(5072, ' Maria Del Refugio', 'Terrones Melchor', 'Aguilas de Zaragoza', 'D', 'Operador General', '1', '29774', '$2y$10$Y2K9oLRKNft4w1.NCR0cMu5mGiViMn0iJJtCTL1m3BWqbMdbD1NXG', '1964-08-26', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2014-02-20'),
(5073, ' Julio Cesar', 'Flores Rios', 'Parajes de Oriente', 'D', 'Operador de Criticos', '2', '31188', '$2y$10$L6MSMLqpLmdN9NqS/C/O9OoPa4qQJnsFuQfG7jGzJmW06RN1rJ3yK', '1975-07-30', 'Santiago Antonio Pacheco', '72187', 'HUS II', '2014-05-12'),
(5074, ' Vicente', 'Alvarez Estrada', 'Lomas del Desierto', 'C', 'Auxiliar de Recibos', '2', '31399', '$2y$10$a06yZhxwSbregF74ST9dXeRG/RMfl8CAN6jlAfsYgxyvmupzvk.Me', '1983-08-31', 'Bacilio Abel Rocha Carrillo', '68476', 'HUS II', '2014-05-26'),
(5075, ' Jaime Manuel', 'Ortega Martinez', 'El Fortin', 'D', 'Tecnico de Calidad', '2', '32494', '$2y$10$2ynRJoK3NNGsiRdrLNoVsO51.ZTOFbAnbefl8YzjqTfmyRAJgrEpi', '1979-01-18', 'Gonzalez Ortega, Gerson Albert', '84541', 'HUS II', '2014-07-09'),
(5076, ' Maria Catalina', 'EstupiÃ±an Guerrero', 'Profesora Maria MartÃ­nez', 'D', 'Operador General', '1', '35717', '$2y$10$V7zRAdL.i.g.gHoVOD9uXeroZZDFwin3v67Bvltw5a2/wxHFoCedq', '1969-03-09', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2014-10-21'),
(5077, ' Jacquelin', 'Cruz ZuÃ±iga', 'El Sauzal', 'D', 'Operador General', '1', '59790', '$2y$10$0hadJANcudSR7801DZIdju2GcIIpBv8oiaM4oaNHsmAvg12a9z9uu', '1977-02-13', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2005-07-12'),
(5078, ' Benito', 'Triste Carrillo', 'Parajes del Sol', 'D', 'Tec Esp en Mtto Equipo', '1', '59794', '$2y$10$i5RCQAEanspwNOnywB2voeUy6A7LreqR/2VUd/ouAnWKCfVZlxH3W', '1967-12-06', 'Martinez Gonzalez Fernando', '24731', 'HES', '2024-04-02'),
(5079, ' Maria Guadalupe', 'Sauzameda Delgado', 'Horizontes del Sur', 'D', 'Limpieza', '1', '59805', '$2y$10$qlptHVAbWCZWaSe1TISuE./YGZgpuOuCOqpGauCMsZD/4aILdmAfy', '1972-05-17', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2006-01-06'),
(5080, ' Alberto', 'Dominguez Garcia', 'Juarez Nuevo', 'D', 'Tec Esp en Mtto Equipo', '1', '59811', '$2y$10$zmy5ixUsH0nAb1zHv1.t0u2hHtYZSea/4moJYtKTD/jWhPhW9dhmi', '1984-07-01', 'Fernando De La O Alvarez', '70963', 'HUS', '2006-02-07'),
(5081, ' Guillermo', 'Palacios Hernandez', 'Urbi Villa del Campo', 'D', 'Tec Mtto Equipo de Moldeo', '1', '59812', '$2y$10$M2cC5aHuuPbh8At.pobjhOjdOsIQxjU8C1ecLGOlkjW44nBfYuDdu', '1986-09-12', 'Castro Molina, Jesus', '46787', 'HUS', '2006-02-02'),
(5082, ' Benjamin', 'Reyes Avila', 'Hacienda de las Torres', 'D', 'Tecnico Seguridad Industrial', '1', '59821', '$2y$10$aUJ1JRvyQMzErSp2v6JqAefj7egY6rxWSgIsM6h4MK/tYuBrAm20u', '1968-01-21', 'Jessica Alejandra Aguilar Guti', '109077', 'HUS', '2006-04-11'),
(5083, ' Ma. Guadalupe', 'Mar Blanco', 'Heroes de Mexico', 'D', 'Operador General', '1', '59824', '$2y$10$k6jaw3PSsL1cOyQwLfHGmePzZXPbrjZMvvCLEAYUp65z.iHKxK/qy', '1966-12-12', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2006-05-02'),
(5084, ' Sanjuana', 'Garcia Rodriguez', 'Parajes del Sol', 'D', 'Operador De Procesos', '2', '59831', '$2y$10$DVLxL54SsCMhw7KyHRLHr.uAKS5keOlAvZ47s3sUG4hYfsJBR1IOC', '1975-04-25', 'Erik Rey Mata Texna', '61890', 'HUS II', '2006-05-31'),
(5085, ' Irving Ruben', 'Cortes Ponce', 'Parajes de san Isidro', 'C', 'Encargado de Tool Crib Sr', '1', '59841', '$2y$10$deZbJaQdIMOkI24HTNGjzuR2ihdFToEm0yJDNwocM6gnX2ltgn1P.', '1988-04-03', 'Martinez Gonzalez Fernando', '24731', 'HES', '2023-05-29'),
(5086, ' Jaquelin', 'Roldan Garces', 'Horizonte Sur', 'D', 'Operador De Procesos', '1', '59847', '$2y$10$rdu6fWun7PVE6vLm.IRVYejQtysU63ffrHzGcjfbdHfKqVclxbtzK', '1973-04-21', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2006-10-17'),
(5087, ' Carla Lorena', 'Valenzuela Alba', 'Parajes de San Isidro', 'D', 'Operador De Procesos', '1', '59850', '$2y$10$qhYefqdTrrC2bE6dZY7F2O/BKtTd4o7TFsddIUYz6O8ltTCCOak9W', '1979-03-07', 'Varona Hernandez, Braulio', '61651', 'HUS', '2007-01-02'),
(5088, ' Silvia', 'Reyes Cortes', 'Fray Garcia de San Franci', 'D', 'Operador De Procesos', '2', '59854', '$2y$10$6ZC2SqsyUhJRDy0AMGHBs.olmJPd0zKDdquFn1LFbgsRfkt19eH42', '1970-02-09', 'Garcia Gaucin, Erik', '28228', 'HUS II', '2007-02-07'),
(5089, ' Josefina', 'Herrera Iquera', 'morelos 1', 'D', 'Inspector Control de Calidad', '1', '59856', '$2y$10$Z.8AXHBw667fkVhmnaRAje.lSRgzw5MiN/medXE3oTJ3PA..h5vty', '1977-03-20', 'Jose Ruiz', '74929', 'HUS', '2007-03-20'),
(5090, ' Teodoro', 'Pineda Cervantes', 'Municipio Libre', 'D', 'Operador General', '1', '59857', '$2y$10$bo8th7HRF/yAQ7UmMFYkaOI5p/aC8mCo1M5ANHJx80tGUqzackFLK', '1972-09-27', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2007-03-21'),
(5091, ' Yolanda', 'Palomares De la O', 'Carlos Chavira Becerra', 'D', 'Operador General', '1', '59858', '$2y$10$pBW15H5bdQjtvnZBEjlwjeEx3QSe2kUX7yCHnCGb5U5dC2CIds1F6', '1977-03-15', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2007-03-22'),
(5092, ' Martha', 'Herrera Romero', 'Sor Juana InÃ©s de la Cruz', 'D', 'Operador General', '1', '59864', '$2y$10$gfdwD.0ASgjZBbpWY7OrC.u817af2Zl3g7pyROmqDMs2G4jqwMLdS', '1966-07-29', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2007-04-09'),
(5093, ' Chain', 'Salvador Martinez', 'Urbi Villa del Cedro', 'D', 'Tecnico de Calidad', '2', '59875', '$2y$10$1taoDOFBYT.KW8feiJoICuWvgAa04zsgWVYMlydtRvJzsYRSes6I6', '1984-05-18', 'Humberto Lopez Lopez', '61865', 'HUS II', '2018-04-10'),
(5094, ' Jorge', 'Mendez Zaragoza', 'Parajes de San Isidro', 'D', 'Operador de Set Up', '1', '59877', '$2y$10$1i.Saer96q4SXGZ7Zoxnue0Lw2SQBn5.68K6oj7ONvxMVHIvmBeBm', '1975-04-23', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2008-01-09'),
(5095, ' Ernesto', 'Noriega Hinostroza', 'Horizontes del Sur', 'D', 'Operador de Set Up', '1', '59880', '$2y$10$60j7oDjteroRV0h2Ig94/u16P.VgkjcS4wB1EwoamhlMwNrzlU45G', '1988-05-08', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2024-04-11'),
(5096, ' Ma Graciela', 'Rios Ramirez', 'El Fortin', 'D', 'Operador De Procesos', '1', '59881', '$2y$10$rGHzSi2xqtphXu1B1eZRkerhPDLvSEHYvih2NByycytSmiNVE48RC', '1974-02-03', 'Varona Hernandez, Braulio', '61651', 'HUS', '2008-01-23'),
(5097, ' Ruben', 'Franco Ontiveros', 'Prados de Salvarcar', 'D', 'Lider de Produccion', '1', '59883', '$2y$10$4KHTijlZG2Uc6XnkdULL2uslxrhPQd7/xNdPwjnc8tAnkzYmThnxO', '1969-07-27', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2008-05-14'),
(5098, ' Jose Guadalupe', 'Arellano Jaquez', 'El Fortin', 'D', 'Tecnico Soldador', '1', '59885', '$2y$10$lEbFQ0/9nguL.pwmQztbuuJnpRpYEo7RsN1uGgiemBTXKdAp8rBcm', '1973-05-19', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2008-05-15'),
(5099, ' Joel', 'Alvarado Gonzalez', 'Paseo de las Torres', 'D', 'Operadores de Secundarios', '1', '59886', '$2y$10$aRyyGxSXfQG8dJU4qiKAGOSTJgq4d3H0dl7sPR8MnJMTqSjX6ClAa', '1965-01-14', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2008-06-03'),
(5100, ' Gloria', 'Gonzalez Bueno', 'Cerradas San Pedro', 'D', 'Operador General', '1', '59892', '$2y$10$0GFsd5/v6LDVRpQxvw2Q9eAuKNfeOv.1X4whxIys2i8UGuzroqdX2', '1988-01-21', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2016-06-09'),
(5101, ' Aaron Edgar', 'Rodriguez Hernandez', 'Manuel Valdez', 'D', 'Tec. De MetrologÃ­a', '1', '59893', '$2y$10$D72Yn8CNh4HXsAHJpyli1eu25iJmgZZiqCayo2Ldb9pb4KJZdz7yq', '1987-06-28', 'Rodriguez Celaya, Ramiro', '24790', 'HUS', '2008-07-21'),
(5102, ' Leopoldo', 'Gutierrez Nicanor', 'Parajes del Sur', 'D', 'Operador de Set Up', '1', '59897', '$2y$10$o3BpDF0HH0xsa/u3vAoyCuE19N1gfNhDS6q30UposRzlT.aoT4any', '1974-04-09', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2024-06-10'),
(5103, ' Zeferino', 'Fierro Guzman', 'Eco 2000', 'D', 'Operador de Set Up', '1', '59898', '$2y$10$lYvpETaKpd/.c6hiYS3ATuMCKT.iqvZq.AmeNEdYX5E2BosnmPmHW', '1966-10-18', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2009-01-19'),
(5104, ' Alfonso', 'Silva Monrreal', 'Las Almeras', 'D', 'Operador de Set Up', '1', '59902', '$2y$10$A/YyXIuYeBT8m0.pGIRseuC3pzzO6decXCP2vx2WooeZQVsTe7mva', '1980-01-23', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-05-04'),
(5105, ' Juan Carlos', 'Bravo Santiago', 'Parajes del Oriente', 'D', 'Lider de Embarques', '2', '59907', '$2y$10$a/n5v/5CZFzIrwT7iSx1oORWdMyzSGt6lxSWqSeYxRfu7UQoI5bMG', '1986-06-24', 'Ricardo Joel Trejo LÃ³pez', '84444', 'HUS II', '2009-03-24'),
(5106, ' Ana Liseth', 'Montelongo MuÃ±oz', 'Riveras del Bravo', 'D', 'Jefe de Grupo', '1', '59916', '$2y$10$VXlvH6aV5gEazbrJd3Vi2ecwVxVjve6rQLBWFL4KwexevD8tA4SoC', '1979-05-12', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-06-13'),
(5107, ' Donaciano', 'Lopez Hernandez', 'Riveras del Bravo', 'D', 'Operador de Set Up', '1', '59918', '$2y$10$qTub7uRrDj3CzsMg0VnoW.u/SppK6U/qK7Cvj8ZL0.fJL760MrmRy', '1979-05-18', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-07-04'),
(5108, ' Elizabeth', 'Magallanes De Leon', 'Aguilas de Zaragoza', 'D', 'Operador General', '1', '59922', '$2y$10$x5eUb9D3nYb1FIfGLZ.1FuHD29k7UOX7SVZajvSLtmsHMCblcVcO2', '1974-04-09', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2009-04-20'),
(5109, ' Guadalupe', 'Lopez De la Cruz', 'Senderos de San Isidro', 'D', 'Operador General', '1', '59924', '$2y$10$c7nda1q4B5hH879.8xCGEeARAFfiA0UHKQWDKjLhM9GApQQm54sWq', '1981-09-16', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2009-06-01'),
(5110, ' Francisca', 'Chavarria Silva', 'Bosques de Salvarcar', 'D', 'Operador General', '1', '59925', '$2y$10$QmXEOtZBO1djzIqYZKJQaOluWAjceIScD64pBnAR44hbQwZNBjRAe', '1964-10-10', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2009-06-01'),
(5111, ' Ricardo', 'Caudillo Rangel', 'Paseo de las Torres', 'D', 'Operador de Set Up', '1', '59926', '$2y$10$lsCr4m.svj3AZquUNWSFgeanZ4fXU4qewTz30HhnLRKV34VywhAy6', '1972-04-24', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-02-20'),
(5112, ' Angel', 'Cruz Salas', 'Riveras del Bravo', 'D', 'Lider de Produccion', '2', '59929', '$2y$10$j09FGGuTZ0rR8QCAg3d9e.zs.dxr2DobgiK9/y2tsZG5JeYIaIDsO', '1982-01-19', 'Leyva Corral, Jose Ramon', '25229', 'HUS II', '2010-04-19'),
(5113, ' Uriel Ivan', 'Reyes Reza', 'San Antonio', 'D', 'Tecnico Electromecanico', '1', '59933', '$2y$10$DV4eaL/Y0pgqDATO01isueI3E.IufuybotSwQRSjjInoWIw9dhl4y', '1985-11-26', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2009-06-01'),
(5114, ' Filiberto', 'Martinez Navarro', 'Praderas de la Sierra', 'D', 'Jefe de Grupo', '1', '59934', '$2y$10$c9n3JFCf2e9g0lrTeP964uCx01by6dTAPs.RLTFaK4msYAK/4iSza', '1968-08-22', 'Vania Garcia', '100540', 'HUS', '2009-06-01'),
(5115, ' Saul', 'Salas Perez', 'Praderas del EnequÃ©n', 'D', 'Almacenista', '1', '59935', '$2y$10$UvY/CyRnkLZkBSIVeLadWOnos0yrqKJJsu6FQE/dtBLx/.ZXdK3LC', '1974-10-26', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2009-06-01'),
(5116, ' Jorge Raul', 'Ontiveros Villegas', 'Horizontes del Sur', 'D', 'Operador Especialista', '1', '59936', '$2y$10$prb7CEKNri.p8gpFe9rsSuDeTYWw90u.uOTe0rtIAR5O0KOw1xMz6', '1973-06-04', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-07-06'),
(5117, ' Ismael', 'Hernandez Zeferino', 'Riveras del Bravo', 'D', 'Tecnico de Ingenieria Sr', '1', '59939', '$2y$10$6hGqsyAaO433giGbT6gf6.mTPNpNDsdjUmdDx2PT//YMs90QLRtg.', '1983-09-19', 'Mata Castro, Julian', '25755', 'HES', '2009-06-01'),
(5118, ' Lucino', 'Nevarez Chavez', 'Sor Juana InÃ©s de la Cruz', 'D', 'Tecnico Mecanico B', '1', '59940', '$2y$10$/.YA/.JXFw1SwPPSXSy06uJmpfRzzlMyFYAoQg9LbwdCKqLMpmvzi', '1964-06-30', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2009-06-01'),
(5119, ' Zalatiel', 'De Jesus Toral', 'Las Gladiolas', 'D', 'Tecnico Soldador', '1', '59943', '$2y$10$ld2AonblWSTS8ouNK7NkRO8Ea8Nk.DaP5z6F0BItqhLlkSPhgqyF2', '1978-06-01', 'Fernando De La O Alvarez', '70963', 'HUS', '2009-06-29'),
(5120, ' Manuel', 'Juarez ', 'Parajes del Oriente', 'D', 'Operadores de Secundarios', '1', '59949', '$2y$10$kD.8.XFZfZzp0b3/Op2Ry.I9Q6hv0nB0KzNvyBAkAGkrx2GHWNsZG', '1969-06-05', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2010-05-04'),
(5121, ' Cruz Ivan', 'Hernandez Colmenares', 'Las Haciendas', 'D', 'Operador De Procesos', '1', '59964', '$2y$10$BmPcjnb6ApU/NBD8g0np1OMRmQYJTzCZy887w7zlTK8zMnPB8nZbe', '1988-05-03', 'Varona Hernandez, Braulio', '61651', 'HUS', '2010-12-09'),
(5122, ' Arturo', 'Cisneros Cossio', 'Zaragoza', 'D', 'Tecnico de Calidad', '1', '59966', '$2y$10$UsmjX8hyH.frxfXFJXENMuSBpVE9XlBoHidxswG1kdJUmah260OpG', '1981-12-12', 'Kevin Adrian Martinez Orozco', '300062', 'HUS', '2015-07-27'),
(5123, ' Fermin', 'Raygoza Guajardo', 'Roma', 'D', 'Operador De Procesos', '1', '59967', '$2y$10$z4AyVKj/Yuh./BVgP8MSWOO2P/3HBMuWNfNKeFAVQpD7TZmPilGZm', '1977-09-11', 'Varona Hernandez, Braulio', '61651', 'HUS', '2011-01-24'),
(5124, ' Ricardo', 'Sifuentes ', 'Constitucion', 'D', 'Operador de Set Up', '1', '59968', '$2y$10$JV8I60p8JbWrlTgtuagNBOtTrizsBwnEbHHiekUWMCPfntk8pKvN.', '1979-11-19', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-10-23'),
(5125, ' Jairo Isaias', 'Rodriguez Lazos', 'Hacienda de las Torres', 'D', 'Tecnico de Calidad', '1', '59973', '$2y$10$0QmhL9RT7CBBoarRtL8sb..BhEx8ddC762eRs68FnM80R2WDJbtMW', '1992-04-08', 'Rodriguez Celaya, Ramiro', '24790', 'HUS', '2011-02-14'),
(5126, ' Pedro Esteban', 'Duarte Morales', 'Morelos 1', 'D', 'Operador de Set Up', '1', '59974', '$2y$10$YFj3S58t2nZNdPeV2NedeeIelrYNWKkDrjbptvcnykLOVLCOSD/bW', '1986-11-29', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2011-02-14'),
(5127, ' Cornelio', 'Lorenzo Angel', 'Terrenos Nacionales', 'D', 'Operador De Procesos', '1', '59976', '$2y$10$nabpZ3TdFQWgNUupTZYg7.7iCjQgHvH3eMrYtURskMAKIejmytp5i', '1988-05-09', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2011-03-02'),
(5128, ' Rocio Elizabeth', 'Tabares Ramirez', 'Praderas de los Oasis', 'D', 'Operador General', '1', '59979', '$2y$10$1gYpguD.zZTVbgY8X0ORj.rzCRBdwADJfSTlvh7mtcIBPa30KC4by', '1974-10-23', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2011-03-22'),
(5129, ' Victor Hugo', 'Cuellar Martinez', 'Lomas del Rey', 'D', 'Operador de Secundarios', '1', '59986', '$2y$10$WOoBQXfxTrtiCpTj8QlH9Oh/lEf9BFoWz4Jc/Z7wc18yQIGtq4MeW', '1986-06-10', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2011-05-04'),
(5130, ' Bruno', 'Valdez Lujan', 'Horizontes del Sur', 'D', 'Tecnico Seguridad Industrial', '1', '59989', '$2y$10$0Q/G/aoGseLo4kOD3tL/M.QZfP0xHhPX5EuMOh6bb2tZQu96rs8Li', '1982-09-20', 'Jessica Alejandra Aguilar Guti', '109077', 'HUS', '2011-05-04'),
(5131, ' Ana Laura', 'Acosta ', 'Paseo de las Torres', 'D', 'Operador de Secundarios', '1', '59997', '$2y$10$VHHqdbOYxJqbKvprAfaG2eG8BaTW7rKBUGhyCaxAULWGTwZGfC4Z2', '1970-07-09', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-08-25'),
(5132, ' Victor Miguel', 'Duarte Mendez', 'Praderas de los Oasis', 'D', 'Tec. de Metrologia', '1', '59999', '$2y$10$Vcy49D2JEByBTCBt/tiamujZm0Dp82HsJxyQt7RQ/1kDWqvutTKwm', '1970-01-05', 'Oscar Garcia', '59965', 'HES', '2011-07-28'),
(5133, ' Gerardo', 'PiÃ±a Carreon', 'Manuel Valdez', 'D', 'Tec Esp en Mtto Equipo', '1', '60000', '$2y$10$kIIP24Xz2dCGQiOLZhtzB./vMPS4HiUcumSTofbZEcayz564P/DCK', '1975-04-23', 'Martinez Gonzalez Fernando', '24731', 'HES', '2023-07-13'),
(5134, ' Carlos Roberto', 'Rodriguez Guerrero', 'La CaÃ±ada', 'D', 'Operador De Procesos', '1', '60002', '$2y$10$iMb5gmt.bIUvyzuTXGCvwOzidl5hJKD4QnFLwLWeZrKSmQbMUOblm', '1972-10-15', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2008-08-19'),
(5135, ' Israel', 'De los Santos Lopez', 'Hacienda De Las Torres Un', 'D', 'Lider de Tecnicos Cnc', '1', '60007', '$2y$10$VCb11vk3BWRP5snhSvP2EOCRLpcfYJp8EkmQhREqRZaCF2MiaTasi', '1981-08-04', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-02-02'),
(5136, ' Cristian Ivan', 'Castor Uribes', 'Parajes del Sur', 'D', 'Lider de Produccion', '1', '60008', '$2y$10$86ZpFQ/YfPq4ZUx.sLwcLOWD3eukh2q/2NbyrsNqN.gH4.0TQDeaS', '1988-12-05', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2008-09-01'),
(5137, ' Pedro', 'Miguel Nicolas', 'Torres del Sur', 'D', 'Operadores de Secundarios', '1', '60009', '$2y$10$J7GdFEE1eJCU6cbgciRPWOnkxf96i/3LWU394VpjzahQg7ITu57Bq', '1989-08-26', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2008-09-01'),
(5138, ' Marco Antonio', 'Almaraz Falcon', 'Paraje de San Isidro', 'D', 'Operador de Set Up', '1', '60014', '$2y$10$HlNfvwxYfNlE64SdH76U.eTnp9R6fpg3131pAdoOM2ZSKbSHHo7UC', '1983-03-25', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-02-20'),
(5139, ' Jose Isidro', 'Uribe Ramirez', 'Rincon del Amanecer', 'D', 'Tec Esp en Troqueles', '1', '60020', '$2y$10$magY5NxAPhNuMN1ONrHC9.DMLD0fD5krebVEkOaO5sleNLYG3Wo8S', '1981-05-15', 'Favela Alvarado, Jose Luis', '25333', 'HES', '2024-05-27'),
(5140, ' Celsa', 'Valero Ortega', 'Eco 2000', 'D', 'Operador General', '1', '60025', '$2y$10$GgNatvtmRCNYhGl2IBYQ8eqknDsjO7/1cYYmMMS8QQNQdQROaZ.pm', '1967-11-01', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2012-04-16'),
(5141, ' Victor Manuel', 'MuÃ±oz Cano', 'Horizontes del Sur', 'D', 'Operador de Set Up', '1', '60026', '$2y$10$076V.rtdI4L5ojqK32RgzevjgCN2Q0V6hfWbJkNdoeFk5ws3T37Z6', '1970-06-17', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2012-04-25'),
(5142, ' Jorge Daniel', 'Ayala Rubio', 'Praderas del Sur', 'D', 'Operador de Set Up', '1', '60027', '$2y$10$nbRbD2kWlEasVN5NRpyNDObALO9D25S.gYl3/e1R.k0tpwDlHkj4O', '1993-09-06', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2012-07-20'),
(5143, ' Valentin', 'Barrera Torres', 'Horizontes del Sur', 'D', 'Tec Esp en Mtto Equipo', '1', '60028', '$2y$10$oUAbi..Ez6sT9ts7MVQ3XejJXims78Er0pzYr9yewzNBGHNlVt5ru', '1976-02-14', 'Martinez Gonzalez Fernando', '24731', 'HES', '2012-10-15'),
(5144, ' Ines', 'Martinez Marcelino', 'Riveras del Bravo', 'D', 'Operador General', '1', '60030', '$2y$10$TkVymcfX658hCTyiSAB1Cu8g.nTxvZOZITF.h/Jtg33HhUni0OYQS', '1982-07-16', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2012-12-11'),
(5145, ' Fiacro', 'Cruz Sanchez', 'Riveras del Bravo', 'D', 'Operador de Criticos', '1', '60033', '$2y$10$QNDUytXRp6tg2wu/64pJmODFMnGsgf/.ytjCDkmMF0cvjqeBi0eam', '1988-01-28', 'Jesus Lopez Solis', '73653', 'HUS', '2023-08-29'),
(5146, ' Lorena', 'Martinez Hernandez', 'Los Arenales', 'D', 'Jefe de Grupo', '1', '60035', '$2y$10$Ki08i/L0xuFNfiLzgFtcEeA6rPEP9Il4SOUuvI0RVDgwFJ/K8Co/q', '1978-08-07', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2013-02-21'),
(5147, ' Olga', 'Garcia Juarez', 'Riveras del Bravo', 'D', 'Operador General', '1', '60038', '$2y$10$.yfcW.IFFOWBBkyKpgnN/.M.p31NOmIiNZfAFzn0AIifGK.1Uqqga', '1988-10-22', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2013-03-11'),
(5148, ' Pedro', 'Favela Arellano', 'Torres del Pri', 'D', 'Limpieza', '1', '60040', '$2y$10$r46PGTBLoByFF1m4aGI5pu4szM4jxCOuPhyiy/NvFcQx8.5/Nwcny', '1965-02-23', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2013-05-30'),
(5149, ' Yadira Alejandra', 'Hernandez Rodriguez', 'Ciudad Moderna', 'D', 'Tecnico de Calidad', '1', '60044', '$2y$10$jNLOQK.oiIAwSpadT0vb9udaftBO.MxTGYXxKvVa0Yzpjjn26LxBy', '1970-06-05', 'Jose Ruiz', '74929', 'HUS', '2013-07-12'),
(5150, ' Magdaleno', 'Barrientos Vazquez', 'Aguilas de Zaragoza', 'D', 'Jefe Grupo Fundicion/ Die Cast/ Lenoir', '1', '60045', '$2y$10$/dTEc4UhcJ7aYprBBKf3hu9i6GF6tSHjY36OFfm4p3zqVUF//Jcf2', '1988-07-29', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2013-08-13'),
(5151, ' Maricela', 'Fraire Silva', 'Parajes de San Isidro', 'D', 'Operador General', '1', '60050', '$2y$10$xc626N2I8nhV47p7OvQykeGTLKCmWMZSQVvYaevxwKSpH2VX3imdO', '1980-03-03', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2014-01-20'),
(5152, ' Paula Catalina', 'Torres Ciruelo', 'El Fortin', 'D', 'Operador General', '1', '60053', '$2y$10$cMsD1FIu79u4uMWYDy6cCOyd9wEz6CadaJP9CwIb2yc9AK5Lgah0i', '1971-11-28', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2014-02-20'),
(5153, ' Miguel Alonso', 'Martinez Gonzalez', 'infonavit solidaridad', 'D', 'Lider de Tecnicos Cnc', '1', '60054', '$2y$10$psF7Fk3MAMQ0ql1wDRGO4.9DisoPpK.BBA3Xnb69JR/iXOVbr6KB2', '1984-03-19', 'Martinez Gonzalez Fernando', '24731', 'HES', '2014-02-26'),
(5154, ' Jesus Andres', 'Arciba Acosta', 'Horizontes del Sur', 'D', 'Tecnico Electromecanico', '1', '60055', '$2y$10$p9lCK3fSwz89z9B07G0Oo.ECV5KVZljNwj1d4ZaDueIi/9lD66zla', '1991-12-25', 'Martinez Gonzalez Fernando', '24731', 'HES', '2014-03-05'),
(5155, ' Luis Alfredo', 'Martinez Mendez', 'Praderas del Sur', 'D', 'Operador de Set Up', '1', '60056', '$2y$10$EpSuLWppvybPBqBp93fL3OFQ57.pprT5GoprON3LttAZq7zm5nZwO', '1991-08-28', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2014-03-20'),
(5156, ' Jose Trinidad', 'Cardoza Garcia', 'Andres Figueroa', 'D', 'Almacenista', '1', '60060', '$2y$10$vsrlLhN38LQFmJFZVOhoVu/Z9nVx8vP8qFzKQL25yjQtvz0Gd1imO', '1974-12-20', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2014-04-30'),
(5157, ' Maria Mayela', 'Trujillo Zamarripa', 'Los Arenales', 'D', 'Operador General', '1', '60065', '$2y$10$3sXeQMFcX.3qQRog.qNjMuA8z2FeghfFq7GMz5ya8Sv63TZ8zSpGG', '1969-05-23', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2014-06-18'),
(5158, ' Sandra', 'Villalobos Aguirre', 'Morelos 1', 'D', 'Operador General', '1', '60069', '$2y$10$pQQo9cJWjg02bhcnu27k0e43tUwkrILHwE2HTT8J1nlVaBUvmbPhK', '1970-02-22', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2014-07-16'),
(5159, ' Sandra', 'Escalante BaÃ±uelos', 'Morelos 2', 'D', 'Operador General', '1', '60072', '$2y$10$S2eJoTIv9RVUXVusZLZsh.GXsNXMAboU9DowrS.wm4PskSiMYeTDK', '1968-12-17', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2014-08-19'),
(5160, ' Marcela', 'Lozano Ramos', 'Sor Juana Ines de la Cruz', 'D', 'Operador de Secundarios', '1', '60075', '$2y$10$5fmkqhnAFp.9Ef3oDCwrP..AIb.OlLaawDtUNcpPTuiGMyZI.Aba.', '1983-01-16', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2014-09-04'),
(5161, ' Amelia', 'Rivera Perez', 'Heroes de la Revolucion', 'D', 'Operador General', '1', '60077', '$2y$10$xaSmxJ5PvyrDfcyl8U6jd.8PxkdDSVeNPf4qo3oK65pX8RTN2TmOK', '1970-05-22', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2014-09-09'),
(5162, ' Rocio De Guadalupe', 'Grajeda Casas', 'Los Alcaldes', 'D', 'Operador General', '1', '60081', '$2y$10$1TXrSO4.q5AdYTovC223xOdF5.rEzzJGo9cR/N3ImBL2Pi8tOppXW', '1971-03-22', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2008-10-07'),
(5163, ' Lorenzo Fabian', 'Devora Gomez', 'Parajes del Oriente', 'D', 'Operador de Set Up', '1', '60083', '$2y$10$5RFThd0sCdVB23dpFJqfTOaP2HbzcS8NPV54/XlaWcg6VkzE.fbQ.', '1978-03-26', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2024-06-10'),
(5164, ' Jose Ines', 'Chairez Sanchez', 'El Papalote', 'D', 'Tecnico Manto. Edificio', '1', '60086', '$2y$10$iF3EC1QkJvTsy8cVDSNko.6qSzhMKTiutgrAbFsB2f3MiRb3sQVlm', '1990-07-18', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2008-10-13'),
(5165, ' Gabriel', 'Guerrero Gonzalez', 'Horizontes del Sur', 'D', 'Tecnico de Calidad', '1', '60088', '$2y$10$xrv1/hx6T6DMQUpKKsFVsuzKI2rUmVNqvLz4VYXdoIBljcHA3kS.i', '1975-06-05', 'Kevin Adrian Martinez Orozco', '300062', 'HUS', '2008-10-16'),
(5166, ' Juan Manuel', 'Garcia Gutierrez', 'Infonavit Solidaridad', 'D', 'Operador Especialista', '1', '60089', '$2y$10$hRC.w.hv5/gs.ACbKXo9x.zJ412L86BokYyxRjYX5FPhEVycf51UW', '1969-05-18', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-08-25'),
(5167, ' Lucio', 'Garcia Moreno', 'Paraje de San Juan', 'D', 'Operador De Procesos', '1', '60093', '$2y$10$2P1hehF9LsjbK8YQQNQwj.odPGrrGf9hST55j5.9kBjgDEzjPGx/.', '1973-09-04', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2014-11-12'),
(5168, ' Edgar', 'Rocha Ibarra', 'Praderas del Sol', 'D', 'Operador Especialista', '1', '60094', '$2y$10$0jy/Xubh7fP.TrK4y7XitOp07CAbzdrEAava2wDmKU56/wKQt/tl2', '1987-03-07', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2014-11-18'),
(5169, ' Maribel', 'Ramirez Mulato', 'Paraje de San Juan', 'D', 'Operador de Secundarios', '1', '60096', '$2y$10$OKl1iNcR8Ij40SY2MAQopO6U7RrxClMwV3SgA8ZRkK3owTYhduHVe', '1974-05-05', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2015-01-07'),
(5170, ' Viviana', 'Rivera Barraza', 'Senderos de San Isidro', 'D', 'Operador General', '1', '60099', '$2y$10$AnRDElY4lg5UMOP40X0g1u1SEvgorztV76d3USO0L5kC.7HsQs7Ma', '1978-08-01', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2015-01-27'),
(5171, ' Julio', 'Reyes Cortez', 'Portal del Roble', 'D', 'Almacenista', '1', '60100', '$2y$10$vf3WZ/ud7y/U1.P7.4Fj6eNoua0XEoqBXUWqQABa2hVF/jou/ozuK', '1980-09-17', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2015-01-27'),
(5172, ' Alfredo', 'Bernardo Garcia', 'Parajes del Sur', 'D', 'Limpieza', '1', '60102', '$2y$10$q/ONGB34UbNjurwTFOP1suCd3Ws0kEVC2sEMnD8qKqhZrbPUfKzom', '1967-02-12', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2015-02-18'),
(5173, ' Gloria', 'Molina Meraz', 'Los Arenales', 'D', 'Operador General', '1', '60103', '$2y$10$WGDTc1lIwdOULyUYlJf.WOauN0t4WtjYhLyqbWitNCaLgUMNFHITi', '1972-08-16', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2015-02-20'),
(5174, ' Dany Humberto', 'Hernandez Arredondo', 'Medanos', 'D', 'Operador De Procesos', '1', '60106', '$2y$10$EnfQJlTEMZJVuwC8fDLFLuAe7UeNauf1ESqMsavcv.Tncg4M.P/um', '1983-03-01', 'Abel Fernandez Delgado', '98716', 'HUS', '2015-03-06'),
(5175, ' Elvira', 'Lopez Palacios', 'Hacienda de las Torres', 'D', 'Operador General', '1', '60115', '$2y$10$W/BpqHXCxseMi.fd.ZSPh.Use/E0P4myYkjvnIUNsepeaQ.Ln21dq', '1973-01-25', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2015-04-22'),
(5176, ' Mauricia', 'Hernandez Aguirre', 'Parajes del Sol', 'D', 'Operador General', '1', '60116', '$2y$10$sQrOtAxV1fN9D1eoDEe60.nLvplPeOX16wpF6IU7gzOY0ykO.w41i', '1975-09-22', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2015-04-22'),
(5177, ' Hugo', 'Castro Arguelles', 'Praderas de la Sierra', 'D', 'Tec Esp en Mtto Equipo', '1', '60117', '$2y$10$2SIupCAl5Hoai1.iZHHCm.cg8D.8Ju4MyuHVHHW55HGYkxSVXG0sS', '1978-03-07', 'Martinez Gonzalez Fernando', '24731', 'HES', '2024-06-18'),
(5178, ' Maria De la Luz', 'Soto Lerma', 'Morelos 2', 'D', 'Operador General', '1', '60121', '$2y$10$QyfmibBEz8dBOAnULm.RMePBBZnjVXYM4vZuKeXUD2tmZNRJBdK62', '1969-08-18', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2015-05-27'),
(5179, ' Alma Cristina', 'Saenz Campos', 'Portal del Roble', 'C', 'Auxiliar de Embarques', '2', '60127', '$2y$10$QY/VDxiMm5C3vOxJ/t7qoONSo.Rd7bUsIcsW66tBXiUUAthrH2OAC', '1990-11-15', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '2015-06-24'),
(5180, ' Jessica Edith', 'Gabaldon Caballero', 'Fracc. Arecas', 'D', 'Operador General', '1', '60129', '$2y$10$tOa.72QKp1LzXcXbqwQzsu5hI8RhZjDVvFfhtSsMKJE0JszsbAWZu', '1978-08-28', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2015-07-07'),
(5181, ' Joel', 'Villela Villela', 'Praderas de la Sierra', 'D', 'Tec Proceso de Moldeo/Die Cast', '1', '60130', '$2y$10$9PQE6Pn/Pnw3O7yyvnIl2O/rm/x9x8PE/NGMqaBBZnTQPiWEKy31u', '1976-11-23', 'Gustavo MacÃ­as Sandoval', '73857', 'HUS', '2015-07-09'),
(5182, ' Jorge Ernesto', 'Acosta Rodriguez', 'Zaragoza', 'D', 'Operador General', '1', '60131', '$2y$10$GdiTbMWizgQmN76T4gmo.es8RvPxfXlt5.tlQu5boCbkc2zWTdg1C', '1965-08-29', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2015-07-14'),
(5183, ' Olga Berenice', 'Geronimo Machucho', 'Parajes de Oriente', 'D', 'Operador General', '1', '60132', '$2y$10$dG7uewaJPHyVpB4MTTuYUOM.J3SByJIN1TIi9YlEwzXVGK3XXjDcq', '1987-03-07', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2015-07-14'),
(5184, ' Silverio', 'Marin Mendez', 'Fracc. el Campanario 4 S', 'D', 'Operador de Criticos', '1', '60135', '$2y$10$71ZaUx7BFZ7/yiDQSUzBg.DDJNG6bDvm83yPGmpftwDU238bDGTTC', '1985-10-26', 'Saul Arellano Escobar', '97722', 'HUS', '2015-07-22'),
(5185, ' Miguel', 'Espinosa Morales', 'Fracc. Puerto Castilla', 'D', 'Tecnico en Entrenamiento', '1', '60138', '$2y$10$8M9ezUYo.P2NEFCpavxEl.xxL5QUNA7yGnGBZoRi.INk.a/2VRpCO', '1993-09-15', 'Jorge Alejandro Ayabar DÃ­az', '66945', 'HUS', '2015-07-29'),
(5186, ' Enriqueta', 'Jimenez Acevedo', 'Terrenos Nacionales', 'D', 'Operador General', '1', '60140', '$2y$10$Fk9r7.MW5HJtS5hIV/N7Pe4caGRE2mRYGV4gj7wUbKRbPLE3mVpyK', '1966-03-03', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2015-07-30'),
(5187, ' Ana Laura', 'Clara Gonzalez', 'Praderas del Sol', 'D', 'Operador General', '1', '60141', '$2y$10$ZaFQy8deKe8wqFtvcXUflu2u/RpgPujaEPpiNN8oWrE37Yl8Vn1bO', '1988-12-10', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2015-08-04'),
(5188, ' Rolando', 'Contreras Rios', 'Paraje del Sol', 'D', 'Operador Especialista', '1', '60144', '$2y$10$iQ1B73Mg3677TzTgWzxxGeW3BdJdynpaVFFUPqJVq32RWfNoDZ/p6', '1992-11-21', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2015-08-11'),
(5189, ' Ofelia', 'Ramirez Hernandez', 'Manuel Valdez', 'D', 'Operador General', '1', '60148', '$2y$10$s0Gk2mkiMYrxiqV7jPwvM.wW0K5mNGAfXMyim/mOgqtaP4vuABkLi', '1967-06-27', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2015-08-19'),
(5190, ' Daniel Ubaldo', 'Ibarra Ibarra', 'Valle de los Olivos', 'D', 'Operador Especialista', '1', '60154', '$2y$10$fGuPWvVOkA8CL4KkYgnW.OnwQiHgFLckioLEoVBdnAQKechhheff2', '1979-05-16', 'Varona Hernandez, Braulio', '61651', 'HUS', '2015-08-27');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `colony`, `position`, `area`, `plant`, `username`, `password`, `birthdate`, `supervisor_name`, `supervisor_reloj_number`, `deparment`, `fecha_ingreso`) VALUES
(5191, ' Anallely', 'Lopez Gonzalez', 'Sauzal', 'D', 'Operador General', '1', '60156', '$2y$10$HlRwRW1VZai5ZrS8AaD/5eGBM3qpShoZm8PFJGNyhp4HbtJc623N6', '1995-07-14', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2018-01-31'),
(5192, ' Francisco Javier', 'Nieves Favela', 'Terrenos Nacionales', 'D', 'Operador Especialista', '1', '60157', '$2y$10$eO4pfjtEG8k7veUj0QVTI.NzrSj60/P.nNrT0QEGhgCw.9p/xC9P2', '1997-07-08', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2015-09-16'),
(5193, ' Carlos Andres', 'Ramirez Aguirre', 'Salvarcar', 'D', 'Lider de Produccion', '1', '60158', '$2y$10$zC9Fm1kHxDmtGwiBsgcAe.MXR0SuoZ/0ow.sfKZHIBxAdTZh4x6MW', '1992-02-26', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2015-09-22'),
(5194, ' Ma Elsa', 'Ibarra Villagrana', 'Terrenos Nacionales', 'D', 'Operador General', '1', '60159', '$2y$10$hn9B88FKwVK0CqIHllOJ0.i0hWAHDIj3Bqa/hW/ohzuu3DQjk89/6', '1971-04-06', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2015-09-23'),
(5195, ' Mayela Elizabeth', 'Alvarado Longoria', 'Morelos Zaragoza', 'D', 'Operador General', '1', '60162', '$2y$10$mp3yte2Mca5w.rWZ0G8J4ex7rYB9/67hEApyw4FEszT5OL1YwBmf.', '1981-02-28', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', NULL),
(5196, ' Alfonso', 'Gurrola OrdoÃ±ez', 'Fracc. Pedregal de San Is', 'D', 'Jefe de Grupo', '1', '60165', '$2y$10$rDz/3LLOFRzdp6HA6ektAOny1I/6E7X9qvgM/NXZN8y/SE6X2EfQO', '1969-02-24', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2015-10-07'),
(5197, ' Norma Leticia', 'Arevalo Zapata', 'Senderos de San Isidro', 'D', 'Operador General', '1', '60167', '$2y$10$41aHkk9AdgpEDv1GmZl1keahjkyEob4AneD8MFgLBDqKwlQQ7C63y', '1982-01-02', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2015-10-12'),
(5198, ' Eusebia', 'Sanchez Carvajal', 'Parajes del Sur', 'D', 'Operador De Procesos', '1', '60168', '$2y$10$6evkkaDH6qBDWFCnC/ZD9OHxxUc6l6R8YCIxDJPGSdJukz5IHflNi', '1967-03-05', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2015-10-13'),
(5199, ' Juan Diego', 'Alonzo Gomez', 'Portal del Roble', 'D', 'Operador De Procesos', '1', '60169', '$2y$10$AHv9VTuiCMGFZripmFTsWeVGpXdbh43k50MbKFT4lOuPnoHtr47tu', '1989-11-18', 'Saul Arellano Escobar', '97722', 'HUS', '2015-10-19'),
(5200, ' Patricia Berenice', 'Salazar NuÃ±ez', 'Tierra Nueva', 'D', 'Operador General', '1', '60170', '$2y$10$LHRpZ3BANcMWYMDMxY9XhuVZ/zTBO5qGQtroiQB.y551aM3vkrcme', '1983-06-06', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2015-10-21'),
(5201, ' Augusto', 'Montalvo Aguirre', 'Plutarco Elias Calles', 'D', 'Tecnico de Calidad', '1', '60172', '$2y$10$CDpxqmLX2Ok4DRwt.vv/veFwmvg86AGGveQsKoPBxvtTZNRsaXpBi', '1984-11-16', 'Diana Demorey Carrasco', '128213', 'HUS', '2015-10-28'),
(5202, ' Hilda Dolores', 'Borjon Diaz', 'Infonavit Solidaridad', 'D', 'Operador General', '1', '60176', '$2y$10$m3.VX1t05W7Qv6YhwZCOzerJciJ6UAwauVfjiFma36cu9HIE3bWiC', '1973-09-29', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2015-11-04'),
(5203, ' Rafael', 'Ortega Orta', 'Horizontes del Sur', 'D', 'Tecnico Electromecanico', '1', '60181', '$2y$10$RLt4JsYOjzehFZ7GxkQMre8QtG798XTU9fd.mFGIRkYrp/S4ZKvgi', '1972-09-06', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2015-12-14'),
(5204, ' Luis', 'Martinez Torres', 'Santa Maria', 'D', 'Almacenista', '1', '60182', '$2y$10$g9E0W4MC7ilBFuteRnMkwOJPQPh/e.RCQzNyvTeWDDjeCThBoXG2m', '1977-07-08', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2016-01-05'),
(5205, ' Joel', 'Fiallo Orrin', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '60183', '$2y$10$35TmYYRjRoBVPX6NhD57IOF3xuaqBtQMBzRBI/bg4bUVjUyUMcmrm', '1979-07-13', 'Saul Arellano Escobar', '97722', 'HUS', '2016-01-05'),
(5206, ' Dilma', 'Lopez Barrios', 'Portal del Roble', 'D', 'Operador General', '1', '60186', '$2y$10$3O5wsWxfbbFIzIQ.dzGBw.MmEwSdKQ77rSxuEcGwiQfgep2fSsR9.', '1985-03-15', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2016-01-07'),
(5207, ' Armando Martin', 'Lopez Alvarez', 'Paraje de Oriente', 'D', 'Operador de Set Up', '1', '60187', '$2y$10$NYHDltnuKVmKCJh6XMsu3O01shUwMyEaohCSUFKqAe8lXQN6SFL5.', '1979-05-06', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2024-06-11'),
(5208, ' Antonio', 'Flores Jurado', 'El Fortin', 'D', 'Operador De Procesos', '1', '60190', '$2y$10$RD556xtHk2pZVdlF1cSjSelI5lBZv9.AAO9NojXkfdTUgym/v1GiG', '1980-07-29', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2016-01-14'),
(5209, ' Minerva', 'Ruiz Candelaria', 'Hacienda de las Torres I', 'D', 'Operador De Procesos', '1', '60192', '$2y$10$yVrfFdby1W/uFDvLyrmfQOlfVv91sixw/YltVl1FZydq20XqHb6rS', '1964-07-13', 'Varona Hernandez, Braulio', '61651', 'HUS', NULL),
(5210, ' Maribel', 'Navarrete Chanon', 'Fracc villas del solar', 'D', 'Tecnico de Calidad', '1', '60193', '$2y$10$zb3T0xKrXLUk/4m56RbnteVn2pMHS5kSPCoxR5rWpYAXM8BzluIk.', '1994-02-06', 'Jose Ruiz', '74929', 'HUS', '2016-01-20'),
(5211, ' Aurelio', 'Martinez Cruz', 'Palmas del Sol', 'D', 'Jefe Grupo Fundicion/ Die Cast/ Lenoir', '1', '60199', '$2y$10$VH5BiGyl8cbpnCJdQoZGteO9RwzqYbVXDiW/JeAvkT8O2TxlI5dCO', '1977-04-06', 'Velarde Inostroza Enrique', '71208', 'HUS', '2016-01-27'),
(5212, ' Armando Ernesto', 'Cuellar Dominguez', 'Bosques de Salvarcar', 'D', 'Operador De Procesos', '1', '60207', '$2y$10$jkU5Wy.fSWEKUnvE/SqEPuVjAJS/aSoG9wbjuuBvWglGvmGX1THuW', '1972-04-13', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2016-02-19'),
(5213, ' Griselda', 'Rosales Hernandez', 'Parajes de Oriente', 'D', 'Operador General', '1', '60210', '$2y$10$yHBu1vptjnvdUCrPh4NHH.rtBa/so4//9gV863nRre88JNqnq1l76', '1972-07-11', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2016-02-24'),
(5214, ' Ma. Guadalupe', 'Sotelo Reyes', 'Salvarcar', 'D', 'Operador General', '1', '60213', '$2y$10$N5iWx1F4Js.q4jyBkAVwNuBqRZkURGCzkf9Eby9T//qCL5FzfVFSi', '1967-12-12', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2016-03-03'),
(5215, ' Nereyda', 'Lopez Estrada', 'El Fortin', 'D', 'Inspector Control de Calidad', '1', '60214', '$2y$10$XfIpQ7Wf9fmkUf4fTbp.EOY93xVu8JkEhg1TotQVQWdDDT9GPYs5K', '1987-01-05', 'Diana Demorey Carrasco', '128213', 'HUS', '2016-09-22'),
(5216, ' Jose Fabian', 'Morales Ochoa', 'Rinconada de las Torres', 'D', 'Almacenista', '1', '60215', '$2y$10$3z6ZKQgSQUzVBSrbiUyieuhp8IbYYJ04JKqKYZW0qYxFbv6E8WfIe', '1982-02-23', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2016-03-09'),
(5217, ' Antonia', 'Galeana Carrera', 'Urbi Villa del Cedro', 'D', 'Inspector Control de Calidad', '1', '60218', '$2y$10$IgqcnJWClz3wiWn.xndPD.3U0uLJdup9VQ4ZCkB/7XcPfzauqfXfa', '1975-02-05', 'Armando Reyes Maldonado', '86641', 'HUS', '2016-03-18'),
(5218, ' Martin', 'Talavera Alvarez', 'El Fortin', 'D', 'Tecnico Electromecanico', '2', '60219', '$2y$10$9Ant3K6LafXQIabTW69/Re.cOU/tTG1XGGZfhha.DTN6yg0KcJt2q', '1966-07-18', 'Ruben NuÃ±ez Adame', '100370', 'HUS II', '2016-03-28'),
(5219, ' Alfredo Ismael', 'Flores Flores', 'Jardines de San Francisco', 'D', 'Tec Esp en Mtto Equipo', '1', '60220', '$2y$10$cg10XG.vrl2BCOuuqUZZq.MpxEk9FKbNpApQ70oegkWVtseQ.AGcS', '1983-05-27', 'Luis Albel Aguirre Ortiz', '61762', 'HUS', '2016-03-28'),
(5220, ' Lorena Ivette', 'Clara Gonzalez', 'Praderas del Sol', 'D', 'Operador De Procesos', '2', '60225', '$2y$10$IeYWa7Au3NcI8YifqQBIm.ohBCDeva.jxJlpzkCFovvDBOjf7wfgG', '1990-01-16', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2016-04-13'),
(5221, ' Genova Maria', 'Gonzalez Gonzalez', 'Terrenos Nacionales', 'D', 'Operador De Procesos', '1', '60226', '$2y$10$4il9NVs4tIMcq2dAgLAheOX5XJyLZyCDSSocKTr6hzTBTjumlPJLW', '1989-04-15', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2016-04-19'),
(5222, ' Ignacio', 'Gil Dominguez', 'Cerradas San Pedro', 'D', 'Operador de Criticos', '1', '60228', '$2y$10$6fiV7o9CABCV1dVqE9nW9e7vNkBpfedfcuS7YI3jC2D1QK5kpE9Ja', '1991-12-12', 'Saul Arellano Escobar', '97722', 'HUS', '2016-11-09'),
(5223, ' Jazmin Alejandra', 'Colon Zamudio', 'Colinas del Sol', 'D', 'Inspector Control de Calidad', '1', '60232', '$2y$10$cjLblXoLxSVGdpPbSWP5XexwkRnaTtjurz3jzNfggwRkw7Y/y2M3C', '1995-09-23', 'Oscar Garcia', '59965', 'HES', '2016-05-03'),
(5224, ' Bernardo', 'Hernandez Cortinas', 'Valle del Sol', 'D', 'Tec Proceso de Moldeo/Die Cast', '1', '60235', '$2y$10$F7kSjXgWcLuglPTo13JzWuRRzjeIGqWCu4G/JFtIr2HV04IMQ1nt2', '1968-08-20', 'Sanchez Cordova, Rene', '41563', 'HES', '2016-05-16'),
(5225, ' Luis Gerardo', 'Duran Perez', 'Terrenos Nacionales', 'D', 'Operador Especialista', '1', '60236', '$2y$10$dzA/p4X94wr.XXALfH3CauuvABey.wZveDQ/1g5P5GlSPATc8DU76', '1987-03-09', 'Briseida Bautista Tolentino', '300011', 'HUS', '2016-05-18'),
(5226, ' Alfredo', 'Ramos Campa', 'Portal del Roble', 'D', 'Operador Especialista', '1', '60241', '$2y$10$D7Oluye6q/TY7skce0vht.dkHJZHRKUHC311sptv7KUZbY3ziK7US', '1991-03-08', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2016-06-07'),
(5227, ' Oswaldo', 'Jenaro Ramirez', 'Juarez', 'D', 'Tec Esp en Mtto Equipo', '1', '60243', '$2y$10$5rLcg.j.lP4cM5qYxsuPIuso245Ff4/LYUYAuDu46x3V27ZDkbr9K', '1977-05-16', 'Luis Albel Aguirre Ortiz', '61762', 'HUS', '2016-06-15'),
(5228, ' Alvaro Ricardo', 'Contreras Valenzuela', 'Roma', 'D', 'Tec Esp en Mtto Equipo', '1', '60244', '$2y$10$nWXZ9R0vRW.UgNkRSBSk2uo2GEtkXSoGM23UfAnqyHz6v8efyehn2', '1987-10-26', 'Mauro Sanchez', '61715', 'HUS', '2016-06-21'),
(5229, ' Ines', 'Perez Rodriguez', 'Parajes del Sur', 'D', 'Operador General', '1', '60247', '$2y$10$HcRKXy.8s63YjWc4aBS57u/hOprB57C8TW5in.vEabNeEZY3Hr5VK', '1970-06-07', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2016-07-05'),
(5230, ' Feliciana', 'Luna Irivas', 'Praderas del Sol', 'D', 'Jefe de Grupo', '1', '60258', '$2y$10$RFByuVMpIHGXVlOXVmKfu.WJ0zi34PM2t3nuqueuAzWESxqK0rZja', '1979-06-09', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2016-07-21'),
(5231, ' Pedro', 'Fiayo Orrin', 'Parajes de San Isidro', 'D', 'Operador De Procesos', '1', '60262', '$2y$10$q9TounT7bCK7wodxje2Uau0q25OJ5mkrpXzXhiK89MVAtumDqng3.', '1984-12-21', 'Velarde Inostroza Enrique', '71208', 'HUS', '2016-07-28'),
(5232, ' Gustavo', 'Alonso Gomez', 'Sendero de San Isidro', 'D', 'Tecnico de Calidad', '1', '60263', '$2y$10$FZA1CkG8eiDLgZ6fZy.is.p90XHkYFUvBUpJFMdNSyOT71IoRo9hC', '1992-08-26', 'Diana Demorey Carrasco', '128213', 'HUS', '2016-08-02'),
(5233, ' Maura', 'Sosa Cano', 'Morelos', 'D', 'Operador General', '1', '60264', '$2y$10$5IhTDBkKTDkzFNO2CfcyGutiRbDc5Wi01xDOWOgTq39l7im0HtXnW', '1973-01-15', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2016-08-02'),
(5234, ' Alejandra', 'Cordova Tagle', 'Sierra Vista', 'D', 'Jefe de Grupo', '1', '60265', '$2y$10$TXrwMDdFVWibQI22WyAqc.2sV5PKuB/LWy7.tOxVRqdZhJ8gORr6m', '1992-07-17', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2016-08-03'),
(5235, ' David', 'Cabrera Guerrero', 'Senderos del Sol', 'D', 'Inspector Control de Calidad', '1', '60266', '$2y$10$fDH4okIBDPpdtNZcY7SwZePIl4suhFfK6OobLEFaQO16Xcuc3CpoS', '1990-11-07', 'Esteban Vazquez', '84463', 'HES', '2016-08-09'),
(5236, ' Samuel', 'Chigo Lopez', 'Riveras del Bravo', 'D', 'Operador de Criticos', '1', '60268', '$2y$10$Mz9m5M/4mojgoSsLAv2XJOUYsnTYOQLvev5BcWoBSwx2.dZxonTBe', '1997-05-19', 'Saul Arellano Escobar', '97722', 'HUS', '2016-08-16'),
(5237, ' Dolores', 'Bonilla Hernandez', 'Terrenos Nacionales', 'D', 'Operador General', '1', '60269', '$2y$10$XyZyFyoRQzFeFvAI9aiEouVdMfUeIHsvKt7KjuE.qlLjAbmbcIms6', '1968-04-05', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2016-08-16'),
(5238, ' Claudia Estela', 'Quiroga Botello', 'Horizontes del Sur', 'D', 'Operador de Secundarios', '1', '60270', '$2y$10$jF98rJRiYEpxt0/znXM8E.nZ3xW6ufXJfNYDgz01SS3zzdLJdCMP2', '1977-04-06', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2016-08-16'),
(5239, ' Giovani', 'Aguilar Medina', 'Paraje de San Jose', 'D', 'Encargado de Tool Crib', '2', '60273', '$2y$10$zM1fluEGPGKA1Hn6lMUZnu9BWzyseT3GMvIOMn/iLYvC115MSO5OC', '1998-04-04', 'Leyva Corral, Jose Ramon', '25229', 'HUS II', '2016-08-17'),
(5240, ' Esteban', 'Sanchez PeÃ±a', 'Vistas de Zaragoza', 'D', 'Operador De Procesos', '1', '60274', '$2y$10$rjdtGUBbNlDG.Vz5FgkjVOunTZQr4Fz1v8SWxjKvHewhMAT0xxlpi', '1977-08-16', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2016-08-18'),
(5241, ' Aidee Nallely', 'SaldaÃ±a Santana', 'Hacienda de las Torres', 'D', 'Operador De Procesos', '1', '60275', '$2y$10$nrUQP2GxnPNvOw.y.EE8o.ODFPLWUfT4sWM6.NAwnLWTG64B1JRL6', '1997-08-08', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2016-08-23'),
(5242, ' Rene', 'Damian Rodriguez', 'Las Haciendas', 'D', 'Operador Especialista', '1', '60283', '$2y$10$fwJq3dJwmJfiRyPrXCzR6ez/I5Yy1ofd0PwMje1RbfouTlebXWVIa', '1982-05-21', 'Fabiola Ramon', '84289', 'HUS', '2016-09-07'),
(5243, ' Francisco Javier', 'Reyes Ramos', 'Riveras del Bravo', 'D', 'Operador Especialista', '1', '60285', '$2y$10$Lh1UuHPRZUQnKAqm6S3uOeZtJ6.QG5jMjWcXbVgWGREvbWeXedyry', '1989-10-16', 'Fabiola Ramon', '84289', 'HUS', '2016-09-10'),
(5244, ' Guadalupe', 'Salazar Ponce', 'Roma', 'D', 'Operador De Procesos', '1', '60287', '$2y$10$3ISHf0JKgpscIAr.8ipuauNiOTzIB4xx7PyGobVXUuR6O5896/Ke.', '1977-08-23', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2016-09-13'),
(5245, ' Blanca Estela', 'Rojas Gonzalez', 'Praderas del Sol', 'D', 'Operador General', '1', '60292', '$2y$10$TcvUt6JZqaGu8HwEMhBkS.AYlinxIMjVGImtoCfqLaoGUaJFoJ6U2', '1972-11-16', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2016-09-20'),
(5246, ' Antonio', 'Trujillo Lopez', 'Cerradas Santa Isabel', 'D', 'Tecnico en Entrenamiento', '1', '60294', '$2y$10$w1eBSNV2atF.p0xfXAlxMei0dtJYxe0mfPbZhVamE4uVN1WarEcJm', '1988-11-18', 'Jorge Alejandro Ayabar DÃ­az', '66945', 'HUS', '2016-09-22'),
(5247, ' Samuel', 'Soria Aldama', 'Parajes del Sur', 'D', 'Tecnico de Calidad de Procesos', '1', '60301', '$2y$10$IZJev5/axPEXj/Hzh2elEu2kVMjfLPx2qotb/hXbS.4JW8SnAus/u', '1987-06-01', 'Armando Reyes Maldonado', '86641', 'HUS', '2016-10-04'),
(5248, ' Jorge', 'Zamorano Gonzalez', 'Bosques de Salvarcar', 'D', 'Operador De Procesos', '1', '60303', '$2y$10$YQUIz1e6L58cpCOoUz7MBemQE2K5PdAfIHhkSwBLN9c0aOjGivpAO', '1968-12-17', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2016-10-05'),
(5249, ' Mayra Patricia', 'Hernandez Olguin', 'Parajes de Oriente', 'D', 'Operador General', '1', '60305', '$2y$10$LKLoeI1r54vDIMCCpEuoseIJXLY/gOiP8jcCvx0dAVSEykKInMCg6', '1992-02-12', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2016-10-12'),
(5250, ' Bertha Alicia', 'Castellanos Marcial', 'Las Gladiolas', 'D', 'Operador General', '1', '60306', '$2y$10$ofIcqBJEU0a.kl30y1LpUemjo4CQgRxssUi64k9pUka9yOSqXBnmm', '1967-05-16', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2016-10-14'),
(5251, ' Maria Cliceria', 'Solis Vargas', 'Aguilas de Zaragoza', 'D', 'Operador General', '1', '60307', '$2y$10$HXwZUyfQ2CDvLnGh/VfSCeaSbAGyt5eq1WDycB63IcTR1Wtzl8uYK', '1966-09-17', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2016-10-18'),
(5252, ' Juan Manuel', 'Lopez Segovia', 'Parajes del Sur', 'D', 'Operador De Procesos', '1', '60309', '$2y$10$xbLm.bEDyjjoOcKPZ8qQxO0luVgIlwTQ.uhL9rYj.zRjaW8p08xH2', '1985-04-05', 'Arellano Mota, Arturo', '24791', 'HUS', '2016-10-19'),
(5253, ' Victoriana', 'Cardenas Cruz', 'Carlos Castillo Peraza', 'D', 'Operador General', '1', '60311', '$2y$10$OEwrh54.ekWZHO4TtQ3cR.kRzImURLGadhRpJnxyiKSNH545tRCuu', '1973-07-28', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2016-10-21'),
(5254, ' Ma. Teresa', 'Garcia Hernandez', 'Praderas del Sol', 'D', 'Operador Especialista', '1', '60314', '$2y$10$W/iQZAHWZ./f30EI5Ix4N.x3dq5xLignmPICcSAzJKSbNC5qjsbzC', '1976-06-26', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2016-10-24'),
(5255, ' Mayra Nohemi', 'Villela Rodriguez', 'Praderas del Sol', 'D', 'Operador General', '1', '60319', '$2y$10$Y5NUkFCMIn6haBaTsbj2Ke/ClezBerUK/N.uz31uDHDbevYC14xKm', '1987-01-08', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2016-11-01'),
(5256, ' Manuel', 'Castro Martinez', 'Riveras del Bravo', 'D', 'Operador De Procesos', '1', '60325', '$2y$10$mmTcD8OBcci4LTeUJUobVuOjGXatRYxaWIIVeSDj/WLboWECC.12y', '1976-09-28', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2016-11-10'),
(5257, ' Elias', 'Hernandez Martinez', 'Portal del Roble', 'D', 'Operador de Criticos', '1', '60331', '$2y$10$odPCwmyosC3MDrvkB1J.Zeeyaq7T.WHNU6VevcRT3.KXa3P.d0hGu', '1993-12-21', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2016-11-18'),
(5258, ' Vicente', 'NuÃ±ez Esquivel', 'Portales de San Pedro', 'D', 'Tec Esp en Mtto Equipo', '1', '60333', '$2y$10$COywZEroAhMF/2OfuIwHSunFm4czerhIaWWIYg4WAi/vFNsbVBXCO', '1989-08-21', 'Favela Alvarado, Jose Luis', '25333', 'HES', '2024-05-06'),
(5259, ' Domitila', 'Olan Torres', 'Mezquital', 'D', 'Operador General', '1', '60335', '$2y$10$nNFgRIzW/OSh5GzzwhL7Ue15/J.osb3cTwzSXR26FPbpuTcoudE1.', '1966-03-22', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2016-11-29'),
(5260, ' Lucelia', 'Velasquez Jacinto', 'Parajes del Sur', 'D', 'Operador General', '1', '60336', '$2y$10$o5UuvQwuzVTbHnafZkAMZ.0kzIhxXT3wW/zRr4vfxIQJBrWaNyyaq', '1998-11-20', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2016-11-29'),
(5261, ' Carmen', 'Roque Tenorio', 'Parajes de San Isidro', 'D', 'Operador General', '1', '60340', '$2y$10$hrqzjkTF8/5Wi5QeBAVR2OJfRSPvhXCUE1H3wJlc0NHPBOD9zJNFi', '1992-10-19', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2016-12-02'),
(5262, ' Dorling Jaqueline', 'Montufa Hernandez', 'Carlos Castillo Peraza', 'D', 'Operador Especialista', '1', '60345', '$2y$10$dtFe6FFrjdbxPyX8PGmRxe6jFWyGpfOOer9J1uqONvMExH0pkoPay', '1998-05-12', 'Briseida Bautista Tolentino', '300011', 'HUS', '2016-12-08'),
(5263, ' Jose Manuel', 'Ortega Perea', 'Urbi Villa del Cedro', 'D', 'Tecnico de Ingenieria Sr', '2', '60346', '$2y$10$M1leVTJnQQdiJqjlSn04c.AZEUyTiXI68iI1hque4DKFLuEVpSU7a', '1997-12-10', 'Aveytia Banuelos, Antonio Edua', '25076', 'HUS II', '2023-01-23'),
(5264, ' Jose Guadalupe', 'Carrillo De la Cruz', 'Heroes de la Revolucion', 'D', 'Set-Up Produccion', '1', '60348', '$2y$10$5KH0qbjj48h99sPgLvnIt.CXUcgKZRgKWCkuxRSseGVgDBiqBfjjW', '1980-07-16', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2016-12-13'),
(5265, ' Salvador', 'Hernandez Lopez', 'Portal del Valle', 'D', 'Operador General', '1', '60355', '$2y$10$pg/TxBsUEzryWWvu2S2AJObzrR.DmCSr9oyrs1DR4lh1r/AxZhrBy', '1995-11-05', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2016-12-21'),
(5266, ' Cecilia', 'Saucedo De la Cruz', 'Manuel Valdez', 'D', 'Operador General', '1', '60361', '$2y$10$6MUzvhkwnddV0XzSiUjHDO.10CbC7xGMS.LwxXDb.oxqPMN9fQFCS', '1998-05-25', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2017-01-05'),
(5267, ' Isaias', 'SiaÃ±ez Saenz', 'Portal del Roble', 'D', 'Limpieza', '1', '60363', '$2y$10$dtHbStFMjKIYKGACub2xvuc996LytJ6NKPFpFO.WWeQz/Y12c7rOq', '1975-07-06', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2017-01-05'),
(5268, ' Carlos Alberto', 'Martinez Hernandez', 'Cerrada de Oriente', 'D', 'Operador de Set Up', '1', '60369', '$2y$10$/2H/hLgsjj41d6j7vHjZZechi/espHBmXYmj86Pbg1R4V0EBl854S', '1971-07-16', 'Sanchez Cordova, Rene', '41563', 'HES', '2017-01-10'),
(5269, ' Francisco', 'Quino Polito', 'Primero de Mayo', 'D', 'Operador de Set Up', '1', '60370', '$2y$10$qwsQTGg.TuXz8E/QAtdpJOC2PcWba2iFhVFJU/lQN12p.Acz8obES', '1979-06-10', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2017-01-11'),
(5270, ' Eli', 'Trujillo Ruiz', 'La CaÃ±ada', 'D', 'Operador de Secundarios', '1', '60383', '$2y$10$SzHNp4xYIUoI8eSvoOhy8uWpwAeFkBtwFnViLYWK/0TMNa68T6TaO', '1983-02-21', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2017-01-19'),
(5271, ' Ma. Del Socorro', 'Luna Guerrero', 'Hacienda de las Torres', 'D', 'Limpieza', '1', '60384', '$2y$10$cDaEqSROWOjNTDmJZvapsuC.3.Xy2amfX7T9w0bnAOhuS4fuQwtha', '1971-07-26', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2017-01-19'),
(5272, ' Carolina', 'Merlo Lechuga', 'Hacienda Santa Fe', 'D', 'Conteos Ciclicos', '1', '60386', '$2y$10$tncNJdvZ5mklaf0m39hSKO0jBUvbQGMqAXs6gaXAu.EBX/H3dkNyu', '1993-10-30', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2017-01-23'),
(5273, ' Lorena', 'Silva Delgado', 'El Fortin', 'D', 'Operador General', '1', '60387', '$2y$10$fudgpQvBAtjudWcB/hLWkuTmYlgV7MDhMVrazlLDMAAFweQgzGnr2', '1968-08-26', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2017-01-23'),
(5274, ' Monica Yaneth', 'Cordero Vega', 'Riveras del Bravo', 'D', 'Tecnico de Calidad', '1', '60388', '$2y$10$YfkGQfFB8eBFkcYIbd5LgejBSqVGFUMhSt5YY64qyYTql2nVL/bIC', '1998-02-26', 'Jose Ruiz', '74929', 'HUS', '2017-01-24'),
(5275, ' Maria del Socorro', 'Campos Soto', 'Morelos', 'D', 'Operador General', '1', '60392', '$2y$10$HcRm9tdpwrd.JouepWBfYuFVEgC2ggDxPFWX5c.c3uGRfAohsWX4y', '1973-05-13', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2017-02-01'),
(5276, ' Ricardo', 'Guevara CarcaÃ±a', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '60393', '$2y$10$Twpm3jSMWhqSIpWXMY7PR.UBc0sy6GmkQ1sfceT.D6V63ejJMwwSe', '1976-12-05', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2017-02-01'),
(5277, ' Maria Antonia', 'Arroniz Romero', 'El Fortin', 'D', 'Operador General', '1', '60395', '$2y$10$QW0RRzvTQrYsZ9sjnUR/PO1HIB.3U92WiiqLRuJQgT/8shza.9MVm', '1975-06-13', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2017-02-02'),
(5278, ' Ivan', 'Santillan Bojorquez', '9 de Septiembre Cdp', 'D', 'Tec Proceso de Moldeo/Die Cast', '1', '60396', '$2y$10$vakC9zCIIbX.eHSe/D8hBuK0qTyAScf9RzdS2OF3hL879P4wlvne2', '1982-11-30', 'Sanchez Cordova, Rene', '41563', 'HES', '2017-02-07'),
(5279, ' Alejandra', 'Sauceda Hernandez', 'Hacienda de las Torres', 'D', 'Operador De Procesos', '1', '60400', '$2y$10$S0qEty5MufRKZllIB4elI.qMhKXAsOMNJi7XbMYZafHSp3oSXIp/G', '1975-01-11', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2017-02-08'),
(5280, ' Erika', 'Olivos Vega', 'Salvarcar', 'D', 'Operador General', '1', '60401', '$2y$10$gZOvC2a678ceQ2K6Dm9HqO/n9oisbB3oqJ5mS4WjF1Rj8FgD2oE8q', '1981-07-12', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2017-02-13'),
(5281, ' Rosa Carmen', 'Luevanos Esquivel', 'Roma', 'D', 'Operador De Procesos', '1', '60402', '$2y$10$toK/O0Gu5lTTwSlZ.RkUtOEGLedoSJI15knlnNCrl.WJQcQcjqr0.', '1980-09-07', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2017-02-13'),
(5282, ' Maria De los Angeles', 'Antonio Sigarroa', 'Riveras del Bravo', 'D', 'Operador General', '1', '60403', '$2y$10$aBFG2hdt4cpFTCmc69jj9Op2PRbqs6irvnPtvtCU4SIA6/nHhQRj6', '1975-04-16', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2017-02-14'),
(5283, ' Fernando', 'Rosas Escarcia', 'Fracc URBIVILLA DEL CEDRO', 'D', 'Operador De Procesos', '1', '60405', '$2y$10$DPp3OhnRzhDe9Pn0z0Gy7e4NpzSKwhRYwJqHU1WMwfdXyqgnBo5J6', '1976-09-21', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2017-02-14'),
(5284, ' Jose Manuel', 'Arciniega Rios', 'Praderas de las Torres', 'D', 'Operador De Procesos', '1', '60407', '$2y$10$.yvJD4Y5abKDRskmOKoRW.T9fB0QcQYfpIdlUPZdDt7xgacg3MSEG', '1996-11-21', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2017-02-15'),
(5285, ' Ada Elizabeth', 'Navarro Favela', 'Los Alcaldes', 'D', 'Tecnico de Calidad', '1', '60410', '$2y$10$seV2k3Nr6cT4fCIzBpt4xOQO1LeMwsJARu5/SoEeZcf6A9J9XwzP2', '1991-09-08', 'Rodriguez Celaya, Ramiro', '24790', 'HUS', '2017-02-16'),
(5286, ' Maria De la Luz', 'Balbuena Rosas', 'Las Gladiolas', 'D', 'Operador General', '1', '60411', '$2y$10$Pzk7laGtcywP5pBnY2IFwOWviiyaM7Jq34NeKfsz4Ar9QFh8XUJQC', '1972-06-09', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2017-02-16'),
(5287, ' Jose Isaias', 'Reyes Morales', 'Parajes de Oriente', 'D', 'Almacenista', '1', '60412', '$2y$10$1qwPZgNAfhe8FEsanl8sauFjJb54lH8Wu5U4ffeEEh.UIhnmrJnDW', '1981-02-26', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2017-02-21'),
(5288, ' Luz Heladia', 'Perez Apolonio', 'Riveras del Bravo', 'D', 'Conteos Ciclicos', '1', '60414', '$2y$10$FxZqETr5/7TtwJKgSb9mDuT11x3PEcnZpGlM3oGXnQdFSbgtDzsC.', '1993-12-21', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2017-02-22'),
(5289, ' Luis Fernando', 'Chavira Alvarado', 'Praderas del Sur', 'D', 'Lider de Control de Calidad', '1', '60423', '$2y$10$6s6AHfoPZKbDZsXNRrHFTeo7lJz.sVxU9xp2y0ZLJsFP7hFXFxYxy', '1998-03-13', 'Jose Ruiz', '74929', 'HUS', '2017-02-28'),
(5290, ' Maday Denisse', 'Amador Moreno', 'Paraje de San Juan', 'D', 'Operador De Procesos', '1', '60427', '$2y$10$737PvjbVimy35bKyEAWu1.oFo1Tyj45e9JfpxrT7Q7XnUCCmfCJ/q', '1986-02-27', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2017-03-07'),
(5291, ' Celsa', 'Ramirez CastaÃ±eda', 'Hacienda Santa Fe', 'D', 'Operador General', '1', '60430', '$2y$10$rFTD1gRASaywIBEPT7xoJuPO14CNeAqJe/UGKLbu6.e1ghQ02pZ5G', '1977-08-28', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2017-03-08'),
(5292, ' Gabriel', 'Aguilar Alfaro', 'Francisco Villa', 'D', 'Conteos Ciclicos', '1', '60431', '$2y$10$CBLOEFL4oOhUn952bSQuVuE6aYNEOnOLq/phH5KIwshrELQdjhROC', '1981-10-22', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2017-03-08'),
(5293, ' Juana', 'Ramos Hernandez', 'Parajes de Oriente', 'D', 'Operador General', '1', '60453', '$2y$10$VQJh6wkgbYzDac/iVk2Gz.6zscbzHEhuTpxnooCo4aQFNRIe86EHm', '1984-10-19', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2017-04-26'),
(5294, ' Liseth', 'Ochoa Guerrero', 'Parajes del Sur', 'D', 'Operador de Criticos', '2', '60454', '$2y$10$K3dLeSVuz1Ogq/U6gaiiI.idDnRSqbM5gSq4pqon8KmG/7Jt5Q5Rm', '1991-07-08', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2017-04-26'),
(5295, ' Karina Alejandra', 'SaldaÃ±a Santana', 'Hacienda de las Torres', 'D', 'Operador De Procesos', '2', '60458', '$2y$10$lhriy1ilFaj3U8YzqIIpBurkq4ocUqAAv2UydsIMJoABlnzU6iBqO', '1995-10-05', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2017-05-03'),
(5296, ' Carlos Alberto', 'Garcia Medina', 'Paraje de San Jose', 'D', 'Operador de Set Up', '1', '60459', '$2y$10$GbkhHJij6Fz.r8HPjjBefODzou3sA04Yky01W7L5BVRNexXYSSXRO', '1975-05-20', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2017-05-03'),
(5297, ' Viviana', 'Acosta Pozos', 'Parajes de San Isidro', 'D', 'Operador De Procesos', '1', '60470', '$2y$10$iqVzHn10UH5h5/l6zjZhBugnIJf1CeZa605VwQ0fviF6y5.jt27Ne', '1981-12-09', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2017-05-09'),
(5298, ' Teresa Gricelda', 'Tapia Martinez', 'El Campanario', 'D', 'Jefe de Grupo', '1', '60471', '$2y$10$9BDqcz34NqFEAdAeO7PFmO6U95CyMhMzTd/TiNXykd5dy76af.O7C', '1979-05-19', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2017-05-09'),
(5299, ' Victor Alfonso', 'Rosas Rodriguez', 'Senderos De San Isidro', 'D', 'Operador Especialista', '1', '60474', '$2y$10$C1CVVkcTZ9m7ea35UlnKde/au0a.X.jtPJ6jApXc4cKEb9lf/EglC', '1983-11-30', 'Arellano Mota, Arturo', '24791', 'HUS', '2017-05-10'),
(5300, ' Hilda', 'Merino Antonio', 'Manuel Valdez', 'D', 'Operador General', '1', '60476', '$2y$10$C5vpM5ClAN5eDd8qqFYcHejrOmlEMOURQubLi.st6S41GwjxKqNmS', '1986-09-15', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2017-05-16'),
(5301, ' Jorge Luis', 'Flores Casimiro', 'Riveras del Bravo', 'D', 'Operador de Set Up', '1', '60477', '$2y$10$CAl7Q6MG/LQ29xim6ttMQ.5ZBGEzX1XoLLRv6SqVBxXR0mkShGJHW', '1971-11-24', 'Sanchez Cordova, Rene', '41563', 'HES', '2017-05-16'),
(5302, ' Jorge', 'Hernandez Garcia', 'Urbi Villa del Cedro', 'D', 'Operador General', '1', '60478', '$2y$10$DZ6TNGAiPTns..7c94H/dukOCZ9vFHSe/E6MIvxU25Jiuni49SIda', '1975-06-15', 'Sanchez Cordova, Rene', '41563', 'HES', '2017-05-16'),
(5303, ' Ludivina', 'Rios Martinez', 'Heroes de la Revolucion', 'D', 'Operador De Procesos', '1', '60482', '$2y$10$caYV7twhbT/GjB3cdshVMeHpvPYg48U1zCPZmiMmSJS4b.v.uanLS', '1983-02-28', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2017-05-23'),
(5304, ' Irma', 'Soto Ramos', 'Oriente los Arenales', 'D', 'Operador General', '1', '60484', '$2y$10$FnieJ6ZJujiNdxE4GjDHLevMSo8Kf106HN7E7H32claqwZJygU2UC', '1967-09-17', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2017-05-23'),
(5305, ' Alexander', 'Trujillo Cruz', 'Parajes de Oriente', 'D', 'Operador de Set Up', '1', '60486', '$2y$10$8XvWQjMfP608G1p3MlRcwuXTKKOFbpnOuUe7/wT.AWJTU6MymXEc.', '1987-05-25', 'Sanchez Cordova, Rene', '41563', 'HES', '2017-05-24'),
(5306, ' Julio Cesar', 'Pimentel Padilla', 'Rinconada de las Torres', 'D', 'Operador de Criticos', '2', '60489', '$2y$10$10.sB0grHGEoh5IG1y6Re.YVRGxvE3qM7rR1nPU95qwhsvYXelbFS', '1996-10-21', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2017-05-31'),
(5307, ' Francisco', 'Ramon Carlos', 'Fraccionamiento Senderos', 'D', 'Tecnico de Ingenieria Sr', '1', '60493', '$2y$10$j6zMT8P5Mquoo2iI3lTopOQazCSu6ws3oQZbqGV4OGGr3iUZFS.Mm', '1994-09-21', 'Sosa Rascon, Lilia Veronica', '24858', 'HES', '2017-05-30'),
(5308, ' Maria Guadalupe', 'Perez Gonzalez', 'Medanos', 'D', 'Operador General', '1', '60502', '$2y$10$kl2EyDhIi1p85JPju5l7WuLq7xslGbpRvtHd4ebHgve3BE7jd1GYW', '1989-07-20', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2017-06-13'),
(5309, ' Sandra Janeth', 'Martinez Martinez', 'portal del roble', 'D', 'Tecnico de Calidad', '2', '60507', '$2y$10$e9IROy0Wf88g6UymJKqPzel7.B/D31as15v1bxE3pez9.vMk1xjFK', '1999-03-01', 'Armando Reyes Maldonado', '86641', 'HUS II', '2017-06-20'),
(5310, ' Miguel', 'Cayetano Ortega', 'Urbivilla Bonita', 'D', 'Operador De Procesos', '1', '60509', '$2y$10$30Zyh7aAN8d.n1Eh9GVa/OE9z1e1hYiBC6b2xXOtASwB57eRLVb6W', '1970-10-15', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2017-06-27'),
(5311, ' Leonardo', 'Perez Reyes', 'Parajes de Oriente', 'D', 'Operador De Procesos', '1', '60516', '$2y$10$XEYrd8uOra/itLlEm0a0U.GXggBDRJP1anjWqoXkXhNFEYpLYI2Gq', '1963-11-05', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2017-07-11'),
(5312, ' Alberto', 'Santiago Reyes', 'Praderas del Sol', 'D', 'Operador de Criticos', '1', '60517', '$2y$10$njFqBjC/3/OpTaN6jgN4r.QG6VG2sxvGAuTHAsQi9id9GS1tyi.km', '1977-04-08', 'Saul Arellano Escobar', '97722', 'HUS', '2017-07-12'),
(5313, ' Flora Elizabeth', 'Valdez Cueto', 'Praderas del Sur', 'D', 'Operador General', '1', '60520', '$2y$10$LAGRTcbg8/sigkejg2k4HuvXhF5oAg3CQTCkAWjGFsshEoHkmEvWK', '1964-01-12', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2017-07-13'),
(5314, ' Lindsey', 'Velazquez Dolores', 'El Fortin', 'D', 'Operador De Procesos', '1', '60524', '$2y$10$5oseqccmpRpWjS321tl44ud6pP0IW3T/XBpQmhy9UPA5VmoyTeF.6', '1977-06-07', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2017-07-25'),
(5315, ' Hilda Zulema', 'Arevalo Vazquez', 'Heroes de la Revolucion', 'D', 'Operador General', '1', '60525', '$2y$10$d9hyKQJYtAojoMCNt4Y3heB9aTS/g.LiQn5LTZZ13Gysw38FLMBAu', '1988-11-26', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2017-07-25'),
(5316, ' Noe', 'Baez Gamboa', 'Parajes de San Isidro', 'D', 'Operador de Criticos', '2', '60526', '$2y$10$AfjpUGdeP910F.IPcRdPCueQBZRtaf8Grkee3ckg/1phzA17HP/Ni', '1999-01-03', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2017-07-25'),
(5317, ' Maria De Jesus', 'Herrera Barron', 'Fray Garcia de San Franci', 'D', 'Operador General', '1', '60527', '$2y$10$yId45sJsIrSI0ShWu2rFrOerzCUt.aXdivrl3hrwFZ1CINgwaYbyK', '1975-06-06', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2017-07-25'),
(5318, ' Orlando', 'Perez Diaz', 'Lucio CabaÃ±as', 'D', 'Operador de Set Up', '1', '60529', '$2y$10$.oRT4SgTvdHPWMu0tvAwS.J92btwiaLSFAZwiP/ZWd7MLRaNAB8T6', '1992-09-17', 'Sanchez Cordova, Rene', '41563', 'HES', '2017-08-01'),
(5319, ' Julio Cesar', 'Aguilera Avalos', 'Horizontes del Sur', 'D', 'Tec Esp en Mtto Equipo', '1', '60539', '$2y$10$hbOPR5cr7qzz0OhFwrZ/aeRzHiwK0FMwZZFzQy.Yx3dWmiZGemTOW', '1971-09-18', 'Luis Albel Aguirre Ortiz', '61762', 'HUS', '2017-08-16'),
(5320, ' Roxana Guadalupe', 'De la Rosa Puentes', 'Parajes del Valle', 'D', 'Operador General', '1', '60541', '$2y$10$sxJjdb3wUZrCPqXG82c5VuO/nM2JKYZCX.7U/giHw5/rPvh6EoR6q', '1997-07-24', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2017-08-23'),
(5321, ' Rolfi Almaguer', 'Lopez Gonzalez', 'Parajes de San Isidro', 'D', 'Operador Especialista', '1', '60552', '$2y$10$1zi.yE2si13X90RpJHB56ePoDnTJm588ejx0gZ8EQ92F5OjCBXLJa', '1988-03-26', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2017-09-07'),
(5322, ' Leticia', 'Gonzalez Aguilar', 'Horizontes del Sur', 'D', 'Operador General', '1', '60562', '$2y$10$ocWhmFb2HeV0sxrpATYYFOOO9cDtZ6.W3W3YKn2MiKJ7cVCJYf/gy', '1971-10-15', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2017-09-20'),
(5323, ' Luz Elena', 'Natividad Molinar', 'Parajes de San Isidro', 'D', 'Operador General', '1', '60563', '$2y$10$FHpVAj99MwOyYyq0n6BjL.EfiwOjlp8UKOBFCumWLjV4j2ndN2lNi', '1985-08-22', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2017-09-21'),
(5324, ' Jesus', 'Sanchez Sanchez', 'Fracc. Misiones de Creel', 'D', 'Tecnico en Ingenieria', '2', '60566', '$2y$10$pFZroiPDM.V1dhOW.WNPbeOXYpgLCczghmWI1/hKiT1V31sRTrN5a', '1990-04-01', 'Shyam Gangadharan', '76925', 'HUS II', '2017-09-26'),
(5325, ' Liliana', 'Jimenez Lopez', 'Senderos de San Isidro', 'D', 'Operador General', '1', '60569', '$2y$10$LUAD29nV.KO0nIZVt//yeOu.BlfBAru/tdwcJr1dJhScYlsADpt9u', '1990-04-13', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2017-09-26'),
(5326, ' Norma', 'Mendoza Trejo', 'Parajes de Oriente', 'D', 'Operador General', '1', '60572', '$2y$10$0DdZvxL0gT3B6lfmxGb/Y.W3vRnpumQPhhJvxen5WZGje/psysj8u', '1973-11-02', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2017-09-29'),
(5327, ' Arlette Selene', 'Flores Flores', 'Bosque Bonito', 'D', 'Operador De Procesos', '1', '60574', '$2y$10$zEBEQ/XUpAkfCpL1DuSffu1zprXAey9KmIzDWs389hOZS9qn48lva', '1991-12-31', 'Vania Garcia', '100540', 'HUS', '2017-10-03'),
(5328, ' Jose Domingo', 'Romero Carmona', 'Riveras del Bravo', 'D', 'Set-Up Produccion', '1', '60576', '$2y$10$G2f9fpK2duDxV02c5gPHgOgk.uYBFu13xWRwoSnSLp99faO0O2kYK', '1976-01-14', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2017-10-06'),
(5329, ' Carlos Arturo', 'Alvarado Rivera', 'Terrenos Nacionales', 'D', 'Conteos Ciclicos', '1', '60582', '$2y$10$5Wb4WlIcz5KfLhhbRFaK7ungGmslZJzm.mDgC54wc8x.bWDmUGeOq', '1982-04-20', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2017-10-12'),
(5330, ' Sergio', 'Hernandez Martinez', 'Parajes del Sur', 'D', 'Almacenista', '1', '60591', '$2y$10$REtQ4cfNyZGzVeDZ5K0BWOs0EVWZoeFKKft7XioVNGj1Aeb.UlrsO', '1984-10-08', 'Resendez Gardner Raul', '98277', 'HUS', '2017-11-09'),
(5331, ' Ma. De Lourdes', 'Juanes Silos', 'Colinas del Sur', 'D', 'Operador General', '1', '60594', '$2y$10$wa06Xbzo9saqvOoxdOYThuol6V62I9UjaH835/xk.eQ8uS4DoGARy', '1965-02-02', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2017-11-23'),
(5332, ' Joel', 'Ortiz Escobedo', 'Carlos Castillo Peraza', 'C', 'Auxiliar de Recibos', '2', '60597', '$2y$10$cRNpb8gMWso0B4jGuGolY.LlyfC.i0/kpflEQ9IFF/kUZt27vysl.', '1999-07-20', 'Bacilio Abel Rocha Carrillo', '68476', 'HUS II', '2017-11-28'),
(5333, ' Maria Isabel', 'Helo Alvarez', 'Morelos Zaragoza', 'D', 'Operador General', '1', '60603', '$2y$10$UC6pALMKHLVukEwHlxXU5OI3FwmvZlo7GkHbtFQvOmtFcU/05ao.2', '1975-06-03', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2017-11-29'),
(5334, ' Jose Armando', 'Lazos Reyna', 'Salvarcar', 'D', 'Almacenista', '1', '60605', '$2y$10$U9.p11vTbwIaz4fUO.Hcv.Htou4uS24NKJG.qXrLT1BuzsS6meUJi', '1982-08-26', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2017-12-06'),
(5335, ' Jesus Alonso', 'Alvarado Torres', 'Villas Residencial del Re', 'D', 'Tec Proceso de Moldeo/Die Cast', '1', '60607', '$2y$10$mmG/wktvB6PkFektiEBU6.ehk4VmLir8ye5uEHfaArstkwE2Bnt1a', '1968-02-20', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2017-12-11'),
(5336, ' Eduwiges', 'Dionicio Esteban', 'Terranova', 'D', 'Operador General', '1', '60613', '$2y$10$w0byRpHkWmO6pbO6bADANuyhDW57B9.S/KkaHk3DeGfeAqGiVbWzq', '1977-09-23', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2018-01-04'),
(5337, ' Ivan', 'Ramirez Medrano', 'Parajes del Sur', 'D', 'Operador De Procesos', '1', '60620', '$2y$10$4Rne9N1Zp2OesQOS6tpOj.i1lEbHXPeqMReH5dO6m5pLWx5HJHtLC', '1973-10-16', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2018-01-08'),
(5338, ' Veronica', 'Romo Molina', 'Urbi Billa del Prado', 'D', 'Operador General', '1', '60621', '$2y$10$Mp1qVywfgYGAdghR1f8S5uYRCwiDTZWrc5rFXokAFoTHDpK/Z6TOS', '1989-05-17', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2018-01-08'),
(5339, ' Jesus Enrique', 'Basurto Aguayo', 'Carlos Castillo Peraza', 'D', 'Operador General', '1', '60626', '$2y$10$leOGyrhNznlRdBpxciFPEuO8MnAUHsoGeoGHjIQj4E.EsDm7xw1Um', '1998-04-25', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2018-01-09'),
(5340, ' Ifran', 'Nolasco Vasquez', 'Paseos del Alba', 'D', 'Operador de Criticos', '1', '60628', '$2y$10$y1J5FUMZZocKkDfMLku62.nBjsTYz3JRNCfPDOmHGeoXdWaBWhVG2', '1979-06-21', 'Saul Arellano Escobar', '97722', 'HUS', '2018-01-09'),
(5341, ' Luz Adriana', 'Juarez Cuevas', 'Infonavit Amp. Aeropuerto', 'C', 'Auxiliar de Planeacion', '1', '60633', '$2y$10$DMG2nUKZ0qPQuTuDYAospupOqY2wYOmmVT8ivG5yK1qemhgdDLdvm', '1984-01-20', 'Falcon Munoz, Lilia', '25685', 'HUS', '2018-01-10'),
(5342, ' Maria De Lourdes', 'Melendez Manriquez', 'Parajes del Sur', 'D', 'Operador Especialista', '1', '60635', '$2y$10$0WMjfAex0nTZF5bU2qFSMuAqnn7chaZIJHx.YZlaNcoSfoXa2rPB.', '1977-04-27', 'Briseida Bautista Tolentino', '300011', 'HUS', '2018-01-11'),
(5343, ' Iram', 'Martinez Lopez', 'Las Haciendas', 'D', 'Operador De Procesos', '1', '60636', '$2y$10$.9l.mi95k8zvjGRFkfdh2eWt/P3bZBYe0eHS9xEhB/3..lhlEQw1e', '1977-09-10', 'Abel Fernandez Delgado', '98716', 'HUS', '2018-01-15'),
(5344, ' Jesus', 'AvendaÃ±o Martinez', 'Salvarcar', 'D', 'Operador de Criticos', '2', '60648', '$2y$10$NbPz/67QZQf7T3kio8q6UeEGmT3lYQl6dU5hexSBxu.kzuzYIZHYC', '1976-05-31', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2018-01-24'),
(5345, ' Ricardo Alberto', 'Luna Marquez', 'Torres del Pri', 'D', 'Operador De Procesos', '1', '60650', '$2y$10$7VCiJf.1.kacpVkOZQfaverQbAARmBfFimLhgnwQ.gJApUbrqXr/6', '1999-10-24', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2018-01-30'),
(5346, ' Francisco', 'MuÃ±oz Hernandez', 'Salvarcar', 'D', 'Operador de Set Up', '1', '60655', '$2y$10$ZyPhendvOlvFHAb81E/ry.k1CVu8ws5WAE9g6DsPX4ICw2WsxaBES', '1973-07-06', 'Sanchez Cordova, Rene', '41563', 'HES', '2018-01-31'),
(5347, ' Luis Alberto', 'Lopez Garcia', 'Palmas del Sol', 'D', 'Operador de Criticos', '1', '60656', '$2y$10$Qez1fhNW6zs.RX/VdmpV4OxYRnObzPl4xxnVl7ulGultj6VuiYcBi', '1980-10-17', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2018-02-07'),
(5348, ' Francisco Javier', 'Santiago Rodriguez', 'Portal del Roble', 'D', 'Operador de Secundarios', '1', '60657', '$2y$10$cHG7gK7WPuHtvhwSokalL.cHyD2CnRQrmAphPdvELR1JzlR7q6kj2', '1985-05-18', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2018-02-07'),
(5349, ' Socorro Elena', 'Diaz Vargas', 'Condominio las Aguilas', 'D', 'Operador General', '1', '60661', '$2y$10$aI71LivAtez8imgT33jb7uusRIQdvDGC30Oa7TorpelN/3cn3I3Ou', '1973-05-17', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2018-02-07'),
(5350, ' Concepcion', 'Fuentes Vazquez', 'Parajes de Oriente', 'D', 'Operador General', '1', '60667', '$2y$10$6lYXElfuT6IsxzLYCB5GkeIhX4jBUAgrnWnSRDZA9f2ipkQR9h7jq', '1968-12-08', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2018-02-08'),
(5351, ' Norma Del Carmen', 'Romero Cruz', 'Parajes de San Jose', 'D', 'Operador General', '1', '60668', '$2y$10$/Jxp/7HQMw6RgOLmnd3dG.FPUbCna.QHLWSWQg8OhfxEwlLFIZpCq', '1989-04-27', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2018-02-09'),
(5352, ' Jorge', 'Castelan CastaÃ±eda', 'Rinconada de las Torres', 'D', 'Operador de  Produccion', '1', '60670', '$2y$10$DKl5ybV1JPC398n5yW0u1.PpZvWv4.XNFxKMZPjuygBzfJsnEoWnK', '1968-04-28', 'Gandarilla Holguin, Jesus Manu', '', 'HES', NULL),
(5353, ' Rubicel', 'Felix Feria', 'Parajes de Oriente', 'D', 'Operador de Criticos', '1', '60671', '$2y$10$W1NxK3fJdTBPKcSO5k9LY.tBBDDzWJEogdsMaQz3SuHBMVpyEpi.u', '1980-06-05', 'Saul Arellano Escobar', '97722', 'HUS', '2018-02-14'),
(5354, ' Blanca Araceli', 'Delfin Valenzuela', 'Santa Lucia', 'D', 'Operador De Procesos', '1', '60674', '$2y$10$ijvb8Jwil.TPVzQxFQ/kpeMtBjcfqSiraaMklh8THWzfw2QteG20m', '1979-02-08', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2018-02-14'),
(5355, ' Jesus Daniel', 'Silva Rodriguez', 'Cerradas San Pedro', 'D', 'Operador de Set Up', '1', '60678', '$2y$10$9YkVUnNBl6Cizh0ZSO7OZux.j5O6tyNurMeLe7Rhac0UnXNILYsgG', '1993-12-11', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2018-02-23'),
(5356, ' Juan', 'NuÃ±ez Sanchez', 'Division del Norte', 'D', 'Tec de Mantenimiento Troqueles', '1', '60681', '$2y$10$3M.KaP1LXUNmYQQ6975z5uthkqDtGV/x9RjYrZyUS01Qafm/tzNGO', '1980-07-04', 'Favela Alvarado, Jose Luis', '25333', 'HES', '2018-03-05'),
(5357, ' Vicente Misael', 'Gonzalez Rendon', 'Hacienda de las Torres I', 'D', 'Operador de Secundarios', '1', '60685', '$2y$10$RGqmKP2BwrwZOQe/n507denaolXT1E37UJUsmStPd7H1yL.WRhOyq', '1990-09-30', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2018-03-06'),
(5358, ' Carlos Alejandro', 'Zamarripa Ordaz', 'Morelos Zaragoza', 'D', 'Operador de Secundarios', '1', '60687', '$2y$10$nCM9Jd5hKXFKhVlrKN69o.SEGyhasOm4jxOUcSXh8vy.H9Jyf.KhW', '1985-12-30', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2018-03-06'),
(5359, ' Ana Luz', 'Sanchez Mesta', 'Riveras del Bravo', 'D', 'Operador de Criticos', '2', '60689', '$2y$10$Lo9FbLEfrffpvh/tAUg8Wuw4RnTjnxpj2L6B8b4j1JR.CKCvf6Vri', '1987-08-18', 'Javier MartÃ­nez Acosta', '61908', 'HUS II', '2018-03-08'),
(5360, ' Maribel', 'Valdez OrdoÃ±ez', 'Parajes del Sur', 'D', 'Operador General', '1', '60690', '$2y$10$6GZbKtaTELz6vfyhR9cqYuQBR4u8zqhufEy9e1QFOzgtGIvH2wQwe', '1969-02-02', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2018-03-13'),
(5361, ' Paulina', 'Gaucin Portillo', 'Carlos Chavira Becerra', 'D', 'Operador General', '1', '60694', '$2y$10$aiCZ0eLVBMdNqXd9l1XKdOCrxDv.3MtbvHIHDYsX8d.S0PKUdrlMa', '1986-10-10', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2018-03-22'),
(5362, ' Elia', 'Robles Zapata', 'Roma', 'D', 'Operador General', '1', '60695', '$2y$10$xUbR4KvhohezyJrL3nASseb5UitCnyVBVRmPEwaxle/BCKLVa654m', '1971-01-28', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2018-03-22'),
(5363, ' Ismael', 'Camargo Renteria', '15 de Mayo', 'D', 'Tecnico de Ingenieria Sr', '1', '60697', '$2y$10$Nl2hkkrFbn0eSV1fhcOWxeUNTRtKE.lHHV8Kd5skl3ahZcdOUEvh.', '1997-03-28', 'Ivan Valero', '24932', 'HES', '2018-03-22'),
(5364, ' Jesus Manuel', 'Perez Gonzalez', 'Paseos del Alba', 'D', 'Materialista', '1', '60702', '$2y$10$uJ1evgvy.L.Zw.GuNqUNse5rNFN.SNDDXO/cj3PgR7rQKPRiHsGXO', '1991-04-30', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2018-03-27'),
(5365, ' Hector', 'Rodriguez Favela', 'Aguilas de Zaragoza', 'D', 'Almacenista', '1', '60707', '$2y$10$bFLTCvDXjr79pFlz7bnRZeD6U5b8ulHaQbtLaTSVRyaXkficLOaTq', '1981-06-23', 'Resendez Gardner Raul', '98277', 'HUS', '2018-03-28'),
(5366, ' Selene Margarita', 'Alvarez Carbajal', 'Parajes de Oriente', 'D', 'Operador De Procesos', '2', '60714', '$2y$10$7EuQSpe.XfQZkP/6DURmQ.PNU31wU4HK6TNhBp.SkkSzKcRjflphG', '1987-07-11', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2018-04-04'),
(5367, ' Veronica Rocio', 'Loza Palacios', 'Urbi Villa del Cedro', 'D', 'Operador General', '1', '60715', '$2y$10$irq4Kuvh2XRu2Q49iAejHea4r3dwnpdZRiBhNZUJPGI93LRQDkPFG', '1976-05-17', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2018-04-04'),
(5368, ' Claudia Verenice', 'Rios Galarza', 'Colinas del Sol', 'D', 'Operador De Procesos', '1', '60716', '$2y$10$JKLGVLa.dnWeTRCrG/85g.EoeqVV06rl2ZvnbRr4hDV0w.nzqorN6', '1985-09-21', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', NULL),
(5369, ' Fidencio', 'Rueda Vaquera', 'Parajes de Oriente', 'D', 'Operador de Criticos', '1', '60725', '$2y$10$8urwkYPEK9NN9UjjN6G/4uxSeD1UVbuqmdYRR6Clkm.dF4Ogu0X22', '1988-06-04', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2018-04-10'),
(5370, ' Magali', 'MuÃ±oz Montes de Oca', 'Carlos Castillo Peraza', 'D', 'Operador De Procesos', '1', '60727', '$2y$10$6GYC5hxkoFpszB49KowlqOu.XyVnUULWNh.ZOsjqkbFGdqKXMXDKO', '1987-04-23', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2018-04-17'),
(5371, ' Mercedes', 'Torres Quintana', 'Simon Rodriguez', 'D', 'Operador General', '1', '60730', '$2y$10$TLRUPtI8t/v.edARF.JkGOu23apqckmP1MqPIhcK.W97GKE7HI73K', '1971-11-28', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2018-04-18'),
(5372, ' Veronica', 'MontaÃ±ez Valdivia', 'Altavista', 'D', 'Operador General', '1', '60732', '$2y$10$2LAsp4FKX.0dvI/NzFbq8.QFeammo3M5asSXTRaxjPG.kou4G0u0O', '1973-05-09', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2018-04-24'),
(5373, ' Miriam Rubi', 'Mora Teresa', 'Buenos Aires', 'D', 'Tecnico de Seguridad Industrial', '1', '60738', '$2y$10$die7X1MRGk2CJKIcduBBVOx3nDaOb7FwG5kvTTGcDwF4HZZh2TzfW', '1997-03-29', 'Parga Rangel, Brayan Alexis', '86782', 'HUS', '2018-04-27'),
(5374, ' Luz Estela', 'Aguayo Villalba', 'Manuel Valdez', 'D', 'Operador General', '1', '60742', '$2y$10$/yQsqK72GDyqSrnQxZZIiODSNZWjXYTNQJQbMZqj1m3rEcIO22cAu', '1974-10-11', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2018-05-01'),
(5375, ' Denys Yadiel', 'Reyes Fabian', 'Carlos Chavira Becerra', 'D', 'Operador de Criticos', '1', '60753', '$2y$10$YcYW4F0BJpizcvh..zkEyeyurOQscyre0b4YqZyNDDd7WWbLxMPQm', '1992-09-16', 'Saul Arellano Escobar', '97722', 'HUS', '2018-05-14'),
(5376, ' Maria Carmel', 'Fontes Carrillo', 'Bosque Bonito', 'D', 'Operador General', '1', '60755', '$2y$10$8lLKfoNLDbPJ8ZG/q1WVsOCLQuNnta5mfgkEMxukVU8JU/g/mQJ8C', '1983-07-16', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2018-05-15'),
(5377, ' Eduardo', 'Cerda Morales', 'Portal del Roble', 'C', 'Auxiliar de Recibos', '1', '60756', '$2y$10$zUCX6.uNjIXgXzuc91LPl.3ZmFElNqhNxsEAaT3iOcZIPW6CuQoQ.', '1999-07-26', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2018-05-15'),
(5378, ' Sandra Veronica', 'Nava Martinez', 'Praderas del Sur', 'D', 'Inspector Control de Calidad', '1', '60760', '$2y$10$iyL8sPjudYlx.6Gq4Ykv0.MQ31rrQz5zNzdDHhfla/bUKhxSFOAj.', '1972-04-15', 'Oscar Garcia', '59965', 'HES', '2018-05-15'),
(5379, ' Maria Guadalupe', 'Vega Belmontes', 'Bosque Bonito', 'D', 'Jefe de Grupo', '1', '60762', '$2y$10$D3DHFZ2XdRILp0p5DkV9uuYQCyyFWwFaPnO8oskXepc.qR9rsuTsS', '1985-09-07', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2018-05-15'),
(5380, ' Macario', 'Miguel Dominguez', 'Parajes de Oriente', 'D', 'Operador de Set Up', '1', '60785', '$2y$10$TaLvrT75SbB1560OENoF1ODvYIlvcZCCMFTXq11VkmjPnv7DroPUO', '1994-04-04', 'Jesus Lopez Solis', '73653', 'HUS', '2018-05-30'),
(5381, ' Margarita', 'Lopez Cruz', 'Hacienda de las Torres', 'D', 'Operador General', '1', '60795', '$2y$10$e5QGtS/QdXcZtIHFLVGHXuMhXOD7PEYbqisjYx8VxAoC0biRw3pvC', '1998-08-06', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2018-06-05'),
(5382, ' Luis Rey', 'Valtierra Gutierrez', 'Riveras del Bravo', 'D', 'Operador de Set Up', '1', '60797', '$2y$10$33Py/G6xvAI4pwjokMuvXO0KmJUAVpYWe3odROMQ/COBARUYmBiyG', '1975-12-02', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2018-06-05'),
(5383, ' Martha Alicia', 'Jinez Cabrales', 'Tierra Nueva', 'D', 'Operador General', '1', '60798', '$2y$10$mK1NKkB1ALoDokMi/hj99OLQeeaMTkrM5DTERdZ44894RqaLwHFF.', '1986-07-29', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2018-06-05'),
(5384, ' Maria Esperanza', 'Soto Andrade', 'Frida Khalo', 'D', 'Operador General', '1', '60802', '$2y$10$57s7s5J4U2zaZtA7ApRfs.P1845HoKwDUWVXbNi2Z8MdxuuBlvvt6', '1982-12-19', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2018-06-13'),
(5385, ' Deysi Yamileth', 'Perez Barahona', 'Urbi Villa del Cedro', 'D', 'Operador General', '1', '60803', '$2y$10$gXoZdEVoy40HCvPrLJwSfulQVeJhILIWsYVY9KqQq.StEQ2YsLFAe', '1995-09-07', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2018-06-13'),
(5386, ' Sanjuana', 'Alvarado Lopez', 'Rincones de Salvarcar', 'D', 'Operador General', '1', '60812', '$2y$10$CJY9FDcM3MizByEvRCPkCOea7ftmm9iyB3orefjidaLunGG9TdHuq', '1975-08-20', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2018-06-21'),
(5387, ' Sergio Enrique', 'Alor Hernandez', 'Carlos Castillo Peraza', 'D', 'Almacenista', '1', '60821', '$2y$10$hw6rwqeek/xD1N2hzVvDVO.8DjY/eNP1.JHAZVQ2Cx4R2Wxa7ZzPi', '1991-10-29', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2018-06-26'),
(5388, ' Noel Alejandro', 'Garcia Aguilera', 'Pino Suarez', 'D', 'Operador General', '1', '60828', '$2y$10$aOxQN68/b1OPrGdvMt2mNukn8a8ub8HTHfWHfi.w6anBuGwGwJ6qG', '1993-12-26', 'Vania Garcia', '100540', 'HUS', '2018-06-28'),
(5389, ' Severo', 'Ramon Gregorio', 'Parajes de Oriente', 'D', 'Operador General', '1', '60829', '$2y$10$utFahKAp6IiMOv5.yFQI7uasINDiAKzBfz0I56F/CMGIR2iycx/hG', '1979-01-02', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2018-06-28'),
(5390, ' Antonio', 'Villarreal Zamora', 'Misiones del Real', 'D', 'Operador De Procesos', '1', '60833', '$2y$10$8AzlCNgMC9Gfov5Z0ceLguSmPA99dFe3DTWwdM8kiCfvQGx0jnZra', '1972-11-12', 'Varona Hernandez, Braulio', '61651', 'HUS', '2018-06-29'),
(5391, ' Asuncion', 'Sanchez De la Cruz', 'Portal del Valle', 'D', 'Operador General', '1', '60835', '$2y$10$G5pWdQtlLjdi/UypTlLO.e644tPUezvLmcDWzz2AZXJaFflN3r0dm', '1970-08-17', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2018-07-03'),
(5392, ' Yuliana', 'Rios Soriano', 'El Fortin', 'D', 'Operador General', '1', '60840', '$2y$10$YgfNuTO8lIcBnhXidG0EG.umpTJ0xodNgImpl65MWs93CRLBImYPO', '1989-07-28', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2018-07-03'),
(5393, ' Eduard Alberto', 'Torres Perez', 'Riveras del Bravo', 'D', 'Operador de Set Up', '1', '60856', '$2y$10$dRnuJVpFehaC/qEpPXBj/.URgdEPT6G2oUGRzP/qIsUhqzSc6Lpye', '1995-03-18', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2018-07-06'),
(5394, ' Mayra', 'Espadas Hernandez', 'Urbi Villa del Cedro', 'D', 'Operador General', '1', '60861', '$2y$10$kt0q8BopSkPtdO23HTSTW.1aCTVM4zbYPmOdEt7jtmhe5hIEER16e', '1978-09-19', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2018-07-10'),
(5395, ' Ana Maria', 'Rosas Ramirez', 'Parajes de Oriente', 'D', 'Operador General', '1', '60862', '$2y$10$pns2.E6TBsRbKjXTk2xXaOgAPejtPNJFcQvt0UWRhqk8k1OMEnBAi', '1994-02-22', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2018-07-10'),
(5396, ' Sara', 'Prieto Gomez', 'Riveras del Bravo', 'D', 'Operador General', '1', '60868', '$2y$10$ye0.yaF355Is37vcbOnFeuYFJqcbShSJ/bnBU6Ua/8SIamcK84cne', '1983-09-22', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2018-07-10'),
(5397, ' Ismael', 'Ruiz Avila', 'Mezquital', 'D', 'Operador General', '1', '60870', '$2y$10$UG6FWioov6iBzuBl0eQbG.7nWJr9g1qqEVEykIRRUw5SUcyDPGhoW', '1981-10-19', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2018-07-11'),
(5398, ' Juan Martin', 'Malacara Veloz', 'Infonavit Solidaridad', 'D', 'Operador De Procesos', '1', '60882', '$2y$10$wT1dguFI7mGBCG9.N2SXcuS/8zjQmU3E1tcODtHhH3Bt0rY.Qs6ZK', '1993-09-03', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2018-07-17');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `colony`, `position`, `area`, `plant`, `username`, `password`, `birthdate`, `supervisor_name`, `supervisor_reloj_number`, `deparment`, `fecha_ingreso`) VALUES
(5399, ' Victor', 'Menchaca Mendoza', 'Cerrada de Oriente', 'D', 'Almacenista', '1', '60885', '$2y$10$bTg4ItZlsrPvWWpTasd0XO.VwUv/0MFVXZUnFjR0kWcOKX1N6VAWG', '1982-08-14', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2018-07-17'),
(5400, ' Yanely', 'AvendaÃ±o Morales', 'Parajes del Sur', 'D', 'Operador De Procesos', '1', '60897', '$2y$10$tpfjTc/l5NtAYbYO8izxgOiMuYFKYF76ditpufzok939jnzvkiApy', '1993-05-18', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2018-07-20'),
(5401, ' Amalia Sarahy', 'Colin Silva', 'Parajes de San Isidro', 'D', 'Operador General', '1', '60901', '$2y$10$7nNB8cgdav24fHnMUFXpWemWzFvFBPdMpmrmgBPCLE5fo5ZHnav/W', '1992-07-10', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2018-07-24'),
(5402, ' Catalino', 'Vazquez Reyes', 'Parajes de San Isidro', 'D', 'Set-Up Produccion', '1', '60902', '$2y$10$TAf8dHVBOzBbn4m39HQxqeQzW2P05e2qvVxkhJqE6sUJb02rlkDmS', '1988-04-29', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2018-07-24'),
(5403, ' Maria Angelica', 'Minjares Perez', 'Eco 2000', 'D', 'Operador General', '1', '60909', '$2y$10$gPy/preH/xxEo1WdoyPNnu7xGlrLSXy6IC90FOUHj8tj4YpclAi7e', '1985-08-09', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2018-07-26'),
(5404, ' Omar', 'Cisneros Aguilar', 'Horizontes del Sur', 'D', 'Operador Especialista', '1', '60917', '$2y$10$yejgsb.JWhi82pThwjOQ0ujmVAFw5W9W2o1uIB00vmyBqBRpjHKjq', '1997-07-05', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2019-07-01'),
(5405, ' Carolina', 'Amparan Sena', 'Aguilas de Zaragoza', 'D', 'Operador General', '1', '60924', '$2y$10$8mQJE.5aP/mLwRQ7FHog1O6Fsw/m7U5p/CG1rqxuu1Ek95eVn/Re.', '1996-10-22', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2018-08-07'),
(5406, ' Maria De los Angeles', 'Sifuentes Romo', 'Senderos de San Isidro', 'D', 'Operador General', '1', '60926', '$2y$10$/3.TS6iL7YpisAeqPXDdz..SLoo89kOpjHGa3TbxIGL11VekmIuh6', '1974-08-01', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2018-08-07'),
(5407, ' Lucina', 'Compean Moran', 'Praderas del Sauzal', 'D', 'Operador De Procesos', '1', '60927', '$2y$10$AKBdfTd/bWJbXqC2p8jo4evPEBgbtPef7ugSzsNw0Z2ttyFGh/rBW', '1979-05-16', 'Velarde Inostroza Enrique', '71208', 'HUS', '2018-08-08'),
(5408, ' Miguel Angel', 'Roman Olvera', 'Las Gladiolas', 'D', 'Operador de Criticos', '1', '60935', '$2y$10$JRrPaMkTUegf1yMzhuAYneeAulZbHZiVk37s5taOVecJkQhSIDt4e', '1980-12-05', 'Vania Garcia', '100540', 'HUS', '2018-08-09'),
(5409, ' Maria Antonia', 'Gonzalez Sanchez', 'Senderos de San Isidro', 'D', 'Operador General', '1', '60937', '$2y$10$abGkxSe5tv.hiWY2Fi9J9.9s5i6QO0DmAtMPtRu9/V7oM647QekE2', '1976-07-06', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2018-08-14'),
(5410, ' Aurelio', 'Lara Espinoza', 'Praderas del Sur', 'D', 'Operador Especialista', '1', '60946', '$2y$10$hlFjaSHENy47H6029JUq1uHl.DYR6aSzW6O1z1zBNZMWv/HyepglG', '1993-01-10', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2018-08-21'),
(5411, ' Maria Ermita', 'Lozano Avila', 'El Fortin', 'D', 'Operador General', '1', '60949', '$2y$10$wr.uuJHBe7I2CvKad52y9OnXr6HrlJEqaozuxVzXf2v8lTx/oPDFW', '1981-03-16', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2018-08-21'),
(5412, ' Maria', 'Guzman Alvaro', 'Zaragoza', 'D', 'Operador De Procesos', '1', '60950', '$2y$10$GZykVVC6VpQxiUv5stJszuUt4pA9KHO2ajoMxufkuj/wFpviKiBT.', '1988-08-15', 'Velarde Inostroza Enrique', '71208', 'HUS', '2018-08-21'),
(5413, ' Karen Esperanza', 'Garcia Villa', 'El Fortin', 'D', 'Tec Seguridad Industrial Sr', '1', '60951', '$2y$10$aCscPgnDaSN/3PXRrFMOK.ANxObgTPRbIaM0TG8LQjFUQ3tNvDXue', '1996-08-26', 'Eduardo Ruiz', '121008', 'HUS', '2018-08-22'),
(5414, ' Esteban', 'Sanchez MuÃ±oz', 'Vistas de Zaragoza', 'D', 'Operador De Procesos', '1', '60956', '$2y$10$7MbCEoJ4Z3CqmAQzADghXeVeYoC0RuXDB.rzfTiwuc.8GHCs7sM7m', '2000-02-26', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2023-01-05'),
(5415, ' Laura', 'CastaÃ±eda Mojica', 'Riveras del Bravo', 'D', 'Operador De Procesos', '1', '60957', '$2y$10$p7M0Fta8.dtrML7RuJypneF4fZ/kJmeTjv.CwudQcntdvp/WAFQCa', '1983-10-19', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2018-08-23'),
(5416, ' Nancy Del Carmen', 'Milagro Dominguez', 'Cerrada de Oriente', 'D', 'Operador General', '1', '60964', '$2y$10$rV87ZewRWOclCQSr6i2Mu.7Ch73o7OETEM11xmEwYdQxF8K2P5kN2', '1998-02-28', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2018-08-28'),
(5417, ' Jose Carlos', 'Mendez Valentin', 'Riveras del Bravo', 'D', 'Operador General', '1', '60974', '$2y$10$eTva.94AGyCBB49x0dzLd.Fez5lUSmANq/jzepNh8zzCuLkHBH88.', '1987-10-13', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2018-08-29'),
(5418, ' Manuel Adrian', 'Romero Gonzalez', 'Urbivilla Del Cedro', 'D', 'Operador de Criticos', '1', '60983', '$2y$10$gh0gmnH5/3urF8Advg23UeB4dEsspAu/LEMKmy0x9smPbm879bLrK', '1987-11-05', 'Jesus Lopez Solis', '73653', 'HUS', '2022-08-18'),
(5419, ' Susana', 'Diaz Venegas', 'Las Almeras', 'D', 'Operador De Procesos', '1', '60986', '$2y$10$CJnByUnksDwqZPU1IT1f8O9oWlM57jP7sz10R/pwowP0juxoNuC3.', '1983-10-11', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2018-09-04'),
(5420, ' Blanca Elizabeth', 'Martinez Burciaga', 'Aguilas de Zaragoza', 'D', 'Operador General', '1', '60995', '$2y$10$2xyoOUMKdcXqvEQ1UGO.pODK0H1zf.HYbPavSvcLKt1SF5hFxmjPq', '1974-04-14', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2018-09-04'),
(5421, ' Virginia Arely', 'Parada Ramirez', 'La Enramada', 'D', 'Operador General', '1', '60996', '$2y$10$PECHkeGvkMiJ0rM30omsQ.dPSpzlNy8MmQKZ6zk9JyUn0co5lT1b2', '1991-09-15', 'Vania Garcia', '100540', 'HUS', '2018-09-04'),
(5422, ' Romario', 'Hernandez Diaz', 'Portal del Roble', 'D', 'Operador General', '1', '61025', '$2y$10$bSrOZ3yMeRVlipmU1.VvpeeHlftr9pU3OHWeN0Dmdt4xmY1u5Ed5O', '1999-05-27', 'Briseida Bautista Tolentino', '300011', 'HUS', '2018-09-19'),
(5423, ' Lorena', 'Carrillo Ramirez', 'Parajes de San Juan', 'D', 'Operador General', '1', '61027', '$2y$10$6n5GFZ0y/Hb2GodEpLa9eeM5OmFZhSifMT4WsGxC4mOLl7mLHqQZC', '1989-01-24', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2018-09-19'),
(5424, ' Raymundo', 'Estrada Moreno', 'Parajes de Oriente', 'D', 'Operador de Criticos', '1', '61031', '$2y$10$JLPftD8D3hyzFvGnDuGru.63ATkOH8QfAASQb8.12H.02hX63ZQ12', '1992-03-14', 'Jesus Lopez Solis', '73653', 'HUS', '2018-09-19'),
(5425, ' Miguel Angel', 'Martinez Feliciano', 'Cerradas del Alamo', 'D', 'Operador De Procesos', '1', '61033', '$2y$10$HfcvZJo3/3eyeoyxG/MbCOF7ZIlxB6TFKNX.t87wUQL0onlvEZpBm', '2000-08-30', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2018-09-19'),
(5426, ' Laura', 'Dominguez Cruz', 'Roma', 'D', 'Operador General', '1', '61036', '$2y$10$a5D.RaqReBhlsrecU.lwr.BWML09Z6niEU9q1Br.Z6a7490fAQ6Vu', '1978-10-16', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2018-09-20'),
(5427, ' Jose', 'Aniceto Garcia', 'Manuel Valdez', 'D', 'Operador De Procesos', '1', '61042', '$2y$10$WJsmTqZUdJfIAw07nd9xbe/9kBH3sKav9tvIn/8EK.ZbTmgIc9ZYC', '1976-10-03', 'Saul Arellano Escobar', '97722', 'HUS', '2018-09-21'),
(5428, ' Luz Yadira', 'Castillo Orona', 'Gardeno', 'D', 'Operador General', '1', '61047', '$2y$10$NkGi004IECHN9O8B4DMFh.AGQwV77o4lQ2pn5cQCUFJZd6nERw6nG', '1989-10-29', 'Vania Garcia', '100540', 'HUS', '2018-09-25'),
(5429, ' Gerson', 'Velazquez Pacheco', 'Parajes de Oriente', 'D', 'Operador Especialista', '1', '61070', '$2y$10$mptGq4cD1lkN6q9VykJPA.NdyQxLBTkplL0lQYeyiSZiwMDJKpmzK', '1996-02-19', 'Abel Fernandez Delgado', '98716', 'HUS', '2018-10-03'),
(5430, ' Silvia', 'Roldan Garces', 'Horizontes del Sur', 'D', 'Operador General', '1', '61076', '$2y$10$cm5zwzaUocIP/06WhG3OJ.cOk9ox3qPu3hsepiUXpDuV8VU3j/rLu', '1971-04-25', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2018-10-04'),
(5431, ' Ramon', 'Jimenez Escontri', 'Hacienda de las Torres I', 'D', 'Operador De Procesos', '1', '61080', '$2y$10$voUkhVdMFOsPmJ6xj.V8Yu5RANMHcLbKUqpyMJq.Bg.KERku9xEFu', '1977-02-22', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2018-10-04'),
(5432, ' Ramon', 'MuÃ±oz Fomperosa', 'Carlos Castillo Peraza', 'D', 'Operador de Set Up', '1', '61098', '$2y$10$HwiKOXq3oS3WiA.3wKtQ3.JWBNTNna.c.ppJSUJB/1VXvzfTyUa/q', '1981-08-31', 'Jesus Lopez Solis', '73653', 'HUS', '2018-10-10'),
(5433, ' Jesus Alfredo', 'Arevalos Rangel', 'Fray Garcia de San Franci', 'D', 'Operador General', '1', '61100', '$2y$10$GfeuBLhrPrlvb2ZQ6llOj.pUdMiUYl/ib/vpmwhqCXRLyF4dHVr76', '1993-08-06', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2018-10-11'),
(5434, ' Felix Mizael', 'Avila Garcia', 'Manuel Valdez', 'D', 'Operador General', '1', '61111', '$2y$10$crjEnMSxSpAvstTt1gdDIOlLAIIhFeDJqxhAA4eQEucwsPmmNOJ6G', '1999-06-09', 'Vania Garcia', '100540', 'HUS', '2018-10-16'),
(5435, ' Yolanda', 'Fausto Miranda', 'Praderas del Sur', 'D', 'Operador General', '1', '61124', '$2y$10$paPT5RpyRGvo5KOeznAD2OPT.xpulFXIHETQdV2JS5RMDY5kAOzAm', '1979-12-17', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2018-10-23'),
(5436, ' Ma De Jesus', 'Gonzalez Candelaria', 'Eco 2000', 'D', 'Operador General', '1', '61126', '$2y$10$LjGx2jL06V8QfaYYo2FpmeMAaGC33tq3KAWVg9.5Phg0nE9AK1gLO', '1976-05-10', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2018-10-23'),
(5437, ' Diana Laura', 'Arreola Perez', 'Riveras del Bravo', 'D', 'Jefe de Grupo', '1', '61132', '$2y$10$y87q2b.1S.Yn5cUsWmzf8OTWNA9La8NyfbMir4MHV0V4eJ6IeAwOe', '1996-02-26', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2018-10-25'),
(5438, ' Abel Ivan', 'Vargas Gasca', 'El Granjero', 'D', 'Tecnico en Entrenamiento', '1', '61138', '$2y$10$ou8C6.KdMz4ABBxz8pcm.O85eHrj2JGtHlc.zcwLvJ9M697rIbtsq', '1998-07-03', 'Jorge Alejandro Ayabar DÃ­az', '66945', 'HUS', '2018-10-30'),
(5439, ' Lorenza Haydee', 'Baylon Rodriguez', 'El Campanario', 'D', 'Operador Especialista', '1', '61148', '$2y$10$ETnHpO0Ko3ydylEw29JRj.nG/7Pd1t.Vp4zTjsdceyWmumNzhWaWO', '1979-04-06', 'Briseida Bautista Tolentino', '300011', 'HUS', '2018-10-31'),
(5440, ' Maria De Lourdes', 'Jimenez Espinoza', 'Olivia Espinoza de Bermud', 'D', 'Operador General', '1', '61155', '$2y$10$3ajvaCoOHkliWB4MDQA9luGvu/F4lk4BKbvyoo2oMERlhfNxINGCm', '1975-02-11', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2018-11-05'),
(5441, ' Carlos Antonio', 'Hernandez Sanchez', 'Parajes de Oriente', 'D', 'Tec de Proceso de Moldeo Die Cast', '1', '61191', '$2y$10$Av.2SczaYVuVDlilsCZc4ulBb/xEg6EOegZj1GWl5W6TPvEcplk5C', '1984-10-01', 'Gustavo MacÃ­as Sandoval', '73857', 'HUS', '2018-11-14'),
(5442, ' Maria De la Luz', 'Luna Puentes', 'Rincon de la Mesa', 'D', 'Operador General', '1', '61199', '$2y$10$bIgLiCeyxPAWAs0NZVLk6eBz5xmvVuMyc6NwLMF9Jo.hu6XDIzuFW', '1979-10-23', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2018-11-20'),
(5443, ' Johana Esperanza', 'Galindo Gonzalez', 'Parajes del Sur', 'D', 'Operador General', '1', '61204', '$2y$10$IB8u5Bubm.Br73yU/G6CeOnrY3DkMZ5ntZLgZwXEMYU0Xpn88aohm', '2000-09-26', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2018-11-21'),
(5444, ' Anahi', 'Anota Sonqui', 'Praderas del Sauzal', 'D', 'Operador de Criticos', '2', '61230', '$2y$10$pEVyAh3wnn5tDCnDUhIXPOc4gXZ.XgfgrJ3VW10mjq8fzICEOJN1m', '1994-01-27', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2018-11-26'),
(5445, ' Luis Alberto', 'Aguilar Flores', 'Hacienda de las Torres', 'D', 'Operador Especialista', '1', '61232', '$2y$10$8gn7Q0e7.Fr8KnBahAXd/.lBCJ7W/.eWL7.ZTZH3SxK3ssQLsrKVO', '1992-06-03', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2018-11-26'),
(5446, ' Diana', 'Colorado Morales', 'Parajes de San Juan', 'D', 'Operador General', '1', '61263', '$2y$10$iyzjzp577BDf8BYVLNZkU.iZnlOEcEWEMDHW9ULKSg1n0Mg8cPRmu', '1996-03-23', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2018-12-04'),
(5447, ' Luis Enrique', 'Rodriguez Lopez', 'Parajes de Oriente', 'D', 'Tecnico en Entrenamiento', '1', '61331', '$2y$10$D/C.r6RpMFZhKWpzhU85dutGMDWS31PQtgcCEAly3tgU1/ySB/mVK', '1981-09-24', 'Jorge Alejandro Ayabar DÃ­az', '66945', 'HUS', '2018-12-12'),
(5448, ' Flora', 'Dominguez Ruiz', 'Parajes de Oriente', 'D', 'Operador General', '1', '61348', '$2y$10$QA6c9r.itoiWUiXYIOsX4ODWcLCMIOAcuoAOoyrQHYjMpwq/X75hu', '1980-11-26', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2018-12-18'),
(5449, ' Alberto', 'Sanchez Gaspar', 'Parajes de San Jose', 'D', 'Almacenista', '1', '61374', '$2y$10$5VBQcjWtaJtMQoWn56M20Ovn5bJV/oZb6xHiGlnPXqkrC2atKJf32', '1991-09-05', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2018-12-20'),
(5450, ' Gilberto', 'Valerio Torres', 'Misiones del Real', 'D', 'Jefe De Grupo De Almacen', '1', '61388', '$2y$10$3CXuJh0HafrYr96.TXw/0.3vtoOTqQZ5NSAhA7rY65gutXFxrRQ/W', '1974-08-28', 'Resendez Gardner Raul', '98277', 'HUS', '2000-01-05'),
(5451, ' Maria Crescencia', 'Olivas Zavala', 'Praderas del Sur', 'D', 'Jefe de Grupo', '1', '61389', '$2y$10$.zsrtn1gOaKuosfjgaZ3Ve6Bu3jBm.DunYOv3bz90V6V4UHL2wnSq', '1974-03-19', 'Lopez Vazquez, Romulo', '61770', 'HUS', '1999-03-29'),
(5452, ' Juana', 'Mancha Alcala', 'Rincon de la Mesa', 'D', 'Operador General', '1', '61392', '$2y$10$/YgBmvGRA3RyESgUrsXHDeLK4L.iY3qBp/hkELaT9/qzDwsZPDgrK', '1973-05-16', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2012-06-08'),
(5453, ' Jesus', 'Morales Herrera', 'Horizontes del Sur', 'D', 'Jefe De Grupo De Almacen', '1', '61395', '$2y$10$O5EPLY5SsQduW6vxrwy5C.DgQkt8RUJ.fRnUCGOrgPKyifk8mYBIG', '1972-08-28', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2006-01-30'),
(5454, ' Gregorio', 'Barrientos Hernandez', 'Horizontes del Sur', 'D', 'Jefe Grupo Fundicion/ Die Cast/ Lenoir', '1', '61398', '$2y$10$eFG/t7TYazHopnKJUKHREO9HW7Io8lHYAAuySbZMkcpzBexto6mWu', '1970-11-16', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '1999-08-25'),
(5455, ' Moises Federico', 'Payan Aguilar', 'Terrenos Nacionales', 'D', 'Tecnico de Calidad', '1', '61399', '$2y$10$qNZ7PxL3t5UT1mVI9ljFRukesZyAlRuTrKO7MK0O4buK9AOQg5lYK', '1964-03-02', 'Diana Demorey Carrasco', '128213', 'HUS', '1999-08-31'),
(5456, ' Maria Del Rosario', 'Salinas Robledo', 'Zaragoza', 'D', 'Operador General', '1', '61400', '$2y$10$qGrFdMb8iMlKLptoPhSyte3MQdFZB3gsSm4qOmTDWUR/8f6L1KEZO', '1964-04-22', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2000-08-08'),
(5457, ' Juan Ignacio', 'Chavarria Silva', 'Praderas del Sur', 'D', 'Lider de Embarques', '1', '61402', '$2y$10$/8wjochmF7vOcFEblfEVLemgOoV8k2f.5jy5mhHiwn3ijKR0TM2PC', '1979-07-31', 'Gustavo Eduardo Muro Soto', '101050', 'HUS', '1999-09-08'),
(5458, ' Natalia', 'Ramos Castillo', 'Medanos', 'D', 'Operador General', '1', '61404', '$2y$10$joPmA4AZDrVSGaRPhSxrw.p0/aIlXre0d8kCXX63CVgYs/5Yvl.Eq', '1972-07-27', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '1999-09-20'),
(5459, ' Norma', 'Cantero Barbosa', 'Rincones de Salvarcar', 'D', 'Jefe de Grupo', '1', '61405', '$2y$10$IUYcnWiY7uV.cy9KzVv7q.dTvnPS4tgUDUW61PJQYRNz7cIItkar.', '1979-01-07', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '1999-09-22'),
(5460, ' Jose Apolonio', 'Marrufo Roman', 'Medanos', 'D', 'Operador General', '1', '61406', '$2y$10$nkGJ1y0Ak2a2lM4a9p4.l.G26/DJugeLMHPxQ8b1wRG3Af/yoR6wC', '1967-09-11', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2014-01-22'),
(5461, ' Pablo', 'Ramirez Gonzalez', 'Olivia Espinoza de Bermud', 'D', 'Almacenista', '2', '61407', '$2y$10$zKH03XnhsscpsoYD7Lc3WOiGIZLu/wZ/57OHFrpBTviZjZ0dWdqAG', '1975-10-19', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '1999-10-05'),
(5462, ' J Cruz', 'Fernandez Lona', 'Salvarcar', 'D', 'Operador de Set Up', '1', '61409', '$2y$10$OvXHsbzDfE8hyKs9sl3txe0BV8Mh/7DTftyJd.hVRiwY9ogNzjmRq', '1972-12-18', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '1999-10-20'),
(5463, ' Maria Del Carmen', 'Salas Vilchis', 'La Perla', 'D', 'Operador General', '1', '61410', '$2y$10$IC/AR9k.D3MG2DrVCDj5z.3MOEMhVwP3ympFAGWySZwmYh82F.06q', '1967-07-16', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '1999-10-27'),
(5464, ' Roberto', 'SaldaÃ±a Castro', 'Praderas del Sur', 'D', 'Tec Esp en Mtto Equipo', '1', '61415', '$2y$10$qcG2ZgdPRAe8617pnCPVruqhONqHn2VOkg3bYlnI6f.G.1XMhLBt6', '1970-06-07', 'Fernando De La O Alvarez', '70963', 'HUS', '2000-01-17'),
(5465, ' Mario Heriberto', 'Favela MontaÃ±ez', 'Solidaridad', 'D', 'Tec Esp en Mtto Equipo', '1', '61416', '$2y$10$Z0Cw.tGWy0Lw2iscrOZW2OqT3bA8cf0ouzXBMHfMeBQNnnk6IFIjS', '1974-03-24', 'Luis Albel Aguirre Ortiz', '61762', 'HUS', '2000-01-18'),
(5466, ' Emilia', 'Melchor Lucero', 'Rincones de Salvarcar', 'D', 'Operador General', '1', '61417', '$2y$10$RSdINx7sii02t6AKvswIlu5RKmnHIqT4op9rGdMkrEc2opRVsY.vy', '1967-11-03', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2001-08-07'),
(5467, ' Leonel', 'CataÃ±o Mejia', 'Aguilas de Zaragoza', 'D', 'Set-Up Produccion', '1', '61420', '$2y$10$.cNi2h38zquXG8YWRXqQY.0iBO9km2hkTQDDY9PjNyQ.JHHfl93YW', '1974-02-20', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2000-02-09'),
(5468, ' Sergio', 'Reyes Rodriguez', 'Tierra Nueva', 'D', 'Encargado de Tool Crib', '1', '61424', '$2y$10$.9xnQEE6Yio7TNA9V0uKNuVp7LKSwuaxRMzTQUmDIHKpR8D3pDupG', '1975-11-13', 'Fernando De La O Alvarez', '70963', 'HUS', '2000-03-06'),
(5469, ' Jesus', 'Santacruz Hernandez', 'El Papalote', 'D', 'Operador Especialista', '1', '61426', '$2y$10$KXlnOL7Q3nIYI.IRz/TWduiCaJ31RFtHeM0raLMwirn31/rjzjgRG', '1970-09-30', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2000-03-08'),
(5470, ' Sotero', 'Rosas Flores', 'Carlos Chavira Becerra', 'D', 'Jefe de Grupo', '1', '61428', '$2y$10$KQ2BBt0hL7cKXeOvzRUZ4emJTwI4aCWNeSDWbnb.WvbWi17E/VQKC', '1979-04-22', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2000-03-21'),
(5471, ' Maurilio', 'Zamudio Valenzuela', 'Senderos de San Isidro', 'D', 'Operador Especialista', '1', '61430', '$2y$10$WPtJSWOrriL9zENBwMvUju1Ym6Jq6UE0jQ2a.DLz9WkI6ufI47LCC', '1973-03-03', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2000-03-23'),
(5472, ' Abel', 'Vazquez Tovar', 'Barrio Azul', 'D', 'Tec Esp en Mtto Equipo', '1', '61432', '$2y$10$f5pvRj4Phcxfn0YiwxXe5ujyLzUWbZMEskvqMhr.JLYIItOfHtLW.', '1975-04-28', 'Fernando De La O Alvarez', '70963', 'HUS', '2000-04-18'),
(5473, ' Ildefonso', 'Gonzalez Pasillas', 'Terrenos Nacionales', 'D', 'Operador General', '1', '61434', '$2y$10$ergQ6abSOaKuPSbs.6QKKeYsp94tqLpvf6KdsTX.ksWxKW3BFms3G', '1966-01-23', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2000-04-27'),
(5474, ' Daniel', 'CastaÃ±on Alvarez', 'Parajes del Sur', 'D', 'Operador de Criticos', '2', '61435', '$2y$10$6Tahcme2Gse713yX9Dosu.ot/gfqiXDfC5xPnVoIg3vOMXgvksKyq', '1973-07-20', 'Purata Enriquez, Misael', '33458', 'HUS II', '2015-01-12'),
(5475, ' German Horacio', 'Salinas Avila', 'Manuel Valdez', 'D', 'Almacenista', '2', '61436', '$2y$10$sUA/lXUsdFx99ku9z8xABeZG4gTqiwrfHUbGI4NIfUkBZtuUma6MW', '1977-05-27', 'Bacilio Abel Rocha Carrillo', '68476', 'HUS II', '2000-05-18'),
(5476, ' Macrina', 'Tovar Rojas', 'Altavista', 'D', 'Operador General', '1', '61437', '$2y$10$lmPa7PzCopKs7w1MJS3H2uSAYnN3AOftEs90QRGUuuZn0Z0TH7QYW', '1965-02-14', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2008-01-07'),
(5477, ' Cruz Roberto', 'Retana Martinez', 'Parajes del Oriente', 'D', 'Jefe de Grupo de Conteos Ciclicos', '1', '61438', '$2y$10$axxXA/hYOLCTZw.EfKP73eoJOQBOU6yptAMFQ1qgIv0FlefSWK6vi', '1984-05-03', 'Mario Soriano Romero', '75688', 'HUS', '2000-05-30'),
(5478, ' Felipe', 'Gonzalez Gonzalez', 'Vistas de Zaragoza', 'D', 'Tec Esp En Moldes', '1', '61441', '$2y$10$gZe.IgRM5.k2k4dUzRjbYOJ3ZZyrQwpnUXpuLe4Qfs7yKmV9Mdkhq', '1980-05-04', 'Jaime Estrada Renteria', '77575', 'HUS', '2000-07-04'),
(5479, ' Jose Angel', 'Ramirez Oropeza', 'Medanos', 'D', 'Tec Esp en Mtto Equipo', '1', '61443', '$2y$10$CaAy3Tdr4KJIBWnVkw7qWuwXtFhsv0TBCqVsoNAgjPEZP4VOhtNLG', '1974-08-02', 'Mauro Sanchez', '61715', 'HUS', '2000-07-11'),
(5480, ' J Concepcion', 'Esquivel Lopez', 'Parajes del Sur', 'D', 'Jefe De Grupo De Almacen', '1', '61444', '$2y$10$8rfR4dN.oh82O9myCXb47OATLTM5mfR8dFCGK6cJFRgz3B1btZoWK', '1976-10-29', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2000-07-13'),
(5481, ' Jesus Manuel', 'Olague Aranda', 'Praderas del Sur', 'D', 'Operador de Set Up', '1', '61445', '$2y$10$c3.vvHMYLE1GE5OFsGCAQeSXaxzrjoMb13tRDKbr//Envz5Bc77Hu', '1975-01-09', 'Saul Arellano Escobar', '97722', 'HUS', '2000-07-18'),
(5482, ' Jose Angel', 'Avalos Rivas', 'Riveras del Bravo', 'D', 'Encargado de Tool Crib', '1', '61447', '$2y$10$fJXLGVBDAjZy70DzgVv4KelttRS05TXYnu7euZaOnqW1YuCnr72uO', '1977-01-27', 'Fernando De La O Alvarez', '70963', 'HUS', '2000-08-08'),
(5483, ' Saul', 'Guerrero Rivera', 'Valle de los Olivos', 'D', 'Jefe Grupo Fundicion/ Die Cast/ Lenoir', '1', '61450', '$2y$10$2dCPnfxIB7PXZzio1h/cge4ofh2wle9oBlrHyg.qF.MTZP8vb7TLe', '1975-12-05', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2000-11-09'),
(5484, ' Tomas', 'Reyes Vargas', 'Carlos Castillo Peraza', 'D', 'Almacenista', '1', '61452', '$2y$10$zhG2jH.jITdR8d4vEQUhru4TqBeJEg/GU1.WokAfMKI2069yxocqy', '1961-12-21', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2001-01-04'),
(5485, ' Alfredo', 'AvendaÃ±o Castro', 'Roma', 'D', 'Lider de Tecnicos Cnc', '1', '61454', '$2y$10$zNfjwmE341geyvIggG82hek.UohQ9/HPHiIO.zFp.Zsla86BN69K2', '1977-10-28', 'Fernando De La O Alvarez', '70963', 'HUS', '2001-01-09'),
(5486, ' Jose Luis', 'Nieves Romo', 'Terrenos Nacionales', 'D', 'Tecnico Electromecanico', '1', '61456', '$2y$10$udSXJ7WPf5mGeFfCdG7n.Oft0Z7ONpfOuKCLfewAcV9e8l.fs7yn2', '1969-12-21', 'Jaime Estrada Renteria', '77575', 'HUS', '2001-03-15'),
(5487, ' Francisco Javier', 'Nieves Romo', 'Terrenos Nacionales', 'D', 'Set-Up Produccion', '1', '61457', '$2y$10$iuusNwD.vz/uQoey2S8hJOfc38ZKmAhFTO5mq805.XUZ8XhqK3dbu', '1971-11-02', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2001-04-10'),
(5488, ' Rosalba', 'Favela Arellano', 'Terrenos Nacionales', 'D', 'Jefe de Grupo', '1', '61458', '$2y$10$Xj0Y1CP8DoaSMgM.qN116ueqOUCY2cgySv8bU.F8vOzX4kdMWcVxK', '1973-06-01', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2001-04-11'),
(5489, ' Jose Alfredo', 'Caldera Duran', 'Las Haciendas', 'D', 'Tec Esp En Moldes', '1', '61462', '$2y$10$sIhzDjkbrtIODwgVWu4/WeEwzXHRDExNHK1qnql/kD0LsFw380B4e', '1971-02-07', 'Jaime Estrada Renteria', '77575', 'HUS', '2001-09-04'),
(5490, ' Rigoberto', 'Hernandez Carreon', 'Infonavit Solidaridad', 'D', 'Tec Esp en Mtto Equipo', '1', '61463', '$2y$10$EPA2r4WIaKj7siqhctKRNegumkKqxw/miML4QgeQzU3bRuNW7VGKG', '1970-03-13', 'Fernando De La O Alvarez', '70963', 'HUS', '2002-02-20'),
(5491, ' Hortencia', 'Romero Rosales', 'Manuel Valdez', 'D', 'Operador General', '1', '61464', '$2y$10$8zQvdD5JvcN4HrUCUT54u.HKTcpucKiAXN4vGZjq.RrQiY9wiI2Mm', '1971-12-16', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2002-02-22'),
(5492, ' Hortencia', 'Sausameda Delgado', 'Inf Juarez Nuevo', 'D', 'Operador General', '1', '61465', '$2y$10$84xvbwcopFhQnfqggaRzDe1H7OsGS6WGodD9JeX60U3TQn/85229C', '1967-01-27', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2002-03-07'),
(5493, ' Hector', 'Velez Hernandez', 'Horizontes del Sur', 'D', 'Conteos Ciclicos', '1', '61468', '$2y$10$GbSaFCXCmxU6YMNusfpr9.j2Gbwk4YEfn0nymRIp1RxE72NcFY6Y6', '1972-04-01', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2002-04-25'),
(5494, ' Ricardo', 'Guzman De Jesus', 'Parajes del Sur', 'D', 'Tecnico Electromecanico', '1', '61469', '$2y$10$cUUlfSxj.Bhuqxw6hgoltukeZvQY0XBRLLLyAkDCe028auySpMolO', '1980-04-05', 'Jaime Estrada Renteria', '77575', 'HUS', '2002-05-07'),
(5495, ' Margarita', 'Ramirez Velazco', 'Paraje de San Juan', 'D', 'Operador General', '1', '61471', '$2y$10$FuIWXtJrYOuI3Hw2rKxIm.j/AwPuIKyNlYgLBfMh8nsyo/sXbVuga', '1974-02-12', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2002-05-24'),
(5496, ' Jose Omar', 'Acosta Ochoa', 'Morelos 2', 'D', 'Jefe De Grupo De Almacen', '1', '61473', '$2y$10$7M9F49HcO2DSgyq7SP/tA.Rl0iXwWMz8eRwaHL11mNaswhi1ocf0a', '1977-08-14', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2002-06-24'),
(5497, ' Juan Francisco', 'Zapata Carranza', 'Praderas del Sur', 'D', 'Tecnico de Calidad', '1', '61474', '$2y$10$dln6m6l47OV9AiviYS39VeoObEXxJPu8bBTcHy9d.BjtxvOGQtRn2', '1974-09-07', 'Jose Ruiz', '74929', 'HUS', '2002-07-11'),
(5498, ' Maria De Lourdes', 'Cordova ', 'Bosques de Salvarcar', 'D', 'Tecnico de Calidad', '1', '61475', '$2y$10$gIqzGf4AFEwtBS1Vw58qlO.wYFac9E6C7/I2DNlkI2ZB42yEIJtG6', '1973-02-11', 'Kevin Adrian Martinez Orozco', '300062', 'HUS', '2002-07-16'),
(5499, ' Federico', 'Hernandez Guia', 'Los Alcaldes', 'D', 'Jefe de Grupo', '1', '61476', '$2y$10$4AyAWZF.38HCEVnc1dcMWuydK2xuoRqBX9q6N09dJDfi9YvaX0OPq', '1974-03-01', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2002-07-16'),
(5500, ' Yolanda', 'Vielma Ruelas', 'Praderas del Sur', 'D', 'Jefe de Grupo', '1', '61477', '$2y$10$VFJj.DOQMHeNjr4jc2eGCu1ZM9GObnjr.Nb.3S1alvl3iI/MI9FlK', '1968-05-13', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2002-07-16'),
(5501, ' Bonifacio', 'Paniagua Cardona', 'Heroes de la Revolucion', 'D', 'Tec Proceso de Moldeo/Die Cast', '1', '61479', '$2y$10$CGeicEP1rdpXnhDG.LOWo.tTCeGVpjffweAC2SUPPjsHprlOCr3Si', '1964-04-01', 'Gustavo MacÃ­as Sandoval', '73857', 'HUS', '2002-08-12'),
(5502, ' Dorotea', 'Galicia Hernandez', 'Parajes del Sur', 'D', 'Jefe de Grupo', '1', '61484', '$2y$10$7ZnImVyDamp25Mmv0v.SD.jXtCfxzc7b2nLF70yRo76MEHD.s8TN6', '1974-12-09', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2003-01-20'),
(5503, ' Hugo', 'Flores Mendez', 'Parajes del Sur', 'D', 'Conteos Ciclicos', '1', '61487', '$2y$10$J.a4dmvbWdVZV8dAISZaee/e59aiHPAi8SY3Fzg3/QWtWGtypiEkO', '1982-04-10', 'Mario Soriano Romero', '75688', 'HUS', '2003-09-23'),
(5504, ' Maria Eusebia', 'Corpus Quintana', 'Manuel Valdez', 'D', 'Operador De Procesos', '1', '61489', '$2y$10$S6zFLTz/HFt5SCkKQsKEc.xA7OqNDb/iEOvw3svDEPXRpdJlXO.Ty', '1966-07-28', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2004-02-03'),
(5505, ' Nora', 'Sanchez Villa', 'Oriente Paraje del Sur', 'D', 'Lider de Control de Calidad', '1', '61490', '$2y$10$GgTCc5OAw0wMCE1ip49jp.M5TGUvfUxj3J3BlMIfBhTht/XtZlrxu', '1983-12-22', 'Jose Ruiz', '74929', 'HUS', '2004-02-10'),
(5506, ' Yolanda', 'Carreon Cordova', 'Senderos de San Isidro', 'D', 'Tecnico de Calidad', '1', '61491', '$2y$10$5LQDDWMf8IkrTChR/czgNOhIzzVLG/9JPPsqjbtgGJmta7n9aqmsS', '1965-03-15', 'Jose Ruiz', '74929', 'HUS', '2004-02-10'),
(5507, ' Jose Luis', 'Najera QuiÃ±ones', 'Villas del Salvarcar', 'D', 'Tec Esp en Mtto Equipo', '1', '61494', '$2y$10$iwgkOGULnCyfljs8HYqSD.oeBXgHwlauBDKnh7wc8tMgr8UTVo.L6', '1970-03-16', 'Luis Albel Aguirre Ortiz', '61762', 'HUS', '2004-03-24'),
(5508, ' Maria', 'Carrillo Artiaga', 'Aguilas de Zaragoza', 'D', 'Operador General', '1', '61497', '$2y$10$P5CXPfBhRw.ime0.XsoU3uvEJwKxwiUUqlEwAWWHBmesq8OZ8a77e', '1972-08-28', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2004-10-14'),
(5509, ' Rosa Elia', 'Ramirez Gutierrez', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '61498', '$2y$10$DgasAp.suV7S4bBrwvuKMOgaHsuf.sT6/qnqcqbcKktSae9FNjKzm', '1979-08-19', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2004-12-07'),
(5510, ' Juan', 'Velazquez Martinez', 'Morelos 2', 'D', 'Tec Esp en Mtto Equipo', '1', '61499', '$2y$10$jaFTam8ROe17Ci8G3fJF2OKis4bgqlUXt6rfFzDkIwZjNki04xtZi', '1971-03-08', 'Fernando De La O Alvarez', '70963', 'HUS', '2005-01-04'),
(5511, ' Luis Manuel', 'Amaya Parra', 'Praderas del Sur', 'D', 'Set-Up Produccion', '1', '61502', '$2y$10$EkY0rV4Cjon.5Tyfodr.8.GMLp2Hxf1hECrsQyRf7DAcSSh3y6Xv6', '1976-06-20', 'Raul Zamora,', '25584', 'HUS', '2005-04-06'),
(5512, ' Jorge Alfredo', 'Marquez Orta', 'Parajes del Sur', 'D', 'Jefe de Grupo de Conteos Ciclicos', '1', '61503', '$2y$10$bITOruShHWclYxIlO0x2ROjSnqGCV1wac6Q63IoTIqCXyJVXj.zxe', '1982-04-23', 'Mario Soriano Romero', '75688', 'HUS', '2005-07-07'),
(5513, ' Antonio', 'Miguel Mariano', 'Torres del Pri', 'D', 'Operador Especialista', '1', '61505', '$2y$10$w23VAmLDf2ixtcXLXO2hXOb2UksYtgElwJKVShWPa8./jkdcBBKyC', '1983-11-05', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2018-06-28'),
(5514, ' Victor Manuel', 'Valerio Garay', 'Praderas del Sur', 'D', 'Tec Esp en Mtto Equipo', '1', '61507', '$2y$10$JCxbLDEIV0XCkgSqDrfywuEkFMbAg69DfpxuLGvjWKikA6vk0pUPi', '1983-02-06', 'Fernando De La O Alvarez', '70963', 'HUS', '2005-10-18'),
(5515, ' Maria Del Carmen', 'Santana Aguilera', 'Hacienda de las Torres', 'D', 'Operador General', '1', '61508', '$2y$10$9GvZNaQ.xX8YLzzZ3H3rMuxr0ebumP.QIuhVzLAzyZhdN0W1pUaka', '1971-02-19', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2005-10-24'),
(5516, ' Rosa Isela', 'Esparza Huitron', 'Horizontes del Sur', 'D', 'Operador General', '1', '61509', '$2y$10$Edo.IYRE2F8XWYVowk.eTuZjUHvRl1AbF6amnwq8RoTVJu9ZgfxlK', '1969-08-09', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2005-12-20'),
(5517, ' Jose Eduardo', 'Alvarado Martinez', 'Jardines de sanfrancisco', 'D', 'Tecnico Cnc', '1', '61510', '$2y$10$ATpZ0Mja61.lo1SxBimxDuzgvKt3zg3JxGzZ1iZ.Z.Jc2Ghf/C582', '1988-09-01', 'Martinez Gonzalez Fernando', '24731', 'HES', '2006-01-03'),
(5518, ' Martha', 'De Santiago Ramirez', 'Horizontes del Sur', 'D', 'Operador General', '1', '61514', '$2y$10$Fbf2USlm0bZcmWLH0lKW/OXhNt4VgTchAQItQ7mqOCX6AiIYqA.Tq', '1970-02-01', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2010-10-22'),
(5519, ' Rafaela', 'Mijares Avila', 'Sauzal', 'D', 'Operador General', '1', '61518', '$2y$10$sUea5htDuLRDO03ZfsejaeAjm0R1H4NPYeYbwSTiqQ.6Iz/J98dEW', '1973-10-24', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2015-01-07'),
(5520, ' Minerva', 'Ignacio Jeronimo', 'Senderos de San Isidro', 'D', 'Operador General', '1', '61519', '$2y$10$NcrCt9jyvzO8MIlwIuRaDOd7xlmLZjpLt2MjktSD6q9mj980R2N4u', '1982-03-12', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2006-07-04'),
(5521, ' Ana Isabel', 'Baca Navarrete', 'Praderas del Sauzal', 'D', 'Operador De Procesos', '1', '61520', '$2y$10$a93TAguf0Rflb9kOnlZMTeBX.dRSu.K6jVJWJmxu4gcmmfLzGP.2W', '1974-10-27', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2017-10-10'),
(5522, ' Luis Enrique', 'Soto Flores', 'Las Haciendas', 'D', 'Jefe Grupo Fundicion Die Cast Lenoir', '1', '61522', '$2y$10$/JwTzCoO5b6S/qDqgdJKk.kiCZn3wPMMcl61tc2.Xh8gfINrR/WfC', '1983-07-09', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2006-08-02'),
(5523, ' Marisela', 'Romero Rosales', 'Manuel Valdez', 'D', 'Tecnico en Documentacion', '1', '61524', '$2y$10$UgrscLvZmXPZ9nMMqTiiYeCUBlBSEucMNF1fxDtSSVAoEe4i.fRRO', '1987-03-03', 'Esteban Vazquez', '84463', 'HES', '2006-09-19'),
(5524, ' Graciela', 'Zamarripa Montes', 'Bosque Bonito', 'D', 'Operador General', '1', '61525', '$2y$10$Z6Q5ezdBfLsP3mee/WhI2.byokpFl3PXZXtrYMJ9oz2Zi694pkzYy', '1969-02-09', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2006-09-19'),
(5525, ' Gerardo', 'Carrillo Guerrero', 'Salvarcar', 'D', 'Tec Esp en Mtto Equipo', '1', '61527', '$2y$10$cVhjBRTz33IupqZFsMxvoOeCdw.O5/skpcab1Da2EB0veC2Ufi9Z2', '1969-07-08', 'Luis Albel Aguirre Ortiz', '61762', 'HUS', '2023-04-10'),
(5526, ' Jacquelline', 'Vargas Hernandez', 'Oasis Oriente', 'D', 'Operador General', '1', '61529', '$2y$10$uswizE/Frw3DPrQihM.Mx.e94IezbyyR.oNRnWWwcOYSWOtgnhJNm', '1983-01-09', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2007-01-17'),
(5527, ' Blanca Estela', 'Almaraz NuÃ±ez', 'El Mezquital', 'D', 'Operador General', '1', '61533', '$2y$10$D8GgtAn0OqCkqhPd5PNkZOky6GaPBSWoZfLIsuNFg2Z7286hxwf3y', '1971-03-20', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2007-08-06'),
(5528, ' Jose Angel', 'Carrillo Pacheco', 'Aguilas Dezaragoza', 'D', 'Operador Especialista', '1', '61534', '$2y$10$yUXfl0TS8Vqw5eltWcJBFOAj0ThcQuZPYZj2rdGFAQ9PaijAT5V0S', '1990-11-26', 'Briseida Bautista Tolentino', '300011', 'HUS', '2007-08-13'),
(5529, ' Leticia', 'Vielma Ruelas', 'Las Torres', 'D', 'Jefe de Grupo', '1', '61536', '$2y$10$Em2TC2IidVBbbdupRYQjKOkRCo3k2/kbpFNiXFmZBNetGZj/ttUiK', '1969-07-14', 'Fabiola Ramon', '84289', 'HUS', '2007-11-07'),
(5530, ' Norma', 'Valdes Montoya', 'Parajes de San Isidro', 'D', 'Operador De Procesos', '1', '61538', '$2y$10$l177/Mzb1RHxcyCwFLjNbOUVny0XRYko0j6NmnQoP2lO.3HvKEGIq', '1966-06-11', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2008-01-14'),
(5531, ' Virginia', 'Moreno Talamante', 'Praderas del Sur', 'D', 'Inspector Control de Calidad', '1', '61539', '$2y$10$eju3zrYbQ21mN01LlHduw.cadTQHelUHR8KYXpZc4A12PLJYCQMay', '1967-01-20', 'Diana Demorey Carrasco', '128213', 'HUS', '2008-01-14'),
(5532, ' Antonio', 'Guerrero Poblano', 'Heroes de la Revolucion', 'D', 'Jefe de Grupo de Conteos Ciclicos', '1', '61540', '$2y$10$TCbNm9A8dVR6rs/E0B7EbemH4orofWR7TiPKGeWej10zLUmJ26tR6', '1965-02-15', 'Mario Soriano Romero', '75688', 'HUS', '2008-01-14'),
(5533, ' Juan Jesus', 'Urrutia Venegas', 'Valle de Santiago', 'D', 'Reparador Moldes Fibra', '2', '61541', '$2y$10$Ri/c1whTLPiDbxlPpw/pcOdGin/Pd0pZVxRgcYRTBeWbtASU1erb.', '1964-03-27', 'Reynaldo Mendoza', '88736', 'HUS II', '2008-02-11'),
(5534, ' Antonio', 'Lopez Hernandez', 'Riveras del Bravo', 'D', 'Materialista', '1', '61543', '$2y$10$/F0XoEA8S1hKV6fDHruJS.auGki6LBTSL2cEgxiGmIl03euV60.IG', '1970-09-26', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2008-04-14'),
(5535, ' Jose Luis', 'Gutierrez CastaÃ±eda', 'Medanos', 'D', 'Tecnico de Calidad', '1', '61544', '$2y$10$OtKfklmEiH7rGs9akyhZguGniaajpEzXRlPgu0YYXWga4b38xyMc2', '1978-07-02', 'Kevin Adrian Martinez Orozco', '300062', 'HUS', '2008-05-27'),
(5536, ' Francisco Javier', 'Diaz MuÃ±oz', 'Figueroa Andres Cdp', 'D', 'Operador de Criticos', '1', '61545', '$2y$10$IBzng7mWAW810FLyUCX0iuXfHcODMjCx8G96lhUTbBebt6YiUiQmS', '1985-08-01', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2008-06-12'),
(5537, ' Jesus Manuel', 'Ortiz Espinoza', 'Villas del Salvarcar', 'D', 'Conteos Ciclicos', '1', '61546', '$2y$10$wPTJhIVUQGFB6Bf2RvUeEuGbs2LMn0G4eofHiH0LAoGqZbunys.Na', '1971-09-16', 'Mario Soriano Romero', '75688', 'HUS', '2008-06-23'),
(5538, ' David Adrian', 'Gonzalez Lopez', 'Parajes de San Juan', 'D', 'Almacenista', '1', '61547', '$2y$10$L07bJ0EirPVOOYzwh6jr6e5mNDwg7LlBviGxBrxxNC/qvw3NST256', '1984-12-04', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2008-06-30'),
(5539, ' Sergio', 'Tentle Ortiz', 'Los Barrios', 'D', 'Operador De Procesos', '1', '61549', '$2y$10$qgu8xIbUlHlPNP6YSf/zj.mMu9ZNXDNz4Vl1HfUJLwpZm9x5/cIKS', '1973-09-06', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2008-08-04'),
(5540, ' Jose', 'Dorado Rodriguez', 'Manuel Valdez', 'D', 'Encargado de Tool Crib', '1', '61550', '$2y$10$oWx6Zo.633YYVJdfl.Lt8OYBboQBzRPmmj4POaFMJ3LVV3lTa/6gW', '1982-03-19', 'Fernando De La O Alvarez', '70963', 'HUS', '2008-08-04'),
(5541, ' Fidencio', 'Bautista Inocente', 'Torres del Pri', 'D', 'Operador de Secundarios', '1', '61551', '$2y$10$n6qeSvx6A8t3dPZ1..4tg.r5ifYiFKKZGj236PbHZPan638zyWIqG', '1988-03-19', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2008-08-04'),
(5542, ' Hector Tomas', 'Landeros Gonzalez', 'Parajes del Oriente', 'D', 'Jefe Grupo Fundicion/ Die Cast/ Lenoir', '1', '61552', '$2y$10$Min7ssa6ZpS7cHLr/sM2/exTp88.yzMKFzdCX1hJhwYRWGBnUo1S6', '1982-03-07', 'Saul Arellano Escobar', '97722', 'HUS', '2008-08-04'),
(5543, ' Luis Manuel', 'Martinez Lizardo', 'Riveras del Bravo', 'D', 'Tecnico de Calidad', '2', '61553', '$2y$10$2/yQIEO4kHBXQhPwhSP82.M2OvessM25MDrMGvWmZUsZma.mDDwda', '1979-10-26', 'Humberto Lopez Lopez', '61865', 'HUS II', '2008-08-05'),
(5544, ' Ma. De los Angeles', 'Rodriguez Saldivar', 'Praderas del Sur', 'D', 'Operador General', '1', '61559', '$2y$10$1myenft0/O9//kdmJl4JKeOg3mWu4AxBGeHzRTEH9QN/dFR80fAJu', '1975-05-16', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2008-09-16'),
(5545, ' Marcelo', 'Lara Arratia', 'Heroes de la Revolucion', 'D', 'Operador de Criticos', '1', '61560', '$2y$10$PoZUT4kkz4RqKYxEx7cTVeBi..kO4UBP1MAFeXmqwqdp2TCbAOLkS', '1969-10-07', 'Jorge Luis Rios Ramirez', '71668', 'HUS', NULL),
(5546, ' Benito', 'SantibaÃ±ez Miranda', 'Torres del Pri', 'D', 'Operador de Set Up', '1', '61561', '$2y$10$jdkFoJt9QrEnZjs9pWnZ2OteIi5RNJQbVaQ1.n.GpqL9IVRP4cy3K', '1988-04-04', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2008-09-22'),
(5547, ' Abraham', 'Rodriguez Sanchez', 'El Sauzal', 'D', 'Tecnico Electromecanico', '2', '61562', '$2y$10$0rEQcfcWACiQMHc6fXB6/.Klva0k7aSzNzNCsCB4J5clGGE2iw23u', '1981-03-16', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2008-09-24'),
(5548, ' Manuel Ramon', 'Montes Monreal', 'El Sauzal', 'D', 'Tecnico de Calidad', '2', '61565', '$2y$10$C.OyDt3zPST4La5oTk9ZvO.yHCPQridE.Kqp94JVMDOiyIjb7kqeO', '1977-09-22', 'Gonzalez Ortega, Gerson Albert', '84541', 'HUS II', '2009-02-27'),
(5549, ' Antonio', 'Rodriguez Sanchez', 'El Sauzal', 'D', 'Operador de Set Up', '1', '61567', '$2y$10$0AVrmdXre4s0.DmBnea4W.HYbofm2zlrPqkrjTpjJdBEpo8XQ2km6', '1978-12-23', 'Saul Arellano Escobar', '97722', 'HUS', '2009-02-27'),
(5550, ' Gerardo', 'Santos Gonzalez', 'Salvarcar', 'D', 'Tec Mtto Equipo de Moldeo', '1', '61571', '$2y$10$l9CZfDcSSLWJbcvjhAur6eDp74ayLoGtvYr/R6M37vd83aKuNGV7q', '1972-10-03', 'Castro Molina, Jesus', '46787', 'HUS', '2009-10-08'),
(5551, ' Carlos Gerardo', 'Gomez Pulido', 'Fraccionamiento valle de', 'D', 'Set-Up Produccion', '1', '61572', '$2y$10$DSV.L7jDnGjXBXZhxjeapuN268W6nUeIFBgwzPZTAh84RPquRBe3e', '1972-08-18', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2010-01-18'),
(5552, ' Fernando', 'Ferman Chavez', 'La Perla', 'D', 'Set-Up Produccion', '1', '61574', '$2y$10$v8TU2gCP9xbISnogsvxLq.zmqOe9mEPdc64AUEUbWjoVBBYr0JBrS', '1976-07-16', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2010-02-04'),
(5553, ' Ignacio', 'Moncivais Silva', 'El Sauzal', 'D', 'Operador Especialista', '1', '61576', '$2y$10$AsUstlFBBhauPk1L50fJX.BG0o7WU5z2bWoDGGjqBtI.W/Q1MupSa', '1969-02-01', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2010-02-15'),
(5554, ' Jose Antonio', 'Flores Arenas', 'Tierra Nueva #1', 'D', 'Operador de Set Up', '1', '61578', '$2y$10$qVTs6EN87FpuXgXHMGU.0uwUhLcQfdBpkzhmSE0RMerNeklJc.Gf2', '1988-07-26', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2010-05-06'),
(5555, ' Francisco', 'Perez Perez', 'Roma', 'D', 'Jefe De Grupo De Almacen', '1', '61582', '$2y$10$Sq8mdHFrf4HzvGwF6hmA4.e2PNtkiC0eXa06TNRYDoqArS/L0WThe', '1982-11-03', 'Resendez Gardner Raul', '98277', 'HUS', '2010-08-09'),
(5556, ' Sixto', 'Cordova Castrejon', 'Infonavit Solidaridad', 'D', 'Operador Especialista', '1', '61583', '$2y$10$KHeH0xwOFIhUCwaLBkzSzO4c69wFhJZnbbtrjYbhnh7DNN32xVXTm', '1989-06-19', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2010-08-23'),
(5557, ' Benigno', 'Gallegos Herrera', 'Olivia Espinoza de Bermud', 'D', 'Limpieza', '1', '61585', '$2y$10$5/qAENYv8/PYEgU6q15rB.kverAm2AiQ8WgKIjlscKuLBQV5Yd.Q2', '1964-09-13', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2010-09-06'),
(5558, ' Alberto', 'Vazquez Gonzalez', 'Medanos', 'D', 'Operador Especialista', '1', '61587', '$2y$10$XqqG60CwY/YgbkdJ9g5aPemySTV7GvDa/cSuRVgxZK9gMFgKumrMa', '1987-02-09', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2010-09-13'),
(5559, ' Francisco Javier', 'Rojo AviÃ±a', 'El Papalote', 'D', 'Jefe Grupo Fundicion/ Die Cast/ Lenoir', '1', '61589', '$2y$10$rTmtc57dC051qOuR9P3fpu7EjEr0VvFx/72lzyMd7zFZOseIYBk1C', '1990-08-08', 'Saul Arellano Escobar', '97722', 'HUS', '2010-09-13'),
(5560, ' Jose Vicente', 'Almaraz Vazquez', 'Parajes del Sur', 'D', 'Operador De Procesos', '1', '61591', '$2y$10$rfuOxIb7nG/ZGHGx7dyyrunSQnzXMto.QhRbgmIHV78tp/Tc9uWM2', '1970-01-14', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2010-10-22'),
(5561, ' Abdon', 'Gonzalez Hernandez', 'Parajes de San Isidro', 'D', 'Jefe De Grupo De Almacen', '1', '61593', '$2y$10$VNBCKJSQLDTsheY9T5MgD.vdb14g3eV3K8LMwrGTFOfyD.XQk6Wry', '1989-11-19', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2010-12-13'),
(5562, ' Antonia', 'Garcia Palomino', 'El Mezquital', 'D', 'Operador General', '1', '61594', '$2y$10$afF6s6Nomi6TTiPozvBMiuNd9Fx.VM2RCkrZNuO.zCx4TnPwdYzZW', '1976-05-10', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2011-04-05'),
(5563, ' Francisco Javier', 'Garibay Ruiz', 'Bosques de Salvarcar', 'D', 'Operador Especialista', '1', '61595', '$2y$10$Wbdt.d26A9YgR05pphr0yu3nlyoD/Rj2j44jrfl8k9IDtq7L139rS', '1972-12-04', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2011-04-06'),
(5564, ' Jose Ivan', 'Lopez Fernandez', 'Parajes de San Isidro', 'D', 'Almacenista', '1', '61596', '$2y$10$27pFnnTcqc2BIV3PDpsz2OpatdNaaseTqDBkXYFHpR42odwJKwtMq', '1986-12-10', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2011-04-06'),
(5565, ' Juan Prisciliano', 'Rojo Garcia', 'Salvarcar', 'D', 'Operador De Procesos', '1', '61597', '$2y$10$KlvicgPrzrbi.u38lMmW8eOy7OrUGzDZFiR9Kd0UNP0g0lKJR9IbC', '1971-09-16', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2011-04-12'),
(5566, ' Sabino', 'Garcia Ortiz', 'Hacienda de las Torres', 'D', 'Set-Up Produccion', '1', '61598', '$2y$10$bDcFxUnQGBZm9yvFtmruqO4qhEbwj0vhAh9YCKnzfYEXp6WQmsVc6', '1965-12-30', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2011-04-12'),
(5567, ' Juan', 'Cristan Frausto', 'Rincones de Salvarcar', 'D', 'Set Up Produccion', '1', '61600', '$2y$10$WDlkScabS78jvVNYuLq/VeLAaqPNFJbIO4wuxiDiU/xCKSg0qlBqu', '1976-07-07', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2011-04-13'),
(5568, ' Irma Leticia', 'Hernandez Navarro', 'Praderas del EnequÃ©n', 'D', 'Operador General', '1', '61602', '$2y$10$GcY3M.zBXmUE7o2OX6UrIu2spJcxM9QhOwlzCQru5ylZa4uWv8puC', '1981-01-21', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2011-04-21'),
(5569, ' Francisco', 'Hernandez Martinez', 'Parajes del Sur', 'D', 'Operador General', '1', '61604', '$2y$10$gebTmcGXiMW/hfijpC/MwuZ/UJ0btjGM/v22YPzBxPfukJquI3.la', '1971-09-02', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2011-05-06'),
(5570, ' Jose Luis', 'Solis Dovali', 'Horizontes del Sur', 'D', 'Operador De Procesos', '1', '61606', '$2y$10$dwrQGlQWTefIzbQ4taYiIOlfizKogumKguOE.YPJiLs/sH5KUaaxq', '1966-11-02', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2011-05-06'),
(5571, ' Luis Alberto', 'Vargas Arreola', 'Portal del Roble', 'D', 'Operador De Procesos', '1', '61607', '$2y$10$iraSwPU3xL4eu7iTpQDU0.GuZ9ReeOILAEIPZC11Sq0UygTOPQ9ci', '1977-07-02', 'Saul Arellano Escobar', '97722', 'HUS', '2011-05-09'),
(5572, ' Juan Carlos', 'Espinoza Rodriguez', 'Parajes del Sol', 'D', 'Operador de Criticos', '1', '61608', '$2y$10$MBIcp7FTOlaP8y9c1P.VOOYKp1PYC1VGg70qkkzV8EpPeljPZKAFS', '1972-01-09', 'Daniel De Jesus Favela Najera', '73913', 'HUS', '2011-05-17'),
(5573, ' Juan Jose', 'Reynoso Oregon', 'Praderas del Sur', 'D', 'Operador de Criticos', '1', '61609', '$2y$10$mdebVyb8xTB9URuJyQNWT.DN5Z7xF3mi3v.iewmrPIUSwQs4H4mO.', '1970-11-20', 'Jesus Lopez Solis', '73653', 'HUS', '2011-05-17'),
(5574, ' Raul', 'Aguilar Rivas', 'El Mezquital', 'D', 'Operador de Criticos', '1', '61610', '$2y$10$0FxgBsDA0LuMbtYJntFWceKIaPv980gNeGyuHIkATkOKL5.XofFw6', '1972-08-06', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2011-05-18'),
(5575, ' Farid', 'Lira Arrez', 'Las Haciendas', 'D', 'Operador de Set Up', '1', '61611', '$2y$10$1BTH/5sL8OO5QOjFPtbzA.Zv1aMoAqmILbvH1Ap.o7W3EuhPSESAe', '1977-02-24', 'Saul Arellano Escobar', '97722', 'HUS', '2011-05-18'),
(5576, ' Ana Cecilia', 'Martinez Martinez', 'Terrenos Nacionales', 'D', 'Operador General', '1', '61612', '$2y$10$6XLFdQshfPpnlgTYUYyOq./Y5u2KRTO1uM3THiozlI9Ne5zP6MGya', '1979-03-03', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2011-06-02'),
(5577, ' Fernando', 'Valenzuela Valenzuela', 'Eco 2000', 'D', 'Operador de Set Up', '1', '61613', '$2y$10$s..IYa6C2x4NQ3pYMtsSSOFgEU5Ubclrbb0fkzj6t9oh7iWzYGDkW', '1984-09-04', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2011-06-02'),
(5578, ' Heladio', 'Martinez Marcelino', 'Valle de Santiago', 'D', 'Conteos Ciclicos', '1', '61615', '$2y$10$MiUI0dUviX2QbCGn3oHOBO8QTQGMXe8wgDMA0Smi3pgUFk2PAiScC', '1989-10-05', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2011-08-04'),
(5579, ' Roque', 'Simental Gonzalez', 'Parajes del Sur', 'D', 'Jefe de Grupo', '1', '61617', '$2y$10$D6rj95w95RVz8doJyUbdrO7hVVv186ySlZm/HVfjz7ZXjtuTXf1su', '1978-06-27', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2011-08-22'),
(5580, ' Aurora', 'Solis Vargas', 'El Granjero', 'D', 'Operador General', '1', '61618', '$2y$10$f0C3p7Ie3Ai41f5OgDRrN.robe1H7eoCFjv1DqxloNdaIBXFbBTpe', '1975-06-09', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2011-09-02'),
(5581, ' Eli', 'Cisneros Ortiz', 'Cerradas San Pedro', 'D', 'Operador de Set Up', '1', '61620', '$2y$10$LpCYvzlxJ.cNdS1W5ON1duVW3IVJoukzBgA8xY1TGSVbRIEkZucQC', '1993-05-02', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2011-09-07'),
(5582, ' Maria De Lourdes', 'AvendaÃ±o Miguel', 'Parajes del Oriente', 'D', 'Operador De Procesos', '1', '61621', '$2y$10$0DjCd3C7wAYzZZOZWaEjvu.aZuR40.S9XSUSg6.ttFgycZ2SxAWqi', '1971-09-23', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2011-09-09'),
(5583, ' Federico', 'Villa Soto', 'Portal del Roble', 'D', 'Operador de Set Up', '1', '61622', '$2y$10$O2LZwTaAqy8.k/BRe8pD8OMGFAlAiZ9vZk5TiXsrnQD96srTXlYlG', '1966-09-20', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2011-09-09'),
(5584, ' Margarita', 'Marquez Vazquez', 'Las Gladiolas', 'D', 'Operador General', '1', '61625', '$2y$10$k2TjSLh2.kZ7fu.2NgjtmOe27iCl27MmEMkeP59RLsDQSg/HTQFv.', '1979-06-22', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2011-09-26'),
(5585, ' Armando Alberto', 'Flores Sierra', 'Medanos', 'D', 'Tecnico de Calidad', '1', '61627', '$2y$10$rGUn9FDliViXa.B8UQv6wOGpp8ICQyX3xPnxDGCn0tvf8k/a8N9wO', '1975-10-24', 'Armando Reyes Maldonado', '86641', 'HUS', '2011-09-26'),
(5586, ' Gerardo', 'De Leon Avalos', 'Parajes del Oriente', 'D', 'Lider de Produccion', '1', '61628', '$2y$10$puiuuT4gGLXuozZLqxu.ku450SpwjE.Ph9/nfAN6EGYf3zc78gdWe', '1988-12-04', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2011-09-26'),
(5587, ' Benito', 'Capistran Hernandez', 'Salvarcar', 'C', 'Auxiliar de Recibos', '1', '61629', '$2y$10$TkXUOLV5omnKYeARmbvZWuFc1EOxV7sLdQmZIpCdGfYQM/fyIqfq6', '1991-03-21', 'Resendez Gardner Raul', '98277', 'HUS', '2011-09-27'),
(5588, ' Daniel Arturo', 'Rodriguez Rodriguez', 'Comp. Integral Aeropuert', 'D', 'Operador de Set Up', '1', '61630', '$2y$10$sc/c0yAttWzu9tfS4jT7teCcRDnFoGR0KlNb.tSdC46hLiOoLd3Me', '1982-12-10', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2011-10-04'),
(5589, ' Raul', 'Perez De la Rosa', 'Porfirio Silva', 'D', 'Almacenista', '1', '61635', '$2y$10$nr5NvVDHZgBUF7N9mYA52O1reX6oCkr7uzaR0.orPsZNszGzxVCoe', '1976-01-28', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2012-04-16'),
(5590, ' Rodolfo', 'Santos Leyva', 'Parajes del Sol', 'D', 'Operador de Set Up', '1', '61636', '$2y$10$iF7EoOt1OoB0Pky7px8pR.LsyeHzRVHcXDoHPd7nNDg5Qe0bHGsKq', '1978-04-04', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2012-05-14'),
(5591, ' Ma. Manuela', 'Andrade Galvan', 'Horizontes del Sur', 'D', 'Operador General', '1', '61637', '$2y$10$LMDn/STDgKGttSk46JebDezRjUlix1sScRahpuY3fqM/ajW39pixS', '1963-06-16', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2012-05-14'),
(5592, ' Samuel', 'Ramos Macias', 'Aguilas de Zaragoza', 'D', 'Tec Esp en Mtto Equipo', '1', '61638', '$2y$10$lhocLzpuXRZ.f0e9DHNvgeWAaAUZQlJMBV7dbRRBpKF1LPzoS9dS.', '1974-06-03', 'Mauro Sanchez', '61715', 'HUS', '2012-05-16'),
(5593, ' Maria De Jesus', 'Zubiate De la Rosa', 'Pradera de los Olmos', 'D', 'Tecnico de Calidad', '1', '61640', '$2y$10$vkH8HOomqqfk2ljKeqndHOBM1wkzYUxhV2jQjMo9Z6L2X62cLdKn.', '1980-06-25', 'Jose Ruiz', '74929', 'HUS', '2012-08-07'),
(5594, ' Jesus Cayetano', 'Carrera Ojeda', 'Salvarcar', 'D', 'Operador de Set Up', '1', '61641', '$2y$10$ShKpIFnnvMu0TVcY6JrQhOE3GI15fGIQi3qhujDApThez1aH9J2QC', '1993-09-19', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2012-08-27'),
(5595, ' Ricardo', 'Ramirez Campos', 'Horizontes del Sur', 'D', 'Operador Especialista', '1', '61643', '$2y$10$VExQzOa9DWJVo6zFdBUC8O9AefeHvgKJsYeL7CmCBAaf9vkhrYFNi', '1970-08-18', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2012-08-30'),
(5596, ' Dina Lizbeth', 'Baca Barraza', 'Parajes del Oriente', 'D', 'Jefe de Grupo', '1', '61646', '$2y$10$0cOVjPQi/G55ntCzM7j77uPmWsNoPm5Lj5yRhkaPAplYYfhiuzvMS', '1994-09-02', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2012-11-07'),
(5597, ' Miguel Osvaldo', 'SaldaÃ±a Adame', 'Parajes del Oriente', 'D', 'Tec de Mantenimiento Troqueles', '1', '61648', '$2y$10$X.o6TSaXOUNkb1NKT7orluQA6pidL7ZdchkXuGhHquIMIYGa8Pu.6', '1984-07-18', 'Favela Alvarado, Jose Luis', '25333', 'HES', '2012-12-05'),
(5598, ' Joel', 'Cruz Martinez', 'Universidad', 'D', 'Operador De Procesos', '1', '61652', '$2y$10$8jh0pKEl1y8cygfKxfH1ju771h.u8MXMx5BzOJX3PRLK16pzeH7HO', '1973-10-11', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2017-05-03'),
(5599, ' Leonardo', 'Reyes Torres', 'Parajes del Sur', 'D', 'Operador de Set Up', '2', '61653', '$2y$10$qBMDiz6aLfmlAD1ZI0GF6.a5gwwXLemNU2gyW5LqSxLJOt7CRmZx.', '1981-11-06', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2013-04-29'),
(5600, ' Manuel', 'Palacios Talamantes', 'Aeropuerto Infonavit', 'D', 'Jefe De Grupo De Almacen', '1', '61654', '$2y$10$jiP0oETsHzJeww7FaGzZmeXh.wTP.I7vH/2KWrZDWZDvMX/CQoqV.', '1967-09-13', 'Resendez Gardner Raul', '98277', 'HUS', '2013-04-29'),
(5601, ' Pablo', 'Ramirez Aguilar', 'Manuel Valdez', 'D', 'Almacenista', '1', '61655', '$2y$10$1xpb/QypJlq.ggh/31ZSy.PVNTJWd867eV.sO9AbEB7VHz2Bz8Cr2', '1975-08-07', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2013-05-22'),
(5602, ' Mario Antonio', 'Lespron QuiÃ±ones', 'Solidaridad', 'D', 'Conteos Ciclicos', '1', '61656', '$2y$10$6D.hc0HXgk279P04V1b8f.rBnBjbPyq2NzauU0alpjNS2W1OG1edS', '1965-08-11', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2013-05-30'),
(5603, ' Juan', 'Hernandez Triana', 'El Fortin', 'D', 'Operador De Procesos', '1', '61657', '$2y$10$pl7OiXrskD.VOFDVYQUt0emsxO/FvRXNCjsi7O4bRHRqufQ./lMjy', '1968-05-01', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2013-06-05'),
(5604, ' Hector Manuel', 'Olivas Portillo', 'Praderas del Sur', 'D', 'Lider de Produccion', '1', '61659', '$2y$10$ruXysHYaZlD21N3mG/AEqOuV4mG1eYbsl9x/3Fqvug6pwoMNqgEre', '1991-04-27', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2013-07-03'),
(5605, ' Felipe', 'Montor Roque', 'Urbi Villa del Cedro', 'D', 'Operador de Set Up', '1', '61661', '$2y$10$w2Eqdair6L8XnpW89CuOfuKzB7tC34KN/zgvzU0axK3jzsmb0QDVu', '1994-01-27', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2013-07-10'),
(5606, ' Rafael Eduardo', 'Marin Aranzola', 'Urbi Billa del Prado', 'D', 'Operador de Criticos', '1', '61662', '$2y$10$kYpqN.xcthS0pbgIs3TAOuRliIlpz4xzIESN7h6sXVkFF9.e7zmN6', '1977-10-13', 'Saul Arellano Escobar', '97722', 'HUS', '2013-07-10'),
(5607, ' Martin', 'Ramirez ', 'Praderas de las Torres', 'D', 'Tec Esp en Mtto Equipo', '1', '61663', '$2y$10$wSGhfs1qm8X3cqpY2qO.tuxwFfYmYWir/ZpUTqJKWsiUDyl3c2FJu', '1964-07-08', 'Fernando De La O Alvarez', '70963', 'HUS', '2013-07-17');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `colony`, `position`, `area`, `plant`, `username`, `password`, `birthdate`, `supervisor_name`, `supervisor_reloj_number`, `deparment`, `fecha_ingreso`) VALUES
(5608, ' Jeans', 'Bustamante Garcia', 'Riveras del Bravo', 'D', 'tecnico de control de inventarios', '1', '61664', '$2y$10$VhmV6WP9SCBsZOsE0EHx4Ou2NhAN2E6nwOaBdMVAyfPQK1Iazmf5a', '1993-04-25', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2013-07-24'),
(5609, ' Gerardo', 'Lopez Macias', 'Rinconada de las Torres', 'D', 'T.Lider Automatizacion Control', '1', '61665', '$2y$10$I5VFAULOjf6Tw3ZMKkMTe.IDS9DW3rZkcY/hhGdqM7bGKg3fH7dES', '1988-08-14', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2013-07-24'),
(5610, ' Delfino', 'De la Rosa Salazar', 'Fracc. Puerto Castilla', 'D', 'Tec de Mantenimiento Troqueles', '1', '61666', '$2y$10$fVTkSyMrg1zJnjFgULNxfOf0jpQacaccnXhDajCxyWwCniZb/bQR6', '1976-11-02', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2013-09-05'),
(5611, ' Pedro Gerardo', 'Moreno Reyes', 'Terrenos Nacionales', 'D', 'Tec Esp en Mtto Equipo', '1', '61668', '$2y$10$CVhI1JNRdfl1hY83x7qmbeWaaHq59bU1aSluv5d2.O9XhsNjgCoVq', '1992-07-19', 'Martinez Gonzalez Fernando', '24731', 'HES', '2016-07-01'),
(5612, ' Fernando', 'Valencia Gonzalez', 'Parajes de San Isidro', 'D', 'Conteos Ciclicos', '1', '61669', '$2y$10$dDbzMNu1JlZcGPxsUMw4MuAusBbE2DZGBbjskYq15wdg5hh8Y2Z6K', '1985-11-19', 'Mario Soriano Romero', '75688', 'HUS', '2014-02-26'),
(5613, ' Josue Noe', 'Tovar Barrios', 'Aguilas de Zaragoza', 'D', 'Almacenista', '1', '61670', '$2y$10$FqZT2OAkWNjlCujBn.zhse34/MwL2gWpDcEwtzUxHvn05t8LjgI.K', '1980-12-19', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2014-02-26'),
(5614, ' Sandra', 'Reza Romero', 'Parajes de San Isidro', 'D', 'Operador De Procesos', '1', '61672', '$2y$10$pmxgLyQnvUrhy.EHhCNqEecEaO8gGibp.SlnHEPccXDIZvRrnejTK', '1975-08-29', 'Varona Hernandez, Braulio', '61651', 'HUS', '2014-05-21'),
(5615, ' Eloy', 'Rodriguez Herrera', 'Manuel Valdez', 'D', 'Operador de Set Up', '1', '61673', '$2y$10$rKF11FmhAu4ESR7yRJX3Mu2Johnh0iS6JrZUMQj2uzQOGO.TzjxwW', '1981-12-01', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2014-05-21'),
(5616, ' Luz Elena', 'Reyes Fernandez', 'Patria Ii', 'D', 'Operador General', '1', '61675', '$2y$10$z2la9iWN87zAWSp/dipnveXmDa2m/D2GGC3sGiKg0W/lIinty/MUi', '1968-10-01', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2014-06-11'),
(5617, ' Jesus', 'Gutierrez Ramiro', 'Parajes de Oriente', 'D', 'Tecnico de Calidad', '1', '61677', '$2y$10$Mwf6pkVBfhfumerjZvfJO.cFOeePqx.VReMTXzUx1r1A3oozXDDzy', '1979-02-05', 'Diana Demorey Carrasco', '128213', 'HUS', '2014-06-27'),
(5618, ' Raymundo', 'Sanchez Ortiz', 'El Fortin', 'D', 'Tec Esp en Mtto Equipo', '1', '61678', '$2y$10$pDsw7OPX1G/z6gI7z4deN.1rc9t/YrBtAU1Jrvxe/Qjz55fVa6z7e', '1966-11-29', 'Mauro Sanchez', '61715', 'HUS', '2014-07-14'),
(5619, ' Rebeca', 'Carrillo Pacheco', 'Medanos', 'D', 'Operador Especialista', '1', '61682', '$2y$10$E5qxQeMd0O0hIx64dZ6rFuH4dVYyA1F5FQFZmr02yQwbd2VIv3X.a', '1995-04-12', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2018-10-04'),
(5620, ' Felipe', 'Salomon Sanchez', 'Parajes de Oriente', 'D', 'Tecnico especialista en moldes', '1', '61683', '$2y$10$Hr0OKLYl5btTAw2r1ialmuWokHw1T0.wmDmk3hOjVJCrFEXnH7Rma', '1992-08-05', 'Jaime Estrada Renteria', '77575', 'HUS', '2014-08-20'),
(5621, ' Guillermo', 'Herrera Calamaco', 'Morelos Zaragoza', 'D', 'Operador De Procesos', '1', '61687', '$2y$10$B1ppT0gNX6fUbuaEedrw..twQCjzmGLeOtiwih3x.zWlsENHrH9im', '1971-06-14', 'Varona Hernandez, Braulio', '61651', 'HUS', '2014-09-10'),
(5622, ' Lucio Nabor', 'Rojas Villalobos', 'Portal del Roble', 'D', 'Operador de Criticos', '1', '61689', '$2y$10$TM32drISUMZY38N2FaeuD..wl3uJGk5MDF8QMPQlnEY5oVrD3G1um', '1972-07-12', 'Saul Arellano Escobar', '97722', 'HUS', '2014-09-17'),
(5623, ' Jose Armando', 'Fernandez Gamez', 'Prados de Salvarcar', 'D', 'Tec Proceso de Moldeo/Die Cast', '1', '61690', '$2y$10$Hr4slg17NkxmDdkYQE99p.LP2.6Men7gSq37Sxeji0RqWVedi7tZO', '1994-12-31', 'Gustavo MacÃ­as Sandoval', '73857', 'HUS', '2014-09-17'),
(5624, ' Rigoberto', 'Diaz ', 'Portal del Roble', 'D', 'Operador General', '1', '61691', '$2y$10$Z3W/FE0IEJlZyQQcoORxb.r2JClQAOeXxXlY5Bidzsa2rhl7SbpQe', '1975-01-22', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2014-09-24'),
(5625, ' Victor Hugo', 'Alvidrez Marquez', 'Roma', 'D', 'Tec Proceso de Moldeo/Die Cast', '1', '61692', '$2y$10$oNybS2fsjTGyulCg19kATOstBSbtyHJ2ZvIABo9t2O4nSVDv/fx9a', '1978-07-21', 'Gustavo MacÃ­as Sandoval', '73857', 'HUS', '2014-10-14'),
(5626, ' Ricardo', 'Fuentes Cisneros', 'Riveras del Bravo', 'D', 'Jefe de Grupo de Conteos Ciclicos', '1', '61693', '$2y$10$8siOKajMJoBPzdbT.qSVpuzQcpGiVwtr8O1YiUcDK.1mezrHOCwhy', '1984-10-02', 'Adalberto Suarez Marin', '66069', 'HUS', '2014-10-15'),
(5627, ' Veronica', 'Arredondo Diaz', 'Praderas del Sur', 'D', 'Inspector Control de Calidad', '1', '61696', '$2y$10$R.LiRTa5ne3/e8R87cAPDejiu6Tw/xWGXgM0xI8yiYaM0knmPN5wm', '1972-11-28', 'Jose Ruiz', '74929', 'HUS', '2014-10-20'),
(5628, ' Moises', 'Chigo Lopez', 'Riveras del Bravo', 'D', 'Operador Especialista', '1', '61697', '$2y$10$8.l0rVKs6pQYUpRGDC6WpOfNH7VjIWd.cxzOwbsC.KKfYMjStQgWu', '1991-08-11', 'Saul Arellano Escobar', '97722', 'HUS', '2014-10-21'),
(5629, ' Victor', 'Moreno Martinez', 'La CaÃ±ada', 'D', 'Operador de Set Up', '1', '61698', '$2y$10$hA9ZDZtrqsCCUkkn/EBtTOfW/oU5is.XD/bPC03n5SIvtAM5OgVrK', '1973-03-02', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2014-10-31'),
(5630, ' Pedro', 'Rosales De Leon', 'El Papalote', 'D', 'Operador De Procesos', '1', '61699', '$2y$10$2jgqPvT2VNeqwVedGqdLFed4b3.STxZVQAy1.mU2ngUz89gd0s5mu', '1974-01-28', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2014-11-21'),
(5631, ' Gabriel', 'Sanchez Sanchez', 'Parajes del Sur', 'D', 'Operador De Procesos', '2', '61700', '$2y$10$THTu7.lbWvI1cKoMyw423eOvqjFsVS1vtlWEZV9VAAQ84jN9YsODy', '1973-05-07', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2014-12-02'),
(5632, ' Regina Maria', 'Vazquez Hernandez', 'Terrenos Nacionales', 'D', 'Operador De Procesos', '1', '61701', '$2y$10$J/Jf4kDE5OJwiLdHBexmXeOiFk17yR1/WaGcpcCPCJZUuD.eVSog6', '1970-07-02', 'Varona Hernandez, Braulio', '61651', 'HUS', '2014-12-11'),
(5633, ' Jose Luis', 'Gonzalez Del Rio', 'Pancho Villa', 'D', 'Tec Esp en Mtto Equipo', '1', '61702', '$2y$10$es1AbH747v5kwJppMNquGuWqYEdFRaP1kJ2ZQVWP6XmLgBLq2cgfW', '1972-03-16', 'Fernando De La O Alvarez', '70963', 'HUS', '2014-12-19'),
(5634, ' Salvador', 'Lugo Alfaro', 'Praderas del Sauzal', 'D', 'Operador Especialista', '1', '61704', '$2y$10$UuyHJSeZJgpepX0oWy.Mce7LaPf1XzC6266Tg65A1.KD7FX1GBgSO', '1972-08-15', 'Varona Hernandez, Braulio', '61651', 'HUS', '2015-01-08'),
(5635, ' Celso', 'Sanchez Suarez', 'La CaÃ±ada', 'D', 'Operador Especialista', '1', '61705', '$2y$10$bwZDDdIZ2mmWg1HpyimnneHZvsd8L5ngSKrjrKwAUYUGMO/Z3yQmO', '1980-05-12', 'Abel Fernandez Delgado', '98716', 'HUS', '2015-01-12'),
(5636, ' Victor Manuel', 'Burciaga MuÃ±oz', 'Morelos 1', 'D', 'Operador Especialista', '1', '61706', '$2y$10$/gwUQvOq9nGi5qw1.jupdOS61j8crUAye0p0wGLHa8RSf9NM8nrNS', '1975-05-20', 'Abel Fernandez Delgado', '98716', 'HUS', '2015-01-12'),
(5637, ' Oscar Francisco', 'Hernandez Aguilar', 'Heroes de Mexico', 'D', 'Jefe De Grupo De Almacen', '1', '61707', '$2y$10$KXZURu7qutNE7qPnIEqNq.7tdHWZK8.xTbPyFjl6R/H3KlMpk6AEC', '1990-10-03', 'Resendez Gardner Raul', '98277', 'HUS', '2015-01-13'),
(5638, ' Gerardo', 'Perez Gonzalez', 'Medanos', 'D', 'Operador Especialista', '1', '61708', '$2y$10$I7mDXX7Odc5sLzprCvVfs.HdwvWd/IahJQu9z8rNSdpmAoLHt7qtq', '1996-10-17', 'Briseida Bautista Tolentino', '300011', 'HUS', '2018-01-17'),
(5639, ' Lorenzo', 'Diaz Garcia', 'Torres del Sur', 'D', 'Tec Esp en Mtto Equipo', '1', '61710', '$2y$10$ufeh0uywlFVWuJAMsksvkOKwtvqyX0i6xJzGfGhLLnGHfvgUHVKEe', '1970-09-05', 'Luis Albel Aguirre Ortiz', '61762', 'HUS', '2015-02-03'),
(5640, ' Saul', 'Mendez Hernandez', 'Tierra Nueva', 'D', 'Operador Especialista', '1', '61712', '$2y$10$X0j74nfU1dYUCe5C8Fmer.sx0bRTzv0vfQ.XmnqnX8TmMs7k5bpyO', '1979-02-12', 'Abel Fernandez Delgado', '98716', 'HUS', '2015-02-06'),
(5641, ' Sergio', 'Tinoco Herrera', 'Manuel Valdez', 'D', 'Operador Especialista', '1', '61713', '$2y$10$L1rE1l8bdfjWKnaqJ4JsYe/dUc4tlY1RI0qUBYvf.AWUDr/znIstK', '1971-09-27', 'Briseida Bautista Tolentino', '300011', 'HUS', '2015-02-10'),
(5642, ' Manuel', 'Chairez Campos', 'Riveras del Bravo', 'D', 'Operador Especialista', '1', '61714', '$2y$10$vlfbu8FyTrTPXyI3I6oWlOjOXS8vWK4RTDoMzk4h0BGzcIDHTZ2Lq', '1980-04-09', 'Daniel De Jesus Favela Najera', '73913', 'HUS', '2015-02-11'),
(5643, ' Jose Maria', 'Perez ', 'Real del Desierto', 'D', 'Operador De Procesos', '1', '61716', '$2y$10$W.DlCga3MaDAfKerVQf34u2hN7C4Kx5EBi6UTTCoWLVgEV2Gpn1Sq', '1970-11-05', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2015-03-12'),
(5644, ' Yair Enrique', 'Arenal Compean', 'Sauzal', 'D', 'Operador Especialista', '1', '61719', '$2y$10$VFMqkSnCxnZITqNgkpaXTO8HmriA7A9VDOMyJ0o38AYKR79sc3nmy', '1996-10-06', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2018-01-31'),
(5645, ' Jesus', 'Vargas Garcia', 'Tierra Nueva', 'D', 'Operador De Procesos', '1', '61720', '$2y$10$BzkWp9r5WpSn69Ym22nXh.B3.MzHj2LyyXaDD4KFqYhj0y6UiA//.', '1968-07-22', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2015-04-02'),
(5646, ' Ramon Ernesto', 'Gil Gaxiola', 'Rincones de Salvarcar', 'D', 'Lider de Tecnicos Cnc', '1', '61726', '$2y$10$..ZtgJb3lQEEHhMeBfLKBOKMjpKqLIpKOhYyNWDxR5WzRb5WzVxo6', '1970-04-22', 'Mauro Sanchez', '61715', 'HUS', '2015-05-19'),
(5647, ' Pedro', 'Martinez Ladin', 'Sauzal', 'D', 'Operador De Procesos', '1', '61728', '$2y$10$iU8rusTHiuDts6unOT1YxeOVIGccaBUsbXwrO2yADA4m9lMRctpjG', '1983-02-20', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2015-05-27'),
(5648, ' Isaac', 'Antonio Santiago', 'Parajes de Oriente', 'D', 'Operador De Procesos', '1', '61729', '$2y$10$d54TVN5.lA4sID/aYP51Ku1A0u1FeNJZszd1qSbVH0JzIzK4XxOTe', '1971-06-03', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2015-05-28'),
(5649, ' Alicia', 'Balboa Lopez', 'Praderas del Sol', 'D', 'Operador De Procesos', '1', '61730', '$2y$10$OhF/kD.C0zLP3PwY/3cbgOB46ZFsaEEpCniEXMWrItzogf9pjY8PG', '1979-09-27', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2015-06-02'),
(5650, ' Ismael', 'Sandoval Aguilera', 'Eco 2000', 'D', 'Almacenista', '1', '61731', '$2y$10$pKsSbgmIJ9BwNWHfhPUqWemAgjc8u..KAmevq484kUUPnybEyHTjC', '1974-10-31', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2015-06-02'),
(5651, ' Andres', 'Enriquez Delgadillo', 'Salvarcar', 'D', 'Tec Esp en Mtto Equipo', '1', '61734', '$2y$10$JZD4WGBn7z2gTwA.vJZNmecVHMFuRq7jsGDQD5cP2dvxnncyhyQsm', '1980-04-25', 'Fernando De La O Alvarez', '70963', 'HUS', '2012-05-15'),
(5652, ' Eric', 'Moreno Lopez', 'El Granjero', 'D', 'Operador de Secundarios', '1', '61735', '$2y$10$v/hVCQtTwm4jJksfMRFINO3Q6sS/fEAewfiiDI01I16Avp0XdWxR6', '1980-09-21', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '1999-08-04'),
(5653, ' Mauricio', 'Martinez Martinez', 'Hacienda de las Torres Un', 'D', 'Jefe de Grupo de Conteos Ciclicos', '1', '61736', '$2y$10$BdFZ6qsrXHaOaqYFZt3GmuF5oDOiPiV2HlWjDKs29.qdAbrY05Mk.', '1978-09-22', 'Jenny Adriana Gonzalez MuÃ±oz', '73168', 'HES', '1999-08-11'),
(5654, ' Margarita', 'Diaz Guzman', 'Infonavit Solidaridad', 'D', 'Limpieza', '1', '61740', '$2y$10$sw7Qx6yUSFf7G2DpfJVKJ.nKCD8tARuXmUJDSxEa2nV/resDn4aT.', '1961-07-20', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2000-02-16'),
(5655, ' Sandra Luz', 'Ramos Herrera', 'Parajes del Sur', 'D', 'Operador General', '1', '61744', '$2y$10$2ommVSFezvKROOxlwYRZwOpIjImmp.KdJ.1ePB9/vDQY7SnLJRlAu', '1975-06-10', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2000-04-26'),
(5656, ' Jose Juan', 'Lopez Vaquera', 'Horizontes del Sur', 'D', 'Operador de Set Up', '1', '61748', '$2y$10$yZK9X6D4FOjHdtKEeyw4u.Vhv5F2SXveIqraQGH1Ml3046YJp7VKm', '1969-03-20', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2008-05-19'),
(5657, ' Gerardo', 'Rosette Huerta', 'Urbi Villa del Cedro', 'D', 'Tec Esp en Mtto Equipo', '1', '61750', '$2y$10$sznreFRJya5T6dN.75Py2exLVT3g8py1yXuVpp4KRkwM2KSllAtf6', '1980-12-14', 'Luis Albel Aguirre Ortiz', '61762', 'HUS', '2008-06-23'),
(5658, ' Manuel', 'SariÃ±ana Moreno', 'Heroes de la Revolucion', 'D', 'Jefe De Grupo De Almacen', '2', '61751', '$2y$10$0NybmLPCtKqEgZdCFOGYdeGnDYFDmSuR41zncwdVHwxFOasthQ2T.', '1974-05-02', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '2008-07-07'),
(5659, ' Luis Antonio', 'Perez Ramirez', 'Morelos Zaragoza', 'D', 'Tecnico CNC', '1', '61755', '$2y$10$SJCbgzicWen62AMv73SQaO811by5KAWaIHD/ODNRaAeeUJnQLkYA.', '1968-03-05', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2008-09-02'),
(5660, ' Jose Manuel', 'Sanchez Villatoro', 'Aguilas de Zaragoza', 'D', 'Tecnico de Control Ambiental', '1', '61757', '$2y$10$ENpAyf4Cayzz59ofcwI0rO5Fem5y0VyTPZoPRbqhcJ4kzAzkuUgvW', '1985-03-17', 'Jessica Alejandra Aguilar Guti', '109077', 'HUS', '2008-09-29'),
(5661, ' Oscar Luis', 'Olivas ', 'Roma', 'D', 'Lider de Tecnicos de Tool Room', '1', '61759', '$2y$10$Yfic2jylXoSMDfBiYrL0TeV3vgxCfehYjqj15sljUqMzG0YtDl9c2', '1972-10-12', 'Fernando De La O Alvarez', '70963', 'HUS', '2008-10-06'),
(5662, ' Javier Alonso', 'Morales Miranda', 'Parajes del Oriente', 'D', 'Operador de Criticos', '1', '61760', '$2y$10$txh4f7rtKxJpP6/H2tIjYeEOTXjFb3rJVa4WZeFxbZdfS0luy42xy', '1979-04-01', 'Daniel De Jesus Favela Najera', '73913', 'HUS', '2008-10-06'),
(5663, ' Martin', 'Dominguez De Santiago', 'Infonavit Angel Trias', 'D', 'Operador de Secundarios', '1', '61761', '$2y$10$M2/T9jzkBw5d2zcyVsRpeO1XlWtW3aAU5cvnVSNjauoqHqVj5Fx6C', '1964-10-03', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2008-10-08'),
(5664, ' Epifanio', 'Chavarria Garcia', 'Manuel Valdez', 'D', 'Tecnico Lider de Automatizacion y Control', '2', '61763', '$2y$10$4HNQ6fxgHq/7c7gr0dYcZuW8aozp93lUFAym5gNsuTu1wBx7kvlEG', '1972-10-11', 'Ruben NuÃ±ez Adame', '100370', 'HUS II', '2008-10-13'),
(5665, ' Jorge', 'Hernandez Mota', 'Fracc. Papagochic', 'D', 'Jefe De Grupo De Almacen', '2', '61765', '$2y$10$UfT5uk7/hw58gbcd6QtEBeaqldScyuMavBkS/FpyZm7SgAIiNRdKS', '1972-01-30', 'Ricardo Joel Trejo LÃ³pez', '84444', 'HUS II', '2008-10-20'),
(5666, ' Juan Carlos', 'Almaraz Sanchez', 'Condominio Vistas del Val', 'D', 'Tec Esp en Troqueles', '1', '61767', '$2y$10$ubOE7uwMDzisEBobS/Vb9OSjqr8Zwy6lgnxK/d0j81D37KVzWvxG.', '1965-05-12', 'Favela Alvarado, Jose Luis', '25333', 'HES', '2008-12-16'),
(5667, ' Carlos Manuel', 'Cervantes Medina', 'Praderas de los Oasis', 'D', 'Tec Esp en Mtto Equipo', '1', '61768', '$2y$10$MG250riDX0BSqEcR87PX0uO4cX1uHhnjmpjfe/wCEWbB.uz8nhpHK', '1975-07-25', 'Fernando De La O Alvarez', '70963', 'HUS', '2008-12-17'),
(5668, ' Juan Carlos', 'Campos CastaÃ±eda', 'Hacienda de las Torres', 'D', 'Tecnico Cnc', '1', '61769', '$2y$10$Yx7XGiiqciqrS5SwQUH9Te02UBuIoRZEZUy7zT4Kr9qrCnDmfc146', '1974-12-19', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2009-02-09'),
(5669, ' Antonio', 'Martinez Morales', 'Carlos Castillo Peraza', 'D', 'Operador De Procesos', '1', '61772', '$2y$10$MEAFfH4S3f7Ubd6eaEslBuoV.J.tb92OXD8TXh9Ohrhk6oJKd.zm6', '1968-06-05', 'Velarde Inostroza Enrique', '71208', 'HUS', '2009-02-18'),
(5670, ' Jorge Urbano', 'Mariscal Aguirre', 'Torres del Sur', 'D', 'Tecnico CNC', '1', '61773', '$2y$10$Qe3mQxNk3zyj9bb9A2.oD.TbPGa0LqYkwT1WBwrxapAmyUEJXCY26', '1969-05-25', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2009-02-24'),
(5671, ' Cristian', 'Davila Ortega', 'Infonavit Tecnologico', 'D', 'Jefe Grupo Fundicion/ Die Cast/ Lenoir', '2', '61774', '$2y$10$S/Z.F5tfTF.xVphT4fxIH.q.XeEZ5tuLhvcyYVv18.PL3/VSzcWIu', '1987-04-01', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2009-05-19'),
(5672, ' Juan Carlos', 'Saldivar Cabrera', 'Municipio Libre', 'D', 'Jefe Grupo Fundicion Die Cast Lenoir', '2', '61775', '$2y$10$eyEkovhCThYucesfzP9YpOx3OCsxki7IPn/wlG4TpLzRIMLz9kHRK', '1985-06-24', 'Garcia Gaucin, Erik', '28228', 'HUS II', '2009-05-21'),
(5673, ' Maria Angelica', 'De la Torre Caldera', 'Parajes de San Juan', 'D', 'Operador de Secundarios', '1', '61777', '$2y$10$70GT0RSaoRKze5B1C6vQw.HFA8Ksi0JKoE2Cagk8wBlGmJVDGSAe.', '1980-04-15', 'Arellano Mota, Arturo', '24791', 'HUS', '2009-06-29'),
(5674, ' Victor Eduardo', 'Granados Rocha', 'Praderas del Sur', 'C', 'Auxiliar de Recibos', '1', '61778', '$2y$10$RdfGu1ZEbquySEH1x9tgse1/nZpAKwPxi9DsqhPA25ZDaCLgsYwu2', '1978-06-25', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2009-07-24'),
(5675, ' Jose Luis', 'Sanchez CastaÃ±eda', 'Morelos', 'D', 'Operador de Criticos', '2', '61779', '$2y$10$N7v8as3893yTnJKMOoB2W.hX.s8aZaznvHhh41O8tkzd6RS1Gmb.y', '1977-01-15', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2009-08-17'),
(5676, ' Jorge Jose', 'Argumedo ', 'Parajes del Sur', 'D', 'Jefe Grupo Fundicion/ Die Cast/ Lenoir', '2', '61780', '$2y$10$Aza9Ur95i9ALhtfFDY2fieAcD9qcRle4xsTZvLX3bjrHcCYpXWuGC', '1976-04-03', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2009-08-18'),
(5677, ' Alejandro', 'Borrego Vega', 'Villa del Cedro', 'C', 'Auxiliar de Embarques', '2', '61783', '$2y$10$h1FcLI7hNNdJ51seoUEu.e/CrdbGZT0Vbd/cUHNUkkTuTaWXeJ4SC', '1984-07-22', 'Ricardo Joel Trejo LÃ³pez', '84444', 'HUS II', '2009-08-24'),
(5678, ' Raul Del Carmen', 'De la Rosa Ramos', 'Carlos Castillo Peraza', 'D', 'Tec. de Metrologia', '1', '61784', '$2y$10$dClC90lhKQwzmtG7C488EOC2OfNNjfX5KZ0P34wBRne5b6jUgHEiG', '1979-12-08', 'Rodriguez Celaya, Ramiro', '24790', 'HUS', '2009-09-07'),
(5679, ' Manuel De Jesus', 'Jaramillo Gallegos', 'Praderas del Oriente', 'D', 'Almacenista', '1', '61786', '$2y$10$ZuKGqp16z9hxOMeKTVHxQulupI9AtlZHa1YyK.5pGReI9EXjojsVO', '1974-12-24', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2010-02-15'),
(5680, ' Abel', 'Ortiz Valenzuela', 'San Francisco', 'D', 'Reparador Moldes Fibra', '2', '61788', '$2y$10$Rfwg3wc4Uf3PHqetuUHcQufqpCRgF8fygE67NyboWSAf4Um8hyqU.', '1972-08-05', 'Reynaldo Mendoza', '88736', 'HUS II', '2010-04-19'),
(5681, ' Victor Manuel', 'Guerrero Flores', 'Simona Barba', 'D', 'Reparador Moldes Fibra', '2', '61789', '$2y$10$AB52llS9qfwDsExIEKsNe.fj.iNW7GAjADpaKf.m.nHp2IXqxnPAC', '1971-10-27', 'Reynaldo Mendoza', '88736', 'HUS II', '2010-04-19'),
(5682, ' Hilario Ambrocio', 'Rubio Rodriguez', 'Olivia Espinoza de Bermud', 'D', 'Tecnico de Calidad', '2', '61790', '$2y$10$kt6.QlFW7KY7XW3ErcZojOGTNGHzGSPSH7N5/ybDz83n2Y/73lCqG', '1977-04-03', 'Mario Chacon', '72893', 'HUS II', '2010-04-26'),
(5683, ' Oswaldo', 'Reyes Cruz', 'Horizontes del Sur', 'D', 'Set-Up de Maquinado', '1', '61791', '$2y$10$zW46gt/RuNKg6E14ru.mwuyGpGpw2KznwxblKPqOLLQ0jggXZWQCu', '1974-09-18', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2010-05-17'),
(5684, ' Roberto Vicente', 'Mata Rincon', 'El Mezquital', 'D', 'Operador de Set Up', '1', '61794', '$2y$10$Lp666nDnmu2cTdU537Sxf.9RwmoT7CPXWc49TMSsbQz2JvY9Gi5vy', '1983-06-07', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2010-06-14'),
(5685, ' Enrique', 'Cabrera Reyes', 'Carlos Castillo Peraza', 'D', 'Tecnico de Calidad', '1', '61795', '$2y$10$afD0VQCShwa34ufzel/lS.FsIMBdNhW0MxeGqEi5VY/8MpjEGWzqy', '1978-07-15', 'Rodriguez Celaya, Ramiro', '24790', 'HUS', '2010-07-19'),
(5686, ' Joel', 'Lopez Juan', 'Parajes del Sur', 'D', 'Jefe De Grupo De Almacen', '2', '61798', '$2y$10$Yjk9ISNQiGLBlzetW3xVZuYgEvSkrCw5qITKhJIIgOLoxse87JSIG', '1983-03-16', 'Bacilio Abel Rocha Carrillo', '68476', 'HUS II', '2010-09-27'),
(5687, ' Martin Armando', 'Alarcon Galvan', 'Parajes del Sur', 'D', 'Tecnico de Calidad', '2', '61800', '$2y$10$wx6T9Z96CccgazuCrHz1y.m9jvXKU/AHrJn602ZKB37qW.9jEQ5ty', '1965-08-27', 'Humberto Lopez Lopez', '61865', 'HUS II', '2011-01-24'),
(5688, ' Daniel Omar', 'Salcedo Ramirez', 'Parajes del Oriente', 'D', 'Tecnico de Calidad', '2', '61801', '$2y$10$nCD/rGXDf4K67E9pw4iDR.6DKeCxLNIz7k0MvmbLf2VIhxRa7F2nS', '1977-05-14', 'Humberto Lopez Lopez', '61865', 'HUS II', '2010-11-01'),
(5689, ' Carlos', 'Garcia Sanchez', 'Horizontes del Sur', 'D', 'Tecnico de Calidad', '1', '61803', '$2y$10$Kf12JZn9PUyBxAuPhTD6NO5lVIQfeVtNis9B/KoFutwEthID/9.CO', '1967-10-17', 'Kevin Adrian Martinez Orozco', '300062', 'HUS', '2011-01-17'),
(5690, ' Jose Renato', 'Hernandez Moncada', 'Parajes del Oriente', 'D', 'Tec de Mantenimiento Troqueles', '1', '61804', '$2y$10$iYNkq/5.hejI3wfPsyH1mOCqklXzZGPol4rY1eakBXdUxTC8Byz2W', '1972-01-22', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2011-02-01'),
(5691, ' Lorenzo De Jesus', 'Vazquez Perez', 'Senderos de San Isidro', 'D', 'Operador de Criticos', '2', '61805', '$2y$10$2T/Z6dNXfTZ2QH5vpkHEIuvj//OIuyxXBUAPRGs8U/HXBKdZVKD3G', '1971-08-31', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2011-02-22'),
(5692, ' Enrique Moises', 'Gonzalez Bartolon', 'Paraje de San Juan', 'D', 'Tecnico de Calidad', '2', '61806', '$2y$10$GM/HCaIEtzEHfHJewYU/C.9RgHfaOaT9cCGUzuTjDo4HuXsvMY7JC', '1979-07-15', 'Humberto Lopez Lopez', '61865', 'HUS II', '2011-04-05'),
(5693, ' Juan Antonio', 'Castro Parrilla', 'Fray Garcia de San Franci', 'D', 'Operador de Criticos', '2', '61807', '$2y$10$jlpI7nwMUwdLSdvhc2tcQ..u05RaiMWyJSK5xZpDxh.ctuNGpm9fO', '1988-07-31', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2011-04-11'),
(5694, ' David', 'Acosta Lopez', 'Praderas del Sur', 'D', 'Operador de Secundarios', '1', '61809', '$2y$10$1LIaEqlKWAYOyWOyuHIbFutGHGuM5B94n3Yj2EWdG4vMQRz8YZwpO', '1973-05-03', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2011-04-25'),
(5695, ' Melquiades', 'Ceniceros Paez', 'Olivia Espinoza de Bermud', 'D', 'Operador de Criticos', '2', '61810', '$2y$10$GeefYSD1P/ZVUXfIX9gDtOYIz.w.KSetynl1W93AtyYDJwmrmhd7K', '1978-11-02', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2012-07-17'),
(5696, ' Victor Manuel', 'Camarena Ruiz', 'Senderos de San Isidro', 'D', 'Operador de Set Up', '1', '61811', '$2y$10$Li8ANHAb/G4CCQp4MsdF5udQmmgzCXouV3o8Xs7GRjEG1E14RAR6S', '1982-08-16', 'Raul Zamora,', '25584', 'HUS', '2011-05-03'),
(5697, ' Luis Alberto', 'Velazquez Ayala', 'Tierra Nueva', 'D', 'Tec Esp En Moldes', '2', '61813', '$2y$10$BT9cuMxFTJ8O8ThFO9Fu4.U4YZx0VBRmsypP4BP0I0oKf6lOHqyrS', '1994-04-22', 'Reynaldo Mendoza', '88736', 'HUS II', '2012-08-13'),
(5698, ' Leandro', 'Sifuentes Armendariz', 'Parajes del Oriente', 'D', 'Jefe Grupo Fundicion/ Die Cast/ Lenoir', '2', '61814', '$2y$10$MDYhwuQ9CwTv6S8broghj.OQn9W9CWyYirRN60N1SJ9Wj9OV6idHW', '1976-10-07', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2011-05-16'),
(5699, ' Miguel Angel', 'Miranda Valles', 'Paseos del Alba', 'D', 'Operador de Secundarios', '1', '61817', '$2y$10$E6L/h4lcXSC4EivmM1NO9OfFydBVgNpk.tElFzgwI1V9PhSjYUvC.', '1983-11-06', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2011-05-24'),
(5700, ' Yadira', 'Garcia Ramirez', 'Horizontes del Sur', 'D', 'Operador De Procesos', '1', '61819', '$2y$10$bNo7OpVIscUleAW17.7U0up84z3JJoS54DhDq42upzSeS0/c1KtfG', '1979-03-17', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2011-06-13'),
(5701, ' Israel', 'Isidro Garcia', 'Parajes de San Isidro', 'D', 'Operador de Criticos', '2', '61820', '$2y$10$RnC7Ov6byYlcE.BJq4s7TeUfgGWp/oLAsqD9HQ2oPmu87qWoehKhG', '1986-04-12', 'Purata Enriquez, Misael', '33458', 'HUS II', '2011-06-13'),
(5702, ' Angel', 'Ramirez Mulato', 'Parajes del Sur', 'D', 'Operador de Criticos', '2', '61821', '$2y$10$fQEWh6NHo8ong26Pe42CmeKoL4Fs4uQc0bBgpsPZa8kmlv.4ReBY6', '1972-06-03', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2011-06-21'),
(5703, ' Jose Luis', 'Dominguez Gaona', 'Los Arenales', 'D', 'Tec Esp En Moldes', '2', '61823', '$2y$10$DUq2tON7z2l66e4FOEz7IO/b7wr1Fqnl60UEJVdB/u/0KMk3EQNJS', '1971-06-04', 'Reynaldo Mendoza', '88736', 'HUS II', '2011-08-01'),
(5704, ' Everto', 'Trujillo Gallegos', 'colonia Real Del Desierto', 'D', 'Operador General', '1', '61824', '$2y$10$tKb3/271eOxWh7hsozKsSe5TW.DQfdilEBrTumxC2aN7hop8GTehS', '1972-10-16', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2011-08-22'),
(5705, ' Albino', 'Torres Varela', 'Portal del Roble', 'D', 'Jefe Grupo Fundicion Die Cast Lenoir', '2', '61827', '$2y$10$Hd5DEpY5aqZjZcHcS9hqiOuO7zY5US3zpnUymte9zAOmt09CuCED6', '1984-05-05', 'Santiago Antonio Pacheco', '72187', 'HUS II', '2012-07-02'),
(5706, ' Amado', 'Garcia Torres', 'Parajes del Oriente', 'D', 'Tec Esp en Mtto Equipo', '2', '61828', '$2y$10$MFd4v/df8GD45FFH8TaEwe.80lIsjp/tHubcF2JINoRn28twAdwWS', '1966-09-13', 'Ruben NuÃ±ez Adame', '100370', 'HUS II', '2012-08-07'),
(5707, ' Ubaldo', 'Aldaco Garcia', 'Morelos', 'D', 'Tec Proceso de Moldeo/Die Cast', '1', '61829', '$2y$10$hHVdBgvX/ABd/b96RrT9seT9iu./p0c.uTM8N.5VHmx3/m8XMH1nK', '1977-12-12', 'Gustavo MacÃ­as Sandoval', '73857', 'HUS', '2015-01-27'),
(5708, ' Jesus', 'Dominguez Corona', 'Fray Garcia de San Franci', 'D', 'Operador de Criticos', '2', '61830', '$2y$10$yM.KTDm69.ow5earl/r6Mu4RctC7wG4ePYlxXJ3xHEN1o/ZEX3qJa', '1983-06-11', 'Santiago Antonio Pacheco', '72187', 'HUS II', '2013-03-13'),
(5709, ' David', 'Pano Leon', 'Parajes del Sur', 'D', 'Jefe Grupo Fundicion/ Die Cast/ Lenoir', '2', '61831', '$2y$10$suxPBL/hy7VF0GF8YzEnvOZHMRzkqaSnGH1gBqd8eT7gCewSQAK.e', '1982-05-31', 'Javier MartÃ­nez Acosta', '61908', 'HUS II', '2013-03-27'),
(5710, ' Humberto', 'Perez Garcia', 'Parajes del Sur', 'D', 'Tecnico de Calidad de Procesos', '2', '61833', '$2y$10$DZy7U3poc3Lx5kt5H3hHcelZnM/fFekCiHvKvMZf.6nPZQR9REPP.', '1982-03-06', 'Porras Alvidrez, Hector', '33328', 'HUS II', '2013-04-09'),
(5711, ' Mario Gilberto', 'Gardea Moreno', 'Horizontes del Sur', 'D', 'Operador de Criticos', '2', '61834', '$2y$10$2TdJ5um6YqahuEjfY7sa9uILAyZKWYlivVufsJuUNVmKbiGcNGyDm', '1985-10-20', 'Santiago Antonio Pacheco', '72187', 'HUS II', '2013-04-09'),
(5712, ' Emilio', 'Vidal Campos', 'Parajes de San Isidro', 'D', 'Operador De Procesos', '2', '61835', '$2y$10$mB2keytezr8OOYGo.9TSouof0NuMHgswrLCfpuHn.h0BpDXsUizfy', '1964-10-22', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2013-04-09'),
(5713, ' Jose Alfredo', 'Santoyo Garcia', 'Parajes del Sur', 'D', 'Set Up de Fabricacion', '2', '61836', '$2y$10$vvTNhi.ssVe2e9CqEf28rOtk67.wpjmznJR9htzQYdrJ8MgAoaH9u', '1976-01-12', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2013-04-09'),
(5714, ' Sergio Alejandro', 'Vazquez Garcia', 'Carlos Castillo Peraza', 'D', 'Operador de Criticos', '2', '61837', '$2y$10$nNJ4C2RocBEZtvg3Io5FauTrUI3itFNI4h2.qQYrhXO.DmJAXCF3S', '1987-06-19', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2013-04-16'),
(5715, ' Jesus Manuel', 'Ruiz Fierro', 'Cerradas de San Mateo', 'D', 'Operador de Criticos', '2', '61839', '$2y$10$HIUIB/uM.F/LoW81/dEVoenH6kl0BtFN8TuMuXMYiJka6LY21SXLG', '1992-05-17', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2013-04-23'),
(5716, ' Felipe', 'Limon Calix', 'Parajes del Sur', 'D', 'Operador de Criticos', '2', '61840', '$2y$10$a/KK64BUNsi.EpRvaRxSKuslO8H8GIrQ71eU2EpcHwvyhmgOiM5NW', '1982-05-13', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2013-04-23'),
(5717, ' Adalberto Santos', 'Cervantes Vitela', 'Olivia Espinoza de Bermud', 'D', 'Reparador Moldes Fibra', '2', '61842', '$2y$10$VxkQclGW8SnxWYJl4x3/D.aPw2HdVx7oujw6x3eIOc6nA.XlbaJYS', '1977-11-01', 'Reynaldo Mendoza', '88736', 'HUS II', '2013-04-29'),
(5718, ' Alonso', 'Alvarez Lopez', 'Horizontes del Sur', 'D', 'Operador de Criticos', '2', '61843', '$2y$10$iiO3NlnCTxluGBe/l9CTSOSfFmzVsYl70/vuRT2DpmMRh/5qKWg1.', '1977-06-10', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2013-04-30'),
(5719, ' Mario', 'Lopez Beauregard', 'Hacienda de las Torres', 'C', 'Auxiliar de Recibos', '2', '61845', '$2y$10$ahK9/BL19FWVQswZcI4pz.Qi5L2rM1m0zoAlRU4oz/GVOmi9Os13O', '1970-09-12', 'Bacilio Abel Rocha Carrillo', '68476', 'HUS II', '2013-05-07'),
(5720, ' Roberto Carlos', 'Aguilar Fabela', 'El Granjero', 'D', 'Operador de Criticos', '2', '61848', '$2y$10$QgjAcbVNXI3at0K0zFG9H.122g71q/VlegbS0RKZ.2RX7iS1NUIau', '1985-04-08', 'Santiago Antonio Pacheco', '72187', 'HUS II', '2013-05-07'),
(5721, ' Jaime', 'Gallardo Barraza', 'Mezquital', 'D', 'Jefe Grupo Fundicion Die Cast Lenoir', '2', '61849', '$2y$10$7R//pgsqfWxADRvZEnJLme69o/pJFfxhrUTkGccM7v6mSLE3uDnq6', '1975-03-11', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2013-05-14'),
(5722, ' Bernardino', 'Alvarez Estrada', 'Urbi Villa del Cedro', 'D', 'Operador de Criticos', '2', '61850', '$2y$10$H4P3rfDCDKIGDoTVOQLY3uX5m7se0JZq67XN.dbZQsRZkgX20vB5i', '1981-07-02', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2013-05-20'),
(5723, ' Alejandro', 'Rodriguez Molina', 'Las MontaÃ±as', 'D', 'Operador de Criticos', '2', '61851', '$2y$10$M.XaiPVzDcQulIXeB5iwgOXeaAJsP8xT6kAoJtpoAYhtBYWT7TqtC', '1984-09-15', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2013-05-27'),
(5724, ' Alfredo', 'Becerra Gomez', 'Parajes de San Juan', 'D', 'Operador de Criticos', '2', '61852', '$2y$10$WcY6TT3RESO/wrj75RtiBuTFmmcVUSNPSLth4nMZFuoshDXF.EO0K', '1973-03-14', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2013-05-27'),
(5725, ' Jose Guadalupe', 'Rangel Ramirez', 'Mezquital', 'D', 'Operador de Criticos', '2', '61854', '$2y$10$q1UwoZf8/YHrOp7o8hesE.YTja.5qwwvLgGvIqmVBwJf3SzvyJtG.', '1985-04-13', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2013-05-27'),
(5726, ' Jose Cruz', 'Tovar NuÃ±ez', 'Parajes del Sur', 'D', 'Almacenista', '2', '61855', '$2y$10$VXVbVzj8ny.CS1BC7GOzq.vQD595windHJLkrhQ41s/OwSXSLRv8C', '1973-05-02', 'Reynaldo Mendoza', '88736', 'HUS II', '2013-05-27'),
(5727, ' Rey', 'Gonzalez Amador', 'Carlos Castillo Peraza', 'D', 'Operador de Criticos', '2', '61856', '$2y$10$QvcvJ8WuLdYKS9hTclSzuuIceUYXUwcoAsAogcGE0fI72zHZd5Blu', '1971-01-06', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2013-05-27'),
(5728, ' Roberto', 'Ramos Lizarraga', 'Parajes de San Isidro', 'D', 'Operador de Criticos', '2', '61857', '$2y$10$heJP92020NX09UXP8mnI6Ou4KQyJvaBcqWXhxhoXROTo.J.n/6YpW', '1984-03-28', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2013-05-27'),
(5729, ' Martin', 'Jimenez Hernandez', 'Complejo Cielo', 'D', 'Tec Esp En Moldes', '2', '61859', '$2y$10$X0qiMmvZxoKHvlQk89cC3.3W.ReH80vunQ.3zkbquOxcqOrtyG5KS', '1970-11-10', 'Purata Enriquez, Misael', '33458', 'HUS II', '2013-06-10'),
(5730, ' Jose Nicolas', 'Moya Gonzalez', 'Praderas del Sol', 'D', 'Tec Esp en Mtto Equipo', '2', '61860', '$2y$10$kNGG8Dw4JQioTPPxTofWoeoLoA5/UMmDBgqaZIL/3xZcTAfb0SnG2', '1978-11-30', 'Ruben NuÃ±ez Adame', '100370', 'HUS II', '2013-06-03'),
(5731, ' Mario', 'Leon Viveros', 'Manuel Clouthier', 'D', 'Operador de Set Up', '2', '61861', '$2y$10$gOQ.s8zV6v2GqbgH4HEVOuX5LcKjnGbroeeyOc88RjC3QGwoYRX5O', '1993-02-11', 'Cecilia Adame Camacho', '97655', 'HUS II', '2013-06-04'),
(5732, ' Jose Alberto', 'Rodriguez Negrete', 'Hacienda de las Torres I', 'D', 'Operador de Criticos', '2', '61862', '$2y$10$/0eXIwGPXinqfnqjUy3wau3uNzLaa8roKx.TXoOFDfjkK3xrRo4Uq', '1981-04-08', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2013-06-10'),
(5733, ' Erith Humberto', 'Hernandez Ramirez', 'Las Haciendas', 'D', 'Tecnico de Control Ambiental', '1', '61863', '$2y$10$x15JmCMEnqLGmWJYVcDYhOGWiyybGAuxc6oV7crjlTv3.cUMs47ia', '1981-04-14', 'Jessica Alejandra Aguilar Guti', '109077', 'HUS', '2013-06-10'),
(5734, ' Ovidio', 'Jimenez ZuÃ±iga', 'La CaÃ±ada', 'D', 'Operador de Criticos', '2', '61864', '$2y$10$0JD96BIWqYzBD3kXU.zZqOcEJnCITdRqic5YTmdcFvo.lHjLXhTeS', '1980-09-14', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2013-06-11'),
(5735, ' Humberto', 'Lopez Lopez', 'Las Gladiolas', 'B', 'Lider de Control de Calidad', '2', '61865', '$2y$10$X4SswWbo3kqMM44ZjPoEHe9jjEJAJ5JU.kNf2NDQ9q9.OxVwFLzs2', '1991-12-28', 'Nallely Alvarado Aguirre', '76513', 'HUS II', '2013-06-10'),
(5736, ' Nicanor', 'Jimenez Lopez', 'Senderos de San Isidro', 'D', 'Tecnico de Calidad', '2', '61867', '$2y$10$9TSoEkvI1pxOvI8ITXuikO6WA4qEuRCSQeV8Z3AfTEauFOjxTM8QW', '1983-08-13', 'Mario Chacon', '72893', 'HUS II', '2013-06-17'),
(5737, ' Cezar', 'Flores Reyes', 'Las Haciendas', 'D', 'Operador de Criticos', '2', '61868', '$2y$10$0BtiCEQdqEmzDsdu9qkdFezQiAfyyKL7b9Nj07XjgUzBqB.NHWykS', '1979-09-17', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2013-06-17'),
(5738, ' Gabriel', 'Rojas Jimenez', 'Parajes de Oriente', 'D', 'Jefe De Grupo De Almacen', '2', '61871', '$2y$10$s0zeWTPUKtADz8DOCubE9ut1uBmxs3TE.e6iUCgt79iM0RzlccbF.', '1984-10-21', 'Ricardo Joel Trejo LÃ³pez', '84444', 'HUS II', '2013-06-18'),
(5739, ' Diego', 'Benito Gomez', 'Parajes de Oriente', 'D', 'Jefe Grupo Fundicion/ Die Cast/ Lenoir', '2', '61872', '$2y$10$otTic.h1yxiuyO.HA7bWCu/3Fhd6P9f3BfhZyHl6XMAe2OxV4P0Ee', '1987-11-13', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2014-06-23'),
(5740, ' Felipe', 'Gonzalez Chontal', 'Lomas de las Aguilas', 'D', 'Jefe Grupo Fundicion Die Cast Lenoir', '2', '61873', '$2y$10$3s18RtMSuP5OKPZ.yyzWcuYm/KEZcHbptR9bf.upjS4eWbt5WYrYO', '1986-12-22', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2013-06-25'),
(5741, ' Pedro', 'Teniente Rodriguez', 'Rincon de la Mesa', 'D', 'Jefe Grupo Fundicion Die Cast Lenoir', '2', '61876', '$2y$10$1sljrSXl1cwBjR7VG31JnOTJqVs.D643TAdJXC7Dl.JuzdBeZss2W', '1979-03-09', 'Erik Rey Mata Texna', '61890', 'HUS II', '2013-06-25'),
(5742, ' Guadalupe Humberto', 'Lozano Bueno', 'Valle de Santiago', 'D', 'Tec Esp en Mtto Equipo', '2', '61878', '$2y$10$XrPt13nGKu1Udply2.HfWe/bmjfjAGXCuLYODO5xrSy8GrCop97Qy', '1971-02-08', 'Ruben NuÃ±ez Adame', '100370', 'HUS II', '2013-07-01'),
(5743, ' Mario Alberto', 'Bustillos Quezada', 'Portales de San Prdro', 'D', 'Operador de Set Up', '2', '61880', '$2y$10$IDxWfCcQXTauETGwWXXlaOaJ4bUwMJHDEQnpeHoWa9gzoGN4QvCsS', '1986-07-29', 'Garcia Gaucin, Erik', '28228', 'HUS II', '2013-07-08'),
(5744, ' Jose Isael', 'Castorena Galvan', 'Misiones del Real', 'D', 'Operador de Criticos', '2', '61881', '$2y$10$ccKK.VKtFy0iXpbcxr.voOmjccAzPPxuGL3R1CrajvXDr5cppkD5y', '1977-02-02', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2013-07-09'),
(5745, ' Ernesto Baudelio', 'Figueroa Reyes', 'Profesora Maria MartÃ­nez', 'C', 'Auxiliar de Embarques', '2', '61883', '$2y$10$wBZ1vT8FjeKbi.PBHUu2G.FmVaLexqzhzg4FhQGPwc7K8aw8WFVf.', '1972-10-16', 'Ricardo Joel Trejo LÃ³pez', '84444', 'HUS II', '2013-07-10'),
(5746, ' Jorge Alberto', 'Torres Estrada', 'Parajes de San Juan', 'D', 'Operador de Criticos', '2', '61884', '$2y$10$FBcSJBV6gr5mUHwrGwzf5Ot61uciwTn1SzCsEep.jEqLWoIkIa0aC', '1979-02-22', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2013-07-16'),
(5747, ' Armando', 'Roldan Carrera', 'Carlos Chavira Becerra', 'D', 'Operador de Criticos', '2', '61886', '$2y$10$lyCUvZuZSV3QgZCrVEFoLuzW0EOHbkbUqm.4eMwY3FqGrjQ4gT1oC', '1982-10-27', 'Garcia Gaucin, Erik', '28228', 'HUS II', '2013-07-22'),
(5748, ' Hector Manuel', 'Fragoso Zamudio', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '61887', '$2y$10$MnV1JOYZMOEZZDTJ4WYfXehZKWv0TuxBTXXFsWQ08EnKUbvDeBkCW', '1988-09-30', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2013-07-22'),
(5749, ' Adrian Enrique', 'Plascencia Contreras', 'Carlos Chavira Becerra', 'D', 'Jefe de Grupo de Conteos Ciclicos', '2', '61888', '$2y$10$NpYZgVpmNhJsaAN4I4ifROKVBtQejTbdBPzdki2SC88/1H3r75ega', '1976-06-26', 'Cynthia Cisneros Medina', '75689', 'HUS II', '2013-07-22'),
(5750, ' Juan Pablo', 'Sanchez Hinojosa', 'Rincones de Salvarcar', 'D', 'Operador de Criticos', '2', '61889', '$2y$10$X2jSkZYAlylDBxJZU6EmjeaoZCcbhlQrnS6no0VUKfSUqvPSXkudS', '1982-05-08', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2013-07-29'),
(5751, ' Erik Rey', 'Mata Texna', 'praderas del sol', 'B', 'Lider de Produccion', '2', '61890', '$2y$10$jUBhhW1JNi/TkxiSb.w6kuk/qLR0AFuIiApqeqfridK.Fn3c0Ii.C', '1987-03-11', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2013-07-29'),
(5752, ' Francisco', 'Ramirez Martinez', 'parajes de san isidro', 'D', 'Tecnico de Calidad', '2', '61891', '$2y$10$Sd5rUEAMRby0SQW50mpg7OSRESGJAyXQjzM2d9IX1XXk6XqczvQBK', '1994-03-20', 'Humberto Lopez Lopez', '61865', 'HUS II', '2013-08-01'),
(5753, ' Gamaliel', 'Alvarado Santillan', 'Parajes del Sur', 'D', 'Operador de Criticos', '2', '61892', '$2y$10$CCDk7Ve0084zS1JSFKylu.6xu8kLJnsgKtfeTUqYXjeDVHqTBNICu', '1980-04-29', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2015-07-29'),
(5754, ' Israel', 'Rodriguez Palacios', 'Las Haciendas', 'D', 'Jefe Grupo Fundicion Die Cast Lenoir', '2', '61894', '$2y$10$knxCS3nRK41J01LOB8Mo7.f5Z0Bd.pXkdvLbnqBV4Pjf1qRtVgKYO', '1983-08-20', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2013-08-05'),
(5755, ' Ismael', 'Miranda Trujillo', 'Parajes de Oriente', 'D', 'Operador de Criticos', '2', '61895', '$2y$10$dYAvSo5XbsNSJGKT.z55ZuG98LixB8zZXtTj2lz5H7VBdg.TtRqEK', '1983-08-26', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2013-08-05'),
(5756, ' Samuel', 'Caldera Tagle', 'Mezquital', 'D', 'Operador de Criticos', '2', '61896', '$2y$10$D/ehlYPx9OgZPfc7E7v5qeffwsU5c3teM3dQYTKOF9BgOfzQfmGba', '1989-01-21', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2013-08-05'),
(5757, ' Gabriel', 'Monge Alvarado', 'Sauzal', 'D', 'Tecnico de Calidad de Procesos', '2', '61898', '$2y$10$e/m38tZGu/0KzPe9jN9iQuolkRfgFpVaST9YuHeYW6SyMs9MYrDoK', '1974-08-13', 'Porras Alvidrez, Hector', '33328', 'HUS II', '2013-08-12'),
(5758, ' Alberto', 'Martinez Herrera', 'Manuel Clouthier', 'D', 'Operador de Criticos', '2', '61901', '$2y$10$kcnpQnaPiJJVg2sKq7HcueB2rpoO6QQo6RXZX7FsLAbgh2nLOdWz6', '1985-03-17', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2015-06-03'),
(5759, ' Jaime Rafael', 'Paez De la Cruz', 'Hacienda de las Torres I', 'D', 'Jefe Grupo Fundicion Die Cast Lenoir', '2', '61902', '$2y$10$hd9v88lrQp0W8xiJE7MfkOtCxn4bSeX7wxPnmxvNmjWOrtoO6P9d.', '1976-12-27', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2014-05-06'),
(5760, ' Francisco', 'Valencia Berumen', 'Sierra Vista', 'D', 'Operador de Set Up', '1', '61903', '$2y$10$GFtKnoFb77l7nz4eLa.SX.VgbMJnPeXRES/PScLePedfcBbxu4qdC', '1993-08-17', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2018-04-17'),
(5761, ' Daniel Hugo', 'Cerenil Mendez', 'Praderas de los Alamos', 'D', 'Tec Esp en Mtto Equipo', '2', '61904', '$2y$10$fwUbmqUW/m2jST.TA.0ZGeXkasR4Y37Ra3Jv5gm8o4XB3JiAoagoq', '1989-02-13', 'Ruben NuÃ±ez Adame', '100370', 'HUS II', '2015-11-23'),
(5762, ' Benjamin', 'Flores Anguiano', 'Praderas del EnequÃ©n', 'D', 'Operador de Criticos', '2', '61905', '$2y$10$o..fww28gN6Fv.NlJHwtR.hR0.6SFevxhoOmhxGDlkkoUm9HzoRKu', '1974-11-07', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2014-08-14'),
(5763, ' Genaro', 'Angeles Acosta', 'Fracc. Arecas', 'D', 'Operador de Criticos', '2', '61906', '$2y$10$uT.qFXbllqb2rMEj4iJOv.wcRm1QbixIuo0OD2du1m.Kzd0Npa5jW', '1981-10-24', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2014-09-02'),
(5764, ' Rovel Isaac', 'Muro Hernandez', 'Portal del Roble', 'D', 'Tecnico en Entrenamiento', '1', '61907', '$2y$10$OZ3DDY18OBz2VNIrJuFykOSbCyK33oqXCeUuWNHCI/4n5z0hOENLi', '1984-05-30', 'Jorge Alejandro Ayabar DÃ­az', '66945', 'HUS', '2014-09-17'),
(5765, ' Benito', 'Cohetero Lorenzo', 'Las Haciendas', 'D', 'Operador de Criticos', '2', '61909', '$2y$10$023XnhUl91.jUkNm3jYtyOLflwXbAH5IR8xrk/3AandHV8/3oGF/y', '1981-03-21', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2014-09-30'),
(5766, ' Ricardo', 'Gutierrez Rangel', 'Mezquital', 'D', 'Operador de Criticos', '2', '61911', '$2y$10$hytzxGHNTyriY8KsNjK70efNw4a2g9CNAmeb0ct6qN9KrWIMfA3D6', '1984-12-20', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2019-08-15'),
(5767, ' Jose Manuel', 'Gutierrez Diaz', 'Parajes de Oriente', 'D', 'Operador de Criticos', '2', '61912', '$2y$10$YGuFZjgq19NXWW7QZ4.JOOLxgrsy3phOfX2scqDYr3kANT6WcJThu', '1985-06-09', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2015-01-12'),
(5768, ' Samuel Efrain', 'Banda Beltran', 'Cerrada del Sur', 'D', 'Tecnico de Calidad', '2', '61914', '$2y$10$TCwIs6g2mk3JomEx8C7lC.J1rfIr/R2y1Uqa3ra01AaX6tjDTDr36', '1993-08-28', 'Mario Chacon', '72893', 'HUS II', '2015-01-19'),
(5769, ' Pedro', 'Montejo Diaz', 'Parajes de San Isidro', 'D', 'Tecnico de Calidad de Procesos', '2', '61915', '$2y$10$H/eleZfHf59HHfG5myVLeuuMAMaz.uEFRhMwLBx6ulryhJYrtUo/y', '1995-01-28', 'Gonzalez Ortega, Gerson Albert', '84541', 'HUS II', '2015-01-19'),
(5770, ' Gildardo', 'Garcia Torres', 'Parajes del Valle', 'D', 'Operador de Criticos', '2', '61917', '$2y$10$Ypy5RYogmmoEA8jvnm9dpOmpoEdScafv2X0MCetIsLuD5Qegfs.yS', '1980-09-02', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2015-02-09'),
(5771, ' Jose Luis', 'Aguilar Beltran', 'Praderas del oriente', 'D', 'Tec Esp en Mtto Equipo', '2', '61918', '$2y$10$JHlzUdaBOJ59byP3ccCkfOTb.JTksW.WwOZxvnU4RNsQbP6f33RD6', '1992-06-07', 'Juan Antonio HernÃ¡ndez Villanu', '95945', 'HUS II', '2015-02-09'),
(5772, ' Mario Alberto', 'Ramirez Hernandez', 'Morelos 2', 'D', 'Operador de Criticos', '2', '61919', '$2y$10$c7xW0HCZ9M1xjuw0qdtfR./TPX0Cth2gebDImvaNCBlGvk2HeaYHy', '1990-09-09', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2015-02-09'),
(5773, ' Roberto', 'Zazueta Botello', 'Las Haciendas', 'D', 'Almacenista', '2', '61920', '$2y$10$ldhacOYHRZ0d/Yghoku3KO3N/hLZQJyephPXxlkwuvm1sJlCOGxvO', '1989-06-07', 'Bacilio Abel Rocha Carrillo', '68476', 'HUS II', '2015-04-06'),
(5774, ' Ricardo', 'Chimeo Mogo', 'hacienda delas torres un', 'D', 'Reparador Moldes Fibra', '2', '61924', '$2y$10$QOfIxwufOH1thdCeMaygVON9GY/1xkjnk8XkvGWLJkvN0rnCon9Ky', '1981-03-04', 'Reynaldo Mendoza', '88736', 'HUS II', '2015-05-14'),
(5775, ' Leonel', 'Tenorio Bibiano', 'Hacienda de las Torres I', 'D', 'Jefe Grupo Fundicion Die Cast Lenoir', '2', '61926', '$2y$10$O0uY4sH31LQnon8kwmofgOj/lVEcoa/PrKyKQUgmsQP5b.gq.ofYO', '1995-07-26', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2015-06-03'),
(5776, ' Jose Manuel', 'Mendez Ortega', 'Salvarcar', 'D', 'Operador de Criticos', '2', '61927', '$2y$10$9yjShNKTrDafhY.WnPTGGOH.MiONzyNzaF7CzS5CuMlSO.Aj0VcdO', '1964-10-14', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2015-06-09'),
(5777, ' Cesar', 'Raigoza Colunga', 'Bosque Bonito', 'D', 'Tecnico Electromecanico', '2', '61929', '$2y$10$B9n85cyB0zFhQOxYLI10.eIRXt7Ga/cNtTRgau4tmg69UKYVVer6S', '1993-06-06', 'Ruben NuÃ±ez Adame', '100370', 'HUS II', '2015-06-24'),
(5778, ' Jorge Luis', 'Sierra Chavez', 'Urbi Billa del Prado', 'D', 'Operador de Criticos', '2', '61934', '$2y$10$B.h2Qp46HMuNBKdWpiDioe.BQIKvxAz/w6nB3FvEFPm0BbZuBoMgK', '1993-05-20', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2015-08-11'),
(5779, ' Jesus Martin', 'Rodriguez Gonzalez', 'Santa Rosa', 'D', 'Operador de Criticos', '2', '61936', '$2y$10$lPwPKilj/FgjGIwDHZC1juDG7yFOXbegOCDdZER1BrwnrfvkvRSGK', '1964-09-28', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2015-08-21'),
(5780, ' Jorge', 'Martinez Herrera', 'Fray Garcia de San Franci', 'D', 'Operador de Criticos', '2', '61937', '$2y$10$cNP.qwsrNhquX/L3/eCFIOnsdt7CXFnRxJNOCMEd/yHLwZ2iqHtVC', '1991-04-30', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2015-08-21'),
(5781, ' Miguel Angel', 'Beltran Montes', 'Papagochic', 'D', 'Almacenista', '2', '61938', '$2y$10$XX/bT0/b0lyT1PuRmBZD4Oys3kTwvFutr20dJRsqMLzxbIdoluCfa', '1975-10-17', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2015-09-02'),
(5782, ' Jesus', 'Torres PeÃ±a', 'Olivia Espinoza de Bermud', 'D', 'Operador de Criticos', '2', '61939', '$2y$10$vdBBfSLTzAdt/6vFeZWyDesYGMg.uY8LCwx/9fjet6QZQe8moPoZu', '1995-12-13', 'Santiago Antonio Pacheco', '72187', 'HUS II', '2015-09-03'),
(5783, ' J. Isaias', 'Serrano Navarrete', 'Salvarcar', 'D', 'Lider de Embarques', '2', '61941', '$2y$10$UuVnJO1qD2ur8Ztd53SSse.J4eXeNiWuauiYXMaF8fZF8CojZrZ7O', '1977-12-30', 'Ricardo Joel Trejo LÃ³pez', '84444', 'HUS II', '2015-09-22'),
(5784, ' Jose Angel', 'Rodriguez Calvillo', 'Las Haciendas', 'D', 'Operador de Criticos', '2', '61943', '$2y$10$IUv5SgOBk.XC9DPI3507o.J93YebKZxshueHI7B6FQRYuqAih.jp6', '1985-10-24', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2015-10-13'),
(5785, ' Arturo', 'Martinez Medrano', 'El Papalote', 'D', 'Tec Esp en Mtto Equipo', '2', '61944', '$2y$10$MFR/jBYOlNM.7EFfQSkl.OVs3Hxsu/79hZoLTzl3osHoNX9lckYdS', '1992-10-12', 'Ruben NuÃ±ez Adame', '100370', 'HUS II', '2015-10-14'),
(5786, ' Armando', 'Prieto PeÃ±a', 'Porfirio Silva', 'D', 'Operador de Criticos', '2', '61947', '$2y$10$0b0JdU8OxSVNhBhzDZoS..mfq.XmlDXFW6jGjh2e6dwvfviqnpCHO', '1985-08-27', 'Purata Enriquez, Misael', '33458', 'HUS II', '2015-10-27'),
(5787, ' Alfredo Lazaro', 'Alvarado Gomez', 'Parajes del Valle', 'D', 'Operador de Criticos', '2', '61949', '$2y$10$CVGuEsa9E5ibXUqbn9LEo.p3MyhLjlSgCKsyhQ7jmlSMKz4nLb0Ba', '1976-05-11', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2015-11-26'),
(5788, ' Gustavo Alfonso', 'Salazar Garcia', 'Horizontes del Sur', 'D', 'Tec Esp en Mtto Equipo', '2', '61952', '$2y$10$7AfUTFiH5KNMOgD5KuVCseA3.Xyy5nUVmFVyk/HXBlkS81L2..cGa', '1993-06-04', 'Juan Antonio HernÃ¡ndez Villanu', '95945', 'HUS II', '2015-12-07'),
(5789, ' Paulo', 'Ortiz Fajardo', 'Praderas del Sol', 'D', 'Operador de Criticos', '2', '61953', '$2y$10$NJ0K4KlBtdUGEUtjdcZCbehFPmGxxUxR4H2xOxfMS6FMAVOK/k6.i', '1983-08-07', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2015-12-11'),
(5790, ' Jose Luis', 'Lira Chavez', 'Salvarcar', 'D', 'Operador de Criticos', '2', '61954', '$2y$10$gl9sZjFYPz6frrLhrYVx.ugEzXB6Be6x5jwpSUIsggZqQYE0WQtc6', '1972-04-04', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2016-01-05'),
(5791, ' Jose Remedios', 'De los Santos Ramos', 'Riveras del Bravo', 'D', 'Operador de Criticos', '2', '61955', '$2y$10$iiKWrssq3zThCkSsNha2Rek4hMPDTDa8VBapJoOJZfGurjuTI5Eum', '1970-11-01', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2016-01-05'),
(5792, ' Josmar', 'Herrera Limon', 'Jose Marti', 'D', 'Operador de Criticos', '2', '61956', '$2y$10$jwzcbdYnNhvg///2W9U7Vu.nXllc8fraarilhl9cEK6O1Hvj2ptqO', '1997-02-24', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2017-02-08'),
(5793, ' Acacio', 'Amparan Herrera', 'Aguilas de Zaragoza', 'D', 'Operador de Criticos', '2', '61957', '$2y$10$IN7Uw2jyXBrpHS2rwUa2R.RaEN7yZqXBU7uxqvytlV.oXtLTwHfD.', '1976-06-28', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2016-01-15'),
(5794, ' Jorge Luis', 'Corral Cisneros', 'Hacienda Santa Fe', 'D', 'Operador de Criticos', '2', '61958', '$2y$10$h8yc6t1./zQwOeM2o7pEjeVpZSLvo7jdlLMXmrMB/0CuSxKrUYyx6', '1984-07-19', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2019-11-20'),
(5795, ' Ramon', 'Martinez Medina', 'Las Haciendas', 'D', 'Jefe De Grupo De Almacen', '2', '61961', '$2y$10$ebkCg1nCTKfxHCa3hZJWTuFR/tCOIqkBYS3PNFLPn6mGiZymf1Gry', '1977-08-02', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '2016-03-17'),
(5796, ' Saul', 'Villegas Molina', 'Portal del roble', 'D', 'Operador de Criticos', '2', '61963', '$2y$10$PqqoqSplwpSu4NR1PFFpX.y6JGnADCj0WJtXJYfObR1psEzAljU.S', '1979-11-17', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2016-04-05'),
(5797, ' Ricardo', 'Holguin Medrano', 'Manuel Valdez', 'D', 'Operador de Set Up', '2', '61964', '$2y$10$2og0oOBuzUGo9qkbt5qgserquQm8.WUGCqJEAGa9cfbiubXFq1ffm', '1997-05-21', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2017-03-21'),
(5798, ' Jesus Adrian', 'Arredondo Aguirre', 'Parajes de Oriente', 'D', 'Reparador Moldes Fibra', '2', '61967', '$2y$10$E19M5PZA8k8i9xSCJFzJQe/YXeiEuAhirwIR5c8UhXiuRXmy99ska', '1990-03-23', 'Reynaldo Mendoza', '88736', 'HUS II', '2016-04-25'),
(5799, ' Federico', 'Pano Santiago', 'Parajes del Sur', 'D', 'Tecnico de Calidad', '2', '61973', '$2y$10$OW9462iTn0u7T7QSLU8PZeFXq6v917s.5/K0sqWbDafvZY6OHpv5G', '1981-03-02', 'Humberto Lopez Lopez', '61865', 'HUS II', '2016-08-17'),
(5800, ' Amado', 'Rodriguez Dominguez', 'San Francisco', 'D', 'Operador de Criticos', '2', '61974', '$2y$10$XFdXyR1AsYCJ5a9eu.yan.jUpI4yJ0NsrTxKxP1ZoowZk1GTRJ3Fu', '1982-11-20', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2016-09-05'),
(5801, ' Miguel Angel', 'Vasquez Garcia', 'Parajes del Valle', 'D', 'Operador de Criticos', '2', '61975', '$2y$10$Si4hhiDEEoC1jaw2cPCbCu8GAlevmrySN6wqqgHK1NavGS/Be7fKW', '1992-09-21', 'Cecilia Adame Camacho', '97655', 'HUS II', '2016-09-27'),
(5802, ' Gregorio', 'Pascual Rodriguez', 'Parajes del Sur', 'D', 'Operador de Criticos', '2', '61976', '$2y$10$bvU3WPThVUT.UHj9yRV/aOalUdTYiD0/KfhjD3J0SQheLsnGX7CwS', '1973-02-11', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2016-10-03'),
(5803, ' Adelaido', 'De los Santos De la Cruz', 'Misiones del Real', 'D', 'Operador de Criticos', '2', '61980', '$2y$10$NcBUotsgPBRxcUvltcUROOymcFeipNGjLaScjvtT.ICQmBxKLxMcy', '1969-03-29', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2017-03-07'),
(5804, ' Joaquin', 'Arango Ortiz', 'Urbi Villa del Cedro', 'D', 'Operador de Criticos', '2', '61986', '$2y$10$fFY7cJOrFrjoI6erXtLcvePT.XZjTxL.hzTTCJYVpZZyXFKV6esv6', '1978-05-08', 'Erik Rey Mata Texna', '61890', 'HUS II', '2017-05-18'),
(5805, ' J Natividad', 'Saucedo Bautista', 'Parajes de San Isidro', 'D', 'Jefe Grupo Fundicion Die Cast Lenoir', '2', '61989', '$2y$10$IaNpwsgNCwZW4jAPN0a/Ne9ckD9cjwwlqLLHo7V9Cgs8IPs73gP8q', '1985-08-31', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2017-06-09'),
(5806, ' Higinio', 'Quinta Severiano', 'Parajes del Sur', 'D', 'Tecnico de Ingenieria Sr', '2', '61990', '$2y$10$ow.SNn8OhhInfhoq2mVo0uppT6Wi5EbgYBATbUjmG70NxPzPHHYAS', '1987-06-20', 'Leyva Corral, Jose Ramon', '25229', 'HUS II', '2017-06-09'),
(5807, ' Jose Isrrael', 'Garcia Garcia', 'Lomas del Desierto', 'D', 'Operador de Criticos', '2', '61997', '$2y$10$GEsOI5vzeVpAOFWGml6P4uwKX7OYBEnmaFS9/xTK3wThxwpQ9adnC', '1987-02-24', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2017-08-08'),
(5808, ' Ubaldo', 'Salinas Collazo', 'Fray Garcia de San Franci', 'D', 'Operador De Procesos', '2', '61999', '$2y$10$8hs10t4wAv0iPzJWjQSUIOTyYKiQqohs2I7vL/fcTBLDAmDHlTTc6', '1973-05-13', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2017-08-22'),
(5809, ' Transito Eli', 'Roblero Martinez', 'Urbi Villa del Cedro', 'D', 'Operador de Criticos', '2', '62000', '$2y$10$lsecyQbA02pV5MYzYq3Aq.C.ZXvO35QlvXPY6R3Iw7wz7TMv.71Qi', '1990-01-12', 'Erik Rey Mata Texna', '61890', 'HUS II', '2021-05-27'),
(5810, ' Naun', 'Lopez Vicente', 'Carlos Castillo Peraza', 'D', 'Tecnico de Calidad', '2', '62002', '$2y$10$7o4.HIQ3pfXATTApTj3LY.4tDUkq1zF84FGuKI.yMLubd.DsFrLTS', '1990-02-09', 'Humberto Lopez Lopez', '61865', 'HUS II', '2017-08-29'),
(5811, ' Jonathan Cruz', 'Salazar Garcia', 'Horizontes del Sur', 'D', 'Tecnico Electromecanico', '2', '62004', '$2y$10$cZFw4MA0uwH8CptPqxyq8eIS2EzE2o184wKqrWKS6.0QmJKcw1x3a', '1999-01-10', 'Ruben NuÃ±ez Adame', '100370', 'HUS II', '2017-10-02'),
(5812, ' Daniel', 'Gomez Esteban', 'Parajes de Oriente', 'D', 'Encargado de Tool Crib Sr', '2', '62009', '$2y$10$f1vMepZV/i8K2KV/DFkG3OI44DOLzsPOF2YOBHGQbGguiDlF/76Uq', '1991-09-02', 'Leyva Corral, Jose Ramon', '25229', 'HUS II', '2018-02-13'),
(5813, ' Nestor Joel', 'Herrera Hernandez', 'Los Arenales', 'D', 'Operador de Criticos', '2', '62012', '$2y$10$CeYncgpwEbDfuJY1x4RAquz4YSb.FZYZFl0tlTfhFEI6sI1IaQqIe', '1980-01-09', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2018-02-14');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `colony`, `position`, `area`, `plant`, `username`, `password`, `birthdate`, `supervisor_name`, `supervisor_reloj_number`, `deparment`, `fecha_ingreso`) VALUES
(5814, ' Jesus', 'Lopez Lagueti', 'Sierra Vista', 'D', 'Operador de Criticos', '2', '62013', '$2y$10$eJG9FmMNgxtHTPlAahoN2OXBgK6E72l6DGea7hH8cif8zW/aMUu1C', '1982-08-24', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2018-02-15'),
(5815, ' Angel', 'Palagot Temix', 'Urbivilla Bonita', 'D', 'Operador De Procesos', '2', '62015', '$2y$10$dUQg1KmgVJM87lJ5zR6hKu9ykGf/OJObUzsHoW4841S1odXVJVLDm', '1969-11-01', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2018-02-22'),
(5816, ' Ventura', 'Lucas Aldeco', 'Parajes del Sur', 'D', 'Operador de Criticos', '2', '62020', '$2y$10$jEKYnGAJQXtB2.5Ij3i29uGFiFbboWucX00J7NUw9RZp3UHs79/UG', '1987-07-15', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2018-04-10'),
(5817, ' Pedro Alfonso', 'Ortiz Garcia', 'Parajes del Sol', 'D', 'Tecnico de Calidad', '2', '62025', '$2y$10$yX/3BVsknjb8PwJK4bRf3.lF31fcMi9lU7KNGJYwkj5ZF7gqE1OtW', '1977-01-14', 'Mario Chacon', '72893', 'HUS II', '2018-04-10'),
(5818, ' Jesus', 'Reyes Ortiz', 'Parajes de Oriente', 'C', 'Auxiliar de Recibos', '2', '62027', '$2y$10$rACgszcsMqxL04PgUONdjuyCoJitZR1nGv8hSl6fj/sfvpJxIkuAm', '1979-05-06', 'Bacilio Abel Rocha Carrillo', '68476', 'HUS II', '2018-04-12'),
(5819, ' Arturo', 'Martinez Soto', 'El Papalote', 'D', 'Operador de Criticos', '2', '62029', '$2y$10$13RTxFJc/ZDdHilr92br7O3rr/vwncl7DM6NyKmbAByp1R5JkFqOG', '1964-12-15', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2018-04-26'),
(5820, ' Armando', 'Rey Diaz', 'Tierra Nueva', 'D', 'Operador de Criticos', '2', '62032', '$2y$10$NbOTu8gupE31.oaDbwnKAOPCACOAJ.gCEq9OtzwYXdyiGHNNFZCW.', '1974-10-13', 'Erik Rey Mata Texna', '61890', 'HUS II', '2018-05-16'),
(5821, ' Carlos', 'Saavedra Gamboa', 'FRAC. URBIVILLA BONITA', 'D', 'Tecnico de Calidad', '2', '62035', '$2y$10$lTvg7aHL74q/h1vcDfbDqeqQEvy8gzIhoVT/3jaDcG2w2/7b2ANN6', '1994-08-23', 'Humberto Lopez Lopez', '61865', 'HUS II', '2018-05-24'),
(5822, ' Erick', 'Soto Armenta', 'Parajes del Valle', 'D', 'Operador de Criticos', '2', '62044', '$2y$10$Zl/i38doYqZ7hHhIuue2eOJwvxjeXKJR1yne2qSt66xAJB5.NNoOG', '1982-06-19', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2018-06-26'),
(5823, ' Carlos Alexis', 'Salazar Garcia', 'Loma Blanca', 'D', 'Tec Esp En Moldes', '2', '62047', '$2y$10$q0EXy8mAAi9Gdq3MFMAhC.qCnxGG9n8SrxPws2lHhY1yfs9drqPTG', '2000-03-03', 'Purata Enriquez, Misael', '33458', 'HUS II', '2018-07-10'),
(5824, ' Juan Francisco', 'Rosas Flores', 'Lomas del Desierto', 'D', 'Operador de Criticos', '2', '62052', '$2y$10$UaoH385L0a1uYLque.ro7.odOZvriieptjRV.wAnUl3/yLiG/JvuO', '1984-10-23', 'Talamantes Antunez, Jose Guada', '62051', 'HUS II', '2018-07-24'),
(5825, ' Marco Antonio', 'Galvan Dominguez', 'Carlos Chavira Becerra', 'D', 'Operador Secundario', '2', '62053', '$2y$10$ILA9qefoT3K7ErzC4PfVjuOcl.VzSYTt9B5jivRT6SqO/vREygQKK', '1982-03-20', 'Cecilia Adame Camacho', '97655', 'HUS II', '2018-07-24'),
(5826, ' Rene Horacio', 'Delgado Reyes', 'Urbi Villa del Cedro', 'D', 'Jefe Grupo Fundicion Die Cast Lenoir', '2', '62054', '$2y$10$VTSq3FI50mvAh4MW6vMG/uQ/6y8ZaF9WkTU/xtD65Qjm5HU.hapSe', '1992-06-27', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2018-07-24'),
(5827, ' Jorge Antonio', 'Gutierrez Alvarez', 'Parajes de San Juan', 'D', 'Tecnico de Calidad', '2', '62055', '$2y$10$jrwT6MUr/d6aqUz7MKnBoe9/SNHsXqL4tiggsJ7k1LkeDhU/WhDza', '1999-01-19', 'Mario Chacon', '72893', 'HUS II', '2018-07-25'),
(5828, ' Julio Cesar', 'Hernandez Cervantes', 'Parajes de Oriente', 'D', 'Operador de Criticos', '2', '62057', '$2y$10$yY099Vd4kT6o35yrVzWhl.7tkCq49n.II6Yf5PXzBwHxdFnnjqEty', '1985-04-15', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2018-08-07'),
(5829, ' Jose Cruz', 'Martinez Velez', 'Parajes del Sur', 'D', 'Operador de Criticos', '2', '62059', '$2y$10$/tqyNNd3YFjOhyPEmasuCeC2raKcudxHAKNHHK3/Z7CdTqlXDsb1C', '1975-10-17', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2018-08-07'),
(5830, ' Jorge', 'Sanchez Almeda', 'Parajes de San Isidro', 'D', 'Operador de Criticos', '2', '62060', '$2y$10$Hv0H5Jpej0ZjyLlu.LPiOud7tnce5WRoPdDTxEe6MKRd7nU1M3N1G', '1984-10-18', 'Santiago Antonio Pacheco', '72187', 'HUS II', '2018-08-07'),
(5831, ' Jesus Manuel', 'Hernandez Galvan', 'Salvarcar', 'D', 'Tecnico de Calidad', '2', '62061', '$2y$10$M2b.1bAv3vXA/He5c2PP9OeimH0eGCuIufbkKPE48LaVHbQ8cYhkG', '1972-05-09', 'Mario Chacon', '72893', 'HUS II', '2018-08-07'),
(5832, ' Francisco Jair', 'Ponce Mireles', 'Sierra Vista', 'D', 'Reparador Moldes Fibra', '2', '62062', '$2y$10$zbZ355iIJ/rBZYx5nLlzJ.erPEFn4KexVe5KJOLEPErmHTSCYvNrS', '1991-12-25', 'Reynaldo Mendoza', '88736', 'HUS II', '2018-08-07'),
(5833, ' Duilio Oswaldo', 'Isidro Manuel', 'Misiones del Real', 'D', 'Operador de Criticos', '2', '62067', '$2y$10$iZK5P6exbuHTUOTYFR8YrO7CRkAAPwJHY8R5L5ExCUSgepcLgBzDW', '2000-02-24', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2018-08-09'),
(5834, ' David', 'Navarro Betancourt', 'San Francisco', 'D', 'Operador de Criticos', '2', '62077', '$2y$10$wZpcgN3Cr5zSaATM9r9ITuTID4bipzthBlv6vHBAnB6CsZQIlf.lW', '1990-07-18', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2018-08-16'),
(5835, ' Jesus', 'Ramirez Ordaz', 'Roma', 'D', 'Operador de Criticos', '2', '62082', '$2y$10$On7bZsxb8tfFLpv9OZQPuO.ffmHZgqxV8FtK1ZfE.ZRYvWdKmvnei', '1976-01-02', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2018-08-20'),
(5836, ' Lazaro', 'Diaz Amaya', 'Parajes del Valle', 'D', 'Operador de Criticos', '2', '62090', '$2y$10$CRfmLqdTkAnOZJIizokC2e3uE5PrmIwxtItSMnWpSHAYd2xR6zqhS', '1980-08-29', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2018-08-29'),
(5837, ' Avelino', 'Colin Lempino', 'Praderas del Sol', 'D', 'Tecnico de Calidad', '2', '62093', '$2y$10$m/1QEEbWJGOJMMwWphPmVeDeC0nMGNRZQlwG1.SVjMnQJuGPdbXZC', '1981-01-11', 'Humberto Lopez Lopez', '61865', 'HUS II', '2018-08-31'),
(5838, ' David Daniel', 'Luna Baeza', 'Villas del Salvarcar', 'D', 'Operador de Criticos', '2', '62104', '$2y$10$MvEgASjhWTzzxmawSFQIJO0mOAz3Dr.kRp5kefMrimQkj/BjIC/rq', '1992-12-21', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2018-09-26'),
(5839, ' Ramon', 'Juanez Silos', 'Colinas del Sol', 'D', 'Tec Esp en Mtto Equipo', '2', '62121', '$2y$10$dexP3Ge42woyOIeuL9.oJ.YekgSk7D/YBPYXNVyekvA85ZZtYSto6', '1970-12-17', 'Ruben NuÃ±ez Adame', '100370', 'HUS II', '2018-10-03'),
(5840, ' Rodrigo De Jesus', 'Chirino Perez', 'Sierra Vista', 'D', 'Operador de Criticos', '2', '62123', '$2y$10$xO9qJNUNZvQJcpxnpK/VxeVvmyzqHZnFDhwJINnIBpuYstwLB6xnG', '1996-04-09', 'Cecilia Adame Camacho', '97655', 'HUS II', '2018-10-26'),
(5841, ' Juan', 'Gutierrez MuÃ±oz', 'Paraje de San Jose', 'D', 'Reparador Moldes Fibra', '2', '62130', '$2y$10$9UK/AVRPu1cvlO/mL3y1zOXYWH0E6vup28NOBhJyIRCUIz1.ZlzPO', '1981-06-24', 'Reynaldo Mendoza', '88736', 'HUS II', '2018-11-06'),
(5842, ' Jose Angel', 'Gutierrez Martinez', 'Manuel Valdez', 'D', 'Operador de Set Up', '2', '62145', '$2y$10$feGlQNmXNM5AYXnfWAOtUeUHjox20jlGr5kqkBRIeCkeekEbRQpSK', '1998-09-21', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2018-12-13'),
(5843, ' Orlando Felipe', 'Aguirre Cortez', 'AmpliaciÃ³n Aeropuerto', 'D', 'Operador de Set Up', '1', '62165', '$2y$10$QR/TRXSzexEwDJG54LkuLu.3kYZdMTt1pI8MwXFV4CwVWmS.PZBka', '1984-02-05', 'Sanchez Cordova, Rene', '41563', 'HES', '2019-01-03'),
(5844, ' Agustina', 'Atayde Acosta', 'Hacienda de las Torres I', 'D', 'Operador General', '1', '62190', '$2y$10$KT3U.PLZjjRWrm0a9jWrUeXHYEqJWRVP7MxpycZ8a5HV630Zd71aK', '1971-08-28', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2019-01-07'),
(5845, ' Oscar Ivan', 'Rodriguez Picazo', 'El Roble', 'D', 'Operador de Secundarios', '1', '62214', '$2y$10$s2NX4EXXoc/iZWdF5PMD8e3k6MCWY.5x0M71tw9Psui8Gc8w6GdVi', '1989-11-03', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2019-01-07'),
(5846, ' Roberto', 'Cruz Ochoa', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '62230', '$2y$10$dIBIpc9z0jFRqCyAvHqo3utFBrcuT3yYxTtD/MLcXXWIYeahlB2oK', '1973-06-07', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2019-01-07'),
(5847, ' Isaac', 'Bravo Miguel', 'Parajes del Sur', 'D', 'Operador Especialista', '1', '62265', '$2y$10$27gUkB0VBU622UcSsT2rmOUIzHW9eTWwcgr6GsVcpPx7EVigfsIGG', '1996-05-21', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2019-01-09'),
(5848, ' Julio Cesar', 'Suastegui Martinez', 'Riveras del Bravo', 'D', 'Operador De Procesos', '1', '62300', '$2y$10$hDuErsqloPIJ2qD3P.J1POgerowfK/hkR8qK4ID97egkQUef0gf2a', '1997-08-28', 'Saul Arellano Escobar', '97722', 'HUS', '2019-01-09'),
(5849, ' Ismael', 'Roman Gonzalez', 'Villas de AlcalÃ¡', 'D', 'Tecnico de Calidad', '1', '62309', '$2y$10$5wP5kNZ22hf5.M88aU3JbelYBjgSdv6dsGtori0HTEL5DbmqHwhi6', '1994-02-25', 'Rodriguez Celaya, Ramiro', '24790', 'HUS', '2019-01-10'),
(5850, ' Adan', 'Reyes Roman', 'Villas de AlcalÃ¡', 'D', 'Operador De Procesos', '1', '62310', '$2y$10$BI4LEdD.8Z806F1JPy7NuOO/E3G3hKwdYi2AIy3pw/1WbGeJ.SY0y', '1995-09-19', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2019-01-10'),
(5851, ' Juana', 'Padia Perez', 'Fracc. Universidad', 'D', 'Operador General', '1', '62359', '$2y$10$2U72gapgsgOOoRBq2Pt2duR/hd5EdGf2PNzy8GXkxg87JcjryICfy', '1973-03-16', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2019-01-14'),
(5852, ' Rosa Maria', 'Cagal Chiguil', 'Las Haciendas', 'D', 'Operador General', '1', '62383', '$2y$10$uCwzhlxhnrVDYQcP/65W8ezgMMunFi1OhEobA4rtkyZdboaD8B7OO', '1979-03-04', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2019-01-11'),
(5853, ' Juan', 'Merlin Limon', 'Las Gladiolas', 'D', 'Operador de Criticos', '2', '62399', '$2y$10$2p6qg1qXACRElYZ0g78f.O8JXLzGlPwzIzwja.apMMQl4EZe/zs3C', '1996-11-23', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2019-01-10'),
(5854, ' Jose Bernau', 'Ruiz Martinez', 'Cerradas San Angel', 'D', 'Operador de Set Up', '2', '62410', '$2y$10$MQHEY.35fFbQpb0gZhDe8eH54imuZ1AOnwS0aABln0miUQqwyRz4C', '1999-03-19', 'Santiago Antonio Pacheco', '72187', 'HUS II', '2019-01-14'),
(5855, ' Jose Manuel', 'Soto Lozano', 'Hacienda de las Torres', 'D', 'Tec Mtto Equipo de Moldeo', '1', '84287', '$2y$10$nYFvkdDpdH00CcYJqrPcye2hfZt6n18BkiXyTf4KzaxpIOjG4v032', '1979-02-04', 'Castro Molina, Jesus', '46787', 'HUS', '2019-01-21'),
(5856, ' Norma Alicia', 'Vela Guerrero', 'Urbi Villa del Cedro', 'D', 'Operador General', '1', '84293', '$2y$10$VVBGmRjEtGS6PGe6ROF2b.I2T9WE8PdDEliVKD/oL80ff55hyJU/u', '1979-10-26', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2019-01-22'),
(5857, ' Victor Manuel', 'Armijo Guel', 'Parajes de Oriente', 'D', 'Operador de Secundarios', '1', '84294', '$2y$10$0ro4P6fF0Ls3Fp1BMywLq.l4VII9Z1DwpfuzG2hB19CVn5NCxiT8a', '1972-09-10', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2019-01-22'),
(5858, ' Ana Karen', 'Pablo Sanchez', 'Parajes de Oriente', 'D', 'Operador De Procesos', '1', '84297', '$2y$10$DuH2vWLaWBnMrIpZrNgf3OVt15G6mXhXUOhjxiu.oBiEhZli6t75C', '1989-03-02', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2019-01-22'),
(5859, ' Juan Lorenzo', 'Gomez Carrillo', 'Oriente Salvarcar', 'D', 'Operador General', '1', '84316', '$2y$10$TAAUp9vnMP.cw7iFLtokY.ytPpNP61g.1cwXa8QVTyDeP0mKUkSue', '1978-08-10', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2019-01-28'),
(5860, ' Yessica', 'Torres Jimenez', 'Cerrada del Sur', 'D', 'Operador General', '1', '84317', '$2y$10$4S76yeY8D/0WF3kXU3NJoO9uwwkJJPXClf3egTA/U0gkKeo5ZVkii', '1992-10-22', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2019-01-28'),
(5861, ' Saul', 'Saucedo Lopez', 'Urbi Villa del Campo', 'D', 'Operador de Set Up', '1', '84336', '$2y$10$x7c3FK0rENP.aJvHcj73MuX8UgkJG3ApplXSW1YcPLGX/ed/M1Nfi', '1975-12-10', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2019-01-30'),
(5862, ' German', 'Salinas Romero', 'Manuel Valdez', 'D', 'Operador De Procesos', '1', '84341', '$2y$10$KglnhcDk89PS8bIkEy0B9O0x3gXCGKIAiYgLZPGR3fXLQF5EQAYja', '1999-11-24', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2019-01-31'),
(5863, ' Rito', 'OrdoÃ±ez Jimenez', 'Senderos de San Isidro', 'D', 'Operador Especialista', '1', '84352', '$2y$10$1q1H.8QP9vOI3tVhDwTYLOtD.Vr05a9V14945zw72.C0w15xugBLa', '1990-07-27', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2019-02-01'),
(5864, ' Jorge Alberto', 'Medina Jaime', 'Parajes de Oriente', 'D', 'Lider de Control de Calidad', '1', '84362', '$2y$10$D6ChieNVNSXwb.WRfRogxOwzzsUxatlCJDpqhLwuEU4AbLn8H.sIC', '1999-08-17', 'Jose Ruiz', '74929', 'HUS', '2019-02-06'),
(5865, ' Emanuel', 'Hernandez Castelan', 'Fray Garcia de San Franci', 'D', 'Tecnico en Entrenamiento', '1', '84365', '$2y$10$xFkMqR.34GhGh/ehnBxqVeDGqhia8yOKVwjCuYgvbX0OGKNvY.q6O', '1994-06-02', 'Jorge Alejandro Ayabar DÃ­az', '66945', 'HUS', '2019-02-06'),
(5866, ' Elvis', 'Santander Pouse', 'Parajes de Oriente', 'D', 'Operador Especialista', '1', '84372', '$2y$10$xW5nLsmFiP1E0bngcbp.LuLJMArEKAapNrIMPwM3i.CSNeGWlOPVS', '1990-01-25', 'Arellano Mota, Arturo', '24791', 'HUS', NULL),
(5867, ' David', 'Flores Lopez', 'Riveras del Bravo', 'D', 'Operador De Procesos', '1', '84380', '$2y$10$N/mf5LEGbo/osNcW95CxrO4NAYdlUZxKagp/wNSTOyWV1r8Iwal5q', '1971-07-11', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2019-02-13'),
(5868, ' Miguel Antonio', 'Zamora Vaquera', 'Residencial Harmoni', 'D', 'Tec Mtto Equipo de Moldeo', '1', '84391', '$2y$10$./r3w6SSMQOfGSKsqPCU0On2G6qZYeM.OymEGWOtJX3IFnoCLfNy2', '1990-10-28', 'Castro Molina, Jesus', '46787', 'HUS', '2019-02-18'),
(5869, ' Maribel', 'Escobedo Cornejo', 'Manuel Valdez', 'D', 'Operador De Procesos', '1', '84395', '$2y$10$XrhO7V5ZKIwxykdZC0Y.t./kWFZKL2LC.HI0TCvOqgevetCFh7X7m', '1975-10-27', 'Arellano Mota, Arturo', '24791', 'HUS', '2019-02-19'),
(5870, ' Olivia', 'Pedroza Valdez', 'Medanos', 'D', 'Operador General', '1', '84400', '$2y$10$Im/feUJgGqLMfAMO6lj2tu0ww/P.KZ9W4QeI5rBVLtW0AcRsaLtxy', '1970-04-25', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2019-01-22'),
(5871, ' Luis Armando', 'Carreon Jimenez', 'Las Haciendas', 'D', 'Jefe Grupo Fundicion Die Cast Lenoir', '2', '84402', '$2y$10$VtmIwI0.1CReOd2HURtDzefrPtqJHl1ATR8EQB/0soKkD5pUh.Niu', '1984-01-01', 'Cecilia Adame Camacho', '97655', 'HUS II', '2019-01-22'),
(5872, ' Edwin Alonso', 'Morales Vargas', 'Rincones de Salvarcar', 'D', 'Jefe de Grupo de Conteos Ciclicos', '2', '84415', '$2y$10$Jv8VI69nvkJjFaRmUQ4kyeV4OORv7rkhzH/Wy8CHaKf9/Up1v0AFu', '1994-10-26', 'Cynthia Cisneros Medina', '75689', 'HUS II', '2019-01-30'),
(5873, ' Oscar', 'Moreno Garcia', 'Parajes del Sur', 'D', 'Reparador Moldes Fibra', '2', '84421', '$2y$10$H6OwAkfN0/sHh5TNEDjkD.NaSRzShUYHo2o1fI4myksW2cd1Cj4q.', '1979-08-07', 'Reynaldo Mendoza', '88736', 'HUS II', '2019-02-07'),
(5874, ' Rogelio', 'Rios Fonseca', 'Parajes de Oriente', 'D', 'Tecnico en Entrenamiento', '1', '84423', '$2y$10$yEqh0owxrn3BLsWHrFnDneMxl.IAXyzkfkE3KdWvsOc3QSsZm8tfq', '1990-10-11', 'Jorge Alejandro Ayabar DÃ­az', '66945', 'HUS', '2019-02-07'),
(5875, ' Abdiel', 'Perez Perez', 'Sierra Vista', 'D', 'Operador de Criticos', '2', '84428', '$2y$10$8uJ7Lf6qZ27mp2EZlSs/JuWl1Dwjd8NtwsqyaPLcGKnOl/NV9sxOe', '1997-03-01', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2019-02-12'),
(5876, ' Martin', 'Martinez Cisneros', 'Carlos Castillo Peraza', 'D', 'Almacenista', '2', '84436', '$2y$10$IguvBtups3aoU5vt0KSifemrQQs3TYDXoPmCwxErmrIuBtep6UVTa', '1973-11-11', 'Reynaldo Mendoza', '88736', 'HUS II', '2019-02-13'),
(5877, ' Oscar Alejandro', 'Garcia Gutierrez', 'Cerradas San Pedro', 'D', 'Tecnico de Calidad', '2', '84437', '$2y$10$v4GZlSfwrJQY7TL99DKR1eciDqtP8QcvvF.gxE9wU.KhJn8lHyVJ2', '1991-10-21', 'Humberto Lopez Lopez', '61865', 'HUS II', '2019-02-13'),
(5878, ' Saul', 'PiÃ±a Flores', 'Misiones del Real', 'D', 'Tecnico Electromecanico', '1', '84442', '$2y$10$5ATOYbkqFHaP3r.WtPy97O8tgkea7rFEcnOkxuCDW3mqX6M/64F9C', '1973-01-06', 'Martinez Gonzalez Fernando', '24731', 'HES', '1997-09-10'),
(5879, ' Ma Aurelia', 'Contreras Soto', 'Parajes del Sur', 'D', 'Operador De Procesos', '1', '84445', '$2y$10$fCoHzRl33reDy0RPAMJ7/espDOa2x39Bb5/4sBAZQUy6njEoAJ.ie', '1966-11-12', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '1996-08-05'),
(5880, ' Juana Carmen', 'Robles Medina', 'Lucio Blanco', 'D', 'Operador General', '1', '84449', '$2y$10$jax710m.1Y0gh5oJSkkMwOiITjVQ2.8U3TRYf0CJsoaB3Kyxo5IUC', '1964-07-12', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '1996-01-01'),
(5881, ' Hilda', 'Angon De Luna', 'Parajes del Sur', 'D', 'Operador De Procesos', '1', '84450', '$2y$10$SgIUaJ6vVdP8ajUZwa56iuBYFFxC9kkwR76nPIycFbhiITu6bWwUK', '1969-12-17', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2002-04-15'),
(5882, ' Maribel', 'Soto Valenzuela', 'Hacienda de las Torres', 'D', 'Tecnico de Calidad', '1', '84451', '$2y$10$u7L65zIZLKD979mZg1GvUObYwT9CV9uS9OtUMTu2eSj9s3lQliE.u', '1969-10-28', 'Esteban Vazquez', '84463', 'HES', '1996-01-16'),
(5883, ' Juan', 'Martinez Vazquez', 'villa jardin', 'C', 'Auxiliar de Recibos', '1', '84452', '$2y$10$WljBnlwLIKSvgEXgOWOs5eiP/qkpKTji5eSi0b20pxdFZpN6gY5IC', '1968-11-28', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '1999-04-07'),
(5884, ' Jose Francisco', 'Garcia Hernandez', 'Torres del Sur', 'D', 'Almacenista', '1', '84453', '$2y$10$/wEkaimG2lzw6aoeub13oOmyKQesRubX1V2.n0d1dgHl8iMawczqy', '1969-01-01', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '1996-01-30'),
(5885, ' Jose Guadalupe', 'Castro Briones', 'Ampliacion Aeropuerto', 'D', 'Tecnico de Calidad', '1', '84454', '$2y$10$e4gaFsp4qC8.sYiwra8UH.FzXAysWOhma.y5y7BV3w7Egtn3B.W9S', '1971-05-12', 'Kevin Adrian Martinez Orozco', '300062', 'HUS', '1996-03-12'),
(5886, ' Isaias', 'Delgado Martinez', 'Hacienda de las Torres', 'D', 'T.Lider Automatizacion Control', '1', '84455', '$2y$10$D9PjdRbxl1QlXskU3oOWcOGjP9smtjRfiMa4qgJg922KCY0a3PemO', '1977-02-01', 'Martinez Gonzalez Fernando', '24731', 'HES', '1996-03-12'),
(5887, ' Clemente', 'Delgadillo Moreno', 'Jardines Residencial', 'D', 'Tec Esp en Mtto Equipo', '1', '84457', '$2y$10$pDejOQ0Fquvg5VVgOkGBoe98WntLxmJjY90ABi3C0CwgluZMtE4bi', '1970-11-23', 'Martinez Gonzalez Fernando', '24731', 'HES', '1997-09-02'),
(5888, ' Abelardo', 'Vega Castro', 'Misiones del Real', 'D', 'Tecnico Electromecanico', '1', '84458', '$2y$10$2tI/T7sTjg6IeZKG6G1iG.9CWaU6lFATn5negby1a.mxEIHmMarHG', '1972-06-22', 'Martinez Gonzalez Fernando', '24731', 'HES', '2012-06-27'),
(5889, ' Vicente Humberto', 'NuÃ±ez Perez', 'Riveras del Bravo', 'D', 'Operador General', '1', '84460', '$2y$10$DYyHzpUdW3OOHecpqELG3.G18sqxApPwii4V.SpKinly5M32znNHO', '1979-05-30', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '1996-10-21'),
(5890, ' Maria Del Socorro', 'ZuÃ±iga Puga', 'Misiones del Real', 'D', 'Jefe de Grupo', '1', '84461', '$2y$10$kM1tz79xKUvJUJCW3R.sTuNo74n8fCbLslCmLQPL3WyBgBcgWeKem', '1966-05-06', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '1997-01-13'),
(5891, ' Martha Yolanda', 'ZuÃ±iga Puga', 'Parajes del Sur', 'D', 'Operador General', '1', '84466', '$2y$10$fo/jtXrG4Z9rq0xzGrQQ..miKZid3D1ZdPm6eCPVua5I6NzcdnaAK', '1972-05-25', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '1997-02-17'),
(5892, ' Jose Manuel', 'Montero Cruz', 'La Perla', 'D', 'Tecnico de Calidad', '1', '84467', '$2y$10$5GBHXdrYd1zePUfa6EJuLekcRoIIEoTTOUJIK0/gsKyr0xs8..Dba', '1975-11-02', 'Kevin Adrian Martinez Orozco', '300062', 'HUS', '1997-03-03'),
(5893, ' Guerrero', 'Saenz Rios', 'Hacienda de las Torres', 'D', 'Lider de Produccion', '1', '84468', '$2y$10$zfMtnyidzNP5W5E4TMRgi.zqny1kt3wA6AoOaa0ePDEbH1SFjOohq', '1974-03-01', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '1997-03-03'),
(5894, ' Fernando', 'Gonzalez Rubio', 'Inf Juarez Nuevo', 'D', 'Tec Esp en Mtto Equipo', '1', '84471', '$2y$10$11lPv./XK1.VeUy7QRE5lOra1kes.aYb1MLgU1XM4YsiycF0l.as2', '1978-09-24', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '1997-05-19'),
(5895, ' Julian', 'Alba Cardiel', 'Salvarcar', 'D', 'Operador De Procesos', '1', '84472', '$2y$10$Cr7tvIvWi2ZVDlefIPnGX.q8fX96r5RJFGfEQ7LU.IsveHClnBKvK', '1969-02-16', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '1997-06-02'),
(5896, ' Jose', 'Velazquez Martinez', 'El Mezquital', 'D', 'Operador de Criticos', '1', '84473', '$2y$10$S/txAyGRaBKHUHR.tY2IK.5wAM1j.PsWZoDSbpN7gxd9woLDxMuCi', '1965-03-17', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2010-02-11'),
(5897, ' Hector Manuel', 'Juarez Solis', 'Torres del Pri', 'D', 'Almacenista', '1', '84475', '$2y$10$N1Ydtl3hej.XVk3.inV/duK/yddLohGGzWUJrCT7gmIK5E/ncKnTG', '1969-05-20', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '1997-08-06'),
(5898, ' Enrique', 'Contreras Valdez', 'Parajes del Valle', 'D', 'Operador de Set Up', '1', '84477', '$2y$10$cjrEkdRfF10JryBx7TyEdehOXv7ac6Nm4xAnDG/1MOp/jfWh/Zyk.', '1980-07-23', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '1997-08-26'),
(5899, ' Cesar', 'Marquez Aguirre', 'Riveras del Bravo', 'D', 'Tec. Seguridad Industrial Sr', '1', '84478', '$2y$10$xQBqgvTxW7QhwTpnSz/JDurO8JKP9a.0ddPHbO4HcUUWtsZhwWlBa', '1981-12-20', 'Jessica Alejandra Aguilar Guti', '109077', 'HUS', '1997-09-02'),
(5900, ' Margarita', 'Sevilla Hernandez', 'El Sauzal', 'D', 'Operador General', '1', '84480', '$2y$10$CRhIjpG.SdWvDIsYstlcM.EuRU.6jGChp1avrKPwIz6Qd.q28NBjW', '1963-07-12', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '1998-01-14'),
(5901, ' Fidel', 'Castro Cob', 'Hacienda de las Torres', 'D', 'Tecnico de Calibracion', '1', '84483', '$2y$10$/83Kpkppc9smH.BQ.UvDnOoIAslDQKRii1vGnk8jLJ/QbDzEG27Ka', '1974-06-09', 'Oscar Garcia', '59965', 'HES', '1998-04-01'),
(5902, ' Jose Antonio', 'Hernandez Diaz', 'Hacienda de las Torres Un', 'D', 'Lider de Embarques', '1', '84484', '$2y$10$MX0y/8nHvcybKzUBuBrowe9U7CSjzXd.NteS7yPkvz761VxgG3.kW', '1973-04-12', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '1998-06-02'),
(5903, ' Hector Angel', 'Colacion Cazarez', 'Roma', 'D', 'Jefe De Grupo De Almacen', '1', '84485', '$2y$10$0S2B5kPwtaKwgQjQl9U4eu4jN843UHyPRWev5G0X/KBfqIf0EgheG', '1974-05-05', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '1999-04-26'),
(5904, ' Ma. Guadalupe', 'Salazar Hernandez', 'Ampliacion Aeropuerto', 'D', 'Operador General', '1', '84486', '$2y$10$JPfn0SOOVXjapFQowXtW4uk3oKRCOTjMsmnXT44k9Fyy5GIAFyfAy', '1965-12-26', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '1998-06-22'),
(5905, ' Elizabeth Fabiola', 'Ayala Morelos', 'El Mezquital', 'D', 'Operador General', '1', '84491', '$2y$10$j7b/LxasxcCxVG6ANRc3Lewq0cOn/erhMFDUgCaQE.nNbViuTBrLu', '1979-05-05', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '1998-08-06'),
(5906, ' Lida Marlene', 'Flores Ronquillo', 'Infonavit Angel Trias', 'D', 'Operador De Procesos', '1', '84494', '$2y$10$Bl5LZ8MjNeR6cOCUzvUaRe2EjadsdBOguQVHLC.gxNvlqMdv619Vi', '1975-05-22', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '1998-09-01'),
(5907, ' Maria Eva', 'Avila Rios', 'Riveras del Bravo II', 'D', 'Operador General', '1', '84495', '$2y$10$4zB0h2Paf1cy/FdAyNAVFO7klDi/RWZivTCGXwDrWGgePK/CFjo52', '1967-03-14', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2000-08-22'),
(5908, ' Arnulfo', 'Rivera Villalobos', 'Arturo Gamiz', 'D', 'Lider de Produccion', '1', '84497', '$2y$10$ySpyTjTloywHjsGNVhwX0.fbrF9lnh9iOogZoUyIar3iJTrMSnRfS', '1973-04-13', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '1998-10-15'),
(5909, ' David Leonardo', 'Del Villar Gasca', 'Rincones de Salvarcar', 'D', 'Operador de Set Up', '1', '84503', '$2y$10$rBiUYcdCOqYcVy382YyLg.NN9kt34angcSHMYPK0Ta.h1lnbv6uvS', '1982-11-22', 'Vania Garcia', '100540', 'HUS', '1999-01-05'),
(5910, ' Jesus', 'Ramirez Martinez', 'hacienda de las torres un', 'D', 'Jefe de Grupo', '1', '84505', '$2y$10$4EH/6DiiYqmL7m3WyCJwKutZOCtfaiT9FVJYJ80YQiOnmxDSObuae', '1973-12-19', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '1999-01-11'),
(5911, ' Ulices', 'Gutierrez PiÃ±on', 'Parajes del Valle', 'D', 'Set-Up Produccion', '1', '84508', '$2y$10$45GMNK/xoFZqwktUNY.LGeWy3iTehVjaMyIVNeuxb8axAuu0jyBoC', '1979-01-18', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '1999-01-26'),
(5912, ' Jesus Mario', 'Manzanares Valenzuela', 'Fuentes del Valle', 'D', 'Operador de Set Up', '1', '84509', '$2y$10$pPOuRosOHIJUwvB/BCH3xu4/XHBk2LHVq0Lk3IyOnPyJ/gruQFJE.', '1968-10-02', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '1999-02-09'),
(5913, ' Maria Luz Elena', 'Gonzalez Escobedo', 'Inf Juarez Nuevo', 'D', 'Operador De Procesos', '1', '84510', '$2y$10$MvqXKiZ7YlVapcxZbNved.Kd4HHHwcWuNk3obbEaK53SMTWwwr/r.', '1964-05-11', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '1999-02-17'),
(5914, ' Ruben', 'Cabriales Solis', 'Riveras del Bravo', 'D', 'Almacenista', '1', '84511', '$2y$10$Utuz/X8W9nBbfD5NbzBdEOdSR2.c0JNt4Sm7Yk1vFSoOUgkEybvN.', '1966-04-10', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '1999-02-17'),
(5915, ' Oscar Alonso', 'Arellano Lugo', 'Parajes del Sur', 'D', 'SetUp Produccion', '1', '84513', '$2y$10$ePcvcUR1fqhzAZHHsnbolOQArqrCn4X1V9mDi6M9vP/prd4LLB.UW', '1977-12-09', 'Raul Zamora,', '25584', 'HUS', '1999-02-17'),
(5916, ' Luz Maria', 'Marin Soto', 'Horizontes del Sur', 'D', 'Operador De Procesos', '1', '84516', '$2y$10$qC7tA2WlOJdNQjaD/rX3rOnwOEGUcmFMCiD/EJSHMxz2yMnoXiWWO', '1966-10-14', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '1999-03-24'),
(5917, ' Lilia', 'Salazar Solis', 'Riveras del Bravo', 'D', 'Operador General', '1', '84518', '$2y$10$Fm5ZYDXtAiUH7yjWzNvdyOQBYg0EiSOqcC28pcocX/pH4quLsiYiO', '1976-06-28', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '1999-05-26'),
(5918, ' Blanca Estela', 'Avila Ogaz', 'Pie de Casa el Granjero', 'D', 'Operador General', '1', '84520', '$2y$10$bYqVARsq8mOE.gHeBKcebup6S3q5m//s0v5Tr64tSuI.nfyWOylHy', '1966-01-30', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '1999-10-05'),
(5919, ' Jose Juan', 'Ramirez YaÃ±ez', 'Universidad', 'D', 'Tec Esp en Troqueles', '1', '84521', '$2y$10$6.7GJ2sIAhYHa.cQ.atTIuUuahu.HJBVDI5tuYi05NzMW9wMg32/2', '1970-04-25', 'Favela Alvarado, Jose Luis', '25333', 'HES', '1999-11-15'),
(5920, ' Juan Antonio', 'Fraustro Robles', 'Hacienda de las Torres', 'D', 'Tec Esp en Mtto Equipo', '1', '84522', '$2y$10$aMS0PCLjI7XPmGCTA3QaoeIbzXp6dbrBXiGqqSSR4RXQHV3WZiceS', '1966-12-16', 'Martinez Gonzalez Fernando', '24731', 'HES', '1999-11-17'),
(5921, ' Felipe Neri', 'Torres Luna', 'Hacienda de las Torres', 'D', 'Tec Esp en Troqueles', '1', '84525', '$2y$10$BJ3gqQrUqOsOSE.29KVys.O42GSmXWPhI58PPlte1KP7iVbykNcC6', '1975-05-26', 'Favela Alvarado, Jose Luis', '25333', 'HES', '2000-02-09'),
(5922, ' Juan Manuel', 'Quezada Campos', 'Parajes del Oriente', 'D', 'Tec Esp en Troqueles', '1', '84528', '$2y$10$/c066tuiolaycqCMJfylN.bVB.dtfldeVt4ellOXC19uM7N04y1Ca', '1977-12-20', 'Favela Alvarado, Jose Luis', '25333', 'HES', '2000-02-29'),
(5923, ' Maria Elena', 'Valadez Hinojos', 'Riveras del Bravo', 'D', 'Operador De Procesos', '1', '84531', '$2y$10$BAeu2JgZb0YKrm8PYtSrQuJdvzoTkmYCuJEiI5IIp0wj6PnCfi0N6', '1965-08-13', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2000-03-21'),
(5924, ' Hilda Ludivina', 'Aguilera Escobedo', 'Oasis Revolucion', 'D', 'Operador General', '1', '84532', '$2y$10$3Vb8Vx978jfX5TUc7vTt.emcwHSeZ5KBR0IBi1Bil0iyaF34VDyeu', '1962-05-23', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2000-04-03'),
(5925, ' Natanael', 'Jimenez Ramirez', 'Parajes del Valle', 'D', 'Jefe De Grupo De Almacen', '1', '84533', '$2y$10$75A5sCA47yR6d6teoaE5k.VN6PvETthwInNOmcm6ZWrwPuuSPy.hy', '1978-11-18', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2000-05-03'),
(5926, ' Honorina', 'Galindo Bargas', 'Villas de AlcalÃ¡', 'D', 'Operador General', '1', '84534', '$2y$10$Kbia/1abWh/3fmWakEe4ceCPKRyQsP4.03v/GqMyIjZjnIZEtBim6', '1962-02-27', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2000-05-03'),
(5927, ' Amanda', 'Vega Parra', 'Del Real', 'D', 'Operador General', '1', '84535', '$2y$10$gAEVQYfTYgNR9N6ISs.vd.xj9Itdc6iEw9QB8ueyjR0YWKlCo83o.', '1969-08-25', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2000-06-12'),
(5928, ' Erika Manuela', 'Manjarrez Sevilla', 'Parajes del Oriente', 'D', 'Operador de Secundarios', '1', '84536', '$2y$10$NFzjKHzv5RlZnkKm7yQgmOUxxW7vB.vMZpFSthyJCmXdlUJRJ4HEu', '1981-12-27', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2000-06-28'),
(5929, ' Samuel', 'Carmona Mendez', 'Riveras del Bravo', 'D', 'Tec Esp en Mtto Equipo', '1', '84539', '$2y$10$7ps9yUZhkdOQfWPkw3jZQulntt8ueO/9sAQG/iUAH9KPEBIWz38i6', '1975-01-21', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2000-07-11'),
(5930, ' Benjamin', 'Garcia Martinez', 'Ciudad Moderna', 'D', 'Materialista', '1', '84540', '$2y$10$MS72qKjicPqsg76R6yQA3OH1yReQau3mTTJgWSQKLDcPG35csGr3u', '1966-12-30', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2000-07-26'),
(5931, ' Andrea', 'Contrera Roque', 'Carlos Castillo Peraza', 'D', 'Operador De Procesos', '2', '84543', '$2y$10$TPFfgKe81bet.b7qJQ4UpOCuY4Qkz5TVkLl4Pi0JVB17vxJQzGKGa', '1965-02-17', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2000-08-14'),
(5932, ' Gregorio', 'Vasquez Lopez', 'Carlos Castillo Peraza', 'D', 'Operador de Secundarios', '1', '84546', '$2y$10$cKRyQ87xttsULdlAjvcg../hXjq8TKhsAa7hJDBQRNtZPGspNtwCS', '1967-05-14', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2000-08-22'),
(5933, ' Bertina', 'Jacquez Aguilar', 'Hermila', 'D', 'Operador General', '1', '84547', '$2y$10$WxEEh6fFYRmckiXgOgmUZu/5WvfvnUB4zWVTvnEfURWkoEXE42Qq6', '1965-09-11', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2000-08-22'),
(5934, ' Ana Alicia', 'De la Cruz Lopez', 'Parajes del Sur', 'D', 'Encargado de Tool Crib', '2', '84549', '$2y$10$HPXxqJ7rpPtj7SDm1NmxO.uWqToqSGF67WW9mABSA9QvGYmi6ZJhe', '1977-08-26', 'Leyva Corral, Jose Ramon', '25229', 'HUS II', '2006-02-22'),
(5935, ' Laura Elena', 'Ruiz Sifuentes', 'Hacienda de las Torres Un', 'D', 'Jefe de Grupo', '1', '84551', '$2y$10$ZugZAHBxHYLooij9aOuR1OFSeiT6dkfvRCr5Yc693zIbJpXPfSIsa', '1971-05-15', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2000-11-16'),
(5936, ' Venigno', 'Perez Ramirez', 'RÃ­o Grande', 'D', 'Tec Esp en Mtto Equipo', '1', '84552', '$2y$10$gt4AvBIqVCd9.Eyh50IO1eyD9QkmLcMntXrj4wKO1PU9Oiw396wEW', '1967-04-19', 'Martinez Gonzalez Fernando', '24731', 'HES', '2000-12-20'),
(5937, ' Victor Antonio', 'Manjarrez Sevilla', 'Villas de AlcalÃ¡', 'D', 'Operador de Secundarios', '1', '84553', '$2y$10$ZDlmY81yPNY25.Pr3t6bnuXwWMtnz12aMm9T8Ee41aClKtaxykAIC', '1983-07-19', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2010-05-05'),
(5938, ' Aida', 'Diaz Gomez', 'Ampliacion Aeropuerto', 'D', 'Operador de Secundarios', '1', '84555', '$2y$10$FrKwuNeklq8tCj6XKxUQy.pdzc0EeNz3jUgIMFBphKKiTQ.HpsajG', '1964-09-25', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2001-10-08'),
(5939, ' Gerardo', 'Robles Morales', 'Parajes del Oriente', 'D', 'Tecnico de Control Ambiental', '1', '84556', '$2y$10$FiNaK7db6uYsxLDeUr/6f./jrB44VQAgXFd8PuLzCfI4Hu4cn9NBu', '1981-12-24', 'Jessica Alejandra Aguilar Guti', '109077', 'HUS', '2006-02-27'),
(5940, ' Jaime', 'Fierro Martinez', 'Parajes del Oriente', 'D', 'Operador de Set Up', '1', '84557', '$2y$10$6T0EZbM0UHvFrpilLkMk6uTkqwkJuMB7uUZGIhB99kJoJs/5gXi2a', '1982-12-02', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2002-04-08'),
(5941, ' Brenda Erika', 'Marrufo Herrera', 'Infonavit Juarez Nuevo', 'D', 'Operador General', '1', '84558', '$2y$10$IohBLOvagGQEbCEYdrPVgeDZFO6mvjnCi7j78F0SWvM9YBgSr3lMi', '1979-12-14', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2017-05-03'),
(5942, ' Miguel Heberto', 'Angon Luna', 'Aguilas de Zaragoza', 'D', 'Operador Especialista', '1', '84559', '$2y$10$BQiWDwRWALspJclIOu754OA/u51sQd.0VNkPVY/GHmAakv6dhmsum', '1973-11-18', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2002-06-18'),
(5943, ' Julio', 'Rodriguez Perez', 'Praderas del Sur', 'D', 'Operador de Secundarios', '1', '84560', '$2y$10$oulwQ5V32MRTDsYVGKwb4ueetIm.VP0w8EoAQg83.FGk6jN9d8pPi', '1982-04-12', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2002-06-18'),
(5944, ' Gerardo', 'Angon De Luna', 'Roma', 'D', 'Inspector Control de Calidad', '1', '84561', '$2y$10$Gnig3f0NsX2d7OYIwgp/w.KfsZxRyPqmEmGN34k/tfq/a/refGvx2', '1971-01-18', 'Esteban Vazquez', '84463', 'HES', '2002-06-18'),
(5945, ' Rebeca', 'Saenz Rios', 'Parajes del Sur', 'D', 'Operador General', '1', '84562', '$2y$10$rIXRyupd95cdIbrGRZRRnuwJD4yv3ktB4PtZtjo.ocpcYKh53oZhK', '1968-08-26', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2002-06-25'),
(5946, ' Ramon Manuel', 'Fernandez Rivera', 'Hacienda de las Torres', 'D', 'Tecnico Electromecanico', '1', '84564', '$2y$10$eEtaMUNZoCpD/4ezBq7k9uCZbqR29kyL7Juw/evh5g6jBJ1.ehuuW', '1965-01-01', 'Martinez Gonzalez Fernando', '24731', 'HES', '2002-09-02'),
(5947, ' Ricardo', 'Saravia Fuentes', 'Paseo de las Torres', 'D', 'Operador de Criticos', '1', '84565', '$2y$10$ti0/7WjwONSYPTZNyo693e.aYdCszdDVJqu7NhsCcN731h18h3QS6', '1966-04-20', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2007-06-11'),
(5948, ' Amada', 'Estrada Espinoza', 'Rincones de Salvarcar', 'D', 'Operador de Secundarios', '1', '84566', '$2y$10$tBzYNuWvc9pYUFKoIVnkLuK/uueDv57OclHNw427hYnuIuP0KVU4m', '1971-09-13', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2003-01-14'),
(5949, ' Francisco', 'Vazquez Rivera', 'Parajes del Oriente', 'D', 'Operador de Secundarios', '1', '84567', '$2y$10$HxmsdXVJjroMoWTwuD3rN.UlKx.YwpRPfzRjkIHjkCfXUIRopy4mC', '1979-10-05', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2003-01-14'),
(5950, ' Veronica', 'Garcia Acosta', 'Hacienda de las Torres', 'D', 'Operador General', '1', '84569', '$2y$10$b8CvDLGmgP/Ix5hXw.LPzOWwyn7WVRpOuiTQzZI/F9rl3fOt.NKGC', '1974-06-26', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2003-01-14'),
(5951, ' Jesus Manuel', 'Hernandez Esparza', 'Manuel Valdez', 'D', 'Operador de Set Up', '1', '84570', '$2y$10$T68NKM2BTQVC64oYwzP.NexygfmE9XTrzHIcmwgTthcrTVPKgjEya', '1980-05-05', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2004-01-06'),
(5952, ' Fernando', 'Carrasco Salas', 'Praderas del Sur', 'D', 'Operador de Set Up', '1', '84572', '$2y$10$HBcTGDsD45qNpKymmpI73eByFg9NOEJ6RWmQBi7d3fuR5.VAU3QsO', '1972-11-16', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2004-01-08'),
(5953, ' Samuel', 'Gutierrez Mata', 'Parajes del Oriente', 'C', 'Auxiliar de Recibos', '2', '84574', '$2y$10$RYj3kPAJvuo5hfHCuLNymeDUjRQ6RZZD0oP0Jq3MxDBHKNlRbSc6K', '1984-01-05', 'Bacilio Abel Rocha Carrillo', '68476', 'HUS II', '2004-08-16'),
(5954, ' Maria Victoria', 'Morales Diaz', 'Parajes del Oriente', 'D', 'Operador General', '1', '84582', '$2y$10$qnU0CUts00FlzN14rG8zy.ZzV3JiRbm9XxFyWvW21j/c5ErCO2D5y', '1980-07-28', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2005-02-01'),
(5955, ' Gamaliel', 'Guerrero Rocha', 'Horizontes del Sur', 'D', 'Tecnico de Calidad', '1', '86558', '$2y$10$6e/fv09Kj6wGnGgC4G/EOOarTA2sF2ZjCWf7WckUcED.DpY.akB/C', '1999-07-17', 'Diana Demorey Carrasco', '128213', 'HUS', '2019-02-21'),
(5956, ' Enrique', 'Hernandez Bautista', 'Praderas del Sol', 'D', 'Operador De Procesos', '1', '86563', '$2y$10$pVDFpTnL6WGHPs.pIc1cu.r.nbn5In4Xh6GLXn.0hmg3VfiaF.RoC', '1985-05-22', 'Saul Arellano Escobar', '97722', 'HUS', '2019-03-05'),
(5957, ' Guillermo', 'Vela Melendez', 'Parajes de San Isidro', 'D', 'Almacenista', '1', '86566', '$2y$10$M9fpRvp./v/Iv85G1ppY6O0N8ATJMdPpitYPKm8/oeZzi0GgybD8e', '1984-10-24', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2019-03-12'),
(5958, ' Salvador', 'Garcia Martinez', 'Praderas de los Oasis', 'D', 'Tec Mtto Equipo de Moldeo', '1', '86567', '$2y$10$nzM4UuoDZJ74UtvJEqbls.OX8WDeDj/H1zBxLXT58gK7DOdTbA24G', '1971-06-25', 'Castro Molina, Jesus', '46787', 'HUS', '2019-07-24'),
(5959, ' Jose Noel', 'Garcia Fernandez', 'Hacienda de las Torres I', 'D', 'Almacenista', '1', '86570', '$2y$10$hP8tYjfp2I1ZnQzGr0MYGu.bP/5HUG5MkM0P4ecTTvrmt0ygdWX1i', '1980-09-18', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2019-04-02'),
(5960, ' Juan Jose', 'Mendez Martinez', 'Tierra Nueva', 'D', 'Operador De Procesos', '1', '86577', '$2y$10$EsgmJLYhYJdYau0snskyb.x1yfnLKlj2hz3mVUmn/RXRq2dPjcSei', '1999-12-23', 'Saul Arellano Escobar', '97722', 'HUS', '2019-04-16'),
(5961, ' Sonia Alejandra', 'Jimenez Macias', 'Valle de Santiago', 'D', 'Tec Seguridad Industrial Sr', '1', '86596', '$2y$10$Dq/ggZ.rKhHtH9/3Iafh3uGA1aoG6mZfXHI97pVyqAGBsuVdhM1eG', '1993-03-22', 'Parga Rangel, Brayan Alexis', '86782', 'HUS', '2019-05-08'),
(5962, ' Zulema', 'Gonzalez Rangel', 'Villas Residencial del Re', 'D', 'Jefe de Grupo', '1', '86601', '$2y$10$eX2RCqJiegNlqzCx14ZPgeuyL7m5m2vA9qjsYqCS77gtKbf79tdiG', '1984-04-04', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2019-05-08'),
(5963, ' Alma Patricia', 'Alvarez De la Rosa', 'Tierra Nueva', 'D', 'Operador General', '1', '86606', '$2y$10$d4ItQi194WaVJtZeqbDoNu9E0f3CDRavH8WQG1H8Vsyh6LJ8gqMvu', '1998-03-10', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2019-05-08'),
(5964, ' Isaac Alejandro', 'Cuevas Lopez', 'Rincones de Salvarcar.', 'D', 'Tecnico en Entrenamiento', '1', '86607', '$2y$10$cIotIeeUzB1K1aMjz0p4AusoFsDSa5Mfg/0aOf2tKInlJiUSTnId.', '1999-03-29', 'Jorge Alejandro Ayabar DÃ­az', '66945', 'HUS', '2019-05-08'),
(5965, ' Romarico', 'Geronimo Bautista', 'Parajes de Oriente', 'D', 'Operador De Procesos', '1', '86621', '$2y$10$mhbmM.NjEGqTaBWCTcHNvOAbjEY.28EtWFZhfP2QPpvmh7IYWmfOq', '1980-09-10', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2019-05-15'),
(5966, ' Abraham', 'Mendoza Escobar', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '86633', '$2y$10$W88RLlqZ9izulcM6FU4ouej589G/0.aQzKyObNsgDFTPASQfGmWH.', '2000-08-31', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2019-05-21'),
(5967, ' Giovani', 'Bautista Tolentino', 'Misiones del Real', 'D', 'Tec. de Metrologia', '1', '86636', '$2y$10$qnwPoSVGRXZx9PvpUPBcSOxdzQfw6DWneDAqu.bu3ZaJDS/sEtmo.', '1999-05-11', 'Rodriguez Celaya, Ramiro', '24790', 'HUS', '2019-05-21'),
(5968, ' Claudia Ivonne', 'Barron Salas', 'Heroes de la Revolucion', 'D', 'Jefe de Grupo', '1', '86638', '$2y$10$FFxBNiuajIFwEtUojKvkeeChgju9PdfNGu5ItANTpyjfBTUMxXF.a', '1987-06-29', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2019-05-22'),
(5969, ' Jose Martin', 'Vargas Aguilar', 'Parajes de San Jose', 'D', 'Operador De Procesos', '1', '86644', '$2y$10$hOrq4aegHLlKmTcDc6snXOqMtlPryuIAelRw9TsUvW3gdqWpg6WtK', '1993-04-13', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2019-05-23'),
(5970, ' Jose', 'Bustos Flores', 'Portal del Roble', 'D', 'Operador De Procesos', '1', '86647', '$2y$10$nhKXw4hsNJhK8DHr4tBmPuJbw5PaCREIJvNIeMDK1gvzGRn095JgC', '1983-03-19', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2019-05-28'),
(5971, ' Israel', 'Castillo Roman', 'Paseo de Zaragoza', 'D', 'Jefe de Grupo', '1', '86649', '$2y$10$JMEVj2eWAPK8I7DepFCZY.tlMRD6TQpkKaubqmfXcc7VCcEE9sHLa', '1997-07-27', 'Briseida Bautista Tolentino', '300011', 'HUS', '2019-05-28'),
(5972, ' Orlando', 'Moscoso Ayala', 'Manuel Valdez', 'D', 'Operador de Set Up', '1', '86663', '$2y$10$aZIfFgw1zUQyd2YE.aSiK.IQCD.cseqQP0DNAlaRlRTi7/BCZQsB.', '1995-09-12', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2021-09-15'),
(5973, ' Rafael', 'Martinez Francisco', 'Riveras del Bravo', 'D', 'Operador De Procesos', '2', '86670', '$2y$10$EJKa2QT99P5i8Rj9vbsgI.CcMRr91xINF5uD2hL9kRRGCX4sDYu7S', '1973-08-12', 'Erik Rey Mata Texna', '61890', 'HUS II', '2019-05-29'),
(5974, ' Cecilia', 'Sagrero Cruz', 'Villas del Sur', 'D', 'Operador General', '1', '86685', '$2y$10$si.OzVmCruadJgGRMigOOeP9tbvoDVLtmkaABT5O6dnfYWyJ56jXa', '1994-12-06', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2019-05-30'),
(5975, ' Flor Judith', 'De la Cruz Sotelo', 'Horizontes del Sur', 'D', 'Tecnico de Calidad', '1', '86690', '$2y$10$cDETLKmrraLlpHgY5BXanO3CPxu5kgyFfAOMmXOEBR0YerGNpXlyi', '1990-07-20', 'Diana Demorey Carrasco', '128213', 'HUS', '2019-05-30'),
(5976, ' Jose Luis', 'Casas Garcia', 'Horizontes del Sur', 'D', 'Tec Esp en Mtto Equipo', '1', '86694', '$2y$10$TWo29moMJASo3uIUABOoUukmjJnnF94MTWyM3yOno45d4go.yj2Bm', '1977-03-22', 'Mauro Sanchez', '61715', 'HUS', '2019-05-30'),
(5977, ' Jose Abdias', 'Anastasio Cruz', 'Cerrada de Oriente', 'D', 'Operador De Procesos', '1', '86706', '$2y$10$lB.iZWj4pyuDcn8Sz/Obh.QXHcAYlhiUrKr.0STUk/ALmBUP5bSTq', '1988-02-10', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2019-06-04'),
(5978, ' Oscar Manuel', 'Rojo Dominguez', 'Division del Norte', 'D', 'Operador de Secundarios', '1', '86709', '$2y$10$MQv.Zj/wHUlivboOol.W7.yxaYBtzh/jXIe3Br8fvldEq1gShgpwK', '1993-03-24', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2019-06-05'),
(5979, ' Blanca Ibeth', 'Martinez Martinez', 'Misiones del Real', 'D', 'Operador De Procesos', '1', '86719', '$2y$10$F.77.pDn.dtoxJE5BRZox.BLVzeDVva7KqmWP2GcNYXckdLOmtdpC', '1979-11-24', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2019-06-11'),
(5980, ' Oscar Raul', 'Gonzalez Reyes', 'El Real', 'D', 'Tec Proceso de Moldeo/Die Cast', '1', '86734', '$2y$10$3QYfHx373PmWcYwv0F7m5uT7zBWG2r0pQo3vcOypFxf6mC.SiBnwG', '1984-07-08', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2019-06-12'),
(5981, ' Ruben Levi', 'Trejo Lopez', 'Horizontes del Sur', 'D', 'Tec Proceso de Moldeo/Die Cast', '1', '86745', '$2y$10$ssNog9jOAicQMlebm4yhR.eFUsWEv8uaRLHI/Rhwpp/3oWBw6ppU.', '1989-08-09', 'Sanchez Cordova, Rene', '41563', 'HES', '2019-06-17'),
(5982, ' Miguel Aldair', 'Barajas Gomez', 'Parajes del Sur', 'D', 'Operador General', '1', '86753', '$2y$10$0pBchZkw32mbQ3SgLdvYye9YrpCr5yGlx8BQGdwZD5vZfOTaj9oE2', '2000-01-16', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2019-06-18'),
(5983, ' Pedro', 'Morales Hernandez', 'Sierra Vista', 'D', 'Operador de Criticos', '1', '86760', '$2y$10$OG9.9bBxULbn/S3VivAjyOWBdJB0fwm9pswlPzn0UebQ2KO1r7W4O', '1990-09-17', 'Jesus Lopez Solis', '73653', 'HUS', '2019-06-19'),
(5984, ' Jessica', 'Morales Sanchez', 'Terrenos Nacionales', 'D', 'Operador De Procesos', '1', '86781', '$2y$10$c71waKmJDOBL6bahM2NCUO/cNWHanF9w1EcREFZ7fX8eNVqJuyPea', '1989-12-15', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2019-06-28'),
(5985, ' Ivan', 'Salazar Trujillo', 'Parajes del Sur', 'D', 'Operador De Procesos', '1', '86793', '$2y$10$f4C0UI.ag8xX1YvmPSL3Fuxd58JBF6tg2c1IiD0UXuW6w9EY1b/AK', '1992-11-19', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2019-07-01'),
(5986, ' Eliseo', 'Guzman Quirino', 'Tierra Nueva', 'D', 'Operador de Set Up', '1', '86794', '$2y$10$64B4dZP6fiUZ4XlUcVArjexoh8zrH9qEQwgupHeHPEbHl1taMGz46', '1978-09-20', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2019-07-01'),
(5987, ' Diana', 'Dominguez Hernandez', 'Horizonte Del Sur', 'D', 'Operador General', '1', '86798', '$2y$10$.qpmUHGA4BYHBn6W1fn8e.y5dFFcLtOhrNNI1T3s/SOcnwqk69ICO', '1978-04-26', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2019-07-01'),
(5988, ' Arturo', 'Corona NuÃ±ez', 'Parajes de San Isidro', 'D', 'Operador De Procesos', '1', '86812', '$2y$10$eyTLwyPPXro.KyyJ9Gfm2OCmoqCYzj2QmRmJKWTq7MuEVPgPk99SG', '1989-12-26', 'Saul Arellano Escobar', '97722', 'HUS', '2019-07-02'),
(5989, ' Arturo Alejandro', 'Saldivar Orozco', 'Las Dunas', 'D', 'Tecnico de Ingenieria Sr', '1', '86824', '$2y$10$I5.1JiQBK7PUvPhSAeEEG.B9hJe72rd6P.Q6qcO1NWhICoCY/HCjq', '1993-05-14', 'Sanchez Cordova, Rene', '41563', 'HES', '2019-07-08'),
(5990, ' Eunice', 'Antonio Arias', 'Riveras del Bravo', 'D', 'Operador de Secundarios', '1', '86866', '$2y$10$yeVuM0.AWVi7PUOgR5fF3ODrMLiy4RkC/E5juMu09wp7XVVWiJf6i', '2001-06-14', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2019-07-23'),
(5991, ' Gabriela', 'Palacio Montes', 'Urbivilla Bonita', 'D', 'Operador De Procesos', '1', '86881', '$2y$10$/rzLR9BUvmAcMnaGMLNm5ON5fxX3O5mX.RAFD/LvD49F2e0MsEadq', '1994-07-09', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2019-07-23'),
(5992, ' Giovanni', 'Sanchez Carrillo', 'Terrenos Nacionales', 'D', 'Operador de Secundarios', '1', '86888', '$2y$10$gZ7IX3a1Brv0Pj.xS4V5Y.BzdKHhWdkElZKfT6papYKmsuK.iGK9O', '1999-09-21', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2019-07-24'),
(5993, ' Bernabe', 'Filio Dolores', 'Fracc. Puerto Castilla', 'D', 'Operador General', '1', '86898', '$2y$10$zClq8ZZqU4TVRPGiiaZYYun4LWrxbIFhvWWxPwjD1WEUGqmRk6P42', '1973-06-19', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2019-07-24'),
(5994, ' Carlos Abraham', 'Chavez Cervantes', 'El Fortin', 'D', 'Almacenista', '1', '86899', '$2y$10$gDciLdjjS9.DjPvlTb4C/.E3gS/G.On.EEMxvCdJHcKSRy1Tao5om', '2001-06-29', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2019-07-24'),
(5995, ' Miguel Angel', 'Armendariz Marin', 'Praderas del EnequÃ©n', 'D', 'Tecnico de Calibracion', '1', '86926', '$2y$10$9QpfPVuGk3.gNbW3t1I0MOiSgY4dJuSzN268KjOQDDaHo3UHHJGNO', '1989-10-07', 'Rodriguez Celaya, Ramiro', '24790', 'HUS', '2019-07-29'),
(5996, ' Alfredo De Jesus', 'Santoyo Silias', 'Parajes del Sur', 'D', 'Tecnico de Calidad', '1', '86932', '$2y$10$qmvuXynB8FVqbpSKSdeRhuznqrQhV4kyHG.7vkinZvT7aWO92lNN6', '2000-10-30', 'Humberto Lopez Lopez', '61865', 'HUS II', NULL),
(5997, ' Hilario', 'Gomez Montalvo', 'La Enramada', 'D', 'Tecnico en Ingenieria', '2', '86933', '$2y$10$28YZBxTkrWAtancqxnFyjegAyu5e1WTCKGUwG/Igar2CHNHcWqOxO', '1986-12-13', 'Rogelio Guitron Lozoya', '86928', 'HUS II', '2019-06-04'),
(5998, ' Edgar Arturo', 'Morales Samaniego', 'Parajes de Oriente', 'D', 'Jefe Grupo Fundicion/ Die Cast/ Lenoir', '2', '86940', '$2y$10$06GdwHOJT9E1753FeTBVnOKKnReW06r1Nk9f6bthjPVvAPNjfscS2', '1991-03-20', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2019-06-11'),
(5999, ' Daniel', 'Aparicio Castillo', 'Parajes del Sur', 'D', 'Tecnico de Calidad', '2', '86941', '$2y$10$qBfY6ilSK7mPvJyoWBzRy.hA.5JStkMzeQhpxnoD12.x.dHCFq3Y.', '2000-11-22', 'Humberto Lopez Lopez', '61865', 'HUS II', '2019-06-18'),
(6000, ' Jorge', 'Lopez Garcia', 'Municipio Libre', 'D', 'Operador de Criticos', '2', '86947', '$2y$10$VP4bk4ThVAHXOYYsqV5R/.wCn7YVG8Geb/AaQFZUm6Yjdjl20AMA2', '1995-08-27', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2019-06-27'),
(6001, ' Ismael Enrique', 'Garcia Romero', 'Colonial del Sur', 'D', 'Jefe De Grupo De Almacen', '2', '86959', '$2y$10$qYDLj0beO9GLw7p5HQKkjO1LOhl6nNgluTbUXYiBbeC0JVxNp1llq', '1983-06-17', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '2019-07-09'),
(6002, ' Rosendo', 'Roque Vazquez', 'Las Haciendas', 'D', 'Tecnico de Calidad', '2', '86961', '$2y$10$aSjAX5tA8vEjkHmJwAowse1tFAgxD.ifzoRY0zNrU29xsoRTr1MZm', '1990-01-04', 'Humberto Lopez Lopez', '61865', 'HUS II', '2019-07-10'),
(6003, ' Heriberto', 'Mascorro Baca', 'Praderas de la Sierra', 'D', 'Operador de Criticos', '2', '86980', '$2y$10$vx5uEk05rQ0QJnIrZYc8JuctZE3mU7eAxjnnXWY3YTtgRdG.tnh9e', '1996-09-18', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2020-08-26'),
(6004, ' Julio Cesar', 'Castellanos Guzman', 'Parajes de San Isidro', 'D', 'Tecnico de Calidad', '2', '86993', '$2y$10$K8BGiiEJfpw4mF3jbXBjBeO/Aqj1BnU3KEFVwNK7kpkPsr36QlKmW', '1983-09-05', 'Humberto Lopez Lopez', '61865', 'HUS II', '2019-07-25'),
(6005, ' David Andres', 'Arroyos Ramirez', 'Praderas del Sol', 'D', 'Reparador Moldes Fibra', '2', '86999', '$2y$10$VZYw0LVaPkcm2gp/m5.P3.21JX0cVdvLgpOBtD1h9JKFe5WOYeCgq', '1989-08-22', 'Reynaldo Mendoza', '88736', 'HUS II', '2019-07-29'),
(6006, ' Javier', 'Velazquez Promotor', 'Senderos de San Isidro', 'D', 'Operador de Set Up', '1', '87072', '$2y$10$mNe97eY2/bYIyNnxUElyEu0nnkUdUttuFbfrnDU8/2TzRiOtAdZXC', '1994-03-23', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2019-07-30'),
(6007, ' Jorge Luis', 'Herrera PiÃ±a', 'Bosque Bonito', 'D', 'Operador de Secundarios', '1', '87629', '$2y$10$V9YgtjXCgg.mBM0WG9KGmu0zPEeikrLzFW1xLfkDYXVQ9MoJOF24m', '1986-08-07', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2019-09-03'),
(6008, ' Rosalinda', 'Vielma Ruelas', 'Las Haciendas', 'D', 'Operador General', '1', '88016', '$2y$10$cZ0ZHNjbiObrDz9dFlaSIeW182dkHynvLmYC4TrCYrJ3h0TYBgz12', '1980-11-07', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2019-09-09'),
(6009, ' Rosalinda', 'Hernandez Zapata', 'Lomas del Valle', 'D', 'Operador General', '1', '88027', '$2y$10$JIamG8j.6APtHONlhdz19O/nayYisbUTAEtPIlVHlnuP9tnj9EjG6', '1979-01-29', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2019-08-02'),
(6010, ' Victor Martin', 'Martinez Soria', 'Senderos de San Isidro', 'D', 'Operador General', '1', '88034', '$2y$10$6t/df0cnly0.UyG1Nyho9.CaVWAJrWlNee1Rl/.n5eLKwc5emE43i', '1984-01-30', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2019-08-06'),
(6011, ' Erick', 'Luna Palacios', 'Praderas del Sur', 'D', 'Operador De Procesos', '2', '88043', '$2y$10$7cINBsi7KWR4k8BDfLUo1.O4M3sVkkS7YHa8Z3zDNtDpcQAopdU5m', '1992-08-06', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2019-08-07'),
(6012, ' Rosalva', 'Rodriguez Aguirre', 'Portal del Roble', 'D', 'Operador General', '1', '88046', '$2y$10$d5NIEZAfVc4FTWMvw6EwIubGF1v.gPLPx7tMqPhVvefupx988/I.O', '1972-09-12', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2019-08-09'),
(6013, ' Ana Raquel', 'Soto Caixba', 'Parajes de San Isidro', 'D', 'Operador General', '1', '88048', '$2y$10$IWxGsZfhkMsdl0c5OLrF2uQSbW2vqIUPjlXTjFEehn2sL682EuqRG', '1992-02-04', 'Briseida Bautista Tolentino', '300011', 'HUS', '2019-08-12'),
(6014, ' Juan', 'Lara Sanchez', 'Riveras del Bravo', 'D', 'Operador General', '1', '88091', '$2y$10$VZs4Y67.n3OWhfLrz1VwTO6sjKIQY1Y7d8OiwfGkq/S5bIN1OKcCW', '1978-06-24', 'Briseida Bautista Tolentino', '300011', 'HUS', '2019-09-02'),
(6015, ' Laura Lizeth', 'Ledezma Caldera', 'Oriente Salvarcar', 'D', 'Operador De Procesos', '1', '88094', '$2y$10$nYMWtH2umk9IV1ppOEB8VuXmQUstX9YDd3OH53aColVOsQoQZgEIG', '1988-01-15', 'Arellano Mota, Arturo', '24791', 'HUS', '2019-09-02'),
(6016, ' Hugo Alberto', 'Chaparro Chaparro', 'Parajes del Sur', 'D', 'Tec Proceso de Moldeo/Die Cast', '1', '88129', '$2y$10$ZfWOMR0wC.xpH9ZJqxJpA.3ltiNlLtR0D/qVbmpwNB1NCJAKk..wi', '1986-12-22', 'Gustavo MacÃ­as Sandoval', '73857', 'HUS', '2019-09-09'),
(6017, ' Arturo', 'Dominguez Coatzozon', 'Riveras del Bravo', 'D', 'Almacenista', '1', '88135', '$2y$10$bQLHbtUEf..MiIU3.4YQ8Oj5.ptukl6qnIOIykya4SgAWb232aJUm', '1991-08-22', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2019-09-10'),
(6018, ' Angi Erika', 'Castelan Trejo', 'Jose Marti', 'D', 'Almacenista', '1', '88138', '$2y$10$54FqjRJ4eV/MzSyu9jlbRepBUHmkrWL6V85eRWwC8bhLiV/jCsrkq', '1983-11-26', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2019-09-11'),
(6019, ' Reyna Guadalupe', 'Valles Guardado', 'Carlos Castillo Peraza', 'D', 'Inspector Control de Calidad', '1', '88146', '$2y$10$33OYcsjU3a8mZjb.3xNfJ.PH3bVHeJbSXHLVvp1j8K/d5OQVvTGKC', '1999-05-17', 'Jose Ruiz', '74929', 'HUS', '2019-09-12'),
(6020, ' Francisco Javier', 'Leos Ramirez', 'Parajes de San Isidro', 'D', 'Operador General', '1', '88158', '$2y$10$pZCnxgyiUuNP3Kwx6Ryl6OzFkfCQTYOFknbY3ZWuoc99ObDTvsJ2y', '1980-10-05', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2019-09-17'),
(6021, ' Fausto', 'Flores Ocampo', 'Valle Fundadores', 'D', 'Operador Especialista', '1', '88168', '$2y$10$O.XCUwaqbXg5zi00AX.2BOfNk4UL4iEYdat62sIeNZbBG85kTuKjq', '1989-02-04', 'Arellano Mota, Arturo', '24791', 'HUS', '2019-09-18');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `colony`, `position`, `area`, `plant`, `username`, `password`, `birthdate`, `supervisor_name`, `supervisor_reloj_number`, `deparment`, `fecha_ingreso`) VALUES
(6022, ' Carlos Govanny', 'Chavez Rosales', 'Portal del Roble', 'D', 'Tec Proceso de Moldeo Die Cast', '1', '88181', '$2y$10$F4alimyc3JTjpwhTGMtkyee/lpuFtI6/Zpx5TFRavxsngwe0uipw6', '1991-08-27', 'Gustavo MacÃ­as Sandoval', '73857', 'HUS', '2019-08-28'),
(6023, ' Artemio', 'Arteaga Jimenez', 'Sauzal', 'D', 'Operador de Criticos', '2', '88192', '$2y$10$VLasg/1xUw99OT0cMSOfhu5/HKHvq9HAU3L74jbqeJ4YC7zVNgva6', '1985-10-20', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2019-08-12'),
(6024, ' Jorge Luis', 'Ocon Galvez', 'Hacienda de las Torres', 'D', 'Operador de Criticos', '2', '88193', '$2y$10$s3CHp5BHie33xfmiatCmCeKltVuXuxbBxPqBPseQ5XRZ715cEkiva', '1976-08-15', 'Garcia Gaucin, Erik', '28228', 'HUS II', '2019-08-12'),
(6025, ' Cristian Francisco', 'Segura Corral', 'Paraje de San Jose', 'D', 'Operador de Criticos', '2', '88203', '$2y$10$pd83T/32eXpd4Ci8G2ZWH.s2q5RNdnXTQu4y4Jbelfwr9tR7jUyHa', '1997-09-12', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2019-08-14'),
(6026, ' Oscar Ivan', 'Mascorro Baca', 'Mezquital', 'D', 'Operador de Criticos', '2', '88214', '$2y$10$tlfcZ8VdFbnMMPUtegB1veE/kCy1Ekj8ifTIB1LWg7fAxM5eYN9Ai', '1995-11-02', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2019-08-21'),
(6027, ' Jose Gabriel', 'Rosales Martinez', 'Parajes de Oriente', 'D', 'Operador de Criticos', '2', '88220', '$2y$10$qm5JGydfu6.haTfFpribSOiIAD6v4MV2yz5vLfkQxOwL80KfRmxJa', '2001-02-23', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2019-08-27'),
(6028, ' Saul', 'Garcia Montor', 'Villas de AlcalÃ¡', 'D', 'Operador de Criticos', '2', '88230', '$2y$10$vIrzENH3as5FuCmMdBuwnuyFDiSQjK368zRai1jpSGK6G/1hcB1lO', '1989-09-30', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2019-09-03'),
(6029, ' Luis David', 'Hernandez Ramirez', 'Sierra Vista', 'D', 'Operador de Criticos', '2', '88232', '$2y$10$8sauRBWecFxm4BkDBjaA0etiNYb96sMdglADH4YBmKDJk1PtS0iU2', '1998-06-23', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2019-09-03'),
(6030, ' Uriel Humberto', 'Granados Ramirez', 'Parajes de San Isidro', 'D', 'Operador de Criticos', '2', '88242', '$2y$10$zG/E386hnPTtgtaVQaJvZu/oWx8S8ZBVczkTtSz42zZuy4U32HUFa', '1981-09-07', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2019-09-10'),
(6031, ' Felix', 'Lopez Huesca', 'Parajes del Valle', 'D', 'Operador de Criticos', '2', '88244', '$2y$10$bI.3frsQE7rYTfVEboixb.KyrKmtobzYr0ROJiIZeyC/YmERZ5iBS', '1985-02-19', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2019-09-11'),
(6032, ' Oscar Rolando', 'Carreon Perez', 'Carlos Castillo Peraza', 'D', 'Operador de Criticos', '2', '88249', '$2y$10$TYUTTfZPgyCxfQ/B/urKuuvaxOlX91EKq4a0lfm2Er63N3GzvOouS', '1995-06-26', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2019-09-12'),
(6033, ' Lazaro', 'Silva Antonio', 'Carlos Castillo Peraza', 'D', 'Operador De Procesos', '1', '88375', '$2y$10$cZLkBg4qrIbUB3mR8UtXBOwC0x8lBTpKs.70BKviw/dppsbHT9Gu2', '1982-12-17', 'Velarde Inostroza Enrique', '71208', 'HUS', '2019-09-27'),
(6034, ' Antonia', 'Juarez PeÃ±a', 'Riveras del Bravo', 'D', 'Operador General', '1', '88376', '$2y$10$yvgjMQvHEH6Wb9ibMnV.ne3ZdBcWif4APNHGDc4RVHMMzoQ8hOcKS', '1971-01-17', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2019-10-01'),
(6035, ' Marisol', 'Carrillo Cid', 'Riveras del Bravo', 'D', 'Tecnico de Calidad', '1', '88378', '$2y$10$Frm4OyuDSsjhpq0b2oujaualdgtHFi5qiG/0sq1sZR2M1NLRXvv1O', '1999-06-13', 'Rodriguez Celaya, Ramiro', '24790', 'HUS', '2019-10-01'),
(6036, ' Sergio', 'Guillen De Luna', 'San Pablo', 'D', 'Tecnico de Calibracion', '1', '88385', '$2y$10$Uhei.T.itgMpwdePEFakoOCmyO49xHooGVi433M.KY28RVJqUtfYO', '1992-04-27', 'Rodriguez Celaya, Ramiro', '24790', 'HUS', '2019-10-02'),
(6037, ' Samuel', 'Lopez Ramirez', 'Carlos Chavira Becerra', 'D', 'Operador De Procesos', '1', '88387', '$2y$10$gdZysCmMJpMFlbyK.Y5z3ehA2vraW8JYcC//LFysu83wmDZoXWsne', '1993-04-11', 'Abel Fernandez Delgado', '98716', 'HUS', '2019-10-03'),
(6038, ' Jose Carmen', 'Guerrero Alvarez', 'Portal del Roble', 'D', 'Operador de Secundarios', '1', '88391', '$2y$10$uNfpxkzQ5YpBHK.8MyanuuMJpAA/JOf4gWa3cJbPNsH.dRYitmxJW', '1976-07-16', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2019-10-08'),
(6039, ' Jose Ascencion', 'Molina Andiola', 'Riveras del Bravo', 'D', 'Operador General', '1', '88392', '$2y$10$p.pgl51gm6lzAi3PegjxY..T65alPvMTy4Rkv7njiYEUc.k6bcvLy', '1978-12-07', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2019-10-08'),
(6040, ' Gerardo Alfredo', 'Ramos ', 'Parajes de San Isidro', 'D', 'Operador General', '1', '88397', '$2y$10$xHcGEbMsKKwMN4zAfPVHMeUgucV2Fw850eC30uZADvAXXcXziLQ5C', '1982-02-28', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2019-10-09'),
(6041, ' Heber Jaziel', 'Veronico Lopez', 'Cerradas de San Mateo', 'D', 'Operador De Procesos', '1', '88402', '$2y$10$Tl78lvbmaTWl0IfbCNGPd.jwbBk6mnEsH.XD8aRgl934.2oJ1uusC', '1993-04-14', 'Arellano Mota, Arturo', '24791', 'HUS', '2019-10-10'),
(6042, ' Rosa Jaqueline', 'Zapo Ramirez', 'La Enramada', 'D', 'Inspector Control de Calidad', '1', '88406', '$2y$10$mM9ujJ1KZISyqcPasrM9Ou8QBD9P9lpewOjVkcpbVmvzvauWlU.mG', '1997-09-07', 'Jose Ruiz', '74929', 'HUS', '2019-10-22'),
(6043, ' Gerson', 'Garcia SaldaÃ±a', 'Oriente Zaragoza', 'D', 'Operador Especialista', '1', '88409', '$2y$10$fL39UvZ4FFzv5jdajcTHv.mvkxkzXMaWPy974XQu0ATuSOAByeuT2', '1994-11-19', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2019-10-22'),
(6044, ' Carlos', 'Manuel Vazquez', 'Praderas del Sol', 'D', 'Inspector Control de Calidad', '1', '88420', '$2y$10$qrc12p72JPxOaRxNCBGIZ.RFtCZqOLKeNllGrDTIGNhY5MRi7nxSm', '1993-07-31', 'Diana Demorey Carrasco', '128213', 'HUS', '2019-10-25'),
(6045, ' Leonel', 'Vicente Champo', 'El Papalote', 'D', 'Almacenista', '1', '88425', '$2y$10$TIgFZVfCGr7zLJeEIaQ17e9XAmEk/5nDstSSxyAP/76dyRNRo5e3W', '1998-11-14', 'Resendez Gardner Raul', '98277', 'HUS', '2019-10-29'),
(6046, ' Alejandro', 'Valdez Lopez', 'Parajes del Sur', 'D', 'Operador De Procesos', '1', '88427', '$2y$10$l4Ci.7sDXIpGYue26HyoTeXwwlUEIicr9mqBPXu7OiT58U/h8GH8.', '1979-03-14', 'Saul Arellano Escobar', '97722', 'HUS', '2019-10-29'),
(6047, ' Maria', 'Francisco Gregorio', 'Las Haciendas', 'D', 'Operador De Procesos', '1', '88434', '$2y$10$.C/Ak.NNAJ8xv8x8AgSeu.G7NCTozyIOFuSddsWU30Z1fDi0JPsXu', '1982-11-04', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2019-10-30'),
(6048, ' David', 'Espinoza Lazo', 'Fracc. Universidad', 'D', 'Tecnico Electromecanico', '1', '88447', '$2y$10$Ngi0SLiQ5HYrowFMyEaJPOBCNscEfrgI7rRszLTM.5aSgWpSQvAO6', '1993-03-29', 'Martinez Gonzalez Fernando', '24731', 'HES', '2019-11-05'),
(6049, ' Vianey', 'Jeronimo Martinez', 'Valle de Allende', 'D', 'Operador De Procesos', '1', '88465', '$2y$10$i9cNfaH9Eo3UbUEo7DBnBeMNSFU/.aXaRAikqvqMcu96olP8nh3dG', '1991-05-07', 'Velarde Inostroza Enrique', '71208', 'HUS', '2019-11-05'),
(6050, ' Justino', 'Velasco IbaÃ±ez', 'Carlos Castillo Peraza', 'D', 'Set-Up Produccion', '1', '88482', '$2y$10$QGvQ20eriBDdG5OxqLXvOuirVHbtqcoZGELHK.nH0asq5XS3/uWE6', '1972-09-26', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2019-11-07'),
(6051, ' Mario Alberto', 'Carrillo Hernandez', 'La Canada', 'D', 'Inspector Control de Calidad', '1', '88501', '$2y$10$wQ8r2qsxBLqatJ9ZJ3IxleICvw9/XcPWJAkqPzYpJ9kmvdS22kjCa', '1976-08-24', 'Diana Demorey Carrasco', '128213', 'HUS', '2019-11-15'),
(6052, ' Sergio', 'Santos Ramos', 'Parajes del Sur', 'D', 'Operador De Procesos', '2', '88506', '$2y$10$aZZH6fYq4THf95Lhw4tqceyi1FcAyt7SNQIM7F4zRp3er.uapR5bm', '1974-06-10', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2019-09-24'),
(6053, ' Aurelio', 'Cruz Ramos', 'Hacienda de las Torres', 'D', 'Operador de Criticos', '2', '88510', '$2y$10$iKwvWfEMqVtZdUJ8lZw9gu6wtvngVXig4RUnNqI9YDvimkID87fQG', '1967-10-20', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2019-09-25'),
(6054, ' Jesus Manuel', 'Cano Olivas', 'Lomas del Valle', 'D', 'Operador de Criticos', '2', '88513', '$2y$10$X1LrVxyh7L7ild0OIkNMc.zlxmNJx3eHnHAIJ.kuhMD.vPGuWz3E6', '1966-11-06', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2019-09-26'),
(6055, ' Antonio', 'Martinez Alor', 'Urbivilla Bonita', 'D', 'Operador de Criticos', '2', '88514', '$2y$10$wIAYHo1TjAbYbQv5TH/K6eoUXBv5AeeZmjo3sRgskobI.2XyJg4nG', '1983-05-10', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2019-09-30'),
(6056, ' Luis Miguel', 'Sandoval Avalos', 'Villas de AlcalÃ¡', 'D', 'Almacenista', '2', '88522', '$2y$10$RgIgpDJ8tmlNpW7Vmpx9lOmXXTl3vQqTI9FdSBFlfyDV5vBE.dnMK', '1984-02-19', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '2019-10-08'),
(6057, ' Yasmany', 'Tinoco Ramirez', 'Parajes de San Isidro', 'D', 'Operador De Procesos', '2', '88530', '$2y$10$BT/dlVPO6eETC6NceSPOVewWwvCYz8.EXqyWbznLnoq/VW1EUhyaS', '1991-04-08', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2019-10-22'),
(6058, ' Rafael', 'Rubio Reza', 'Parajes del Sur', 'D', 'Operador De Procesos', '2', '88537', '$2y$10$g2w9TZYivWxgbK5pmXBUsefChDLNYjjY6atAfz6FRyuiuwNbDcxkC', '1985-03-20', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2019-10-29'),
(6059, ' Juan Antonio', 'Rodriguez Torres', 'Senderos del Sol', 'D', 'Tecnico de Calidad', '2', '88542', '$2y$10$LI1OUH/ji.2Ps17vri28L.fVlozVT.T2BKoSUPb1oZDsI6UEQARLi', '1985-04-27', 'Mario Chacon', '72893', 'HUS II', '2019-10-31'),
(6060, ' Israel', 'Torres Martinez', 'Roma', 'D', 'Operador de Criticos', '2', '88548', '$2y$10$9TZkg9z23Zgkiqw5YBzgSel7JEbeeRrbgVuVSH7cOc0w1wSlwq.EC', '1993-09-08', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2019-10-30'),
(6061, ' Raymundo Antonio', 'Hernandez Franco', 'Sor Juana Ines de la Cruz', 'D', 'Operador De Procesos', '2', '88550', '$2y$10$v/gB8n/BBOPjQPKww9xm2eMJzZqXOcUgPqaot2jsglrn0GdfGJjiq', '1976-06-13', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2019-11-01'),
(6062, ' Jose Guadalupe', 'Barrios Vazquez', 'Parajes de Oriente', 'D', 'Operador de Criticos', '2', '88556', '$2y$10$59AfWn/aO2mUo0LZBvDAsOEI2o09DjAvY/z7z0qoLICMYnS52qv0e', '1975-12-12', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2019-11-12'),
(6063, ' Ismael', 'Talledo Merino', 'Cerradas del Alamo', 'D', 'Tecnico de Ingenieria Sr', '2', '88560', '$2y$10$BTfXkghVTIWxhmk.s4S3jeoxccGygRp2x9KJjREd0Pe/m9FzPcN7K', '1994-06-17', 'Rogelio Guitron Lozoya', '86928', 'HUS II', '2019-11-12'),
(6064, ' Luis Manuel', 'Martinez De Reza', 'Parajes de San Isidro', 'D', 'Operador De Procesos', '2', '88566', '$2y$10$d./vax6PHeWZIKOR5TxdvO51P/TuqaiWahGfAaDcqnsVepZEJLmsm', '1975-06-22', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2019-11-14'),
(6065, ' Joel', 'Fernandez Quino', 'Granja de los Alcades', 'D', 'Operador de Criticos', '2', '88573', '$2y$10$LdQcHAVITTzGRWG4Om0QD.bA7WFFy2cWxwjXJFqZXLkkVtQEDPRFK', '1993-03-07', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2019-11-14'),
(6066, ' Raul', 'Velarde Hernandez', 'Aguilas de Zaragoza', 'D', 'Tec Esp en Mtto Equipo', '1', '88691', '$2y$10$UWW.ckM2juh6KQ/l3m3w6ukjcwgbOtFAryPzDCrqt9oOD9W6DcXz.', '1995-12-29', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2019-11-19'),
(6067, ' Federico', 'Illescas Cruz', 'Parajes del Sur', 'D', 'Tecnico de Calidad', '2', '88714', '$2y$10$VWLZILcVf/n1DxdIzavtH.slS3SN.XhlxAxYzhJqEmon0T0.UA7JO', '1992-02-02', 'Humberto Lopez Lopez', '61865', 'HUS II', '2019-11-19'),
(6068, ' Mauro', 'Morales Castillo', 'Valle de Allende', 'D', 'Operador De Procesos', '1', '88725', '$2y$10$TvHTJmx74QZbE/Dw/hbZdunEKr2.JLp37s1Jc1josmCmAt5Yb.O0e', '1992-01-15', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2019-11-26'),
(6069, ' Jose Manuel', 'Torres Torres', 'Division del Norte', 'D', 'Tecnico Cnc', '1', '88779', '$2y$10$Zsmnh2DpuFfwmwE.EmziVO8rGfUiiEgpcR1NrmN36vZCRfxevpBtS', '1978-01-09', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2019-12-09'),
(6070, ' Fernando', 'Avila Vazquez', 'Villas de AlcalÃ¡', 'D', 'Operador de Criticos', '2', '88791', '$2y$10$K1FHE2bjb51uqOUMldXzOeg.aI2jSce8lXBA8khoYVgKrf0VisJve', '1985-02-21', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2019-11-28'),
(6071, ' Adan', 'Garcia Pedro', 'Oriente Paraje de San Jua', 'D', 'Operador de Criticos', '2', '88807', '$2y$10$2xEV8NOMkGCC.7Vyq4iw9uSOnuuE7pak8cIQFzx4JqNslcJXwkwJG', '1973-11-10', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2019-12-05'),
(6072, ' Rogelio', 'Aguilar Perez', 'Oriente Torres Sur', 'D', 'Jefe Grupo Fundicion Die Cast Lenoir', '2', '88809', '$2y$10$XCw/qp9I2GUD184ujbTWieE3oMwNEviaHUAlg4psL5veY7a/u74q6', '1974-01-09', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2019-12-05'),
(6073, ' Maria Mercedes', 'Mendez Morales', 'Parajes de San Jose', 'D', 'Operador de Criticos', '1', '88831', '$2y$10$C2f5FQflUZKxmkcXB1Wot.3vipbDET24MVwWDbbpv1yoJYsCvtbL6', '1994-09-24', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2020-01-07'),
(6074, ' Rogelio', 'Sebastian Gonzalez', 'Villas de AlcalÃ¡', 'D', 'Operador de Criticos', '2', '88841', '$2y$10$E0e.fQ.AJlQ/rru1eTWdCu9seeTruZihhRMH0uq.ZpxXmUjeDbP8S', '1984-04-02', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2023-01-19'),
(6075, ' Jonathan', 'Cruz Lopez', 'Hacienda de las Torres', 'D', 'Operador de Criticos', '2', '88842', '$2y$10$VuO//P8fyreaoBlVdI95aufe2erl2j7qIvbWlFm8y9FmvFv2XDlaO', '2001-07-18', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2020-01-08'),
(6076, ' Everardo', 'Vazquez Cruz', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '2', '88853', '$2y$10$WwZXuREA.QdvrnzLUwRLl.xgZZzVL75Dw1AaEnmimRe8sayLEFXXa', '1978-08-06', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2020-01-08'),
(6077, ' Juan Carlos', 'Lopez Doria', 'Terranova', 'D', 'Operador de Criticos', '2', '88858', '$2y$10$KmDPNRqCI7GnUchztv6Cou6v2XIefjCRUDTbDUDTfG1ipYHgesD06', '1980-12-27', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-01-08'),
(6078, ' Roman Bernardo', 'Hernandez Roacho', 'Riveras del Bravo', 'D', 'Operador de Criticos', '2', '88862', '$2y$10$KRW3zDQLgY8U9WWzL5T6euikHBOvouJsVWwXugWpSpEj6DKLLHwHW', '1991-11-18', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2020-01-08'),
(6079, ' Cesar Cristobal', 'Perez ZuÃ±iga', 'Terranova', 'D', 'Operador de Criticos', '2', '88864', '$2y$10$P1TNlamo1w/rNdpfq4kqfup1D7Qxfje5a1aus5GiT.ix2zsylXOee', '1992-03-10', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2020-01-08'),
(6080, ' Victor Manuel', 'Azamar Ortega', 'Parajes de San Jose', 'D', 'Operador De Procesos', '1', '88929', '$2y$10$OWPMH.WLoNVOj7.btP3BV.rwfGgtdFgBJKWzG/gbHWCmSQRmaIrrW', '1984-04-27', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2020-01-14'),
(6081, ' Alexander', 'Sanchez Romero', 'Riveras del Bravo', 'D', 'Operador De Procesos', '1', '88938', '$2y$10$fbFzqmrVtvT5tcDplL/LaeD/w4q.JY0Zd7pf5HUvFRPT1tBAldUPu', '1995-09-06', 'Abel Fernandez Delgado', '98716', 'HUS', '2020-01-15'),
(6082, ' Francisco Javier', 'Marquez Prieto', 'Hidalgo', 'D', 'Operador De Procesos', '1', '88945', '$2y$10$RPBILt2eHXcKGlHXhtjPtOVA6oC6GipHS4SBbaCfCH1a0TdcQSUam', '1988-09-26', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2020-01-16'),
(6083, ' Gumaro', 'Berumen Nieto', 'Urbi Villa del Cedro', 'D', 'Almacenista', '1', '88948', '$2y$10$.TnvAdXuUTlvfPQyfabpc.S0spP4rBzLM7pj7pIjjApQ0CPyYEoKK', '1982-09-20', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2020-01-16'),
(6084, ' Willian', 'Salas Chacon', 'Aguilas de Zaragoza', 'D', 'Operador de Secundarios', '1', '88951', '$2y$10$16Q2djeMnCewJvt.aOFUbulF2vwvyRTyG.Jq/HaXSwEdKksvxuGoq', '1997-06-20', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2020-01-21'),
(6085, ' Hilario', 'Hernandez Vargas', 'Riveras del Bravo', 'D', 'Operador General', '1', '88955', '$2y$10$ErhszKi/WZGJuZnTQd68R.MEb4FotKZKGIjpT8.HCoa5WIE48fMUS', '1968-10-21', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2020-01-21'),
(6086, ' Luis Rodolfo', 'Guizar Vizcarra', 'Parajes de Oriente', 'D', 'Operador De Procesos', '2', '88957', '$2y$10$iF9l6TvFbhyscePst8H6POzWDclmthuQg0..dOMVHapLGmhxfP7w.', '1978-07-07', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2020-01-09'),
(6087, ' Jose Noe', 'Burciaga Aguilar', 'Fracc. Papigochi', 'D', 'Operador de Criticos', '2', '88979', '$2y$10$Uo4RGliMoPkCigi8BV965OTmSqA.qseQW1awc1EIY.t4ijomWM8My', '1996-02-05', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-01-14'),
(6088, ' Gilberto', 'Arellano Cuevas', 'Parajes de Oriente', 'D', 'Operador de Criticos', '2', '88980', '$2y$10$f1V8gYYqJ0bMHPSqj2p9RuOPQgWpt05eG0PLWinJKmuxdI5pmLNVG', '1978-11-26', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-01-14'),
(6089, ' Miguel', 'Torres Garcia', 'Fray Garcia de San Franci', 'D', 'Operador De Procesos', '2', '88987', '$2y$10$k4TdpgvbXRxYMKs8Je05EOemirzlcmnBSymxmTFDM4yuvNDP3MHc6', '1972-01-15', 'Cecilia Adame Camacho', '97655', 'HUS II', '2020-01-15'),
(6090, ' Prisiliano', 'Fajardo Martinez', 'Senderos de San Isidro', 'D', 'Operador de Criticos', '2', '89001', '$2y$10$3iOM2C5sK8eApsPNEJyruuyHxj3/q6iI1SQSjZ90Yi6maBj8/0vpC', '1999-01-04', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2020-01-21'),
(6091, ' Otilio', 'Linares Roque', 'La Enramada', 'D', 'Operador de Criticos', '2', '89006', '$2y$10$ZhZtgbEx0maRfNu.T5dOC.0UtTVOcTp21DFUaj7x4YrApPzeLBT2G', '1993-07-13', 'Erik Rey Mata Texna', '61890', 'HUS II', '2020-01-21'),
(6092, ' Victor Manuel', 'Sotelo Dominguez', 'Sierra Vista', 'D', 'Jefe Grupo Fundicion Die Cast Lenoir', '2', '89010', '$2y$10$KqrRLdEvNpYJuaEBctZ2AODjahx.0g72tnkmy1fcVByPWe6PHCwou', '1995-08-14', 'Jessica Alejandra Aguilar Guti', '109077', 'HUS II', '2020-01-21'),
(6093, ' Mauricio Armando', 'Castruita Aguilera', 'Senderos de Oriente', 'D', 'Tecnico de Calidad', '1', '89023', '$2y$10$n/Nx8q9XdJ4VKG1p0BG5DeSnyeZ5NyZ8MjNkw7HtETM6qb/V.9xAa', '1991-08-27', 'Kevin Adrian Martinez Orozco', '300062', 'HUS', '2020-01-22'),
(6094, ' Alejandro', 'Cordova Hernandez', 'Cerradas Santa Isabel', 'D', 'Materialista', '1', '89024', '$2y$10$ac9eZcHho6gEtGS0xJD3reWJzhFfDPoo7fLlvoW0VuGXNoxlRlOMi', '1985-01-07', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2020-01-22'),
(6095, ' Miguel', 'Martinez Reyes', 'Palmas del Sol', 'D', 'Operador De Procesos', '1', '94747', '$2y$10$7/XICcnXwOU3evNugBDuAO..twXMBIehMtQIsagIBBTPTUnzl2PR.', '1978-07-16', 'Velarde Inostroza Enrique', '71208', 'HUS', '2020-01-23'),
(6096, ' Carlos Elias', 'Ramirez Raygoza', 'Hacienda las Torres', 'D', 'Operador de Criticos', '1', '94749', '$2y$10$i426yjMflwIRJPoyZgf2xOGE2ZbG6CVmHvq644px.rj4zcgpjGy1C', '1983-07-20', 'Erik Rey Mata Texna', '', 'HUS II', NULL),
(6097, ' Jesus David', 'Carrillo Guajardo', 'Oriente Senderos del Sol', 'D', 'Almacenista', '1', '94750', '$2y$10$Uol5ONVhnmUVcGI5Lt8toeKSgKDLDyPrd46mnieSbvoYlIEfypqhy', '1980-12-02', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2020-01-23'),
(6098, ' David', 'Tadeo Trinidad', 'Paraje de San Isidro', 'D', 'Operador De Procesos', '1', '94791', '$2y$10$EEeLa4U01FKtKhUwK7xv..VFjCRhRYEmpkxGg8dNFKNZO.LpRJw/6', '1993-11-13', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2020-01-28'),
(6099, ' Otoniel', 'Favela Gonzalez', 'Sur el Mezquital', 'D', 'Operador de Criticos', '2', '94795', '$2y$10$FeGssTcOeX..0s.YXyp3uOZfHnVKrLnV5npcqERhQ/mLmA4RsNJLu', '1994-09-21', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2020-01-28'),
(6100, ' Raul', 'Ruiz Morales', 'Hda de las Torres Univer', 'D', 'Operador de Criticos', '2', '94796', '$2y$10$Bwu2A8.PLKipKabcIKsJPeZOWMFky4Is.3P9Ihpb/NE4ExzqrVLtG', '1977-10-01', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2020-01-28'),
(6101, ' Ruben Sikarov', 'Lugo Martinez', 'Riveras del Bravo Etapa 9', 'D', 'Conteos Ciclicos', '1', '94851', '$2y$10$YBeo/w49Ra8eW8DtscJ7meXgJ3jRfVwxmB9q0M/05ixHrnD.Z1QCO', '1977-09-05', 'Mario Soriano Romero', '75688', 'HUS', '2020-01-27'),
(6102, ' Jonathan', 'Lopez Martinez', 'Oriente Senderos de San I', 'D', 'Operador de Criticos', '2', '94852', '$2y$10$5M3vzJbV6Fqeom3BLrYKu.kLL0BJnWCjGd6rejuEwE/WIITC/TjNa', '1995-06-23', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2020-01-28'),
(6103, ' Lino', 'Cervantes Martinez', 'Oriente Villas de Alcala', 'D', 'Operador de Criticos', '2', '94857', '$2y$10$Ci/de7Ab9.Z5qTk2BTd3Ne9Ey1FyF0J0KzCWo0oVkYgLCSCbUFPvi', '1992-09-23', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2020-01-28'),
(6104, ' Favio Duvan', 'Limon Limon', 'Gladiolas', 'D', 'Operador de Criticos', '2', '94913', '$2y$10$qDoWK6iAlEpo9RJWgLin5.UNmkyUsNenfsXNIWoQ6XF13VK5y.Xai', '1996-08-01', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2020-02-06'),
(6105, ' Joel', 'Hernandez Alvarez', 'Fracc. Las Haciendas', 'D', 'Tecnico de Calidad', '2', '94915', '$2y$10$VCBwu8NhL726YnL05hC1l.QaPpXQtzEXclESBbkw8qCTuVGmt4G4i', '1984-05-03', 'Humberto Lopez Lopez', '61865', 'HUS II', '2020-02-06'),
(6106, ' Cleofo', 'Vazquez Venancio', 'Parajes del Sur', 'D', 'Operador De Procesos', '1', '94921', '$2y$10$dYTF/N9Ma.XVZB3P7Ib3refr7/k1etIjK.5O2up5Oyq1ZhBNtGenq', '1981-02-28', 'Arellano Mota, Arturo', '24791', 'HUS', '2020-02-06'),
(6107, ' Ivan Guillermo', 'Garcia Gonzalez', 'Municipio libre', 'D', 'Tecnico en Documentacion', '2', '95034', '$2y$10$7LcStSRLE28qZh2nSkTbM.0JlRry53xdr2Vi1eythDOGIt5SegNIy', '1996-04-05', 'Nallely Alvarado Aguirre', '76513', 'HUS II', '2020-02-12'),
(6108, ' Jose Eduardo', 'Flores Cadeza', 'Oriente Paraje del Sur', 'D', 'Tecnico en Entrenamiento', '1', '95035', '$2y$10$nMDA1jBjWJb.TkI4bh/y/.k0Kq7q/xP9HANV1Q0hz4R.2430kkvby', '1998-07-28', 'Jorge Alejandro Ayabar DÃ­az', '66945', 'HUS', '2020-02-12'),
(6109, ' Crhistian', 'Morales Cruz', 'Fray Garcia de San Franci', 'D', 'Operador de Criticos', '2', '95076', '$2y$10$5coLbO99XfrdQU/qi2lXquPCtKd5FgG9KoywzslVtm2pyi5p9jo2m', '1988-10-29', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-02-11'),
(6110, ' Israel', 'Gregorio Isidro', 'Senderos del Sol', 'D', 'Almacenista', '1', '95089', '$2y$10$M1WyO2Fulv9IVYJOqXHYhOBzMB2CcIVzPh2o7dX0uQTXL7IR2VDrm', '1985-12-01', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2024-01-11'),
(6111, ' Juan', 'Hidalgo Rojas', 'Pradera del Sol', 'D', 'Tecnico de Calidad', '2', '95111', '$2y$10$JZ3UzD9U.zSGTOgsossXX.2WAM0nYJSQb2VPAbg5Lx15tbDGWSTOO', '1991-12-04', 'Humberto Lopez Lopez', '61865', 'HUS II', '2020-02-18'),
(6112, ' Fidencio', 'Zavala Rodriguez', 'Maestros Estatales y Fede', 'D', 'Operador De Procesos', '1', '95113', '$2y$10$gJCWnSmTYzMJJ4sIqol52O6ouIIzpvP1Q4ETnjMmYQ05JP5Yy2l9G', '1976-08-05', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2020-02-18'),
(6113, ' Pedro', 'Chavez Quintana', 'Oriente Las Gladiolas', 'D', 'Operador De Procesos', '2', '95115', '$2y$10$TPmKLCJa9zwQT.FE579gkO7S2jwHI4l8/Uk89s5BW6K2lwrsqddeO', '1973-08-14', 'Cecilia Adame Camacho', '97655', 'HUS II', '2020-02-18'),
(6114, ' Amador', 'Martinez Hernandez', 'Paraje de San Jose', 'D', 'Operador de Criticos', '2', '95243', '$2y$10$qtHIWenuo/JvMIyttP9HaubT0DhWaqMh5ZVr9kk0Aqxiry0g3cNMO', '1999-07-07', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-02-24'),
(6115, ' Andres', 'Ortiz Griensen', 'Tierra Nueva', 'D', 'Tecnico Lider de Automatizacion y Control', '2', '95247', '$2y$10$6qWFrne7emS2N96JxBqfAuQPftuYfpzWAR8/KJnDqjEMt/HV80q1e', '1970-08-24', 'Ruben NuÃ±ez Adame', '100370', 'HUS II', '2020-02-24'),
(6116, ' Jose Andres', 'Virgen Clemente', 'Fraccionamiento Misiones', 'D', 'Inspector Control de Calidad', '1', '95297', '$2y$10$9DIGEzosUJ9KvQknAquNHONaxt1ZXPdhXWJKJ..Ss23ef7dhLSFEa', '1976-10-31', 'Diana Demorey Carrasco', '128213', 'HUS', '2020-02-25'),
(6117, ' Antonio', 'Romero Mena', 'Eco 2000', 'D', 'Operador De Procesos', '1', '95355', '$2y$10$lKyPMJRAlwER/J1bqKVIO.xoFlTknG/1Ai54nyFxQ/RQRWXJ1LqTO', '1973-03-30', 'Varona Hernandez, Braulio', '61651', 'HUS', '2020-02-28'),
(6118, ' Miguel Angel', 'Rodriguez Castro', 'Hacienda de las Torres Un', 'D', 'Operador de Criticos', '2', '95434', '$2y$10$pBlRbOwCwqiP..6J1xxbf.8kyVU.NrMSoygpTjR42LlWDPRVVe/T2', '1997-12-29', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-03-04'),
(6119, ' J. Guadalupe', 'Cano Vazquez', 'Sur Praderas del Sol', 'D', 'Operador de Criticos', '2', '95440', '$2y$10$8ET5zWG19ZSSzkQ1HxNWYOljd2mZqsSH875XWhRoQkq/nUh6/1oD6', '1972-12-09', 'Santiago Antonio Pacheco', '72187', 'HUS II', '2020-03-04'),
(6120, ' Juan Alberto', 'Soto Gandara', 'Oriente Misiones de Creel', 'D', 'Operador De Procesos', '2', '95441', '$2y$10$lanl1vLzT97P5YxJJ3o0QOyZ4tbTk/i5JM.sSUZdjlx0KFNBaWZWK', '1989-07-08', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-03-04'),
(6121, ' Jorge', 'Perez Gonzalez', 'Medanoz', 'D', 'Operador de Secundarios', '1', '95454', '$2y$10$hXIPWQQRyxGQERqb35g5QeZimJTsQOtyds/KFAnlCwo/vTDkx253C', '1986-04-23', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2020-03-03'),
(6122, ' Jose Luis', 'Romo Ibarra', 'Paraje De San Isidro', 'D', 'Almacenista', '1', '95483', '$2y$10$TfXT0Uc7hnHat.nYNEpDFOotQYoElM0O39/vVrLoOypV9hVzW6MLi', '1990-10-16', 'Resendez Gardner Raul', '98277', 'HUS', '2020-03-06'),
(6123, ' Jairo', 'Franco Rojas', 'Manuel Gomez Morin', 'D', 'Operador de Criticos', '2', '95484', '$2y$10$yU9jUO5NVqoFlfAEWU9XPu3AFXy6FaldHimTvSZBkE6AavN6IS6BC', '1987-03-24', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2020-03-06'),
(6124, ' Jose Francisco', 'Mendez Carrera', 'Enequen', 'D', 'Operador de Criticos', '2', '95688', '$2y$10$qorEnFm./pcAt3po836Br.AUmGeJRr5xHEJ7DRE.fb4IUxN2lbIx.', '1994-05-04', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2020-03-12'),
(6125, ' Jesus Manuel', 'Ramos Ramos', 'Terenos Nacionales Zarago', 'D', 'Operador de Criticos', '1', '95755', '$2y$10$znQFgMYI96W3VA3//HbMpOv1htkZn6MTPdZ0NEss4wysApj7gxoM2', '1986-10-09', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2020-03-17'),
(6126, ' Reyes Eduardo', 'Gonzalez Pichardo', 'Lucio Blanco 2', 'D', 'Tec Esp En Moldes', '2', '95790', '$2y$10$1KqMer/SZfyjJtG73Fgn8.sSxvj/wEgT7B/7fbYcwWjB5mgKI1/GW', '1990-12-03', 'Ruben NuÃ±ez Adame', '100370', 'HUS II', '2020-03-18'),
(6127, ' Manuel', 'Renteria Martinez', 'Terranova', 'D', 'Tec Esp en Mtto Equipo', '2', '95794', '$2y$10$o1Y0n710Uc3lVswYH3JhWO579DVPLW6MbRLToab8T3P2e2qn/9c3G', '1987-09-09', 'Ruben NuÃ±ez Adame', '100370', 'HUS II', '2020-03-18'),
(6128, ' Marmi', 'Medina NuÃ±ez', 'Riveras del Bravo', 'D', 'Almacenista', '2', '95798', '$2y$10$c/ciApjHoWILnhGHsHMCE.NegUkzrFCt7UVj1zHl6tuiM70f4t4tS', '1977-08-18', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '2020-03-18'),
(6129, ' Americo', 'Rodriguez Castro', 'Colonial del Sur', 'D', 'Operador De Procesos', '1', '95823', '$2y$10$quokXln3WPzY1r7/E59ibumVaU92L.vwAsI9AANkgXm41R2feepQW', '1980-07-10', 'Daniel De Jesus Favela Najera', '73913', 'HUS', '2020-03-20'),
(6130, ' Diego Raul', 'Maldonado Rodriguez', 'Las Haciendas', 'D', 'Operador de Criticos', '2', '95878', '$2y$10$U3rMvfgq4MroZtt0DjucpemfCNINJNXPxtOO9eGYUITQhhwMjgkGu', '1985-12-12', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2020-03-25'),
(6131, ' Pedro Manuel', 'Lopez Martinez', 'Praderas del Sol', 'D', 'Tecnico Manto. Edificio', '1', '95939', '$2y$10$HaRCmL39r02QKGfEI7tR/u307ngZsx0AXZkLsBKy0g/du9z9dXobi', '1981-06-29', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2020-03-30'),
(6132, ' Ruben', 'Aguilar Martinez', 'Terrenos Nacionales', 'D', 'Almacenista', '1', '95982', '$2y$10$aFKQl/okC58N3uO.D6SZQO3jTRIWDNQfQV8feh7FdpYh8f4qMj9He', '1983-03-16', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2020-04-01'),
(6133, ' Feliciano', 'Cortes Vasquez', 'Hacienda de las Torres Un', 'D', 'Operador General', '1', '96005', '$2y$10$66j4jFCi8Z5ahhynDYrpgeXyhgBkp2AjYpUXV14XJaxYHQpKgkjp.', '1972-03-06', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2020-04-03'),
(6134, ' Yessenia', 'Garcia Flores', 'Oriente Paraje de San Isi', 'D', 'Operador De Procesos', '1', '96032', '$2y$10$6QFvY87RC5Pol.KsEBC7xOz05NUz//Yz1ItXuL.z5ubHxyj0kTQ2u', '1987-12-10', 'Saul Arellano Escobar', '97722', 'HUS', '2020-04-07'),
(6135, ' Enemias', 'Prieto Basurto', 'Praderas del sol', 'D', 'Operador General', '1', '96697', '$2y$10$.W3614BOulLeEtw6E3U.CeI4JbZPtykeQGMtULncN4/J.PNmsjQe.', '1985-06-17', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2020-05-28'),
(6136, ' Javier', 'Alvarado Chavarria', 'Praderas del Sol', 'D', 'Operador General', '1', '96821', '$2y$10$RG6yEkYBIbco8FOSrqYmGeqmqsq9tjb.xcPEUBiHN2rA9W3mMF3u6', '1975-08-20', 'Briseida Bautista Tolentino', '300011', 'HUS', '2020-06-05'),
(6137, ' Noel', 'Hernandez Morales', 'Fraccionamiento ECo 2000', 'D', 'Operador De Procesos', '1', '96823', '$2y$10$8fmRLqN16cM0z0RvjYKNXe1eloypRWsN7XOSCmsqtHR82JH/iLyYG', '1979-03-16', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2020-06-05'),
(6138, ' Rosa Isela', 'Cisneros Molina', 'Roma', 'D', 'Operador de Secundarios', '1', '96965', '$2y$10$Yi.Iwl4EDhWOuKcE0kM6G.9IiCAaLDfo2xagnm4wkJjgTLVZ5HYfC', '1982-02-25', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2020-06-11'),
(6139, ' Isidro Alejandro', 'Matuz Lopez', 'Cerradas San Angel', 'D', 'Operador de Criticos', '2', '96974', '$2y$10$Yv/USTweDKf2ySEvEMxHYOYBERbo38cJ/kOECvUk7xp31yjnA3lXy', '1995-04-29', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2020-06-11'),
(6140, ' Carlos Alfredo', 'Cuello Gonzalez', 'Oriente Paraje de San Jos', 'D', 'Inspector Control de Calidad', '1', '96978', '$2y$10$PXxlE9w6mSJ36VAqmHd.uOXb/Sa83aOTbmU5cnlG26qpcBuM7wUzq', '1995-12-17', 'Esteban Vazquez', '84463', 'HES', '2020-06-11'),
(6141, ' Natanael', 'De La Cruz Hernandez', 'Riberas del Bravo III', 'D', 'Operador General', '1', '96983', '$2y$10$Qko0T4MxuxtPbIdSOMR5SOQ/1Fln6mw4DnJYFyn3IXPcYkA9Bt6ce', '1979-12-26', 'Briseida Bautista Tolentino', '300011', 'HUS', '2020-06-11'),
(6142, ' MA. Elisa', 'Vazquez Alvarado', 'Fray Garcia de San Franci', 'D', 'Operador General', '1', '97011', '$2y$10$rnX/6obqg9TACfL.bsKKFu5U7axyb1E9YmsRXYEi9qt0Hx4Wg0D4u', '1973-07-06', 'Maria Eloisa Barron Salas', '61631', 'HUS', NULL),
(6143, ' Selene', 'Garcia Moctezuma', 'Oriente Misiones del Real', 'D', 'Operador de Secundarios', '1', '97016', '$2y$10$9v8szEjkZIlDRh11YgBr3e7HXcnD8CWtm5BD87dzJPuKKq/Htsgxy', '1986-12-21', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2020-06-15'),
(6144, ' Elizabeth', 'Caletre Vinalay', 'Villas De Alcala', 'D', 'Operador De Procesos', '1', '97018', '$2y$10$wDszVqpyales7dBaPnHScO53jlNVyd/Lzd0TcVmFMV7vnV1IfL2G6', '1998-11-17', 'Arellano Mota, Arturo', '24791', 'HUS', '2020-06-15'),
(6145, ' Maria Basiliza', 'Machado Castor', 'Parajes de Oriente', 'D', 'Operador General', '1', '97028', '$2y$10$gXVPY7H/UIirhercna9ncOeteMmXli9IRseguqmHnew7PxvetHYSW', '1987-11-28', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2020-06-15'),
(6146, ' Lorenzo', 'Quezada Nieto', 'Profa Maria Martinez', 'D', 'Tec Esp en Mtto Equipo', '2', '97034', '$2y$10$VQR3kndzqnF2S.G1Lwi85e0Vhe45R0g4AKEqwnx/SRqMbkl2Qu4Em', '1981-09-26', 'Juan Antonio HernÃ¡ndez Villanu', '95945', 'HUS II', '2020-06-15'),
(6147, ' Gerardo', 'Pablo Lopez', 'Portal del Roble', 'D', 'Operador General', '1', '97053', '$2y$10$vHcxz5sNch9sxr1Qgo.5MecGcADJzpOQbo7J.okS03OAqPQ7tnrjm', '1984-01-13', 'Briseida Bautista Tolentino', '300011', 'HUS', '2020-06-15'),
(6148, ' Arcadio', 'Saucedo Chavez', 'Senderos de San Isidro', 'D', 'Operador Especialista', '1', '97055', '$2y$10$Vs757DD2x89mes8EoE1e7ulD3/5pDMw4Niu.zaOwjnw5SimC4BbwG', '1978-02-04', 'Varona Hernandez, Braulio', '61651', 'HUS', '2020-06-15'),
(6149, ' Alejandro', 'Cabrera Nava', 'Vista del Valle', 'D', 'Operador De Procesos', '1', '97056', '$2y$10$htSowF54DLK2MqLWT8AfzO59zSJOwDvaJ8jSCaubS1yrdGlJ4hRey', '1985-04-07', 'Arellano Mota, Arturo', '24791', 'HUS', '2020-06-15'),
(6150, ' Alexander', 'Hernandez Diaz', 'Portal del Roble', 'D', 'Operador Especialista', '1', '97059', '$2y$10$vUFl70a6WRxgaHDC1U.hEORKTTAKSsr48sq0Qgqf0YGIS4eRZ2NOy', '1997-06-01', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2020-06-15'),
(6151, ' Erasmo', 'Zamudio Palomino', 'Villas del Sur', 'D', 'Operador Especialista', '1', '97068', '$2y$10$JAMN/m855bkeCZ5dM4HcBe96KKK1Thvinp2UlAbum2JxSp2V6tODm', '1976-11-25', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2020-06-15'),
(6152, ' Maria Del Carmen', 'Vazquez Torres', 'Paraje de San Juan', 'D', 'Operador General', '1', '97086', '$2y$10$.MjVEnq.iSPg4/9iKaAiLe1L8p1wTHsT/ojmcps.lyeOUSQgaWQbO', '1990-07-14', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2020-06-16'),
(6153, ' Ricardo', 'Martinez Velez', 'Cerradas del Sur 1', 'D', 'Operador de Criticos', '2', '97099', '$2y$10$NJxqG/PUN69huxuXbsohb.YG9jSwbaHkHtHDjPyR6HGaq8Ns3LAfG', '1981-09-06', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-06-16'),
(6154, ' Moises Francisco', 'Vazquez Zenteno', 'Urbivilla del Cedro', 'D', 'Operador de Criticos', '2', '97102', '$2y$10$S6O1qF451iApKTV0hH3hTOfrCVOiNuFCen.vKfCnp0JhDfuB0OEvi', '1999-07-08', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2020-06-16'),
(6155, ' Luis Antonio', 'Rodriguez Rodriguez', 'Misiones del Real', 'D', 'operador setup', '1', '97141', '$2y$10$6R.8gpc227KtyawXG5CxA.bljwUqWhV0/IosT2eUuoapWnOg/SKa2', '1984-09-02', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2020-06-17'),
(6156, ' Cesar', 'Reyes Mendez', 'Puerto Ancio y Victoria M', 'D', 'Operador Especialista', '1', '97149', '$2y$10$EH.vs4FxcbH5M7lYF4scu.1gpydNsH9fI1x/EfOuLU58QfBp51/56', '1983-04-06', 'Arellano Mota, Arturo', '24791', 'HUS', '2020-06-17'),
(6157, ' Angel', 'Gonzalez Chontal', 'Ubivilla del Cedro', 'D', 'Operador de Criticos', '2', '97157', '$2y$10$2NKjMn1xOBPKadING5rG0O2E0SjsUGwc107L11eiYU4jlnQ/90wge', '1988-07-26', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2020-06-17'),
(6158, ' Ruben', 'Roque Carrillo', 'Fray Garcia de San Franci', 'D', 'Operador General', '1', '97172', '$2y$10$IhRpnCktrMHcpiOCXc4ikOjxDW2MEiG0YEak7VKuEFMPOQeZ/oqzm', '1979-04-10', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2022-04-19'),
(6159, ' Antonio De Jesus', 'Najera Cabello', 'Las MontaÃ±as', 'D', 'Operador de Criticos', '2', '97213', '$2y$10$AX3JcFwK9D8rdzA2zEETGuhFY69ApdrYe/T7L6mYcj/.F8m.X0HHC', '1992-05-25', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-06-18'),
(6160, ' Luis Fernando', 'Del Rio Avila', 'Paraje de San Isidro', 'D', 'Operador De Procesos', '2', '97217', '$2y$10$EJ2Qr2WfU/qvCCTZfc9f2O7CaWNM.3EatzuXzttvMynIvLk.u6PAy', '1994-08-22', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2020-06-18'),
(6161, ' Daisy', 'Salazar Rodriguez', 'Puerto Lisboa y Puerto De', 'D', 'Inspector Control de Calidad', '1', '97240', '$2y$10$lsBu8/JeyZqICBFrPtDNs.QzQkr/O8n0t.M6acIRS5NCMkds8vuAK', '1994-12-31', 'Jose Ruiz', '74929', 'HUS', '2020-06-19'),
(6162, ' Lazara', 'Gaucin Portillo', 'Portal del Roble', 'D', 'Operador General', '1', '97281', '$2y$10$BSsE4BraXCe2uOA5mj3LquPV9ddEQh3La9HXXNab.Lk1gN9rpx4Zq', '1988-12-17', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2020-06-22'),
(6163, ' Manuel', 'Flores Soto', 'Olivia Espinoza', 'D', 'Operador De Procesos', '1', '97293', '$2y$10$EcbU1iqyF.vw/kVKrHGdUeWSSwe7UBMJOvGda3JYfvKdvfzzRrLaW', '1977-02-13', 'Arellano Mota, Arturo', '24791', 'HUS', '2020-06-22'),
(6164, ' Blanca Estela', 'Azamar AvendaÃ±o', 'Cerrada de Oriente', 'D', 'Operador General', '1', '97299', '$2y$10$Zs7J9Akuqu8HIV.vkyMVmupaFtXi7CKHbIWEwcEO8mmOBjqTJp1h2', '1989-03-28', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2020-06-22'),
(6165, ' Salvador', 'Chavez Erives', 'Hacienda de las Torres', 'D', 'Operador de Criticos', '2', '97457', '$2y$10$x13/MKsR7oo9kdly6Xp0.exhDgLXCBdaIa1tLgHi54UreQwp91mo.', '1974-01-16', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2020-06-29'),
(6166, ' Gilberto', 'Lechuga Reyes', 'Riberas del Bravo VIII', 'D', 'Operador de Secundarios', '1', '97459', '$2y$10$cidGzuiLxsDv8lqeFIuVkengxTbl8Vud32fXI.43r67yYGlWZBJ9i', '1994-02-04', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2020-06-29'),
(6167, ' Valeria', 'Leon Garcia', 'Parajes de oriente', 'D', 'Operador General', '1', '97468', '$2y$10$Jt5yGj8LmX3D9HpehUgOn.wWKCQFvu5A6n9YBPOu5Kqjkp/BrxZy6', '1992-02-14', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2020-06-29'),
(6168, ' Jessica Jazmin', 'Andrade Navarro', 'Puerto de Castilla', 'D', 'Operador General', '1', '97529', '$2y$10$lC88MBOtz8Z6LxbT/Aqnn.FbDgD3UBCfso7BvobKIXGmKfek2iJtu', '1991-04-06', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2020-06-30'),
(6169, ' Roberto', 'De Los Santos Sanchez', 'Los Alcaldes Amp', 'D', 'Tecnico de Calidad de Procesos', '2', '97534', '$2y$10$PmLXLg3lEId4ntUAkvlzHe9OyMkUy76jZPP2IrlPd9TwA7n/JsQWa', '1991-04-25', 'Porras Alvidrez, Hector', '33328', 'HUS II', '2020-06-30'),
(6170, ' Antonio De Jesus', 'Herrera Aguirre', 'Valle de Allende', 'D', 'Operador De Procesos', '1', '97540', '$2y$10$lTYveVnc2HfC9/kHxEuiAeIbNpeBt.X6KsV92rAbRqyB6QqnuwxDq', '1985-06-13', 'Saul Arellano Escobar', '97722', 'HUS', '2020-06-30'),
(6171, ' Erika', 'Luna Silva', 'Torres Sur', 'D', 'Jefe de Grupo', '1', '97542', '$2y$10$nVJ6HdFa3WfgAFwV.WP7yeYjd26w89XgzB2G0TLODdQr9IwrFQZdi', '1980-10-21', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2020-06-30'),
(6172, ' Antonia', 'Regis Nava', 'Los Alcaldes', 'D', 'Operador De Procesos', '1', '97581', '$2y$10$D/PkZGwtCcPSNw08I6jByOgjv612DvGOPBvmyllrLuXXiyXhrjV6.', '1968-01-17', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2020-07-01'),
(6173, ' Zulma Mireya', 'Romo Arreola', 'Carlos Chavira Becerra', 'D', 'Operador General', '1', '97586', '$2y$10$okqVxOkk2SBNi/I5gh8zcePjfbekTFm7Y0HW6Qc97HULXFzMrFrRO', '1994-04-17', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2020-07-01'),
(6174, ' Axel Jesus', 'Barrera Torres', 'Fray Garcia de San FCO', 'D', 'Tecnico de Calidad', '2', '97588', '$2y$10$UxWqq3zsj0T69S1uPeCwQuvNc3Od90Or4U8EkcgzcPQ6kaWkWmeCi', '1999-12-04', 'Humberto Lopez Lopez', '61865', 'HUS II', '2020-07-01'),
(6175, ' Luz Del Carmen', 'Martinez Cruz', 'Paraje de San Isidro', 'D', 'Operador Especialista', '1', '97589', '$2y$10$2OCq9JVm2Yji.LXmXJ3ao.2ChQDuMuppErQsgxHjMniaE7wpmCZw.', '1979-07-31', 'Varona Hernandez, Braulio', '61651', 'HUS', '2020-07-01'),
(6176, ' Jesus Eduardo', 'Cortes Mendez', 'Juan de la Barrera y Fern', 'D', 'Tecnico Electromecanico', '2', '97597', '$2y$10$Ek66s8Z7exgC2FsNiPeL2Or0q2l1dhKRA/PfT3UZh54rHj4luWCzy', '1998-01-03', 'Juan Antonio HernÃ¡ndez Villanu', '95945', 'HUS II', '2020-07-01'),
(6177, ' Guillermo', 'Mendez Garcia', 'Paraje de San Isidro', 'D', 'Almacenista', '1', '97642', '$2y$10$vovqLT2GmT8Zq5zlDaPdIelCKaJSfC1cQOVBkWweJiFNiYc1nNaLS', '1984-03-19', 'Resendez Gardner Raul', '98277', 'HUS', '2020-07-02'),
(6178, ' Iris Morelva', 'Lopez Ruiz', 'Cerradas Santa Isabel', 'D', 'Operador General', '1', '97649', '$2y$10$0mWuAC0ySOJ9mpxcwl/3Ce9xd/vfvXRdax2SMudS3PMEMJmaOkHfG', '1989-11-19', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2020-07-02'),
(6179, ' Wendy Lizeth', 'Ovalle Perez', 'Los Arenales', 'D', 'Operador General', '1', '97661', '$2y$10$AKHqPaw3s77scRKIrKD3cOlIpDFlSLTQdid3iHSij/xqMNAqXlNR6', '1995-11-06', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-05-29'),
(6180, ' Beatriz', 'Herrera Torres', 'Urbivilla del Cedro', 'D', 'Operador General', '1', '97664', '$2y$10$Lr.9aIlXQHNbGGbpIe9gWuPuzgvVTP6FZ.XVsBKB67p9ByGOgSzLS', '1988-06-28', 'Vania Garcia', '100540', 'HUS', '2020-07-02'),
(6181, ' Juana Marina', 'Alarcon Arambula', 'Oriente Torres del Pri', 'D', 'Operador General', '1', '97665', '$2y$10$7KqzlDEKAFodqf3PSxYeT.wyGD3QYajR1hXioAyVrITujoycFR91S', '1973-07-12', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2020-07-03'),
(6182, ' Juan Carlos', 'Garza Olvera', 'Riberas del Bravo', 'D', 'Operador De Procesos', '1', '97680', '$2y$10$lqCTErw0w6Sv81A3OY0VkeJmm9Q8E/CuvZT9tkQPc1yovrYJcKB/y', '1982-07-30', 'Abel Fernandez Delgado', '98716', 'HUS', '2020-07-03'),
(6183, ' Concepcion', 'Narciso Martinez', 'Arecas', 'D', 'Operador General', '1', '97688', '$2y$10$nPOZCtIGttW4KKMCeAJzuOuLs5hsRizegWFK2VpvKADK6.N3E1q1O', '1988-12-08', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2020-07-06'),
(6184, ' Carlos', 'Pacheco Hernandez', 'Carlos Castillo Peraza', 'D', 'Operador De Procesos', '1', '97705', '$2y$10$eQhHmT26kUuSpIk6hRGYgOxMRDRKdv1GJbVP5J7Fus06G.tD1j4ra', '1974-08-18', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2020-07-06'),
(6185, ' Jose Eusebio', 'Reyes Hernandez', 'Praderas de sauzal', 'D', 'Operador General', '1', '97709', '$2y$10$xR3bUmRbPCRh8p5oRZIOguWzkdGHsh1mJ0h6wgIC6i6KtCI4Kr4uS', '1987-06-08', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2020-07-06'),
(6186, ' Yazmin', 'Lopez Serra', 'Portal del Roble', 'D', 'Operador General', '1', '97710', '$2y$10$cce.Vtewql8HC70l6QaUtu0Bm.sw59mRXreXpL6gsayv1YrNCybWy', '1989-04-05', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2020-07-06'),
(6187, ' Adrian', 'Gonzalez Zocua', 'Riveras del Bravo', 'D', 'Operador de Set Up', '1', '97751', '$2y$10$y5.gbG8vBN1.VfpebVfxJOY88pPEV7JwIgH0m2ItiC0dQyUTj661m', '1976-03-05', 'Varona Hernandez, Braulio', '61651', 'HUS', '2020-07-07'),
(6188, ' Rosalio', 'Castillo Sanchez', 'Horizonte del Sur', 'D', 'Operador De Procesos', '1', '97753', '$2y$10$zp0M29qlLp5G7E.SC7TViOjaA16RHibhooTfVr5KIzm4XdnBLEma6', '1974-09-04', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2020-07-07'),
(6189, ' Sergio Antonio', 'Tarango Melendez', 'Los Arenales', 'D', 'Jefe Grupo Fundicion/ Die Cast/ Lenoir', '2', '97756', '$2y$10$xDUNk5CzkJXaYtAcL1N39.LMyFbfNkyxzkjRXOM9lkv198vH8LdEi', '1998-04-01', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2020-07-07'),
(6190, ' Laura', 'Villarreal Garcia', 'Hda de las Torres Univers', 'D', 'Operador General', '1', '97763', '$2y$10$q1mgsBfLATmgE.QFHAWYruzoHN7FUf3DpC9VCBKNNeD6GoK40HOu2', '1977-05-01', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2020-07-07'),
(6191, ' Francisco', 'Gonzalez Gonzalez', 'Oriente Riveras del Bravo', 'D', 'Operador De Procesos', '1', '97792', '$2y$10$K3PwnQqCSSZQdntslKj2ZO46BeoI1LaAcMmLN/O./DDnYzCZfipHe', '1977-08-12', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2020-07-08'),
(6192, ' Beatriz', 'Teodoro Perez', 'Parajes de Oriente', 'D', 'Operador De Procesos', '1', '97815', '$2y$10$ydWgRiBgjfYZ5uTaPbz5BuslIvk9qVFPmshEC8WyavF/0qX3j8XC.', '1991-07-29', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2020-07-08'),
(6193, ' Asanty Nohemi', 'Martinez Soto', 'Riveras del Bravo', 'D', 'Operador Especialista', '1', '97824', '$2y$10$ERJwo/Ikrc9vLinxvt/kqe3WiGzZ.s3sWI/9IMnkEh4aMqsRGxCp6', '1997-06-13', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2020-07-09'),
(6194, ' Perla Matilde', 'Hernandez Perez', 'Valle de America', 'D', 'Operador General', '1', '97828', '$2y$10$mkWB4eo5dxowreTYF.Ze2uJK54tKSmlNMAPt3myVu0yi4bWYYmAli', '1986-03-14', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2020-07-09'),
(6195, ' Alejandro', 'Soto Delgado', 'Oriente Profesora Simona', 'D', 'Operador de Criticos', '2', '97829', '$2y$10$lw5OGUF/iBrAsnV/9yoV0u0kPuXPFAfmsiGOXC1JunfRGFTQT82xq', '1995-04-20', 'Rogelio Guitron Lozoya', '86928', 'HUS II', '2020-07-09'),
(6196, ' Fernando', 'Orona Millan', 'Sur el Mezquital', 'D', 'Operador De Procesos', '2', '97832', '$2y$10$/Mq6DPoq7OsWEjgVZFbXauxA3zAqvIPec4JHhbo0txxbwYHBe8nRe', '1990-09-10', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2020-07-09'),
(6197, ' Samuel', 'Arce Dominguez', 'Valle Fundadores', 'D', 'Jefe Grupo Fundicion Die Cast Lenoir', '2', '97834', '$2y$10$8R8aS9sFtbEA7nw4zgmbVe5dDBodsgL5RB5eQMZb.get.17v9M8KO', '1993-04-21', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-07-09'),
(6198, ' Isaac', 'Mendoza Gallardo', 'Oriente Medanos', 'D', 'Operador General', '1', '97883', '$2y$10$Ig.q2w7Z6ZaxPC6CBC2np.M5jzoWbi34uNz4Dk/9fzMhHb8VOU.AK', '1997-04-03', 'Briseida Bautista Tolentino', '300011', 'HUS', '2020-07-13'),
(6199, ' Leonel', 'Pantoja Vargas', 'Heroes de Mexico', 'D', 'T.Lider Automatizacion Control', '2', '97896', '$2y$10$NSa8QQBdFyzw3PCXU7x.9eni4tZBOR8XR3g4WMuZzGQu6VXOsW1M6', '1997-12-13', 'Ruben NuÃ±ez Adame', '100370', 'HUS II', '2020-07-13'),
(6200, ' Ramon', 'Alegria Mendez', 'Jardines de Roma', 'D', 'Operador General', '1', '97952', '$2y$10$l6EUi6aFdbl.fHvZ.0iIVe1k6Nlbn2prO8461n8TNuk1rVKx7BXbK', '1984-11-06', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2020-07-14'),
(6201, ' Jose Alberto', 'Jimenez Garcia', 'Division del Norte', 'D', 'Operador de Criticos', '2', '97978', '$2y$10$cfjZQXslTfxgkmt9rbPQ4.MuVNm1Ua2m7cYx1PjUDYeoM/idCm9za', '1981-08-20', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2020-07-14'),
(6202, ' Oscar', 'Diaz Belmonte', 'La CaÃ±ada', 'D', 'Operador de Criticos', '2', '98016', '$2y$10$Mt3IO0ZNBFBvP5c321wyj.DPJmjqOHNB4quxr2J3lVGJjchnRa5lK', '1987-06-01', 'Rogelio Guitron Lozoya', '86928', 'HUS II', '2020-07-15'),
(6203, ' Omar', 'Cortes Astudillo', 'Oriente Misiones del Real', 'D', 'Operador de Criticos', '2', '98062', '$2y$10$jM3/tYKVpRuGqNfpDTvbLuS7rPMplE21qOC6x4dfkebSR0Ikwk45.', '1994-08-13', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2020-07-17'),
(6204, ' Jose Samuel', 'Ramirez Morales', 'Arecas', 'D', 'Operador de Secundarios', '2', '98100', '$2y$10$Aj7he6xQR8i9JKCDKpDJse/Hgz/b3VCRl5GGPYVeWbUw6c3HE.t1C', '1991-10-06', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-07-20'),
(6205, ' Humberto Ramon', 'Caporal Carrera', 'Urbi Villa Del Cedro', 'D', 'Operador de Criticos', '2', '98104', '$2y$10$r/jdfdDWqaooeP7yCiOmxuk9sTOJdT6XDa.zhA7dOMyqcvZ7eX5.e', '1993-03-25', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2020-07-20'),
(6206, ' Jose Guadalupe', 'Crisanto Martinez', 'Las Haciendas', 'D', 'Operador de Criticos', '2', '98108', '$2y$10$GR9NG/BYXF7EtuubmMZv8OBfCrh9LgfztVfNk6ICGt40.4JkdwhWO', '1997-05-07', 'Javier MartÃ­nez Acosta', '61908', 'HUS II', '2020-07-20'),
(6207, ' Martha Patricia', 'Martinez Soto', 'Riberas del Bravo', 'D', 'Limpieza', '1', '98139', '$2y$10$C0gTJL7awzHI5EvBjIEBp.81oFiEoVzHVaTQIi.XtBfm8ToM0.zea', '1976-05-10', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2020-07-21'),
(6208, ' Maria Juliana', 'Vazquez Cortes', 'Oriente paraje del sur', 'D', 'Operador De Procesos', '1', '98142', '$2y$10$QpnZ7LpeLFsWYfZzTXrrXu/ZFs.mYsT0M1.50fzHjAvtNs2/2XDle', '1998-07-28', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2020-07-21'),
(6209, ' Hector', 'Blas Perez', 'Terranova', 'D', 'Operador De Procesos', '1', '98145', '$2y$10$lKb3GAgpGBRvOSC9ysN9JuVPetLh7ntARfMcPJvdY9juTHNDV1XBS', '1979-06-18', 'Abel Fernandez Delgado', '98716', 'HUS', '2020-07-21'),
(6210, ' Rodrigo', 'AvendaÃ±o Perez', 'Hacienda de las Torres', 'D', 'Operador de Criticos', '2', '98214', '$2y$10$brT2xkkFusVgoeiDa/4poe9T/HZB/2a7twkp2M3sCZGT/fln3.Xj.', '1999-10-09', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2020-07-22'),
(6211, ' Norberto', 'Moreno Vazquez', 'Cerradas San Pedro', 'D', 'Almacenista', '1', '98217', '$2y$10$x3ZOhezmY5iSWmDNDTvOsOgbg1rn/zj4aywtTprdn0Z1N5FKFxZHO', '1994-08-25', 'Resendez Gardner Raul', '98277', 'HUS', '2020-07-22'),
(6212, ' Rene', 'Nataren Martinez', 'Oriente Riveras del Bravo', 'D', 'Operador De Procesos', '1', '98227', '$2y$10$VKjFToFDuhRgHc/lz60tX.lISted6zoPk6mXEfRePmKBibiu2/LeS', '1986-08-13', 'Arellano Mota, Arturo', '24791', 'HUS', '2020-07-23'),
(6213, ' Cristina', 'Jimenez Martell', 'Las MontaÃ±as', 'D', 'Tecnico de Ingenieria Sr', '2', '98276', '$2y$10$IGhOdazL99RpgIl6crZM/.Ch1xd565oP8cUPQ19X8Dkq4aTsfpOJO', '1991-12-07', 'Maria Guadalupe Aldaba Gracian', '40956', 'HUS II', '2020-07-27'),
(6214, ' Victoria', 'Ramirez Perez', 'Villas de Alcala', 'D', 'Inspector Control de Calidad', '1', '98278', '$2y$10$6IhjEIjDlHP1WgQkRdKpEeiVUqP/My6e4zRmBRmlFei8bBNmGImQe', '1993-08-01', 'Armando Reyes Maldonado', '86641', 'HUS', '2020-07-27'),
(6215, ' Isela', 'Martinez Hernandez', 'Parajes del Sol', 'D', 'Operador De Procesos', '1', '98319', '$2y$10$5rQpaVQUph82n0iKWNxM8.MikxsYYqPJAQ.K7GqycDa1HcE3pUhlq', '1987-01-12', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2020-07-28'),
(6216, ' Ismael', 'Martinez Abad', 'FCTO. Cerradas San Angel', 'D', 'Inspector de Calidad', '1', '98322', '$2y$10$G4SS0Mmyvqirxv0AubOlluzNosQshFMjfVnYGGulR6K3ZW9q0ecK.', '1993-07-04', 'Oscar Garcia', '59965', 'HES', '2020-07-28'),
(6217, ' Isabel Cristina', 'Zamorano Sedano', 'Tierra Nueva', 'D', 'Operador General', '1', '98330', '$2y$10$0h.Ed444aHa5XLHv4qexzOPde7Uwpxl/WQQmoz8omUam95tSQ4aFO', '1982-03-08', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2020-07-28'),
(6218, ' Ariosto', 'Hernandez Roque', 'Paraje de San Jose', 'D', 'Operador de Criticos', '2', '98372', '$2y$10$4Ae6alIWl6HJLiKugMl1peZxoWX.W3btzoBKxJE/9ccsdxttmzPTe', '1992-02-09', 'Santiago Antonio Pacheco', '72187', 'HUS II', '2023-05-04'),
(6219, ' Carlos Enrique', 'Meraz Lopez', 'Villa Colonial', 'D', 'Tec. Seguridad Industrial Sr', '1', '98442', '$2y$10$0Jcvake1suS9Wl.Qjd8ZNO9zFtVlIKscKOQ2GVe.N7ZkFnmBffp/y', '1972-06-11', 'Jose Rodolfo AcuÃ±a Lopez', '78080', 'HUS', '2020-08-03'),
(6220, ' Antonio', 'Meza Reyes', 'Paraje de San Isidro', 'D', 'Materialista', '1', '98462', '$2y$10$uKK9g9OiUMJKV.sL2ulbju0kwaF8NxzDGNw1fFKgtL.GTyEhD/cfe', '1983-06-13', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2020-08-04'),
(6221, ' Willian Ricardo', 'Fierro Mendoza', 'El Fortin', 'D', 'Operador de Criticos', '1', '98468', '$2y$10$BVkQWs0N0zrK2/79N50Bp.DAft1VAcadcguLKaY2NUHURZQ2gFO8m', '1985-05-10', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2020-08-04'),
(6222, ' Oswaldo', 'Martinez Rojas', 'Parajes del Sur', 'D', 'Operador General', '1', '98504', '$2y$10$LFfE/JT/Nyk9AKYa6hG3teMbmrZTSkDUIs5QBiP8eTpozScZbKjB.', '1993-05-04', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-05-28'),
(6223, ' Elian', 'Martinez Vidal', 'Paraje de San Juan', 'D', 'Operador de Criticos', '2', '98507', '$2y$10$aCyVTLrZNQJDE0Cm.cVdNOx7anZ21wd6nE9/1T/lecMTi6PafTLRK', '1999-03-02', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2020-08-05'),
(6224, ' Juan', 'Sanchez Zamudio', 'Riveras del Bravo II', 'D', 'Operador De Procesos', '1', '98532', '$2y$10$G9G0G.4vwPb/A40oflPg5.UDYYOMRqz4c5OKUI.NXzIG5bD/lUsYy', '1990-06-24', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2020-08-06'),
(6225, ' Heliodoro', 'Perez Ramirez', 'Misiones de Creel', 'D', 'Operador de Criticos', '2', '98533', '$2y$10$29mXbV3eOwBbYJyWL1/2Auig3zxbF.iUbuPu7zrRsrHPAky4oh9qq', '1991-07-23', 'Garcia Gaucin, Erik', '28228', 'HUS II', '2021-04-12'),
(6226, ' Ana Yesenia', 'Montoya Garcia', 'Carlos Chavira Becerra', 'D', 'Operador De Procesos', '1', '98632', '$2y$10$z0i4S/vP0KVrjZyzrVC.xONMXJ7IRBF335cQqj2p26x8v.e1kD0C6', '1990-11-14', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2020-08-11'),
(6227, ' Yulissa', 'Utrera Chiguil', 'Papigochic', 'D', 'Inspector Control de Calidad', '1', '98637', '$2y$10$5mAwjOj7E8SBbhVSZVQrveexEe9UbdEgdXQKojlre7dzBFoXS/Cda', '1997-09-10', 'Jose Ruiz', '74929', 'HUS', '2021-05-07');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `colony`, `position`, `area`, `plant`, `username`, `password`, `birthdate`, `supervisor_name`, `supervisor_reloj_number`, `deparment`, `fecha_ingreso`) VALUES
(6228, ' Greicy Del Carmen', 'Chalas Ascencio', 'Villas de Alcala', 'D', 'Operador Especialista', '1', '98641', '$2y$10$vjIylUcB8quGBbA5bRhAAuAHunpPitUAWy0uWr.PsTRT48nGB9wpe', '1997-12-07', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2020-08-11'),
(6229, ' Humberto', 'Martinez Araiza', 'Poniente Toribio Ortega', 'D', 'Tec Esp en Mtto Equipo', '2', '98648', '$2y$10$la0ioyQbWhruTwjLpTFHg.kIiD4w4McSaeteTAHVzKu2L/CaiVNZK', '1979-03-23', 'Juan Antonio HernÃ¡ndez Villanu', '95945', 'HUS II', '2020-08-11'),
(6230, ' Manuel', 'Jimenez Hernandez', 'Info Aeropuerto', 'D', 'Operador General', '1', '98674', '$2y$10$dcCHdVsMYPVMUTaAW/Tf0ujA.Lh6cnuq/lLtQrBzAN/GOdpyQPMxi', '1979-08-04', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2020-08-12'),
(6231, ' Jose Angel', 'Velasquez Gonzalez', 'Urbivilla Del Cedro I', 'D', 'Operador De Procesos', '2', '98706', '$2y$10$W49DHXAbRhUaATzafEz2renww7tQbiK0qjru3CJLH1dYlOfnue2xW', '1995-07-07', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-08-13'),
(6232, ' Rodolfo Guadalupe', 'Aguirre Amaya', 'Parajes de Oriente', 'D', 'Operador de Criticos', '2', '98707', '$2y$10$cRFhQtUgzhQrbkesiFguOuiYpjswkz77gdFgN0RgkZs1fQv8zfQIG', '1999-10-09', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-08-13'),
(6233, ' Jesus Porfirio', 'Vazquez Rivera', 'Misiones del Real', 'D', 'Almacenista', '1', '98708', '$2y$10$3Cjnh99qSVsb3zyKP1HVYOs.umPRWf00tNHTij79g7B.D1m6zmni2', '1988-08-22', 'Resendez Gardner Raul', '98277', 'HUS', '2020-08-13'),
(6234, ' Francisco De Jesus', 'Gonzalez De Los Santos', 'Paraje del Oriente', 'D', 'Almacenista', '1', '98780', '$2y$10$kytPV3rxq0ujSQYb2XjwYO./o17Iyn/cM3/I5Rw86TUGCmkRRiTpm', '1998-01-27', 'Resendez Gardner Raul', '98277', 'HUS', '2020-08-18'),
(6235, ' Felipa', 'Jose Zaragoza', 'La CaÃ±ada', 'D', 'Operador General', '1', '98785', '$2y$10$a4Z5xg1J.hDjJuKzG9U7JeyOpabyoWA2JyTDKTqhZyxzcFRama/uG', '1979-02-02', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2020-08-18'),
(6236, ' Alejandro', 'Garcia Hinojosa', 'Campestre Virreyes', 'D', 'Operador de Criticos', '2', '98791', '$2y$10$3i/5lMIFSSGO2wGGMaKF2.LOizHb4Jm6Ob8YG3KMkC0OstSBBtxpO', '1994-07-15', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2020-08-18'),
(6237, ' Yajaira Michel', 'Garcia Ibarra', 'Oriente Praderas del Hene', 'D', 'Operador Especialista', '1', '98873', '$2y$10$tPtWjREH35v0USDgG5U8OO0f76Jb5ZcVo.we7qOB4c1XNau5pAc9.', '1999-07-23', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2020-08-20'),
(6238, ' Jose Antonio', 'Ramirez Hernandez', 'Misiones del Real', 'D', 'Operador de Criticos', '2', '98874', '$2y$10$6AUqwDNxMxujyHhrVgy8mue5yImkGpyT0BRu6V/OWBhvNW0ngKiSO', '1992-02-18', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-08-20'),
(6239, ' Yesenia', 'Ibarra Morales', 'Pradera Del Henequen', 'D', 'Conteos Ciclicos', '1', '98970', '$2y$10$sLrdBC90AX84.Sax/Qbd4.pgj1yw/Kbgb1csAqYN1EDltse5zgdgi', '1978-11-16', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2020-08-25'),
(6240, ' Gustavo Adolfo', 'Cadeza Carrera', 'Riveras del Bravo', 'D', 'Operador Especialista', '1', '99034', '$2y$10$PL4N5lQUXJROX0pkzyT/FOUzW62XA2oE.js.3q0/ZeY0OfdRKXRHS', '1997-04-07', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2020-08-26'),
(6241, ' Lorenzo Antonio', 'Martinez Helo', 'Morelos', 'D', 'Operador de Secundarios', '1', '99111', '$2y$10$Km9wGqTGyWQMbzBeuj5uzuxfhptcE4emgEoXVKgvVzVKkurt9wsNG', '1993-07-16', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2020-08-28'),
(6242, ' Rogelio', 'Perez Lopez', 'Las flores', 'D', 'Operador De Procesos', '1', '99193', '$2y$10$yzRjSyPXDybMOSJAp6ZJ4.IxiB6aBn9c6/Ps9BPZo3E0Ci91ZMtYm', '1989-07-15', 'Varona Hernandez, Braulio', '61651', 'HUS', '2020-09-01'),
(6243, ' Jose Eduardo', 'Cuatzozon Santos', 'Haciendas de la Torres', 'D', 'Operador de Criticos', '2', '99201', '$2y$10$fCINnDc3PMbTdLeuP0O.ruDg3nz36hRdy9yjPeJkSRXJYju1BeIPq', '1994-01-19', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-09-01'),
(6244, ' Luis Armando', 'Chairez Ortega', 'Parajes del Sur', 'D', 'Operador Especialista', '1', '99217', '$2y$10$c//V4IWg6LVoiNsovPEDg.zjULUv8Ya21O.0tO5mKTjVAr9p1tBxm', '1994-08-02', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2020-09-02'),
(6245, ' Oscar', 'Hernandez Ramos', 'Gladiolas', 'D', 'Tecnico de Calidad', '1', '99221', '$2y$10$LPl6yyb10INW/bq4yjjUIuOGh/o0vJYOXNlMyUtYNlOprvIBdG/FC', '1978-09-27', 'Diana Demorey Carrasco', '128213', 'HUS', '2020-09-02'),
(6246, ' Eusebio', 'Navarro Garcia', 'Patria', 'D', 'Operador de Criticos', '1', '99358', '$2y$10$VOw/GZQV/JqO6hzZq9UC5O5/slf5pUgcwXjI7goHu.aEurWdcD4wm', '1981-08-14', 'Vania Garcia', '100540', 'HUS', '2020-09-09'),
(6247, ' Jose Gabriel', 'Alvarado Reveles', 'Senderos De San Isidro', 'D', 'Operador De Procesos', '1', '99368', '$2y$10$mL2GxIjTOXFgI9EsMtbMYe7EbDtXNcba3Oo6drvnu78nDp2aJ4eny', '1985-05-10', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2020-09-09'),
(6248, ' Henry', 'Carabantes Perez', 'Urbi Villa del Cedro', 'D', 'Operador de Set Up', '1', '99406', '$2y$10$fjPZ/EO30UELkWENrs1O5eJTZ4xDeVLfFLv9nrZMO9se1sYGieRHO', '1991-01-27', 'Sanchez Cordova, Rene', '41563', 'HES', '2020-09-10'),
(6249, ' Guadalupe', 'Rodriguez Rodriguez', 'Lomas del Valle', 'D', 'Operador General', '1', '99408', '$2y$10$kPyocB9W5zYiPrYu7S4xlO4Y23rHS3axVv.mpfATaSHVJFMiBRma.', '1994-11-28', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2020-09-10'),
(6250, ' Isaac Seth', 'Villegas Garcia', 'Horizontes del Sur', 'D', 'Tecnico Electromecanico', '1', '99416', '$2y$10$3yV0ndvd9SDGV0sTAInOF.YhSRb3rGwoPLXjA9KJsRmW9dnHXrQum', '2000-11-19', 'Juan Antonio HernÃ¡ndez Villanu', '95945', 'HUS II', NULL),
(6251, ' Jose Francisco', 'Malpica Gomez', 'Oriente Praderas del Sur', 'C', 'Auxiliar de Embarques', '2', '99417', '$2y$10$T8gQrDX1qXYydvs0kYv4T.Thy3Qr2d2V1TWDMB9brzui/xEsQAmN2', '1998-12-25', 'Ricardo Joel Trejo LÃ³pez', '84444', 'HUS II', '2020-09-10'),
(6252, ' Lizeth', 'Silva Sanchez', 'Paraje del sur', 'D', 'Operador General', '1', '99489', '$2y$10$30eu2KfuHHJDWSgTjCanTurU.07kixM4Vy0fI6dOf9AVLvsYDqiQi', '1995-08-17', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2020-09-14'),
(6253, ' Jesus', 'Guerrero Reyes', 'Oriente Paseo de las Torr', 'D', 'Operador de Set Up', '1', '99491', '$2y$10$FbU9TRqdKJSMtJEzJ9mdru22sZMykFQNw1mnIrS53e5pl1AZPrB6q', '1987-05-01', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2020-09-14'),
(6254, ' Hever', 'Sanchez Cruz', 'Hacienda De Las Torres', 'D', 'Operador de Secundarios', '1', '99506', '$2y$10$2tAXu0TazgGwWuPfnZlbRO7g/m1TZo55uej7U.0Mq0r5qHmyLtUVC', '1977-01-25', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2020-09-14'),
(6255, ' Isaias', 'Gonzalez Sifuentes', 'Praderas del Sol', 'D', 'Operador de Criticos', '2', '99566', '$2y$10$x/Nbhs/LekfWLMr49wTyy.EGCfAs85GCeI5oreQglwI70dCIx8lRS', '1982-07-06', 'Javier MartÃ­nez Acosta', '61908', 'HUS II', '2020-09-16'),
(6256, ' Carlos', 'Cruz Felix', 'Hacienda de las Torres', 'D', 'Jefe De Grupo De Almacen', '1', '99673', '$2y$10$hsgRhM3J5TME80FRmm4Mw.6WdfLhqqjDbvU.Qjz7vgYcBfgOkLI7K', '1980-04-21', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2020-09-18'),
(6257, ' Isidro', 'Cayetano Jimenez', 'Sor Juana Ines de la Cruz', 'D', 'Operador de Criticos', '2', '99678', '$2y$10$RCn7a4NZNc6K0nHHrwE0oetGkCTHlnJ2/9/JoEJ3EjvkgNOfkOcXu', '1987-03-15', 'Santiago Antonio Pacheco', '72187', 'HUS II', '2020-09-18'),
(6258, ' Rubi', 'Molina Montelongo', 'Horizonte del Sur', 'D', 'Operador De Procesos', '1', '99737', '$2y$10$0.VCfopH0Kb/zF1bkcz8KeZSsDxAqjUslqZLZAfcsW1v5OniQ6qQS', '1994-01-08', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2020-09-22'),
(6259, ' Javier', 'Sanchez Celis', 'Blancas', 'D', 'Operador General', '1', '99739', '$2y$10$scSoHW8UcMutwrmQjL.5N.sWTnOoaXlS2xNjE2GD.fd0031mSXqjq', '1977-09-14', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2020-09-22'),
(6260, ' Luis Gerardo', 'Perea Betancurt', 'Paraje de San Isidro', 'D', 'Operador General', '1', '99772', '$2y$10$dAGgzycp5EiIZ3cY5AnHBeg8Wnbd3Fb/fo5dskzdfi8sYz1bzlmpe', '1990-05-01', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2020-09-23'),
(6261, ' Misael', 'Roman Vasquez', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '2', '99858', '$2y$10$AlQZIglogydVZ1xhKC6x9.tAHs7BSuIiboxOdps1rJyDTE7CJGnt.', '1995-10-12', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-09-28'),
(6262, ' Julian Javier', 'Perez Carmona', 'Sierra Vista', 'D', 'Inspector Control de Calidad', '1', '99893', '$2y$10$i6zYoY6RX1XS8bNEBp9MmehoxQfO154myh9.OdauWcHAh3JZKH9ju', '1996-01-20', 'Jose Ruiz', '74929', 'HUS', '2020-09-29'),
(6263, ' Raul Arturo', 'Salazar Lirio', 'Oriente Aguilas de Zarago', 'D', 'Operador de Criticos', '2', '99983', '$2y$10$K81.PMwNVawSBpiLaTmM5.L2aLKvMiybsG0hVWI1SdcnUAegjTe6C', '1978-04-20', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-10-01'),
(6264, ' Eugenio', 'Dominguez Gonzalez', 'Carlos Castillo Peraza', 'D', 'Operador de Criticos', '2', '99988', '$2y$10$E33hGMvP57AhC4uekLjRye/yU06CyHYn9foyHoQNqCbe0USGBQC0a', '1996-09-28', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2020-10-01'),
(6265, ' Samuel', 'Contreras Vazquez', 'Portales de San Pedro', 'D', 'Tec Esp en Mtto Equipo', '2', '100070', '$2y$10$2I/gxPWtItQOJ3Dw6dcLRuA8GaXT340LCollrLFYSc4sxK6pTtn7K', '1992-12-22', 'Juan Antonio HernÃ¡ndez Villanu', '95945', 'HUS II', '2020-10-06'),
(6266, ' Luis Angel', 'Perez Villanueva', 'Sur el Granjero', 'D', 'Tecnico Seguridad Industrial', '1', '100335', '$2y$10$g9wfhJVgwNGvtnjEDAyXGuNAY6DKd4tFWq926Kg5gx0akdfxGMm72', '1991-11-21', 'Jose Rodolfo AcuÃ±a Lopez', '78080', 'HUS', '2023-02-21'),
(6267, ' Carlos Daniel', 'Isidro Manuel', 'Misiones del Real', 'D', 'Operador de Criticos', '2', '100430', '$2y$10$1O5/XLiJcBM0Pr46JwUZsumB3iW4DCFupWjGk0Y7CR.D6rcUeKLxe', '2002-02-27', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2020-10-22'),
(6268, ' Williams Ivan', 'Gonzalez Martinez', 'Aguilas de Zaragoza', 'D', 'Operador de Criticos', '2', '100431', '$2y$10$J4JHYgqS0FEGy5D8s680NukP6gHlBzx1jaF.3vQa5q4PyctXc3Dlq', '1995-04-21', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2020-10-22'),
(6269, ' Crescencio', 'Rodriguez Pablo', 'Parajes del Valle', 'D', 'Inspector Control de Calidad', '1', '100519', '$2y$10$81pqYFn4PjDqm5JOIPVXL.ICanbKa28OuvLJyr/8beHOn/btDq1Ye', '1990-02-07', 'Armando Reyes Maldonado', '86641', 'HUS', '2020-10-27'),
(6270, ' Eneyda', 'Fiallo Orrin', 'Oriente Paraje de San Isi', 'D', 'Operador General', '1', '100541', '$2y$10$y3Q1erJE38j4MAjcLwQhs.IZoKH8wNR3QUyka6mtwV3TF3f2r2.aO', '1991-12-22', 'Vania Garcia', '100540', 'HUS', '2020-10-28'),
(6271, ' Franklin Fernando', 'Perez Ramos', 'El Papalote', 'D', 'Operador De Procesos', '1', '100547', '$2y$10$XSYdJZ5dG/KaxYlKbOHZteqR6mfO4Fn62zC9ysGRJxkcYb6LVbRC.', '1999-07-16', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2020-10-28'),
(6272, ' Claudia Rumalli', 'Milagros Dominguez', 'Paraje de San Isidro', 'D', 'Operador General', '1', '100628', '$2y$10$hP67Q2I4fg.ry5OU65Ie1ecSw.lYYCeWLzBE9WviUg1LwvpVc86Je', '1996-03-18', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2020-11-02'),
(6273, ' Arturo', 'Rueda Rueda', 'Senderos de San Isidro', 'D', 'Set Up Produccion', '1', '100636', '$2y$10$nAUJZ9OMZDoYyMiXBC5gG.FDti/kcrWFGVdOFSO0AnsHok3XR8EBq', '1982-12-15', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2020-11-02'),
(6274, ' Ricardo', 'Martinez Vargas', 'Fracc Horizontes del sur', 'D', 'Tec Esp en Mtto Equipo', '1', '100638', '$2y$10$rLtcFEzpIh1j.u4.XiNPhOiIml/CLDvC9dxF6kqhROjpEpRLgNTKi', '1977-03-17', 'Mauro Sanchez', '61715', 'HUS', '2020-11-02'),
(6275, ' Ignacio', 'Vilchis Sosa', 'Oriente Terrenos Nacional', 'D', 'Operador General', '1', '100640', '$2y$10$uNqY4nI4HjMAq5jvTc5FE.OtXGNgZRM1YA./4ckll1wntmXzNeoju', '1971-07-31', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2020-11-02'),
(6276, ' Guadalupe', 'Capitan Trapaga', 'Hacienda de las Torres', 'D', 'Operador General', '1', '100654', '$2y$10$EYA5fYlMFDgttB2kWOYnreu6aqb7FXT6O8igg1sm0P5cyAp5Ixhkq', '1980-01-12', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2020-11-02'),
(6277, ' Dora Isabel', 'Vicente Zamorano', 'Tierra Nueva', 'D', 'Operador De Procesos', '1', '100659', '$2y$10$u2jz08SMLRo17h4nBbh/JefTaKTnbzp4NnlAwe5jyQha1sB2GB6JG', '1999-03-03', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2020-11-02'),
(6278, ' Blanca Idalia', 'Castro Zarate', 'Riberas del Bravo VIII', 'D', 'Jefe de Grupo', '1', '100692', '$2y$10$GHIFE7ldMVMi2NEMcA22peJdBBbpu.bKXpyoxNTXjVhuz6QFDb4i.', '1985-05-31', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2020-11-03'),
(6279, ' Santa Lucia', 'Moreno Rojas', 'Tierra Nueva', 'D', 'Operador De Procesos', '1', '100712', '$2y$10$kdPBoGO4dOH5nSMPXnlju.dC5zXa4ZzU5mks66lOFlVSVLTJMBbbO', '1979-12-13', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2023-01-31'),
(6280, ' Rosa', 'Bello Casimiro', 'Eco 2000', 'D', 'Operador De Procesos', '1', '100778', '$2y$10$a3hgo77irBxSvcKoDFwZJexODHN.Q3x7951ynFMybRbAYrYZ1iMiK', '1994-11-21', 'Varona Hernandez, Braulio', '61651', 'HUS', '2020-11-05'),
(6281, ' Maria Antonia', 'Regules Garcia', 'Oriente Parajes de Orient', 'D', 'Operador De Procesos', '1', '100785', '$2y$10$4EvH.wcrEp5ZVEYJQDxrEu2.RIuE3IgJ3zda4XSQbYIUIX7OMI4Qi', '1997-06-13', 'Arellano Mota, Arturo', '24791', 'HUS', '2020-11-05'),
(6282, ' Indra Monserrat', 'Fernandez Dolores', 'Paraje de San Isidro', 'D', 'Operador De Procesos', '1', '100925', '$2y$10$V/5GjjU0n0pdMtQ.RKG2.uvrm5fSj3vGfKYL7bRh961oXKnOthLJ2', '1995-06-29', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2020-11-11'),
(6283, ' Simon', 'Juarez Amaro', 'Villas De Alcala', 'D', 'Conteos Ciclicos', '1', '101002', '$2y$10$X/9JiEAqlh7P8NuxazbfZu25ecjjprSr6PGCeUhK/pxAm6sKFMYEy', '1991-12-04', 'Jenny Adriana Gonzalez MuÃ±oz', '73168', 'HES', '2020-11-13'),
(6284, ' Jhonatan Noe', 'Valencia Escamilla', 'Villas de Alcala', 'D', 'Operador de Criticos', '2', '101003', '$2y$10$dGfXoFzIztmusKFeHM1JPewhdPIzSofWDU4n7zAZh1XWWd2uRokl.', '1995-04-21', 'Reynaldo Mendoza', '88736', 'HUS II', '2020-11-13'),
(6285, ' Luis Alberto', 'De La Cruz Perez', 'Paraje de Oriente', 'D', 'Operador de Secundarios', '2', '101046', '$2y$10$42okFi11ncypg2rCW5sY8ODhJsxuRbznwXeN78Nu8m11dpABRKhRS', '1987-08-10', 'Javier MartÃ­nez Acosta', '61908', 'HUS II', '2020-11-17'),
(6286, ' Rosalinda', 'Martinez Garcia', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '101061', '$2y$10$tiiDzwqkBHhVxU3P2Tc.iuNl1GzG6OK2T0wci6B4.rKH/gnHa9X9e', '1994-12-15', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2020-11-18'),
(6287, ' Maribel Berenice', 'Rojas Chavira', 'Terrenos Nacionales', 'D', 'Operador General', '1', '101110', '$2y$10$Bnuwi8RyHPw2d27vVhgXLuVLoF1.u9vw1LG920ksmC8h3GzqPTG7S', '1985-10-29', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2020-11-19'),
(6288, ' Silvia Ruth', 'Guzman Dominguez', 'Las Haciendas', 'D', 'Operador General', '1', '101113', '$2y$10$bJy9ajL6Ju5rduQejtJtQui70yExFmhgaVeWVFcKVNFY9ysEd.hjq', '1972-04-10', 'Vania Garcia', '100540', 'HUS', '2020-11-19'),
(6289, ' Sergio Alonso', 'Burciaga Majalca', 'Paquime', 'D', 'Operador de Set Up', '1', '101125', '$2y$10$tlJRYttqFdJ2oFG.k92bbOTkGFWsHCtWOKnYjLsVb14ROYy2qzvNa', '1988-05-20', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2020-11-20'),
(6290, ' Edgar Ulises', 'Olivas Aguirre', 'Zaragoza', 'D', 'Tecnico Electromecanico', '1', '101225', '$2y$10$2HF.2pBrW3.ZrtK1wfyhD.bNx4RnecZpEW5RBVUMKOwYXCskGv4pe', '1995-09-10', 'Martinez Gonzalez Fernando', '24731', 'HES', '2020-11-26'),
(6291, ' Iris Jacksel', 'Carmona Pineda', 'Urbivilla del Cedro', 'D', 'Operador General', '1', '101239', '$2y$10$3Egi1Y/r7g1bnhNjop82iuX/ftcfXoEiG.4Rv3Cg9WY4Rc82rd7zG', '1987-01-12', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2020-11-27'),
(6292, ' Rodolfo', 'Perez Vielma', 'El Granjero', 'D', 'T.Lider Automatizacion Control', '1', '101256', '$2y$10$.wb.wMtTZ9JjeLsa1ikgy.1Jr2Xlp96GHmI/IXIsYupusIiDTavw.', '1990-06-30', 'Martinez Gonzalez Fernando', '24731', 'HES', '2020-11-30'),
(6293, ' Juan Manuel', 'Ruiz Torres', 'Arecas', 'D', 'Tec Esp en Mtto Equipo', '1', '101259', '$2y$10$XlAkj60hP0lym7i59MjHF.C21jv5wu68xmkuPtpte4Uub3DLhS9Z6', '1994-02-05', 'Mauro Sanchez', '61715', 'HUS', '2020-11-30'),
(6294, ' Omar', 'Dominguez Dominguez', 'Riberas del Bravo', 'D', 'Operador De Procesos', '1', '101285', '$2y$10$it/1V3Z1n4DWNh5AGkZZEO1y/JhSPcktqVSx8vQfN1crNPa4U1w0y', '1992-05-05', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2020-12-01'),
(6295, ' Ignacio', 'Compean Moran', 'Sauzal', 'D', 'Operador De Procesos', '1', '101287', '$2y$10$TMtQjaobYyF2w8oKyy3qnunkEZP52KQ5wLUFV7B5.K71TUq3g39tu', '1985-02-03', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2020-12-01'),
(6296, ' Marisol', 'Carbajal Rivera', 'Jardines de San Fco', 'D', 'Inspector Control de Calidad', '1', '101304', '$2y$10$41gNTiuYnf3.jwg1Z2AhGOwBLAWp5ahRwZtJSgQI3q/OGvt42QSwu', '1973-11-04', 'Oscar Garcia', '59965', 'HES', '2020-12-02'),
(6297, ' Heber Alejandro', 'AguiÃ±aga Perez', 'Los Arenales', 'D', 'Operador de Criticos', '2', '101505', '$2y$10$hTZSV46tiJQxtEF7w5sVBO4oEv0IjXjfPj5Y0AbvUPsDliS6bPHvq', '1984-09-03', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2020-12-11'),
(6298, ' Teodoro', 'Torres OrduÃ±a', 'Parajes del Sur', 'D', 'Almacenista', '2', '101801', '$2y$10$vIjV6qG.jl21qxZLSVNuV.rFfJ9h1SuelL4mZTISshXWoZ.M4D6M6', '1976-12-27', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '2021-01-06'),
(6299, ' Daniel', 'Talledos Hernandez', 'Oriente Oriente XXI Roma', 'D', 'Operador De Procesos', '2', '101802', '$2y$10$zHuzdssOZ72s1XyMMpG9LO9WoKPw4ZAlEt/GxZyiK.l9YzTb5S.U.', '1981-07-11', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2021-01-06'),
(6300, ' Juan', 'Martinez Pelaez', 'Hacienda Santa Fe', 'D', 'Operador de Criticos', '2', '101817', '$2y$10$VPqfV3vlOMbqPRVwLlqSle6RfdyNmBVmK4WliErQ9rWSdtkbAHFfG', '1985-09-13', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2021-01-07'),
(6301, ' David', 'Colmenares Moreno', 'Parajes del Sur', 'D', 'Operador de Criticos', '2', '101818', '$2y$10$QwHtHVYm7qN55dCWzHFBk.8eksOnBY4qkDHOpHE5eLKwhKg1inFXe', '1986-06-04', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2021-01-07'),
(6302, ' Alejandro', 'Rodriguez Ortiz', 'Manuel J Clouthier', 'D', 'Operador De Procesos', '2', '101819', '$2y$10$MY9UsCJJfSvs0nlxT9Niuu1y/EVFE.netzNSDjM44WaSFvLsYHpOS', '1998-10-21', 'Erik Rey Mata Texna', '61890', 'HUS II', '2021-01-07'),
(6303, ' Fernando', 'Rodriguez Ortiz', 'Frida Khalo', 'D', 'Operador de Criticos', '2', '101853', '$2y$10$ZNCAUdBKl73iyLsDlC/7JOE7DdUazZbof4Xr9OoV0zQDjIdOxkghy', '1985-03-31', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2021-01-08'),
(6304, ' Jesus Emilio', 'Martinez Castro', 'Hacienda De Las Torres', 'D', 'Almacenista', '1', '101935', '$2y$10$X5EeB9KX/CHj8e0/3F4EaeOD4EoRoqWwRw3YpBFIpYAEzU1b5qjgq', '1993-09-09', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2021-01-12'),
(6305, ' Juan Carlos', 'Reyes Ramos', 'Arecas', 'D', 'Tecnico Seguridad Industrial', '1', '102900', '$2y$10$qAaGpXhZWWXEsLc/MwNZJuguJOv2lM0aZ8n.qVapxoFBAxX.mGOka', '1995-08-22', 'Parga Rangel, Brayan Alexis', '86782', 'HUS', '2021-02-22'),
(6306, ' Jakeline Rocio', 'SaldaÃ±a Briones', 'Sierra Vista', 'D', 'Inspector Control de Calidad', '1', '102901', '$2y$10$p4Ez890tllO2DUVTIq7q.e9Za7H1qWurmhFV3M6ku2eQi47K/Kq6q', '1991-07-27', 'Esteban Vazquez', '84463', 'HES', '2021-02-22'),
(6307, ' Guadalupe Alexandra', 'Rodriguez Garcia', 'Puerto Castill', 'D', 'Operador General', '1', '102902', '$2y$10$ClTUnBJudU9WOCpRJYva2.RgeWJ1QYF8mEoOm6XvxarGhRNibzJsq', '1985-12-28', 'Vania Garcia', '100540', 'HUS', '2021-02-22'),
(6308, ' Alex Antonio', 'Rodriguez Sanchez', 'Sauzal', 'D', 'Operador De Procesos', '2', '102905', '$2y$10$Uzc7GE1zmXqZzxDMIhq55eA8oCjOwbn5XHc1qH7o54/USO.HLZdJK', '1999-12-04', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2021-02-22'),
(6309, ' Damari Samay', 'Lozano Valuis', 'Oriente Portal del Roble', 'D', 'Inspector Control de Calidad', '1', '102912', '$2y$10$16U4MxDl3lTIeMHFJlC7p./xQi4MgLfHq/FHhHd/E8hoX.rYyglD.', '2002-08-22', 'Jose Ruiz', '74929', 'HUS', '2021-02-22'),
(6310, ' Ma. Esthela', 'Sierra Salas', 'Cerradas del Sur', 'D', 'Operador General', '1', '102914', '$2y$10$yNDVdBRXOwvJ1jc1nkJ9wec0n.bv.XJfV9gxkErvdkc/iO./JxYse', '1982-07-14', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2021-02-22'),
(6311, ' Lesly Rubi', 'Parada Ramirez', 'La Enramada', 'D', 'Operador General', '1', '102921', '$2y$10$Mba6CCNssxRWRktG4og38.TQ09Z1dLAUnTGnlU3CouPVWkqp7ELa6', '1993-09-29', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2021-02-22'),
(6312, ' Yesica', 'Ripol Rodriguez', 'Paraje de Oriente', 'D', 'Operador De Procesos', '1', '103007', '$2y$10$u7EcIJUtd.8khjQ1AuBIE.PCyy6WgZx8LIWL83iaElrAy4.NpsEda', '1977-04-04', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2021-02-24'),
(6313, ' Candelaria', 'Lopez Carmona', 'Sur Roma', 'D', 'Operador General', '1', '103091', '$2y$10$dFaM048Idho8lRJSTTjbh.GW./347yP5i9ySvm2DOcxstgHs1DCjG', '1976-02-02', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2021-02-26'),
(6314, ' Arturo', 'Sanchez Jimenez', 'Riberas del Bravo', 'D', 'Operador De Procesos', '2', '103107', '$2y$10$5w7pVx0CdcaFpTXyCqso6.EnLCyG2t3oTKq/EQuQHHvPgxjFMKT2u', '1978-11-01', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2021-02-26'),
(6315, ' Leonardo Rafael', 'Vazquez Cruz', 'Riberas del Bravo', 'D', 'Operador de Criticos', '1', '103113', '$2y$10$zB.oAg5flTLC3Ucr2uGqJOqui4mIxjoYi8GYFaHasXzGcpnqpAaAu', '1990-02-19', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2021-02-26'),
(6316, ' Maximo', 'Perez Garcia', 'Paraje del Sur', 'D', 'Operador de Criticos', '2', '103198', '$2y$10$taAAdyfVgMKltuNbu21FA.gMGOB9g9sC366st4GuQo0roPuBnxRce', '1997-05-11', 'Garcia Gaucin, Erik', '28228', 'HUS II', '2021-03-01'),
(6317, ' David Humberto', 'Santiago Cortes', 'Solidaridad', 'D', 'Operador de Criticos', '1', '103242', '$2y$10$08L60CSSKQd.XZScQfuEM.gYl2jCbsbGEZkFFC5.KBSAf5hz/G9bC', '1996-03-25', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2021-03-02'),
(6318, ' Armando', 'Climaco Benitez', 'Cerradas San Pedro', 'D', 'Operador De Procesos', '1', '103249', '$2y$10$CbZtq8Pqa.SMdpfAwY7WH.cKvomp23hbwp8OXbOj/sMx1D8vp0hye', '1984-07-20', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2021-03-02'),
(6319, ' Trinidad Irene', 'Sosa Saiz', 'Paraje de Oriente', 'D', 'Operador General', '1', '104299', '$2y$10$SrmrZHUsmPID1oKErEXZcuV5BMN6xqtScqJinPn89jSI02Bfso/6.', '1971-06-06', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2021-03-03'),
(6320, ' Oscar Ivan', 'Felix Ortiz', 'Horizonte del Sur', 'D', 'Operador de Criticos', '2', '104308', '$2y$10$aaPPvTcgysCWQs6ktTUAWue9zNpbWkuKiwucIDK9YGJKIhTEmEHWS', '1995-10-25', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2021-03-03'),
(6321, ' Jose Del Carmen', 'Gutierrez Sanchez', 'Jardines de Roma', 'D', 'Operador De Procesos', '1', '104345', '$2y$10$5b4raskQJFwK2YJpBEDQp.zt3cS9qpcFxz7tmeHabwZDfEJt5zcV2', '1982-07-13', 'Velarde Inostroza Enrique', '71208', 'HUS', '2021-03-04'),
(6322, ' Roger Ivan', 'Del Porte Lopez', 'Sur Roma', 'D', 'Operador De Procesos', '1', '104417', '$2y$10$vkjjc1dxm/E0LQXFN9ssyueENh.5VVUESV3P6YiN2LpxT4Pk0MfPy', '1985-11-21', 'Abel Fernandez Delgado', '98716', 'HUS', '2021-03-05'),
(6323, ' Lorenzo', 'Martinez Rodriguez', 'El Granjero', 'D', 'Operador De Procesos', '2', '104422', '$2y$10$rKcA60.ysbhJZy4GfiRgTOJGIQInHSDRaqQrWDrXCKadtfmL9mOvu', '1990-11-19', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2021-03-05'),
(6324, ' Angel Noel', 'Chavarria Enriquez', 'Valle de Santiago', 'D', 'Tec Esp en Mtto Equipo', '1', '104532', '$2y$10$MOSBiSpyTbiK1OQO7ojcVeHrmb43UcKevf6NtM0f4J/DWKBFxSmGq', '1988-12-01', 'Mauro Sanchez', '61715', 'HUS', '2021-03-09'),
(6325, ' Sergio Alonso', 'Molina Martinez', 'Paraje Del Sur', 'D', 'Operador De Procesos', '1', '104612', '$2y$10$..MO041V6QA9ULZUMnN/wu94iMqyfF9Wx4UnEbhWJ6T1yH6oS9kfC', '1979-05-01', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2021-03-11'),
(6326, ' Adan', 'Tenco Calzada', 'El Fortin', 'D', 'Operador de Criticos', '1', '104762', '$2y$10$hDcTalPVwrjx2XKLke5AmePGhrn4eyTPcfzLZr4jtlUia3A/mjtz.', '1998-05-11', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2021-03-17'),
(6327, ' Jose Manuel', 'Rojas Gonzalez', 'Parajes de San Isidro', 'D', 'Operador de Criticos', '1', '104763', '$2y$10$ral8dWJLIQvsCNpRXbOZVenxFp9sUEaW.j6kkuulWmKKfvEZHzR1C', '1989-03-14', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2021-03-17'),
(6328, ' Alejandra', 'Roque Sanchez', 'Heroes de la Revolucion', 'D', 'Operador de Secundarios', '1', '104906', '$2y$10$D3A82rHhbbie75vLF..JieA6XEukvxIxnbRjDRG8CFAK4YTFrLmPG', '1992-06-26', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2021-03-22'),
(6329, ' Janeth', 'Reyes Ramos', 'Lomas del Valle', 'D', 'Operador de Secundarios', '1', '104912', '$2y$10$1LcIV/1tK8GgMQLx.FxTUulWt/f5k6IkpLA1X1FjFsPGNvcJn0Yx2', '1986-11-11', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2021-03-22'),
(6330, ' Vania Jazmin', 'Romero Altamirano', 'Villas de Alcala', 'D', 'Operador General', '1', '104923', '$2y$10$ViFJ41QMUV0sfnIhQHediemsZUuZUaS9iD0dmlkWpw1Fumks26CBa', '1986-11-09', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2021-03-22'),
(6331, ' Susana', 'Velazquez Parral', 'Paraje de San Isidro', 'D', 'Operador General', '1', '104926', '$2y$10$h/AcMd1w1sdt3GdrDH1kHuCrYyqLSTQgH2.eWxH7DoYkk/V64pT1O', '1984-09-05', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2021-03-22'),
(6332, ' Ever Gerardo', 'Villalba Gonzalez', 'Infonavit Solidaridad', 'D', 'Operador De Procesos', '2', '104967', '$2y$10$.G0FFjItmd8fInfdrTKfmey3pK09bQsjE3LSR.kf1Znyz8ebRQwjS', '1989-10-18', 'Erik Rey Mata Texna', '61890', 'HUS II', '2021-03-23'),
(6333, ' Azucena', 'Huerta Rosales', 'Parajes del Sur', 'D', 'Operador De Procesos', '1', '105127', '$2y$10$w1Bo73ARsKxWfd1IlLfsxeqR6DOszdxgoV2RxFFpallcunoj0iEUO', '1988-05-08', 'Arellano Mota, Arturo', '24791', 'HUS', '2021-03-29'),
(6334, ' Luis Fernando', 'Cruz Canseco', 'Juarez Nuevo', 'D', 'Operador de Set Up', '1', '105411', '$2y$10$ql.7r3fmN3uncaGyceCqrOMGce.lOjJnAXZNOfURS9SynI3/ITv8C', '1992-08-28', 'Sanchez Cordova, Rene', '41563', 'HES', '2021-04-06'),
(6335, ' Maria Del Carmen', 'Marquez Galindo', 'Las Haciendas', 'D', 'Operador General', '1', '105413', '$2y$10$SlEq4a/LQgkqvkRq99gmUuclFeSv4d/7aDijT63dwG.h71E1hLJkO', '1992-09-01', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2021-04-06'),
(6336, ' Silvia', 'Solis Vargas', 'Aguilas de Zaragoza', 'D', 'Operador General', '1', '105461', '$2y$10$pSoHSm8JLXHTXcU5Dh.CVeJqVoiAFeyswlHv5xLbwkNNXiqb4CkIO', '1974-10-03', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2021-04-08'),
(6337, ' Dayani Grissel', 'Villarreal Caballero', 'Las Haciendas', 'D', 'Operador General', '1', '105499', '$2y$10$VgjmWnkTsOiDi2J5cCm3S.TA7McyU1QpkYAqDzo6RWfT7QLhmHSES', '1990-04-16', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2021-04-09'),
(6338, ' Humberto', 'Chicuellar Torres', 'Paraje de Oriente', 'D', 'Almacenista', '1', '105500', '$2y$10$We0qeswi35DCBHuLZD6bI.2.pxFOWkYwFUu1c17hYLaG9g4bAidM.', '1996-03-25', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2021-04-09'),
(6339, ' Luis Fernando', 'Del Porte Bruno', 'Sierra Vista', 'D', 'Operador General', '1', '105501', '$2y$10$f6kHCXfJvFAq7GKwfFdnOubh02jkalQgoVeBCkmpqLtYBCV6NuOcK', '1997-04-08', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2021-04-09'),
(6340, ' Alexis Yovani', 'Rodriguez Rosales', 'Paraje de Oriente', 'D', 'Operador de Criticos', '2', '105518', '$2y$10$HzuR1.u2TzIIjdcUeiqv0ufnpsCd/c2HZCESLm5aT7V6umpeskGha', '2001-09-21', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2021-04-09'),
(6341, ' Jesus Gilberto', 'Rodriguez Rosales', 'Paraje de Oriente', 'D', 'Operador de Criticos', '2', '105526', '$2y$10$E9ts.eJLv9H8c1N4ppt64OM6tCIngz/OAAmCIG1JpCW/idD6IyWpi', '2003-03-25', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2021-04-09'),
(6342, ' Marcela', 'Morales Calderon', 'Parque Mirador Etapa 1', 'D', 'Operador General', '1', '105552', '$2y$10$OA4fII1Sraa7mfuNQck1JO.7mmidWP7u9IYcLDS6haEj/rWVVZYiC', '1986-01-16', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2021-04-12'),
(6343, ' Vitalia', 'De los Santos Espinosa', 'Oriente Paraje de Oriente', 'D', 'Operador General', '1', '105553', '$2y$10$m3PTn3HtVDuuPKayUucS8u57wBpbWNujqv4JaECQ9UKbCH.5sV/4S', '1981-05-19', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2021-04-12'),
(6344, ' Claudio', 'SantibaÃ±ez Narciso', 'Valle Fundadores', 'D', 'Operador Especialista', '1', '105557', '$2y$10$wOXu6bvr63nHjVY1XD2xL.vMAkTP7rweKRxsOXbdMaIgJuyL9Sqa2', '1989-08-22', 'Abel Fernandez Delgado', '98716', 'HUS', '2021-04-12'),
(6345, ' Adela', 'Lara Rodriguez', 'Roma', 'C', 'Auxiliar de Recibos', '1', '105560', '$2y$10$8weG3J4Fr8mE3J.RpskHcumGdTPnz1kqA0t2gZMnkN0rTtEgF./ny', '1997-09-13', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2021-04-12'),
(6346, ' Francisco Javier', 'Fuentes Martinez', 'Riveras del Bravo', 'D', 'Operador General', '1', '105625', '$2y$10$OH5MpBBScAZMbqbA6L6McuS9su02NFEUT4E9V6u1SQq6FcOrtCYkq', '1996-08-16', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2021-04-13'),
(6347, ' Jairo', 'Zavala Muro', 'Mezquital', 'D', 'Operador de Criticos', '2', '105633', '$2y$10$1MR8JVLgAX5ohM9jmK2Nk.4clCsDxuJl11N3A.Im7zfiqLL4bmmD6', '1992-01-29', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2021-04-13'),
(6348, ' Brayan Ulises', 'Martinez Carmona', 'Hacienda de las Torres Un', 'D', 'Operador de Criticos', '2', '105635', '$2y$10$mdIDt6hGFk2.v0/ebTck5OaLSejI2Yc4PtUyHs29DmW7/W7aveI2.', '1995-10-07', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2021-04-13'),
(6349, ' Irvin Alberto', 'Hernandez Lopez', 'Valle Fundadores', 'D', 'Operador de Criticos', '2', '105638', '$2y$10$FgUlUT41o7jROr/NmYdlWuXwFKF6MNoOQf2FWceQHiiJu0Yjkx6HC', '1998-12-18', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2021-04-13'),
(6350, ' Jose Luis', 'Catarino Bravo', 'Paraje de San Isidro', 'D', 'Operador Secundario', '2', '105642', '$2y$10$txylEmtD6El5wz1nzgduMePXk9WdpndrVpBgm18JdHIFQ2f54IYtG', '2000-11-14', 'Erik Rey Mata Texna', '61890', 'HUS II', '2021-04-13'),
(6351, ' Enoc', 'Naranjo Hernandez', 'Paraje de San Juan', 'D', 'Operador de Secundarios', '2', '105680', '$2y$10$dyUnrnNKss7dC6B.fbeCuuHBewGa4y8SKqcA0trdubaabghXL88LO', '2000-11-06', 'Javier MartÃ­nez Acosta', '61908', 'HUS II', '2021-04-14'),
(6352, ' Marco Antonio', 'De La Cruz Maldonado', 'Valle de Allende', 'D', 'Operador de Criticos', '2', '105725', '$2y$10$LBrZpkWPuGAW0Qejm7Ftv.jZR6RwGPhk.e2giIfnHPFiB5OKGyWHu', '1987-06-13', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2021-04-16'),
(6353, ' Omar', 'Lorenzo Poxtan', 'Urbivilla', 'D', 'Operador de Criticos', '2', '105765', '$2y$10$PwVAs9Aq7mVvzh4zutrXFOrw8Gqiob/ifT3EQguCRthZKfZddlc26', '1988-02-15', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2021-04-19'),
(6354, ' Luis Felipe', 'Gonzalez Martinez', 'Praderas del Sauzal', 'D', 'Operador de Criticos', '2', '105866', '$2y$10$0mV0uiyqRrIpszSEmSKVLO4ZDAngB2Pte21I4vZ6xBGR2MS0V3pt2', '1998-06-17', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2021-04-22'),
(6355, ' Luis Edgardo', 'Guzman Martinez', 'Horizonte del Sur', 'D', 'Operador General', '1', '105944', '$2y$10$4QCtMJtEoc8LSnFopS91vu9G7aQb71Qix6jK5EXAqp2BtNKhEsLzu', '1996-07-08', 'Sanchez Cordova, Rene', '41563', 'HES', '2021-04-26'),
(6356, ' Eduardo', 'VillafaÃ±e Lopez', 'Tierra Nueva', 'D', 'Operador De Procesos', '1', '106004', '$2y$10$WfHWRL4yNWdsNb/yNXyIhe2kYzGpRyfwyx3yR1DVPK4TwORhqflEa', '1984-12-15', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2021-04-28'),
(6357, ' Wiliam', 'Chavez Luis', 'Hda de Las Torres Univers', 'D', 'Operador De Procesos', '1', '106178', '$2y$10$OP7UTXrHQb6OwzNiDQgGQuzzfDsdLYo32ni4CZM7W/CQo/oMQny6G', '1987-02-25', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2021-05-05'),
(6358, ' Maria Del Carmen', 'Vicente Martinez', 'Urbivilla del Cedro', 'D', 'Operador de Criticos', '1', '106181', '$2y$10$hX0kph8E.Mfmc9FyEleDKes5PfohRSlxxBM2r5amjPZgPhnQmYPcm', '1997-10-01', 'Daniel De Jesus Favela Najera', '73913', 'HUS', '2021-05-05'),
(6359, ' Luis Angel', 'Molina Gallardo', 'Hacienda las Torres', 'D', 'Operador de Criticos', '2', '106211', '$2y$10$FTlt/NF0fLLR3Q0J9fX39uzeS/nGfoOdcvVBxy8Pvy8tBjR/6dUjy', '2001-05-01', 'Cecilia Adame Camacho', '97655', 'HUS II', '2021-05-06'),
(6360, ' Jose', 'Olvera Marentes', 'Paraje del Sur', 'D', 'Tec Esp en Troqueles', '1', '106280', '$2y$10$hpdLky5E5lMyf2zDoTOx9OzE5BKZ43b9mB.QHIBGfHpLEM8wQ78E.', '1988-11-24', 'Favela Alvarado, Jose Luis', '25333', 'HES', '2021-05-11'),
(6361, ' Cesar', 'Gonzalez Alvarado', 'Praderas de Los Oasis', 'D', 'Tec Proceso de Moldeo/Die Cast', '1', '106443', '$2y$10$4QWxs4RXwnI6qbe/QqvEC.xdu3i2gr9dpTuvUiCTeA5Ea1AtO1Uaa', '1975-12-13', 'Gustavo MacÃ­as Sandoval', '73857', 'HUS', '2021-05-18'),
(6362, ' Rodulfo De Jesus', 'Camacho Lopez', 'Cerradas del Sur', 'D', 'Operador de Criticos', '2', '106518', '$2y$10$1tZ3jmPtyo9e3KfiDauY8uATLGh21SQWGNqLScOO28WKghFLncq/S', '2002-06-15', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2021-05-20'),
(6363, ' Mario Alberto', 'Silva Martinez', 'Carlos Chavira', 'D', 'Operador Especialista', '1', '106541', '$2y$10$6zbSv.gYMspiRxk6Uju/1uOy/691uxXK.6cI1Qvi2nZbeu88n00Qa', '2000-06-08', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2021-05-21'),
(6364, ' Aldrin', 'Zamora Bautista', 'Rincones del Rio', 'D', 'Operador de Set Up', '1', '106543', '$2y$10$V2dUHFddDaluDZNXJhoqxelPQGXozQ2aP7IvRk1AjQCAAnRKLmPVy', '1981-06-06', 'Sanchez Cordova, Rene', '41563', 'HES', '2021-05-21'),
(6365, ' Jose Joel', 'Garcia Castillo', 'El Papalote', 'D', 'Operador de Criticos', '2', '106553', '$2y$10$5zhJxBn5qCmVhdRCYie8i.ZTJ4zZqpsBHj2Q.jOay8TiXomGR0pFi', '1999-08-31', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2021-05-21'),
(6366, ' Karen Isabel', 'Palacios QuiÃ±onez', 'Division del Norte', 'D', 'Tec Seguridad Industrial Sr', '1', '106564', '$2y$10$xYEpoUaEGB6VQj/YEEd26u13Nh4yWeAfoOZc23e0Iy6VGJNJCWLSG', '1998-06-19', 'Parga Rangel, Brayan Alexis', '86782', 'HUS', '2021-05-24'),
(6367, ' Daniel Alfonso', 'Martinez Rivero', 'La CaÃ±ada', 'D', 'Operador De Procesos', '1', '106656', '$2y$10$WRdK6Ktc2iLgJh25XKiF2Ob6.L26dwBkiOHfqZv9zEyI78EXoaQdq', '1990-02-11', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2021-05-26'),
(6368, ' Jose Gerardo', 'Davila Diaz', 'La Enramada', 'D', 'Operador de Criticos', '2', '106735', '$2y$10$d4pzKZvydJHuSFYaN/rQr.tjbab7SJKQsUByp.9Ch.Qc.ioH/C0VS', '1982-05-16', 'Javier MartÃ­nez Acosta', '61908', 'HUS II', '2021-05-27'),
(6369, ' Jose Andres', 'Diaz Jordan', 'Salvarcar', 'D', 'Operador Especialista', '1', '106864', '$2y$10$UyDkVmjfUX6ipLcUoyIiTO58nzVAPVc1.BgDHPjDVZGlwEtiJDeuy', '1996-06-20', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2021-06-02'),
(6370, ' Ezequiel', 'Cruz Joaquin', 'Villas de Alcala', 'D', 'Operador Especialista', '1', '106928', '$2y$10$numWkVxk1kS6XLqPWjIow.lxFniglUEuVp9sdcdDiOz/HB/x/.3EC', '1992-02-14', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2021-06-03'),
(6371, ' Bricio', 'SantibaÃ±ez Narciso', 'Urbi Villa Del Prado', 'D', 'Operador de Criticos', '2', '106931', '$2y$10$JkE767Y7omBWr/wWuhMF4.P0erl7TxlzEpDQDWZxOSwkH1V3h0sji', '1987-07-23', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2021-06-03'),
(6372, ' Yobani', 'Rodriguez Hernandez', 'Paraje del Oriente', 'D', 'Operador De Procesos', '1', '106937', '$2y$10$rQ6MXCC5i0EulBh2qyjLB.e1hoS1.tLt.mBCWzK4.VfFElZSN/Bvu', '2000-08-12', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2021-06-03'),
(6373, ' Julio Adrian', 'Vazconcelo Lopez', 'Valle Fundadores', 'D', 'Operador de Criticos', '2', '106981', '$2y$10$338DcSIOPJXanwtaaiWUfOub5/.2DuL6Lmg9/YcS67qYnburN6KkC', '1997-07-24', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2021-06-04'),
(6374, ' Jose Luis', 'De la Cruz Lopez', 'Manuel Jesus Clouthier', 'D', 'Operador General', '1', '107048', '$2y$10$MOQ6kNna1YUx8PPTpc9zcebcYUkspvi3OS7m5UJKI1zykZ3V3/z9y', '1972-03-19', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2021-06-08'),
(6375, ' Cesar Felipe', 'Canul Hau', 'Granjero Pie de Casa', 'D', 'Lider de Tecnicos de Tool Room', '1', '107051', '$2y$10$Qqc6rH20P6ZkIdHTEVxwW.rTYbr50hCcHn5iHVrwNjWT0g7PRKpEK', '1991-08-24', 'Favela Alvarado, Jose Luis', '25333', 'HES', '2021-06-08'),
(6376, ' Jose Luis', 'Carlos Diaz', 'Manuel Valdez', 'D', 'Operador De Procesos', '1', '107090', '$2y$10$3dTlubdq6sC9rvo3qW.TRO5UH6wq/lyfa/RMU.Y13UetpKTLV67L.', '1993-04-08', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2021-06-09'),
(6377, ' Oscar Arturo', 'Ibarra Solis', 'Urbi Villa Del Cedro', 'D', 'Operador De Procesos', '2', '107109', '$2y$10$FxwM/vauPwylbLJs2aip/Oj1flJgQhVv1tL9Vz56/Z/VxD67hKJJq', '1993-05-21', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2021-06-09'),
(6378, ' Diego', 'Lopez Torres', 'Parajes del Sur', 'D', 'Operador de Criticos', '2', '107181', '$2y$10$DiK9MSl74M3CeyhDYjqn.Om26n8dPXflqPsd8nV61ZWRem4ZKocHu', '1991-04-09', 'Garcia Gaucin, Erik', '28228', 'HUS II', '2021-06-14'),
(6379, ' Ramiro', 'Espinoza Juarez', 'Sur el Mezquital', 'D', 'Operador De Procesos', '2', '107379', '$2y$10$Htra4UU72V2OLVfqvJ9a9OwqM7nRZAPQ4Shdms1PN.5RnPSJi5pTC', '1977-04-14', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2021-06-21'),
(6380, ' Brenda Socorro', 'Sarabia Rios', 'Senderos de San Isidro', 'D', 'Operador General', '1', '107456', '$2y$10$S59eSzx39Cz3XdVsWhFZPOpzWyj5RItNBNglq2SSxJ/nynYeACZ3a', '1987-09-11', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2021-06-23'),
(6381, ' Maria Ines', 'Ramirez Santiago', 'Paraje de Oriente', 'D', 'Operador General', '1', '107464', '$2y$10$P8MvtM/856sOIDhRsW.I/e9wndamHlrD5.H3sfiF9RdI8OInbUD7e', '1978-01-21', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2021-06-23'),
(6382, ' Monica', 'Rojas Barron', 'Sur Terranova Sur', 'D', 'Operador de Criticos', '1', '107469', '$2y$10$D3vyZBnnFKCMNbLCRwe0weNpIUyh4GQZg5.dL1ac5jYcpcnZCLJh.', '1986-05-04', 'Jesus Lopez Solis', '73653', 'HUS', '2021-06-23'),
(6383, ' Roman', 'Jimenez Jimenez', 'Villa Res del Real', 'D', 'Operador General', '1', '107470', '$2y$10$nvw3rhZAjjtY/LkhGH54AO2dYOKoj5hGpbEy.eYWdc5.B1hp2wVkG', '1978-08-21', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2021-06-23'),
(6384, ' Mareli', 'Sosa Illescas', 'Riberas del Bravo', 'D', 'Operador de Criticos', '1', '107472', '$2y$10$bzKy3czXtFauPBO4eYVtMu3LFQEBMNc8OLPXmepGJDKSiGft681cm', '1992-05-12', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2021-06-23'),
(6385, ' Rafael Josue', 'Reyes Villegas', 'Vistas de Zaragoza', 'D', 'Operador De Procesos', '1', '107475', '$2y$10$PV688TYt8LIkk5cr6h2oae/68Eljp5utmJHdHG1.iDRwyXnxWIKbW', '1996-08-30', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2021-06-23'),
(6386, ' Felix Eduardo', 'Ramirez Santiago', 'Paraje de Oriente', 'D', 'Operador de Criticos', '2', '107493', '$2y$10$ciqN2v7.rXzFqOf1eLCtqe6rWgB7GTY8B3CqrSMpNddmNy3.Ji2XS', '2002-03-02', 'Garcia Gaucin, Erik', '28228', 'HUS II', '2021-06-24'),
(6387, ' Silviano', 'Carlos Martinez', 'Paraje deSan Juan', 'D', 'Tecnico de Ingenieria Sr', '1', '107646', '$2y$10$bZ0ktCif4Tz4S0bB8bJ9G.hKuFZ13bk8Rbi903nUEcMYftYXdtDWq', '1998-02-14', 'Guillermo Moreno', '72011', 'HUS', '2021-06-29'),
(6388, ' Marcelino', 'Cruz Chontal', 'Las Haciendas', 'D', 'Operador De Procesos', '1', '107648', '$2y$10$RK4wBp84oc7JHJS2F4db5umAivBFmfFD9vBq29UVhXLMz8HzlgyPi', '1997-09-05', 'Velarde Inostroza Enrique', '71208', 'HUS', '2021-06-29'),
(6389, ' Lorenzo Antonio', 'Cano Rodriguez', 'Paraje de Oriente', 'D', 'Operador General', '1', '107683', '$2y$10$QmC9mRaIh7xpK0ueNAlWdO2A2F5qkT9nwvj44ynIrv3NXwc8D9y3q', '1995-08-09', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2021-06-30'),
(6390, ' Citlali Yarelin', 'Beltran Gonzalez', 'Paraje de San Isidro', 'D', 'Operador General', '1', '107685', '$2y$10$0xJl7KcNUW1fCwjH6L4KAuUlsltW2/xhOJZOcEDJwsuvxJVfo7lzy', '1994-12-28', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2021-06-30'),
(6391, ' Efrain', 'Ramos Peinado', 'Paraje de San Jose', 'D', 'Operador De Procesos', '2', '107789', '$2y$10$05DkU1jgBS5hAmK1IQECduVb0cyeRgmxS9gP315lmdD2YnrdcxmpC', '1989-09-23', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2021-07-05'),
(6392, ' Miguel Angel', 'NiÃ±o Escobedo', 'Roma', 'D', 'Operador General', '1', '107805', '$2y$10$Y0f9S0iFXOrxocFVL/JLTOn2LIAhupeintzV0sKZsiyApWkkhPktO', '1977-09-15', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2021-07-06'),
(6393, ' Mauricio', 'Montalvo Gonzalez', 'Privadas Florencia', 'D', 'Operador General', '1', '107850', '$2y$10$aFcBYK7lGDBpguKnMndwIeoN8y6E9DNGzYMmUxSgPHQPqYvNK0yDi', '1992-09-22', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2021-07-07'),
(6394, ' Jorge', 'Perez Ramirez', 'Riberas del Bravo VI', 'D', 'Almacenista', '2', '107892', '$2y$10$VLDsegVz0GcDflBZJUcSiuZcOO24qzUy2q/gQGIP2Nu02AY0iSCzW', '1990-04-23', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '2021-07-08'),
(6395, ' Jose Carlos', 'Ortiz Zavala', 'Paraje San Jose', 'D', 'Operador De Procesos', '1', '108087', '$2y$10$hcTBrysPpSZV1r0zQDmg...fwmntJCPtGntT.jF5XASMLY8xPURia', '1986-01-11', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2021-07-15'),
(6396, ' Martha', 'Esquivel Ibarra', 'Medanos', 'D', 'Operador General', '1', '108164', '$2y$10$orgWqeo2MkaxykB4SpmO1e0Pa5AXTkvbizunWEXPKQJOfDMTpbFci', '1975-11-13', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2021-07-19'),
(6397, ' Karla', 'Ortiz Morales', 'Parajes del Sur', 'D', 'Operador General', '1', '108190', '$2y$10$cAMIS/X3tppg1njv8ZwWZ.5tlPYqPO.vxVHV4LPrSMAUxhIxZuMLS', '1995-07-26', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2021-07-19'),
(6398, ' Mario Alberto', 'Cano Carmona', 'Portal del Roble', 'D', 'Almacenista', '2', '108202', '$2y$10$ce3V.4dMwT214eDQ0dia/.6S1nxlDecDXfyz/7E02IkdP8ZxBgM2e', '1990-08-10', 'Santiago Antonio Pacheco', '72187', 'HUS II', '2021-07-19'),
(6399, ' Rodolfo', 'Gonzalez Rodriguez', 'Praderas del Sur', 'D', 'Inspector Control de Calidad', '1', '108258', '$2y$10$v5Pc73ElE9SEbY7zs5.GOucSmyVFDGc5l2V6StfZfNJPONFWP9u..', '1984-01-11', 'Diana Demorey Carrasco', '128213', 'HUS', '2021-07-20'),
(6400, ' Juan Angel', 'Hernandez Pedraza', 'Riveras de Bravo', 'D', 'Operador de Criticos', '2', '108272', '$2y$10$4kD0Oc9HARNTXVwSBTLz.uwg/KWt1AWC0ubQrf4A4envIOjG7RfkS', '1993-05-19', 'Purata Enriquez, Misael', '33458', 'HUS II', '2021-07-20'),
(6401, ' Oscar', 'Juan BolaÃ±os', 'Monte Cantal', 'D', 'Operador de Criticos', '2', '108366', '$2y$10$1MhpzU5i45h/KqbE3ONZW.fjlep2d.HxvGHFN0kx5PkMgxla9CRzi', '1990-06-19', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2021-07-22'),
(6402, ' Sergio Lucas', 'Rodriguez Gonzalez', 'Oriente Urbivilla', 'D', 'Operador De Procesos', '2', '108397', '$2y$10$8VBp4xgqQ6tx.mDeaYjiPO/BaFxBRLMgA0GUQabWI64u2LmEPOIZa', '1983-10-08', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2021-07-23'),
(6403, ' Omar', 'Rodriguez Gutierrez', 'Paraje de San Juan', 'D', 'Almacenista', '2', '108533', '$2y$10$cdN8dNVia.Hxqqp13s76iezBhWkPsnneTOoKUqurKxyzIXmNTDGrK', '1978-08-13', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '2021-07-29'),
(6404, ' Abel', 'QuiÃ±onez Chavez', 'Paraje de San Iisidro', 'D', 'Operador de Criticos', '2', '108618', '$2y$10$OnNWnwOL2lz4YclAjMcl3uH1Q9fHTJ.6c95TAxVsi5M69FcfcqTlG', '1999-03-11', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2021-08-02'),
(6405, ' Jose Manuel', 'De Jesus Hernandez', 'Urbivilla del Prado', 'D', 'Operador de Criticos', '2', '108694', '$2y$10$uww0IEcalUXvgWYurz9gy.AFsHB24EGe3Ac1/aTEuci1d.NQCZyoe', '1979-12-11', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2021-08-05'),
(6406, ' Cesar Antonio', 'Santoyo Silias', 'Parajes del Sur', 'D', 'Tecnico de Calidad', '2', '108695', '$2y$10$O5omSpnmKaAZBWi4RWwxdeismUVQEo89Kyp7h.jqHkdx29j13WVF2', '2002-09-02', 'Humberto Lopez Lopez', '61865', 'HUS II', '2021-08-05'),
(6407, ' Jesus Norberto', 'Albizo Paez', 'Cerradas de San Pedro', 'D', 'Tecnico de Calidad', '2', '108766', '$2y$10$8KID/ldcwFY2P92tK.rUBOgv9VNF3X2O2KUWLBolzXY79pM6xq/4K', '1992-06-06', 'Humberto Lopez Lopez', '61865', 'HUS II', '2021-08-09'),
(6408, ' Erick Daniel', 'Jimenez Esquivel', 'Urbivilla Bonita', 'D', 'Operador de Criticos', '2', '108826', '$2y$10$yuWfhoe/wcNAe84sD.SHWuWvzvw3C8tMQ20ZGUTDwRzvXTqvaG1I6', '2003-03-11', 'Talamantes Antunez, Jose Guada', '62051', 'HUS II', '2021-08-10'),
(6409, ' Karla Sujey', 'Prospero Cuellar', 'Parajes de San Juan', 'D', 'Operador De Procesos', '2', '108827', '$2y$10$X931mr7tEF0/si8pvS8DTOqtPbO/Km3lbVz8EnHt6FgojtOfbikO2', '1982-04-25', 'Garcia Gaucin, Erik', '28228', 'HUS II', '2021-08-10'),
(6410, ' Omar', 'Cruz Joaquin', 'Oriente Villas de Alcala', 'D', 'Operador De Procesos', '2', '108898', '$2y$10$lHynuLqFaum1Ft5BPsWl6.PgP6OQCLmJVNA2gTts3BhbtbAEcZQry', '1985-04-16', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2021-08-12'),
(6411, ' Angel Arturo', 'Sanchez Galan', 'Aguilas de Zaragoza', 'D', 'Operador General', '1', '108927', '$2y$10$wdBiop63nktU//ad4UNceODPppBDKYX4pzSUPD80aPMSfo17ka4ve', '1996-02-23', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2021-08-13'),
(6412, ' Felipe', 'Huerta Villalobos', 'El Fortin', 'D', 'Operador De Procesos', '1', '108933', '$2y$10$bnxFOadt3NiFcbtP9DtrIufr/poTECmJlrRn7e5Ne08MUFxLghA1K', '1999-05-26', 'Varona Hernandez, Braulio', '61651', 'HUS', '2021-08-13'),
(6413, ' Luciano', 'Camacho Felix', 'Paraje de Oriente', 'D', 'Operador de Criticos', '2', '108935', '$2y$10$BS0jq6ANpqj89YzO.q5UmO8pOnDmfKBdj1.nYDSv3xtfj/aNSqoHW', '1982-12-13', 'Garcia Gaucin, Erik', '28228', 'HUS II', '2021-08-13'),
(6414, ' Omar', 'Hernandez Solis', 'Oriente Paraje de San Isi', 'D', 'Operador de Criticos', '2', '108967', '$2y$10$6yyfchdU4GVn9cwB.iuub.3ejEFXxL9Nai8A1ucIsptZXYsSZSkrW', '1990-07-09', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2021-08-16'),
(6415, ' Juan Carlos', 'Tlapa Rios', 'Carlos Chavira', 'D', 'Operador de Secundarios', '1', '108994', '$2y$10$QYN7WgOXzTzpF/24BSszTuAm3B82Kgn9AEB/HvpVerX7QirtNNFke', '1984-12-23', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2021-08-17'),
(6416, ' Serapio', 'Manuel Bautista', 'Fcto. La Enramada', 'D', 'Operador de Criticos', '2', '108998', '$2y$10$LMzJYOWAenKG9MkNKoh3C.RSwjae.KW0HbOKvx6yRKvvHHkN7fLhe', '1994-01-14', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2021-08-17'),
(6417, ' Guadalupe', 'Valles Devora', 'El Granjero', 'D', 'Tec. Seguridad Industrial Sr', '1', '109060', '$2y$10$l/7FO1eWxTbeC22zitYnuOh6LWxBqb7zt7lmIohe6w2GEGLFamtTS', '1997-12-27', 'Jessica Alejandra Aguilar Guti', '109077', 'HUS', '2021-08-19'),
(6418, ' Martin', 'Gonzalez Ceballos', 'Riberas del Bravo', 'D', 'Operador de Criticos', '2', '109182', '$2y$10$0k.DmQpavtQyJEXlmY0UOOatRKLA1qXJ4fWFfRzL7NLERIMQ3P55K', '1981-03-25', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2021-08-25'),
(6419, ' Jesus Antonio', 'Lopez Martinez', 'El Papalote', 'D', 'Operador De Procesos', '1', '109240', '$2y$10$zP2oKHQ6HENmbLGXocZQvuzRW2MtXEYDe72rsRMjKoRsbwmIvRQ2i', '1998-06-02', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2021-08-27'),
(6420, ' Jose Antonio', 'Solano Hernandez', 'Riveras del Bravo', 'D', 'Operador De Procesos', '1', '109242', '$2y$10$lU4GP5UYbG4yjeLNgNs/meAnBmhvybUvXjkC5A/GSq5FaWafxGVju', '1981-08-15', 'Velarde Inostroza Enrique', '71208', 'HUS', '2021-08-27'),
(6421, ' Sergio', 'Alejandro Guzman', 'Carlos Chavira Becerra', 'D', 'Operador De Procesos', '1', '109243', '$2y$10$FDxePuzA2M6/3rV7FrXxq.TpSv/5LIugzRmTwIu8UJ8rMh4FI19BW', '1987-10-08', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2021-08-27'),
(6422, ' Daniel', 'Borja De Jesus', 'Paraje de San Isidro', 'D', 'Operador de Criticos', '2', '109294', '$2y$10$0.T4nrVvyk2mj.SFDmvma.7W3jMNbaTaTq87GMbErc0RQCDBFlam6', '1991-10-20', 'Garcia Gaucin, Erik', '28228', 'HUS II', '2021-08-31'),
(6423, ' Marbella', 'Flores Gonzalez', 'Riveras del Bravo', 'D', 'Operador General', '1', '109339', '$2y$10$PT1vngChrpYc3R5VUXYUJOywYpqcYDIVMG0ZAcMBajVfrxqXTIsji', '1986-03-01', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2021-09-01'),
(6424, ' Rafael', 'Oseguera Ortigoza', 'Oasis Revolucion', 'D', 'Operador de Secundarios', '1', '109421', '$2y$10$9bew4W6t5mn3m0kocojHfew5d8c3XxMUi0Gy6joh5nvm2K06mtAiW', '1997-11-06', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2021-09-07'),
(6425, ' Xochitl Citlalit', 'Perez Alarcon', 'Villas de Alcala', 'D', 'Operador de Criticos', '1', '109564', '$2y$10$Srw98z5FC60mrrSVEMe7NuFNeaAtiZ5A5WQTHdPaH74myh.x39Slu', '1988-09-29', 'Saul Arellano Escobar', '97722', 'HUS', '2021-09-13'),
(6426, ' Marcelino', 'Morales Gonzalez', 'Senderos del Sol', 'D', 'Almacenista', '1', '109612', '$2y$10$d21noIxEsO/PEUop6JO7IOhTDfm4yQwwJGl/O/rt4dM0mn7RioWGu', '1987-05-13', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2021-09-14'),
(6427, ' Victor Hugo', 'Soto Cabello', 'Parajesnde Oriente', 'D', 'Operador De Procesos', '2', '109641', '$2y$10$wYC/6zY8Sji/Zp9iwkWV0ucjyIHH61/H/S4JiRrfHjuwwmCJN2ZIO', '1995-03-03', 'Purata Enriquez, Misael', '33458', 'HUS II', '2022-12-20'),
(6428, ' Ariadna Mayela', 'Martinez Luciano', 'Jardines de Roma', 'D', 'Capturista de Datos Etiquetas', '2', '109642', '$2y$10$BIraRBerInaD0/05dL75E./cpo/tPasP4jHeqRo4N68vBkFUKCgm6', '1992-12-18', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '2021-09-15'),
(6429, ' Victor Manuel', 'Reyes Martinez', 'Fracc. Paquime', 'D', 'Operador de Criticos', '1', '109669', '$2y$10$kbsoTP65V3TeUEsPZCal3eHII21jI90Ez7/r5OmKFOz1dgf9UY6vy', '1985-01-22', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2021-09-16'),
(6430, ' Silvia', 'Campa Villanueva', 'Ampliacion Loma Blanca', 'D', 'Operador de Criticos', '1', '109675', '$2y$10$XQ8a02s9V.5XS7Rn9CAQaeaMMwdYS87YciGUFd1I/P.s.zcFWhkjO', '1978-02-22', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2021-09-16'),
(6431, ' Fidel', 'Falcon Martinez', 'Cerradas del Sur', 'D', 'Operador de Criticos', '2', '109685', '$2y$10$Ojpr3jPApgmnoBMU.mh6g.Y0MB4Rxc8qrBLBw8n3w9uNS4PjQmA..', '1986-06-01', 'Santiago Antonio Pacheco', '72187', 'HUS II', '2021-09-16'),
(6432, ' Jeronimo', 'Cruz Olmeda', 'Arecas', 'D', 'Operador de Criticos', '2', '109765', '$2y$10$Acsgwt/XVb9w5YyWY8a74.BV4/KhH59gFXux09VRVmr1Sz0lVb0z2', '1986-12-22', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2021-09-21'),
(6433, ' Omar Alonso', 'Parada Mares', 'Manuel Valdez', 'D', 'Operador de Criticos', '2', '109766', '$2y$10$xiK3UFXvf8INSsQSX9KZc.0UFlx8/QLyfXuv9voCMbKxofltXd9Q.', '1990-09-15', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2022-10-04');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `colony`, `position`, `area`, `plant`, `username`, `password`, `birthdate`, `supervisor_name`, `supervisor_reloj_number`, `deparment`, `fecha_ingreso`) VALUES
(6434, ' Francisco', 'Perez Garcia', 'Fray Garcia de San Franci', 'D', 'Operador de Criticos', '2', '109769', '$2y$10$.75PhITO4m34dSZ0SPwqqeXe6M6.hfsMN5r94c4Ef3VObZeXF3dc6', '1995-01-24', 'Garcia Gaucin, Erik', '28228', 'HUS II', '2021-09-21'),
(6435, ' Carlos Alberto', 'Martinez Ramirez', 'Senderos de San Isidro', 'D', 'Operador de Criticos', '2', '109806', '$2y$10$K8jMaG3Jel0LkgTR42hhVOAA2d9iK0LPFn2QlbQqQXvRyt73jzKZq', '1999-01-03', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2021-09-22'),
(6436, ' Yulma Dennis', 'Vargas Hernandez', 'Arecas', 'D', 'Operador de Criticos', '1', '109889', '$2y$10$aJc94zLASF1xyAV8tJ7xD.MyoQDYgnxuRy8/9eZwti0B2nJEkczES', '1999-06-21', 'Daniel De Jesus Favela Najera', '73913', 'HUS', '2023-02-07'),
(6437, ' Juan', 'Martinez Moreno', 'Parajes del Sur', 'D', 'Almacenista', '2', '109896', '$2y$10$RcLuWUxrmZ1XDe7JJHbLf.a81w3n/aBCNKgGzcwNqWKfSalH/zTWS', '1988-09-07', 'Bacilio Abel Rocha Carrillo', '68476', 'HUS II', '2021-09-27'),
(6438, ' Raul Iram', 'Guitron Lozoya', 'Parajes delSur', 'D', 'Operador de Criticos', '2', '109897', '$2y$10$AKdffoReHW3/dKiQhcDxoOLADuXDBWTOXmWIEia5lj0T7lBStyFg6', '2003-08-08', 'Leyva Corral, Jose Ramon', '25229', 'HUS II', '2021-09-27'),
(6439, ' Lucina', 'Martinez Mendez', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '2', '109898', '$2y$10$WLi.o1jmWXvwvAnVZUrC4uaauW/nrj4aPqFONl5w.dJgIcFRh6fuC', '1999-02-16', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2021-09-27'),
(6440, ' Juan Carlos', 'Zarate Espinosa', 'Riberas del Bravo', 'D', 'Operador de Criticos', '1', '109934', '$2y$10$bYNeRrtTCCMvJV7AZ1TGQuvtHwXJTkbFw85.4njkbHSvzKuzIA2H.', '1991-02-22', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2021-09-28'),
(6441, ' Francisco Javier', 'Vidales Salinas', 'Paraje San Jose', 'D', 'Operador de Criticos', '1', '109938', '$2y$10$9zkxpYfjljoXLo5FspYakerBAuOZWAUo20DATUL6raUi4ayB.e/Lu', '1991-11-28', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2021-09-28'),
(6442, ' Claudia Ramona', 'Estrada Pacheco', 'Urbivilla del Prado', 'D', 'Tecnico de Calidad', '2', '109987', '$2y$10$7.5j0Z.d.7nxkcOXiy8CNOeBP0fC8TrzxNovIwER0VovkZ9UoWD42', '1985-12-04', 'Humberto Lopez Lopez', '61865', 'HUS II', '2021-09-29'),
(6443, ' Diego', 'Ramos Juarez', 'Sur Hacienda de las Torre', 'D', 'Operador De Procesos', '2', '109996', '$2y$10$PaPKvgziUtS5Cyyr/w5cYuwDtdXv7rm3BJT6G2dfaPHKzOcfbzj.G', '2000-10-13', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2021-09-29'),
(6444, ' Isidro', 'Ledesma Reyes', 'Villa Residencial del Rea', 'D', 'Jefe Grupo Fundicion Die Cast Lenoir', '2', '109997', '$2y$10$KZVMQDj00OGc2/txGzrsxuXgJOduhMAIsHPtTTlUQH9zi8TjUbLES', '1993-05-15', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2021-09-29'),
(6445, ' Zulema', 'Zavala Hernandez', 'Ampliacion Aeropuerto', 'D', 'Operador General', '1', '110022', '$2y$10$iVi6jhVBVWUKYU0wkAB7ye/1hNBM46r4GBg4H3oOyh5cjUepq9jf.', '1976-06-04', 'Vania Garcia', '100540', 'HUS', '2021-09-30'),
(6446, ' Angel', 'MuÃ±oz Ramon', 'La Enramada', 'D', 'Operador de Criticos', '1', '110101', '$2y$10$xNb5JSvqH.pHnJ9tzurUUuvsmUjUxy7cAU.MaCSK.GhbV/mOkqa3G', '1990-12-15', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2021-10-04'),
(6447, ' Abel', 'Espinoza Cazarin', 'Paraje del Sur', 'D', 'Operador General', '1', '110131', '$2y$10$IprEiUpAL3cUMe.fnqQPR.2rB/e/OnSZJXOFd6EJFGDi8VGR.ORra', '2000-08-07', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2021-10-05'),
(6448, ' Armando', 'Reyes Hernandez', 'Senderos de San Isidro', 'D', 'Operador de Criticos', '2', '110143', '$2y$10$0tUWZDOHNcwLkwG0m7jGq.j0.8.nDLLSDanPApXCSild5.uUQX3gK', '1977-06-01', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2021-10-05'),
(6449, ' Araceli Guadalupe', 'Rivera Burgoa', 'Misiones Del Real', 'D', 'Operador General', '1', '110170', '$2y$10$WH5A3Q0p3qIWHETuR/xJ2.8xLXWT9FGUJ7VFjs6eNTIexggm.6uIC', '1994-03-05', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2021-10-06'),
(6450, ' Jesus Alberto', 'Mercader Diaz', 'Paraje de San Isidro', 'D', 'Operador General', '1', '110179', '$2y$10$fa4HYcWNIu9V2roWwrBAb.jOJVB2tIDV/bFYfKzQamPvtPv697yCm', '1980-07-02', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2021-10-06'),
(6451, ' Rubicel', 'Espinoza Ordaz', 'Riberas del Bravo', 'D', 'Operador De Procesos', '1', '110192', '$2y$10$qmUfCcEvdR4tYXqdQo7s4OQlxpIKmp.gdnFCwBpnKfMa0IFI/nTf.', '1990-09-10', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2021-10-06'),
(6452, ' Alberto', 'Carrasco AvendaÃ±o', 'Parajes de Oriente', 'D', 'Inspector Control de Calidad', '1', '110216', '$2y$10$KgkgJrMuek0a5/3GNHFoSOpNArzEs7sE32Pv9kWspzrmicadzXZry', '2002-02-21', 'Diana Demorey Carrasco', '128213', 'HUS', '2021-10-07'),
(6453, ' Eunice', 'Martinez Duran', 'Paraje San Isidro', 'D', 'Operador De Procesos', '1', '110217', '$2y$10$l4ClYrqmBkhPfzelyCx2nOXKMA6toukQcIy/eidzc93sUXNAZFN3C', '1978-04-26', 'Varona Hernandez, Braulio', '61651', 'HUS', '2021-10-07'),
(6454, ' Mauricio', 'Soto YaÃ±ez', 'Bosques de Salvacar', 'D', 'Operador de Criticos', '2', '110219', '$2y$10$uP6s.8a.dCV8yWu1RMyBuuKqycIBSLWG1QSNqkk3ioR2rGMUszBlK', '1991-03-18', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2021-10-07'),
(6455, ' Irma Liliana', 'Venegas Tena', 'Paraje de Oriente', 'D', 'Operador General', '1', '110221', '$2y$10$sDoJaTw3neizzqxmSjnuIOhzry59HdHCANyyLWRlZ4B.tSE5i5vp6', '1976-06-12', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2021-10-07'),
(6456, ' Maria De Jesus Elvira', 'Ruiz De Anda', 'Las MontaÃ±as', 'D', 'Operador General', '1', '110286', '$2y$10$Tsn9mdC4yj0LdeRGaxhdRO6XvmMEBVUQEGWzjHhwZL8r/vNf1/iE6', '1978-06-07', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2021-10-11'),
(6457, ' Juan Manuel', 'Meza Gonzalez', 'Sur Roma Etapa VI', 'D', 'Tecnico de Calidad', '2', '110295', '$2y$10$W/Ang4d35hDSx3JaUA2Siu8HwaDsaumTMaKyfzanVUhzoi4RvxZ1u', '1973-07-08', 'Gonzalez Ortega, Gerson Albert', '84541', 'HUS II', '2021-10-11'),
(6458, ' Pedro', 'Machado Tovar', 'Paraje de Oriente', 'D', 'Operador De Procesos', '2', '110319', '$2y$10$Fa6FtUL36GcQ/UNG0cuFnOoi6X0RDRl7dlXhCVVAt1bxSdIG9ILdm', '1994-06-10', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2021-10-12'),
(6459, ' Manuel', 'Custodio De la Cruz', 'Senderos de San Isidro', 'D', 'Operador de Criticos', '1', '110350', '$2y$10$mJpT.PrYaL2XkhfiwwCBQeGdYbhRo9JBQmpWMHEwHBhfct29NQq5G', '1982-01-01', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2021-10-13'),
(6460, ' Esmeralda', 'Orozco Gonzalez', 'Hacienda Las Torres unive', 'D', 'Operador De Procesos', '1', '110351', '$2y$10$CItJ3U1cJp1L4/jSv3ItaeewNqxRfIv6eYtqMJTmEuPe0yETv.9Ti', '1993-11-20', 'Arellano Mota, Arturo', '24791', 'HUS', '2021-10-13'),
(6461, ' Sergio', 'Ramirez Perez', 'Urbivilla del Cedro', 'D', 'Operador de Criticos', '2', '110436', '$2y$10$MNyByckW0FHQVuFEhaESXueAM6Oh9OIJ1/bzWqOmg3kcM0JR6wuxm', '1994-10-08', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2021-10-18'),
(6462, ' Adolfo', 'Chavez Martinez', 'Universidad', 'D', 'Operador de Criticos', '2', '110492', '$2y$10$vJd/bnb4d9NFefGVe4ON/uiR9N5MAScn69oE5OKxXQamaP1fG6m9q', '1988-01-30', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2021-10-20'),
(6463, ' Fadair', 'Hernandez Lopez', 'Portal del Valle', 'D', 'Operador General', '1', '110494', '$2y$10$m5xZZ0YjwCkKVLAir8AExuQHIwiah05jSJPAj.qHurjXCTVx4ejmu', '2002-01-16', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2021-10-20'),
(6464, ' Heriberto', 'Mauricio Castillo', 'Horizontes del Sur', 'D', 'Operador General', '1', '110513', '$2y$10$fZmsDIH1tMefJvjkpJn5M.WmwAe1hOQGz30RgWeG74.m42pga39R.', '1981-09-18', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2021-10-21'),
(6465, ' Raul', 'Machado Castor', 'Cerradas San Mateo', 'D', 'Operador General', '1', '110540', '$2y$10$XsEaApFSp9q9RCbuVd9usO0462lIqoAbVrw3rLC0Qp8qQLxKTpVDS', '1990-06-19', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2021-10-25'),
(6466, ' Pedro De Jesus', 'Sanchez Gonzalez', 'Parajes del Sur', 'D', 'Operador de Criticos', '2', '110583', '$2y$10$t3bQgopO9cZB71nMvbJsu.x/bC2SKFjH2.owmqHKPIRVzXJtGE6yC', '1996-06-27', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2021-10-26'),
(6467, ' Jose Andres', 'Cruz Jimenez', 'Arecas', 'D', 'Operador De Procesos', '2', '110615', '$2y$10$dIPDJHs5h3rKmFK4cS6sY..z/XOeLQQElYaqMHrYznmJs1oJ2vSPC', '1979-11-30', 'Erik Rey Mata Texna', '61890', 'HUS II', '2021-10-27'),
(6468, ' Adrian', 'Mendez Rueda', 'Terranova', 'D', 'Almacenista', '1', '110643', '$2y$10$qfYqpAb9UEtTMM0AJqo8Xe4LeUiiNMDK/P45aUmyjvri6Re4L1dV2', '1982-09-08', 'Resendez Gardner Raul', '98277', 'HUS', '2021-10-28'),
(6469, ' Josue Iram', 'Rodriguez Medina', 'Carlos Castillo Peraza', 'D', 'Operador De Procesos', '1', '110685', '$2y$10$dc6Jh.20JjVvDNCW528NSOOpPnl3JctymUlX88G2QDUMmOK3ajo9G', '1999-02-24', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2021-10-29'),
(6470, ' Joanna', 'Martinez Marin', 'Praderas del Sur', 'D', 'Operador General', '1', '110810', '$2y$10$0mmOyNV20u2QDxDf8TlY...wo8i6GPuol7p6Sw65ACDpLuWV00BA.', '1998-04-29', 'Vania Garcia', '100540', 'HUS', '2021-11-02'),
(6471, ' Jaime Eduardo', 'Lugo Vazquez', 'Praderas Del Sol', 'D', 'Operador De Procesos', '1', '110840', '$2y$10$WfLOC4Z9J2.Ag3idpe9ku.6MESuHkIgKC/NXQ7a4kX4ysOlH.Kpne', '1995-04-25', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2021-11-03'),
(6472, ' Samuel', 'Trinidad Nicolas', 'Riveras del Bravo', 'D', 'Operador de Criticos', '2', '110851', '$2y$10$gv83b8mpms1tkiq5C2iJlO4qOnpX1I3vfxkoK63X1lwIJ.v7O8Xgm', '1996-05-01', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2021-11-03'),
(6473, ' Alma Yudith', 'Hernandez Herrera', 'Paraje de San Isidro', 'D', 'Operador Especialista', '2', '110999', '$2y$10$WhgPl26ki6YDh8wAso0Ol.1GQzHnPSI9dtlR.C4vVz7IreoeHB7ma', '1989-10-14', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2021-11-09'),
(6474, ' Adrian', 'Contreras Gonzalez', 'Misiones del Real', 'D', 'Mensajero', '1', '111183', '$2y$10$sf2GqxzFLcNWcBfygi8t6.6azHtqP643F9sTDfxd4ZVV7fsP9KdiS', '1984-11-13', 'Cynthia Marquez', '74541', 'HUS', '2021-11-16'),
(6475, ' Jose Luis', 'Gonzalez Gallegos', 'Rincones del Salvarcar', 'D', 'Operador De Procesos', '2', '111267', '$2y$10$4ucuEOQ9pbcvcQBaSbDTJOGb7Ut1UtJvKnOuoloQDorO8CxsN2SdC', '1981-11-05', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2021-11-19'),
(6476, ' Ignacio', 'Gomez Miguel', 'Senderos del Sol', 'D', 'Operador de Criticos', '2', '111269', '$2y$10$tiObhUMyiyYtlovXUn8OoegWm0xVedt3Sdl09k9ORBxhIzB/RqBUq', '1995-08-12', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2021-11-19'),
(6477, ' Ernesto', 'Garcia Tenorio', 'Mision Del Real', 'D', 'Operador de Criticos', '1', '111920', '$2y$10$gY81eFLFvRakwqm7B9/wDeLrqSmotEl3bWtKZcuGyTV38ch3CoFXO', '1969-11-29', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2022-01-05'),
(6478, ' Gadiel Alfredo', 'Del Villar Linares', 'Rincones de Salvarcar', 'D', 'Tecnico Electromecanico', '1', '111922', '$2y$10$jgqH7AQ0HxzrrD0hyzLpD.ACZd33j4OvpZ4Xb/FGKTKusF5MrRkci', '2002-03-05', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2022-01-05'),
(6479, ' Ricardo', 'Gonzalez Carrillo', 'Portal Del Roble', 'D', 'Operador de Criticos', '2', '111928', '$2y$10$jeW1ecNUTGPeLq9ZIjh1AexaLq698zk00N7.beaZ5JiqSwAbGCxta', '1982-04-03', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2022-01-05'),
(6480, ' Jesus Adrian', 'Gomez Cruz', 'Las Arcadas', 'D', 'Operador General', '1', '111932', '$2y$10$gvFGYz8cr3HYAl0N.lHljurm8/I1lekxlKPXywz.DBtMFLZLEtaTm', '1999-01-05', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2022-01-05'),
(6481, ' Porfirio', 'Marin Rasgado', 'Cond Oasis Zaragoza', 'D', 'Operador de Criticos', '2', '111951', '$2y$10$bN.IzssXRwxiLYXIM5eB..XyZpXXiWiL2fNQdHjnUZ4yDCvjEeY9m', '1984-03-10', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2022-01-05'),
(6482, ' Luis Alberto', 'Lopez Serrano', 'Villas de Alcala', 'D', 'Operador de Criticos', '2', '111986', '$2y$10$4v/Mpw2AEw0zmNuFPtLHheEEnmBJnz6Fp2/RAteEvf3HfmmHrwDsu', '1986-04-25', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2022-01-06'),
(6483, ' Hector', 'Coss Rubio', 'Oasis Revolucion', 'D', 'Operador de Criticos', '2', '111991', '$2y$10$Q.UiXQ/p6ZqP6Co8kv/y4ObekDf0jUNa7hbyygNcRqn/U1nHNGc1m', '1991-02-11', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2022-01-06'),
(6484, ' Jose Luis', 'Soto Torres', 'Urbivilla del Cedro III', 'D', 'Operador General', '1', '112096', '$2y$10$5fVQGUPQ4LCrNPRyytobTetTb7gaKxXaPVRzMxaFa7WrgqxuQ/xdi', '1978-11-24', 'Briseida Bautista Tolentino', '300011', 'HUS', '2022-01-11'),
(6485, ' Claudio', 'Moralez Isidro', 'Bellavista', 'D', 'Operador De Procesos', '1', '112097', '$2y$10$KzFoQybYh5J0fSFJVCEfVuqTniCJWn/Aqvefhyv0AAMxZTL0ZpY7m', '1990-03-07', 'Abel Fernandez Delgado', '98716', 'HUS', '2022-01-11'),
(6486, ' Luis Alberto', 'Vazquez Diaz', 'Praderas del Oasis II', 'D', 'Operador De Procesos', '1', '112137', '$2y$10$tZrunsXoHacMqWCrv9PVFuNJ2..GeoLhejBqj9ESqs.aJfY3Moe1K', '1992-07-21', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2022-01-12'),
(6487, ' Antonio Salvador', 'Garcia Moguel', 'Oriente Manuel Valdez', 'D', 'Operador de Criticos', '2', '112146', '$2y$10$4cIl7o8nlqe3VrUWdoRf9O7vo0.EchLfXUQI0n4tS3JYG4K4SG4wq', '2002-08-29', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2022-01-12'),
(6488, ' Maria Fernanda', 'Gonzalez Robledo', 'Paraje de Oriente', 'D', 'Operador De Procesos', '2', '112147', '$2y$10$Oxr.3PKquuOJOKZuubTSPeIIx.JtkFfHMwKQgCfIiLGqUIsw.ak2W', '1993-09-08', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '2022-01-12'),
(6489, ' Enrique', 'Martinez Antonio', 'Aguilas De Zaragoza', 'D', 'Almacenista', '1', '112311', '$2y$10$29PIVr7ZA.gDgX1dIhPL7uXPo9/flyndlXyfaF9HwKdJr/OFeUUAW', '1998-04-22', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2022-01-19'),
(6490, ' Gloria', 'Aguilar Ramirez', 'Portal de los olivos', 'D', 'Tecnico Seguridad Industrial', '1', '112315', '$2y$10$q6dqOCNge2EBxnAR4.zoCuoCy2z7kAATqzLIBRPIJzeFnuPzPS53e', '1999-02-15', 'Jose Rodolfo AcuÃ±a Lopez', '78080', 'HUS', '2022-01-19'),
(6491, ' Ruben', 'Santana Cristobal', 'Parajes de San Jose', 'D', 'Operador de Criticos', '2', '112393', '$2y$10$CqVLjoppth1fh3TQD5PZlORSakANr94zJtGJYeuGV/YuCQWicmqEG', '1998-04-14', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2022-01-20'),
(6492, ' Juan Carlos', 'Pedro AvendaÃ±o', 'Urbivilla del Prado', 'D', 'Operador de Criticos', '2', '112396', '$2y$10$5GgQYHDt7cafGBEeRQ/B6ebgq6q4SaNVZRedcQqjggDfQXkO412jq', '1992-09-13', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2022-01-20'),
(6493, ' Yonic', 'Palomeque Jeronimo', 'Riveras del Bravo', 'D', 'Operador de Criticos', '2', '112544', '$2y$10$g34S2JK/FV4Z0ewwiZlik.eVhr2kq6SSigSMF6QeA.hZSMu1qCCYu', '1987-01-08', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2022-01-25'),
(6494, ' Jose Feliciano', 'Garcia Triana', 'Fracc Arecas', 'D', 'Operador De Procesos', '2', '112602', '$2y$10$iC4hyNeLxAvHyoXVxJmfreTA/3qX4uSpK1FdV/xyBaME4vGyrOmQy', '1986-06-01', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2022-01-26'),
(6495, ' Jorge Luis', 'De Avila Garcia', 'Sierra Vista', 'D', 'Almacenista', '2', '112704', '$2y$10$kD/VAn4vTlIeW00TlX0MSebPlPN.Nr7xh3kzy5Ag7lBiXI0Mec/I6', '1987-05-08', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '2022-01-28'),
(6496, ' Silvestre', 'Espinoza Salmeron', 'Misiones del Creel', 'D', 'Operador De Procesos', '2', '112769', '$2y$10$kSa.opEoJ5M2I.UwhZGAZubMJwSYQmpYff9k8VzrFu/LMrK4C9MW6', '1998-07-05', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2022-02-01'),
(6497, ' Misael', 'De la Cruz Hernandez', 'Las Haciendas', 'D', 'Operador de Criticos', '2', '112774', '$2y$10$765j2tFjmmEMr0vRZjsoCuWKmTUI105nlqOfKfte9MABr5pWOCziG', '1995-03-14', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2022-02-01'),
(6498, ' Fredy', 'Contreras Mendoza', 'Hacienda Universidad', 'D', 'Operador de Criticos', '2', '112776', '$2y$10$aIF/q9tacJpQ8uUUgiwxgOvmvWaH6uDFfEpoesXz6ZliJMsB..lgS', '1992-12-22', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2022-02-01'),
(6499, ' Raul', 'Valdez Solano', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '2', '112835', '$2y$10$tih6.rY3TWGVoC9JhutooeEhAmb7djd8geRo6PnKw3I6wIIqbyYgi', '1977-09-02', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2022-02-03'),
(6500, ' Jorge', 'Flores De Jesus', 'Sierra Vista', 'D', 'Operador de Criticos', '2', '112935', '$2y$10$.aqlamS/Vc7gFUf8X3zlLOIe0.zFBauJzd0383LHubbF72yL1AU7a', '1978-12-29', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2022-02-09'),
(6501, ' Aidee', 'De Santiago Aguilera', 'Colonial del Sur', 'D', 'Operador Especialista', '1', '113133', '$2y$10$py7bf7dCKXQbnEO5.9yvBuZwuaUnOduvEsiTA26QW2gOtuNj78zUe', '1987-05-24', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2022-02-16'),
(6502, ' Jair Jareth', 'Balderas Celestino', 'Parajes de Oriente', 'D', 'Operador de Criticos', '2', '113135', '$2y$10$9fuB2BY66Yq0CmN9FPWl4umJ/gP1F36yQutpA52ZKC4R63w04AhgG', '2001-03-01', 'Erik Rey Mata Texna', '61890', 'HUS II', '2022-02-16'),
(6503, ' Juan Carlos', 'Gonzalez Almaraz', 'Parajes Del Valle', 'D', 'Jefe De Grupo De Almacen', '1', '113179', '$2y$10$QdisdG816IfUNZG0pItpFOBzxQtIs99IjDkshpPheK46iIYgnyRca', '1975-08-20', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2022-02-18'),
(6504, ' Alexander', 'Perez Ignacio', 'Paraje de San Jose', 'D', 'Operador de Criticos', '2', '113251', '$2y$10$s0IcfLlfx9zRcO48rO/Hru/CFkXrV4K4ZA3qhfQAF13yQdhV7s4Xy', '1992-04-27', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2022-02-22'),
(6505, ' Edgar Alfredo', 'Lazarin Romo', 'Parajes del Sur', 'D', 'Operador de Criticos', '2', '113252', '$2y$10$AYW1wUBDj1pZzy1/MbVHX.PdS9IczMXNQci1t7uGZUz43q9UYqCIG', '1974-10-11', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2022-02-22'),
(6506, ' Gerardo', 'Limon Mojica', 'Portal de San Pedro', 'D', 'Operador de Criticos', '2', '113316', '$2y$10$LYfgdaxrKLlHaqb3MrM7bejdHnWGSLe/1zfFYPMKHUYYF2mk5tsz2', '1992-02-17', 'Erik Rey Mata Texna', '61890', 'HUS II', '2022-02-24'),
(6507, ' Obed', 'Espinoza Molina', 'Urbi villa del cedro', 'D', 'Operador de Criticos', '2', '113379', '$2y$10$IJqKImfJBoBEx4vESNO5D.rVLvA0Fsc6tecTge7F0ri1OeVRQ2/.y', '1974-09-26', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2022-03-01'),
(6508, ' Luis Eduardo', 'Tinoco Rodriguez', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '113385', '$2y$10$5VrpvhQTbGhM4jeW3JY0VehqzM076T84TAze5baLDANnJYvWlt07O', '1984-02-14', 'Abel Fernandez Delgado', '98716', 'HUS', '2022-03-01'),
(6509, ' Heriberto', 'Ramirez Rendon', 'Olivia Espinoza de Bermud', 'D', 'Operador De Procesos', '1', '113496', '$2y$10$saURhpgU2xrigliZwaC1x.FkALTmnTsegmPw2WxKYswsdPMqjPKUu', '1996-11-03', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2022-03-09'),
(6510, ' Ernesto', 'BolaÃ±os Bartolo', 'Terranova', 'D', 'Operador de Criticos', '1', '113499', '$2y$10$ZlxDMFNFURtfRQNAZtRuu.wcMnxPFd52Rf7L7mm1TEC6NTIcfh5oe', '1986-09-13', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', NULL),
(6511, ' Gustavo', 'Mendoza Rojas', 'Uribi villa del Cedro', 'D', 'Operador de Set Up', '2', '113586', '$2y$10$jcQ8Khxdkn6tSmue1NaLour0rB145aCuYrx7HRoLnmbBMzWiLvC7a', '1988-03-22', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2022-03-14'),
(6512, ' Yan Carlo', 'Lazcano Ramirez', 'Arecas', 'D', 'Operador De Procesos', '2', '113712', '$2y$10$jat9Bvsz.G2JSLJ7gmVa4ec484Y24Wac6oxZ.AzHcaUpeEi5JMfr.', '1987-04-23', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2022-03-18'),
(6513, ' Fidel', 'Fabela Villa', 'Arecas', 'D', 'Almacenista', '1', '113719', '$2y$10$9/3W26Q/cYXJnG9q3aSpueMfljfvpGtEclCqYj77iYvbWeJbNZGPa', '1996-01-11', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2022-03-18'),
(6514, ' Ismael', 'Robles Carmona', 'Cerradas San Pedro', 'D', 'Almacenista', '2', '113849', '$2y$10$2F5sf4iZEB7kYD9bxPMQ5.SGeJejjxYunxHK0wdnODd9KtbpZZOcu', '1991-11-16', 'Ricardo Joel Trejo LÃ³pez', '84444', 'HUS II', '2022-03-24'),
(6515, ' Jair', 'Cristobal Montero', 'Urbivilla del Prado', 'D', 'Operador de Criticos', '2', '113850', '$2y$10$gJC7gCu9.w3EmP/YA/9PnO.Q9bYzYRwQpXa9iz7tH5we1M18dMfnq', '2002-05-04', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2022-03-24'),
(6516, ' Bryan Onesimo', 'Chong Nataren', 'Sauzal', 'D', 'Operador De Procesos', '1', '113911', '$2y$10$CDqdPtRdGyY3oAqBo06yRez31OqVLwwTK4zQ8U093VXQ7Hii8VxFq', '2000-05-03', 'Velarde Inostroza Enrique', '71208', 'HUS', '2022-03-29'),
(6517, ' Flavio', 'Quintero Merino', 'Urbi Villa del Cedro', 'D', 'Operador De Procesos', '1', '113996', '$2y$10$91F9ZvEmNFA.OsR.P1EDceSbuu.7Cgy6MQPJB//ZeJnQzrqisyCSG', '1999-05-06', 'Velarde Inostroza Enrique', '71208', 'HUS', '2022-03-31'),
(6518, ' Lucio', 'Quintero Merino', 'Urbi Villa del Cedro', 'D', 'Operador De Procesos', '1', '113997', '$2y$10$RJ0ji8awBxndDW4KHCgg4eBHX3kuO0Z8v8FIXW6JBWQgDeK5DVaZ6', '1999-12-10', 'Velarde Inostroza Enrique', '71208', 'HUS', '2022-03-31'),
(6519, ' Jose Manuel', 'Cano Rodriguez', 'Paraje de Oriente', 'D', 'inspector de control de calidad', '1', '114152', '$2y$10$mQfij0GAqHdcoa6jbKpZu.KRAnEyvUK83qfFY3UuhRc6L/9Z6k9QS', '2001-09-20', 'Esteban Vazquez', '84463', 'HES', '2022-04-07'),
(6520, ' Sandra', 'Hesiquio Ojeda', 'Paraje de San Jose', 'D', 'Operador De Procesos', '1', '114227', '$2y$10$GVHRSsiPdYQKURPc9S2fmeOE5rwX6.yWE24TXfUg/tNA5Bd43fCWC', '1989-04-29', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2022-04-11'),
(6521, ' Cesar', 'Jimenez Santos', 'Riberas del Bravo II', 'D', 'Operador De Procesos', '1', '114296', '$2y$10$DL/Os4nu3iisUJkWTZvcG.dLGalyXYiv4x6susDJosDMcRMVAuAbK', '1982-06-29', 'Velarde Inostroza Enrique', '71208', 'HUS', '2022-04-12'),
(6522, ' Juan Antonio', 'Rodriguez Rosas', 'Candra De Villa Bonita', 'D', 'Operador de Secundarios', '2', '114410', '$2y$10$rm/CaJcM4/RMdy/SUR3Y4OTeV2dUQSzfHs.eYViT/orkrp04nvoP.', '1980-05-26', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2022-04-19'),
(6523, ' Heriberto', 'Enriquez Lopez', 'Misiones de Creel', 'D', 'Operador General', '1', '114436', '$2y$10$yfxsTFEzff0Axhnthj8K.u/tR5uIF8cRCdASXSJnDcX1OPM9THA9.', '1983-11-22', 'Vania Garcia', '100540', 'HUS', '2022-04-19'),
(6524, ' Jose Del Carmen', 'Toala Espinosa', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '114514', '$2y$10$AuLqzNb3T.LQ1ukk69qm7OadafeVtZZ/D2tJaOwUwCjyO6jJrYZsq', '1985-07-10', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', NULL),
(6525, ' Bernardo', 'Gonzalez Santos', 'Eco 2000', 'D', 'Operador de Secundarios', '1', '114700', '$2y$10$9BTXew3.6LFBe29P/7YhNey6RbNBpUJTFhSOZGr5uSwgZ.FqvFUU6', '1981-11-11', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2022-04-28'),
(6526, ' Mario Alberto', 'Gomez Hernandez', 'La Enramada', 'D', 'Operador de Secundarios', '1', '114702', '$2y$10$0cLYry5/JFks8uZqSQkbYu8K0jL/QLa9UwrTRKwcc68wK4KqBOCDS', '1985-08-30', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2022-04-28'),
(6527, ' Luis Fernando', 'De La Cruz Puentes', 'Paseos del Alba', 'D', 'Operador De Procesos', '2', '114850', '$2y$10$fm5mqIcPzntamB9cZT86juze.CfFzR5q16eVKMN1rIXF6dpllVj2W', '1995-06-01', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2022-05-04'),
(6528, ' Brenda Nayeli', 'Palacios Barron', 'Bosque Bonito', 'D', 'Operador De Procesos', '1', '115184', '$2y$10$BdqA7tPXHXkdjfzoODELX.vqNqbz4Ne5fX2x5xJjvLD6GYASQea4y', '1992-01-05', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2022-05-20'),
(6529, ' Mario Arturo', 'Sanchez ', 'Parajes del Valle', 'D', 'Tecnico Manto Edificio', '1', '115189', '$2y$10$LOK5K1mL7J.qFVPP4dlFuexSzUL2tmlKXp8DE3UlYE6qNzRdvB9fe', '1977-09-24', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2022-05-20'),
(6530, ' Diana Angelica', 'Olaiz Hernandez', 'Patria', 'D', 'Operador de Criticos', '1', '115196', '$2y$10$.Sg8OJLw9DzwDT20SNPLbuT5bGIwDYErWZoVv7SuXrl02yvETTKk.', '1989-01-23', 'Saul Arellano Escobar', '97722', 'HUS', '2022-05-20'),
(6531, ' Jose Domingo', 'Martinez Reyes', 'La Enramada', 'D', 'Operador de Criticos', '1', '115270', '$2y$10$EO5r5W6l3eVgpAAOqeQq5evf8/1efZlxmjMcNSJ0llLHrOI.DEnoO', '2003-02-05', 'Velarde Inostroza Enrique', '71208', 'HUS', '2022-05-24'),
(6532, ' Rene Francisco', 'Rivera Avelino', 'Paraje de Oriente', 'D', 'Operador de Criticos', '1', '115271', '$2y$10$mT6p0zCNaMmBC2dB.kGXt.zUVHol6QDZQ9Xx6.6wBi7.zYsfjI8ni', '1984-07-01', 'Jesus Lopez Solis', '73653', 'HUS', '2022-05-24'),
(6533, ' Pedro', 'Nape Ortega', 'Portal del Roble', 'D', 'Operador de Criticos', '1', '115362', '$2y$10$Ic88Vw2N6f2qqYNXkYKsme8VUBbuiwOoIGiOmy653fM5RCeLj0/gG', '1992-06-29', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2022-05-31'),
(6534, ' Francisco Javier', 'Tapia Ontiveros', 'Torres del Sur', 'D', 'Operador De Procesos', '1', '115398', '$2y$10$Bj5HjOqRYVFAEH4iM7TcdewZWll9CrJDvZTvc5cLdr7LJqU4lNFO.', '1987-10-18', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2022-06-02'),
(6535, ' Andres', 'EscareÃ±o Espinoza', 'Pradera del Sol', 'D', 'Operador de Secundarios', '2', '115408', '$2y$10$qUbb/Y16O2yh1NVuqw6g/OVIaZqAbdKfvhaG5o7At62XtbKR/xPZi', '2000-08-14', 'Javier MartÃ­nez Acosta', '61908', 'HUS II', '2022-06-02'),
(6536, ' Guadalupe Viridiana', 'Martinez Bustos', 'Misiones del Real', 'D', 'Operador De Procesos', '1', '115465', '$2y$10$NJDKHhY4yenSoiUIJ4PfI.eQyrYufV4.ZoDhVFMmSs32CY3BHUBU6', '1994-12-20', 'Velarde Inostroza Enrique', '71208', 'HUS', '2022-06-06'),
(6537, ' Gerardo', 'Hernandez Banda', 'Parajes del Sur', 'D', 'Tec Esp en Mtto Equipo', '1', '115493', '$2y$10$Bq8gEH.kkx3WJ2zLbRMmT.MFNiJWBMA.SY8XvFOjB5zeesCIOxGaO', '1981-12-21', 'Martinez Gonzalez Fernando', '24731', 'HES', '2022-06-07'),
(6538, ' Mario', 'Chigo Utrera', 'Paraje de Oriente', 'D', 'Operador de Criticos', '1', '115500', '$2y$10$gSNo2FDw6ImEn91ElvePMuvtD7rw2YYS0JcLIBk.JpNT3wKAEDfpu', '1989-09-12', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2022-06-07'),
(6539, ' Mario', 'Ortega Vega', 'Paraje de San Juan', 'D', 'Operador General', '1', '115505', '$2y$10$Svm3CerZx4NYYd9u.OJmouA.cAQrumxPNNAF5XeAijgm1YXgCZYeG', '1974-02-01', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2022-06-07'),
(6540, ' Julio Cesar', 'Mendoza Acevedo', 'Villas De Alcala', 'D', 'Operador de Criticos', '2', '115590', '$2y$10$zMa4hnK77SUq9MstiiINtOmxMKoQ9f2ixapVHRPc/KS5EmDmeGrwy', '1975-09-14', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2022-06-09'),
(6541, ' Antonio De Jesus', 'Matuz Lopez', 'Cerradas del Sur', 'D', 'Operador de Criticos', '2', '115592', '$2y$10$a2H7A6awlpvrSg17Ge4Lze9qHhSxcS8MyykhymxpepvAMgI4ndjJm', '1991-09-13', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2022-06-09'),
(6542, ' Fabiola Edith', 'Cervantes Reazola', 'Arecas', 'D', 'Operador de Criticos', '1', '115593', '$2y$10$POTj5EUcbDrfecX26CdMzOVITnYAnU5idmPwbzQmyenX.FppWQBaC', '1995-08-31', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2022-06-09'),
(6543, ' Angelino', 'Jimenez Gutierrez', 'Las Haciendas', 'D', 'Operador de Criticos', '2', '115704', '$2y$10$tLsPka9Evam12x7B54DdR.rwnSlLmSW4kFDmb.lqD6XJ6lFHtWZIG', '1978-10-01', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2022-06-14'),
(6544, ' Fabian', 'Martinez Morales', 'C. San Pedro', 'D', 'Operador de Criticos', '2', '115705', '$2y$10$hjO/CeTm6l3ajYKf2eEld.g.aWqEiz8Zb9524.3GkqWfuoqytZpT6', '1998-10-24', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2022-06-14'),
(6545, ' Erick Alberto', 'Jose Castillo', 'Riveras del Bravo', 'D', 'Operador De Procesos', '2', '115897', '$2y$10$YNbLhrOwvO5Yc8z0M6Z/tOZLmv09Rf1wwWeI7/Q7DebFwG.9uQyG6', '2000-05-29', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2022-06-20'),
(6546, ' Jose Daniel', 'Garcia Arcos', 'Paraje de Oriente', 'D', 'Operador de Criticos', '2', '115901', '$2y$10$aVp7PSrwXO0.QgCLPY.1uu8vNYIEsqJYQeWxj7Q9Un.M01wl1gD06', '1998-09-01', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2022-06-21'),
(6547, ' Rafael', 'Hernandez De Paz', 'Paraje de San Jose', 'D', 'Operador de Criticos', '2', '115911', '$2y$10$USB1PAER.UCeCFRVpuxIZOIIimbLKtYlQaC2vpVs.UJUWYTRifCQa', '1994-01-20', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2022-06-21'),
(6548, ' Jesus Manuel', 'Hernandez Mendoza', 'Jose Martin', 'D', 'Operador de Secundarios', '2', '116014', '$2y$10$kFxjqR/PKqKxcfdZoCWiPuJc/7nsSEmtZbJoQ1VDf/qMcNp4g4PIq', '1995-01-04', 'Javier MartÃ­nez Acosta', '61908', 'HUS II', '2022-06-27'),
(6549, ' Antonio', 'Galindo Mora', 'Villas De Alcala', 'D', 'Operador General', '1', '116017', '$2y$10$nv3ElPxpsDYDEtwiWlig5eMRZu5ri.QNnkDjaNxTb2EOlnPNf30jG', '1989-03-29', 'Sanchez Cordova, Rene', '41563', 'HES', '2022-06-27'),
(6550, ' Isaac', 'Vazquez Lorenzo', 'Praderas del Sol', 'D', 'Operador De Procesos', '2', '116018', '$2y$10$YOc/PKB6Tsx0CzHWWlo7qO6yxlYjekF4J.EwKCOChcc5jvtg4Yuk.', '1995-04-11', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2022-06-27'),
(6551, ' Francisco', 'Romero Camino', 'Paraje del Oriente', 'D', 'Operador de Criticos', '2', '116019', '$2y$10$V8Xo9TFD8inHqidLGiKxo.p0dQzHcXtt5Q0RFDsCdHlUGP9EJzUi2', '1971-02-20', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2022-06-27'),
(6552, ' Francisco Javier', 'Ibarra Castro', 'Oriente Patria', 'D', 'Operador De Procesos', '1', '116071', '$2y$10$5RED3qNYEG.bXLxQJOKNtOQJDhvBa5bqaWUkaT9CMEHWiDqvopGeS', '1983-07-03', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2022-06-30'),
(6553, ' Jose Antonio', 'Canseco Cruz', 'Olivia Espinoza de Bermud', 'D', 'Operador De Procesos', '1', '116072', '$2y$10$u3j6.VZHe63QI3/WAHVR4.fQdCBOWY0ch07r3p2/iq6c0r/OvulOO', '1994-12-05', 'Velarde Inostroza Enrique', '71208', 'HUS', '2022-06-30'),
(6554, ' Edgar', 'Nataren Cruz', 'Puente Alto', 'D', 'Operador General', '1', '116075', '$2y$10$l1XpgXgwTR2ptFbG8RFgbOh6eFdWAlSuLYgBrb0OA6k2/H2BdMhFu', '1998-04-01', 'Sanchez Cordova, Rene', '41563', 'HES', '2022-06-30'),
(6555, ' Jose Antonio', 'Zamora Solorio', 'Parajes Del Sol', 'D', 'Tec. Esp. en Mtto. Equipo', '1', '116110', '$2y$10$YM7ZnrmMSJU0S0SkwgHKuey4yke38nO94iHBtps9HFDLQTYA5li26', '1993-08-21', 'Martinez Gonzalez Fernando', '24731', 'HES', '2022-07-04'),
(6556, ' Miguel Angel', 'Lopez Guerrero', 'Parajes del Sur', 'D', 'Operador De Procesos', '1', '116111', '$2y$10$MHJWzsAkSRmQGYZ2Dw5RYeIIIyuQlO63iJ3n9p4At55tNuYy7gIsu', '2004-03-10', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2022-07-04'),
(6557, ' Francisco', 'Perez Barahona', 'Cerradas del Parque', 'D', 'Operador General', '1', '116168', '$2y$10$CBe/VEwb1pRu/DzHbrFKqem51MDBCLWdf.sM9S6cA/lw25hYNjSG6', '2001-08-26', 'Vania Garcia', '100540', 'HUS', '2022-07-08'),
(6558, ' Cesar Ulises', 'Gutierrez Alvarado', 'Riberas Del Bravo VII', 'D', 'Inspector Control de Calidad', '1', '116182', '$2y$10$R98fh.OfdTW55lnWuKewhugJasFX6vTxyHcSjRJzBzNX6jYAsWG5q', '1994-06-21', 'Esteban Vazquez', '84463', 'HES', '2022-07-11'),
(6559, ' Miguel Angel', 'Campos Guerrero', 'Bosque Bonito', 'D', 'Operadores de Secundarios', '1', '116183', '$2y$10$QsEQxPwlDaPtfK0wuYm7b.hwCjqL8.IFDOuoFynGX.5ElHh8/G5jC', '1974-04-09', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2022-07-11'),
(6560, ' Andri Esteban', 'Hernandez De La Cruz', 'Riveras Del Bravo', 'D', 'Operador De Procesos', '2', '116228', '$2y$10$f4zoyzMKZD8WrceL7Hho6.LZwsc2wDqIlTWrskzGUzmxyp.QoRC0i', '2002-11-20', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2022-07-12'),
(6561, ' Edgar Eduardo', 'Garcia Cruz', 'Praderas del Sauzal', 'D', 'Operador de Criticos', '1', '116266', '$2y$10$pbusNLy.r5Ysx5kek1HuIeHRTT59VdN3nDDXCYRoXNyE1VhczQ1gi', '1993-12-26', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2022-07-15'),
(6562, ' Mario Alejandro', 'Lara Moreno', 'Senderos de San Isidro', 'D', 'Operador de Criticos', '2', '116271', '$2y$10$8vkYPwNfPQJOukE4v2B8feQHDpUQ550jVV/FPQXD37NFqXqqf91Ey', '2002-06-23', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2022-07-15'),
(6563, ' Joel', 'Ortiz Garcia', 'Parajes de San Jose', 'D', 'Operador de Secundarios', '1', '116552', '$2y$10$g20EmPR7dF6gZqDWWDNJTu3UNps007V9vhAjYJlAB46tCgnbVUWhC', '1975-03-12', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2022-07-21'),
(6564, ' Everardo', 'IbaÃ±ez Pacheco', 'Paraje del Sur', 'D', 'Operador de Criticos', '2', '116605', '$2y$10$BNRXqKZAGmaaPPvNZkejE.6knenPGeFLieKX4BddcbJe/rXFWyyBy', '1982-07-08', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2022-07-25'),
(6565, ' Ernesto', 'Cervantes Pascual', 'Villa de Alcala', 'D', 'Operador de Criticos', '2', '116609', '$2y$10$Do/ZU8wpio.ZgjCOlvK3ne7OZX1zWonzATMqYHosgluxEAFyUs8gu', '1997-03-07', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2022-07-25'),
(6566, ' Zacarias', 'Negrete Juan', 'Paraje de San Juan', 'D', 'Operador de Criticos', '2', '116631', '$2y$10$9Eo2wRJEX4BhfRFDKjU7buoi.2mwBVbxqm7dyxJxIXp7jdxcH9zJe', '1986-11-05', 'Erik Rey Mata Texna', '61890', 'HUS II', '2022-07-26'),
(6567, ' Sixto', 'Colorado Cruz', 'Cerradas San Angel', 'D', 'Operador de Criticos', '2', '116633', '$2y$10$zMVr4XmtsfkUsGUMDwQrkOgUNUTKtLPAF6sPbE0NT/NkN1nD.IwAu', '1985-08-19', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2022-07-26'),
(6568, ' Jose Manuel', 'Gutierrez Alaniz', 'Urbivilla Del Prado', 'D', 'Operador de Criticos', '2', '116640', '$2y$10$uQeO7lvc8hNTSMol1.RwX.raF1mN15A.oUcNnwAMBS/b/MFfjiZli', '2001-10-13', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2022-07-26'),
(6569, ' Giancarlo', 'Gordillo Arreola', 'Portales de San Pedro', 'D', 'Operador De Procesos', '2', '116767', '$2y$10$30OiCB2OgesrEAw7qvZAIuESaksmdyDcG6FAIccnh77UyJh9Yf.RS', '1994-12-15', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2022-08-01'),
(6570, ' Luis Fernando', 'Flores Cervantes', 'Cerradas San Pedro', 'D', 'Operador de Criticos', '2', '116771', '$2y$10$pH5jGDborXifveG8YFGBteo3wCBWb9bGMth0U6rlruhtgpQNUhP4.', '2000-09-21', 'Purata Enriquez, Misael', '33458', 'HUS II', '2022-08-01'),
(6571, ' Jose Antonio', 'Rivera Meza', 'Manuel Vadez', 'D', 'Operador De Procesos', '1', '116772', '$2y$10$ktLhszzig4mL2BObjtViJueIMGL02gqg8IxEgCHN/zZSzF56ztiFy', '1990-05-23', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2022-08-01'),
(6572, ' Adilene Minerva', 'Baylon Contreras', 'Parajes Del Sur', 'D', 'Operador De Procesos', '1', '116777', '$2y$10$wkaEVTSdXnaeHRK0TwQK/uozC46XHwi8pgyc38LMkpCf6nr4YGjZq', '1989-11-08', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2022-08-01'),
(6573, ' Joel', 'Chavez Pineda', 'Hacienda de las Torres', 'D', 'Operador de Criticos', '2', '116781', '$2y$10$91fdQzPmgZR7Fo7u8wy9Fe4WoUzDW1Somj4mw.a5KVJ6Cu9evyxkK', '1997-09-10', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2022-08-01'),
(6574, ' Gabino', 'Avalos Gonzalez', 'Parajes Del Sol', 'D', 'Operador de Criticos', '2', '116804', '$2y$10$ZpzPrFgDH2x7Q4Aydyi1l.vwP2wndnKvOMUWAfu0lQSamjinRi0hi', '1979-01-13', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2022-08-02'),
(6575, ' Jesus Aniceto', 'Lopez Martinez', 'Portal del Roble', 'D', 'Operador De Procesos', '2', '116805', '$2y$10$CrKu/12UGa73X6UZtQa6ZuqBP4ubvCLPiq.5QQElYTC14icAwcq/y', '1995-06-22', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2022-08-02'),
(6576, ' Jose Alejandro', 'Cepeda Reyes', 'Paraje del Sur', 'D', 'Operador De Procesos', '1', '117229', '$2y$10$yS7BHRbkBJvbinzLDNBg4eLiBvxEDH3FbVhfD2hfB2skGmOg5vD3W', '1978-03-17', 'Arellano Mota, Arturo', '24791', 'HUS', '2022-08-08'),
(6577, ' Luis Francisco', 'Dionicio Esteban', 'Sur Terranova', 'D', 'Almacenista', '2', '117232', '$2y$10$68NmhQ7lAhJ4N2sH/qRQNuO/ScJQUBiFsPAEf2vTL6SEIEuWoMQP.', '2001-05-27', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '2022-08-08'),
(6578, ' Elias', 'Frias Romero', 'Valle de Allende', 'D', 'Operador De Procesos', '1', '117243', '$2y$10$HDypzfpsamOEUeL47lxAOetclo6qMl6tQlZcf.otcMKFF8KDalu7K', '1994-07-25', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2022-08-08'),
(6579, ' Guillermo', 'Perez Sanchez', 'Paraje de San Jose', 'D', 'Inspector Control de Calidad', '1', '117316', '$2y$10$kmodhm1Z02fVyFEs3qDD5.fJRxHWaDQL/.ch07KwJumLwF.AieJfK', '1991-07-04', 'Jose Ruiz', '74929', 'HUS', '2022-08-11'),
(6580, ' Alejandra', 'Acosta Aguilar', 'Paraje de San Jose', 'D', 'Operador General', '1', '117317', '$2y$10$WBGYB8Z9mZAXK1UYsu/LQuB7HSlXZQecoHnc9AVCV11p24iF.6jRu', '1990-04-09', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2022-08-11'),
(6581, ' Julio Cesar', 'Gonzalez SaldaÃ±a', 'Parajes de San Juan', 'D', 'Operador de Criticos', '1', '117330', '$2y$10$cIbheoxvqSc2ubuYWlcBluFUdW3kmOtsTkoLHJ62Wu5njTpL2rtu.', '1990-01-25', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2022-08-11'),
(6582, ' Yvan Jaret', 'Ramirez Trujillo', 'Paraje de San Isidro', 'D', 'Operador de Criticos', '2', '117337', '$2y$10$82qClbMUZQvihT1aL3q5Ve1BSbAXA3KNdTXdMg51ARghcpzHCqmTq', '2001-08-21', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2022-08-11'),
(6583, ' Heber Antonio', 'Escajeda Villegas', 'Riveras del Bravo', 'D', 'Almacenista', '1', '117339', '$2y$10$3hiRPyNqWmtcKg7d1cTlduuW1MHrWXcdJN45/PRf8xoaEt2vTN4/a', '2004-02-04', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2022-08-11'),
(6584, ' Cruz', 'Martinez Balboa', 'La Enramada', 'D', 'Operador General', '1', '117358', '$2y$10$gNspUkWAftJa71vztqpbsOuM3r8/f68YVcdEeeSN9LisXbv97gSk2', '1995-08-18', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2022-08-15'),
(6585, ' Beatriz', 'Lorenzo Poxtan', 'Parajes del Sur', 'D', 'Operador Especialista', '2', '117359', '$2y$10$M1kHzVe2g5Uvqlh6lzfRy.myOyCJKbprnEc22V2jhOIToojDH974G', '1986-03-12', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2022-08-15'),
(6586, ' Diana Sherlyn', 'MociÃ±os Merida', 'Villas de Alcala', 'D', 'Operador De Procesos', '2', '117384', '$2y$10$B8YTW.yK1I0k/PmS87fDn.g8kPFDPjk1RX4eRF.Izt42JpUdiKebq', '2000-07-26', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2022-08-16'),
(6587, ' Carlos Antonio', 'Arias Garcia', 'Parajes del sur', 'D', 'Operador de Criticos', '2', '117386', '$2y$10$5/ZtWDf1NGgYd6bznICMk..I4flYpPMnX1bKwSFCo9BSLmy5iXv.2', '2000-08-24', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2022-08-16'),
(6588, ' Edgar', 'Hernandez Ortiz', 'Hacienda de Las Torres', 'D', 'Almacenista', '1', '117388', '$2y$10$9BFKJr.Yv8Bxxu/R3aylVOIO8P3KZ7X0YuV0GMo6US68RHtM2khTu', '1987-07-18', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2022-08-16'),
(6589, ' Maria de Jesus', 'Ovalle Diaz', 'Parajes del Sol', 'D', 'Operador De Procesos', '2', '117451', '$2y$10$Km0ZZ3.RVmfhktnqCA2yR.yxbf/OXgYLc2PQTIEXT/SNodmNqYvTi', '1992-08-17', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2022-08-18'),
(6590, ' Hector', 'Balderas Hernandez', 'Riveras Del Bravo', 'D', 'Operador de Criticos', '2', '117507', '$2y$10$yLj1NFoEH6pPnSgyxSYuFeCxkuRB6SBDU1zP1cPYKc7hcuriJpCHS', '1968-05-09', 'Erik Rey Mata Texna', '61890', 'HUS II', '2022-08-22'),
(6591, ' Omar Alejandro', 'Rodriguez Peralta', 'Parajes del Valle', 'D', 'Operador De Procesos', '2', '117519', '$2y$10$seGeenBYTJn78oktb6gso.Joy2QBpP72Aq7O7WkYZXXknjZ/SiwFu', '1996-03-23', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2022-08-22'),
(6592, ' Rodolfo', 'Merlo Lechuga', 'Villas de Alcala', 'D', 'Operador de Criticos', '1', '117533', '$2y$10$WbVwAH.YHckAYs54b3shN.GUgG9T34tRNbdpO5xbBLgPvm0XVbmfi', '1996-12-20', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2022-08-23'),
(6593, ' Eduardo', 'Navarro Alaniz', 'Cerradas de San Pedro', 'D', 'Operador Especialista', '2', '117539', '$2y$10$exF7zF5xgV6LwniFuFoyLOqNVFzJLUta0nZxO8ygDfX70dnKUIDGC', '1993-12-07', 'Javier MartÃ­nez Acosta', '61908', 'HUS II', '2022-08-23'),
(6594, ' Doris', 'OrdoÃ±ez Medina', 'Lomas del Valle', 'D', 'Operador de Criticos', '1', '117575', '$2y$10$qCUTYdap2kGDNrtGuX.OguDwPKUkHruPzEftcam7yzRQFfr8VOFtm', '1987-05-14', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2022-08-25'),
(6595, ' Francisco Javier', 'Campos Alvarado', 'Horizontes del Sur', 'D', 'Operador de Criticos', '2', '117577', '$2y$10$b2iS/AVAkJY0V2.QE4LgQu2JY8FpFr10bi4jgFGl/Jd9om0UIpyCm', '1997-06-22', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2022-08-25'),
(6596, ' Rene', 'BolaÃ±os Quintero', 'Riberas del Bravo I', 'D', 'Operador de Criticos', '2', '117583', '$2y$10$RgY02bK51qCxVvQux.uui.ToI3l2W.4FLM5zUGVy3yWrmUMFaOsTa', '2000-11-18', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2022-08-25'),
(6597, ' Angel De Jesus', 'Pantaleon Gallardo', 'Valle Fundadores', 'D', 'Operador De Procesos', '1', '117587', '$2y$10$n8aU/GrBOyiMpuWKCq8j9uTDtvLGS.GFSWATzMMvgmZU94gTgX.m.', '2002-12-09', 'Velarde Inostroza Enrique', '71208', 'HUS', '2022-08-25'),
(6598, ' Omar', 'Gonzalez Espinoza', 'Paraje de Oriente', 'D', 'Operador de Criticos', '1', '117624', '$2y$10$9LQMCxQHaZvUXD2iw5toMexoqCHbXNx28aVoBCxn.18SL6EKBX81e', '1983-10-22', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2022-08-29'),
(6599, ' Erick Missael', 'Enriquez Angon', 'Oasis', 'D', 'Tec Esp en Mtto Equipo', '1', '117634', '$2y$10$Zl1U9W5I6T7dC1.LUqfTmOUhAdRTAuurtJ9s8dTNU3nbShGZ.iLw2', '1997-09-24', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2022-08-29'),
(6600, ' Cristian Eduardo', 'Cruz Cruz', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '117656', '$2y$10$YO6ax2YlATmwMS9qlcgaQurNRJ0Oi0UIZ233eEjMI2QP9D1/PAcCi', '1999-09-21', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2022-08-30'),
(6601, ' Carlos Abraham', 'Martinez Martinez', 'Cerrada de Oriente', 'D', 'Operador de Criticos', '2', '117659', '$2y$10$CoWMi7gvpv7gmHfxDNNvyuFFOm8HNLLjICGkQO8lIOj0m6ikSrmX.', '2003-09-29', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2022-08-30'),
(6602, ' Edgar Alejandro', 'Valero Rodriguez', 'Cerradas San Pedro', 'D', 'Operador De Procesos', '1', '117664', '$2y$10$pMp8QHu3rig38LBj/e6bnOoSZ13twQYyZOczqgXbjP3TjH5176Oiq', '1993-02-14', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2022-08-30'),
(6603, ' Daniel Alonso', 'Fernandez Delgado', 'Jardines de San Carlos', 'D', 'Tecnico de Ingenieria Sr', '1', '117723', '$2y$10$.WSGzi8ftiN8UFp7WcZdk.4YlXF9Vw4cdpgQDpWWQC2.qPmZ9bqQa', '1998-08-08', 'Hugo Gurrola', '75403', 'HUS', '2022-09-01'),
(6604, ' Avelino', 'Mendoza Aguilar', 'Parajes de Oriente', 'D', 'Almacenista', '2', '117764', '$2y$10$2437smZFhpFRIkxnb2gMrOA2oD198rraX.cVpVbctKpId.dGYxlAa', '1982-09-16', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '2022-09-06'),
(6605, ' Jose Francisco', 'de la Cruz Morales', 'Urbivilla del Prado', 'D', 'Operador De Procesos', '1', '117765', '$2y$10$BKowgS5UeUwfvV2QYqo7LOMkuF/RST3669ucYfj/03qXznPm7bwwy', '1995-08-19', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2022-09-06'),
(6606, ' Jabdiel', 'Herrera Perez', 'Portal Del Roble', 'D', 'Operador De Procesos', '1', '117811', '$2y$10$OWgeAwubfEPtfIuhDvq.deS/mJfzpq7NsyZOCdJW8bZxE.TdQeUzC', '2002-12-31', 'Arellano Mota, Arturo', '24791', 'HUS', '2022-09-08'),
(6607, ' Ramiro', 'Martinez Jimenez', 'Torres Del Sur', 'D', 'Operador De Procesos', '1', '117827', '$2y$10$P4mPO3VIrhcX5LtDj/r2POB2nj0Chvt0gqNez1Mn15FBgugA4v3PK', '1996-02-05', 'Saul Arellano Escobar', '97722', 'HUS', '2022-09-09'),
(6608, ' Imanol De Jesus', 'Rodriguez Fiallo', 'Valle de Allende', 'D', 'Operador De Procesos', '1', '117831', '$2y$10$dhYHL0KrAbsoe7kg7A9g1OsV4blSJMEN9i/ZmEmqoy0k8CZ/sswAC', '2002-08-08', 'Saul Arellano Escobar', '97722', 'HUS', '2022-09-09'),
(6609, ' Victor Hugo', 'Lira Correa', 'Paraje de San Jose', 'D', 'Tecnico Electromecanico', '2', '117972', '$2y$10$L8EQmed1fKEHQLy5X9llQeeMHSAlti/fHBpIGL/dyrvN0F0vJG632', '1977-06-25', 'Ruben NuÃ±ez Adame', '100370', 'HUS II', '2022-09-20'),
(6610, ' Williams', 'Ruiz Lopez', 'Horizontes del Sur', 'D', 'Operador de Criticos', '1', '118125', '$2y$10$dk/I9.cbrPP2wTSE2IyAgugmONRthwJ1kqleH/9PM1U5VjlhFwoFy', '1982-02-05', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2022-09-22'),
(6611, ' Julio', 'Luna Ortega', 'Parajes del Sol', 'D', 'Tecnico de Control Ambiental', '1', '118126', '$2y$10$u01q.dGe48/bQF1UZrGdcOPUASMv0hFxBVyuslAIeHH/6VCUccaay', '1998-02-26', 'Jessica Alejandra Aguilar Guti', '109077', 'HUS', '2022-09-22'),
(6612, ' Jose Nestor', 'NuÃ±ez Sanchez', 'Ubivilla del Campo', 'D', 'Operador de Criticos', '2', '118175', '$2y$10$1MuQadpEXk.zzHww6ULqLeC6cSRmaLhFRFwZaNZczg8zUSmFkMemu', '1985-02-26', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2022-09-26'),
(6613, ' Angel Guadalupe', 'Beranza Cordero', 'Oriente Riberas del Bravo', 'D', 'Operador De Procesos', '1', '118179', '$2y$10$ZD8ZSTwhX4WJ.volt7V0TOJKcVIxJg4z7yZi8hrk/GFKuZKr4Vfju', '2004-08-22', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2022-09-26'),
(6614, ' Brayan', 'Trejo CastaÃ±eda', 'Urbivilla del Prado', 'D', 'Encargado de Control de Activos Fijos', '2', '118181', '$2y$10$8FH3vLbXSEa6rvtoBr7yJ.g9Hg8hguFNBGTEFGUxyRBU74lvZwA/a', '1999-10-25', 'Cynthia Cisneros Medina', '75689', 'HUS II', '2022-09-26'),
(6615, ' Claudio', 'Feliciano Feliciano', 'Valle Fundadores', 'D', 'Operador de Criticos', '2', '118183', '$2y$10$Tn6M.7kVw91XlJ4.CH7M2eepYSm1njm4khbmNGGcWI36/69U43LIu', '1997-08-31', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2022-09-26'),
(6616, ' Juan Carlos', 'Mendoza Diaz', 'Oriente Manuel Valdez', 'D', 'Operador De Procesos', '1', '118186', '$2y$10$uF.N5wAgbP1aTk09W6RT9.qqeuiVwySJAIs0ReKwgOxmyl6YjcRTa', '1996-05-14', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2022-09-26'),
(6617, ' Juan Jose', 'Serratos De Santiago', 'Arecas', 'D', 'Almacenista', '2', '118218', '$2y$10$Yp7gFLW/K57MevN9XhfT0eTo1mWwEQfjbv9B.xwa3TR8Whutkz7OK', '1999-10-14', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '2022-09-27'),
(6618, ' Juan Diego', 'Hernandez Miguel', 'Torres del Sur', 'D', 'Operador De Procesos', '2', '118269', '$2y$10$tnjUIIfMUqvzmirKRhzQcemeZdyD/rN/JRsNKCD.Yl/7nRkMgTCXq', '2002-12-10', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2022-09-29'),
(6619, ' Isai', 'Segura Lopez', 'Riveras del Bravo', 'D', 'Operador De Procesos', '1', '118276', '$2y$10$OE6j/GcNiAd3QPzjDsdYu.0FVTqoW4PmgPBYon4PB4eYCuVyuWRGe', '2002-01-13', 'Saul Arellano Escobar', '97722', 'HUS', '2022-09-29'),
(6620, ' Rafael', 'Monjaras Ignacio', 'Oriente Terrenos Nacional', 'D', 'Operador de Criticos', '1', '118280', '$2y$10$DtrN1qS3.D2g/S9XcvdnWebeGmaNUHAZFlaGB9v3cgaGsmpwnpD12', '1993-08-01', 'Saul Arellano Escobar', '97722', 'HUS', '2022-09-29'),
(6621, ' Rocio Janet', 'Granados Dominguez', 'Paraje de Oriente', 'D', 'Tecnico de Calidad', '2', '118290', '$2y$10$k7YJY54lXmcvXUABHnv/4upoX9b6lVsvBs.RMnjObboVB2b8.5MpK', '1991-08-28', 'Mario Chacon', '72893', 'HUS II', '2022-09-29'),
(6622, ' Blanca Olivia', 'Garcia Reyes', 'Profa Maria Martinez', 'D', 'Operador De Procesos', '1', '118294', '$2y$10$AqHt6cmu45DmgZ2eSLV9U.KFOmGK1lUmCI08BUNbi7sKK2bID0ahq', '1981-04-08', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', NULL),
(6623, ' Maria De Jesus', 'Rodriguez Lira', 'Valle de Fundadores', 'D', 'Operador De Procesos', '1', '118365', '$2y$10$OCfmmIq4HkXM6aSJ.9ddZOFs9O5qaEky9hQ9XFuTRyE//v6QpAugO', '1994-12-25', 'Resendez Gardner Raul', '98277', 'HUS', '2022-09-30'),
(6624, ' Alberto', 'Garcia Orosco', 'Portal del Roble 2', 'D', 'Operador De Procesos', '1', '118423', '$2y$10$TtpH0RkUPot/M69.t5aRJuqNjt8nNgdqJ.MuskgxexuuI1fuDoVpK', '2001-02-11', 'Saul Arellano Escobar', '97722', 'HUS', '2022-10-03'),
(6625, ' Mateo', 'Ramirez Hernandez', 'Portal de Oriente', 'D', 'Operador De Procesos', '1', '118458', '$2y$10$znVUIqx/.pTh0lb2q1DxXu6qHCL/HDWtHB.KLxFoWyI.04bSWQQpS', '2002-10-22', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2022-10-04'),
(6626, ' David', 'Quintana Ochoa', 'Paraje de Oriente', 'D', 'Operador General', '1', '118460', '$2y$10$GlH9.1eoMR.TvDiR43.xr.w5goS6QHjOFmkfp2l3aYLyrwCNBSoIq', '1996-03-11', 'Vania Garcia', '100540', 'HUS', '2024-05-27'),
(6627, ' Oscar Michelle', 'Jimenez Cruz', 'Valle de Oriente', 'D', 'Operador De Procesos', '1', '118464', '$2y$10$.7e7.o3WM7leL3bvmziequGD3Oc2HbGsU6KS4upxbDXFsrKLEBw1e', '1992-11-01', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2022-10-04'),
(6628, ' Paulino', 'Garcia Antonio', 'Rincones del Rio', 'D', 'Operador De Procesos', '1', '118467', '$2y$10$z4Gu6kA.gIixps9BH5Sreeu81AJL9bXrAC74GxYEwAP2LiB6cW9GS', '1975-06-26', 'Varona Hernandez, Braulio', '61651', 'HUS', '2022-10-04'),
(6629, ' Horacio', 'Torres Oropeza', 'Profra Ma Martinez', 'D', 'Operador De Procesos', '2', '118555', '$2y$10$Q7GVo8ayDIdcl0Yz3TyoP.6CKLKmv9OxdSyZUN6ZKd4pgCMOuKlbq', '1980-10-17', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2022-10-06'),
(6630, ' Deisy Yaneth', 'Rodriguez Campa', 'Riberas del Bravo', 'D', 'Operador de Criticos', '1', '118607', '$2y$10$HGaAfhL3lpCp0PpEU9RUdOz0oUaLKV/agO3UKvDCw4JFyse4RWGlC', '1995-11-20', 'Saul Arellano Escobar', '97722', 'HUS', '2022-10-10'),
(6631, ' Guillermo', 'Aguilar Trejo', 'Riveras del Bravo', 'D', 'Operador De Procesos', '1', '118611', '$2y$10$eL6xA1pH0XQsG3.hpb9rCOAE7JOEgCJkB9LReQgxtrzZ0PtV530Ju', '1987-11-24', 'Abel Fernandez Delgado', '98716', 'HUS', '2022-10-10'),
(6632, ' Francisco', 'Ortega Santiago', 'Oriente las Haciendas', 'D', 'Tecnico en Entrenamiento', '1', '118612', '$2y$10$V..dQd8mdhe1mANVWcOGVeoRcvD1l6PPOnsxQnHA1C1QKe6AnNypC', '1991-05-02', 'Jorge Alejandro Ayabar DÃ­az', '66945', 'HUS', '2022-10-10'),
(6633, ' Isaias', 'Cabrales Fasio', 'Paraje de Oriente', 'D', 'Operador de Criticos', '2', '118623', '$2y$10$Ol1.ntm5nSvjjWaNFDuHA.qs7Y8a.DQHvIOPKZtY2h2uFeSfo2StO', '1984-07-06', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2022-10-10'),
(6634, ' Jesus Humberto', 'Macias MuÃ±oz', 'Parajes de Oriente', 'D', 'Operador De Procesos', '2', '118632', '$2y$10$2etHSonBzcxNnKxzZ8kJiuoltkV6syLQo6Z3qDH7CL6Cl2lJhgTUC', '1989-08-15', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2022-10-10'),
(6635, ' Citlally Del Carmen', 'Andrade Martinez', 'Hacienda de las Torres', 'D', 'Operador de Criticos', '2', '118637', '$2y$10$0xrqrN9uxe27ODY0jpb/xe6GKe6kjyBbLVMdQvLfq0O3WnSUOwqIC', '1994-06-23', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2022-10-10'),
(6636, ' Adrian', 'Dominguez Cuevas', 'Lomas de las Aguilas', 'D', 'Almacenista', '2', '118639', '$2y$10$XdlTlU0di1bL0D/ZlJqrnecUDs5qljhaclvnw9t.ii0SoyTUZlRxy', '1972-02-07', 'Bacilio Abel Rocha Carrillo', '68476', 'HUS II', '2022-10-10'),
(6637, ' Gustavo Adolfo', 'Garcia Roque', 'Lomas del Valle', 'D', 'Operador De Procesos', '2', '118655', '$2y$10$hFRwvbVRWEyi0zCEtFqJpuuTSsVBvZ4gNCKB0.k4MuBOkwetyIaq.', '2001-03-27', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2022-10-11'),
(6638, ' Leonardo', 'Rubio Diaz', 'El Papalote', 'D', 'Operador de Criticos', '2', '118657', '$2y$10$v/ndOUyq6Q6Hp8TsuiS9Z.FQ9DK9f9ivL8s4fsO9Wrfej./gVPx8y', '1994-11-06', 'Erik Rey Mata Texna', '61890', 'HUS II', '2022-10-11');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `colony`, `position`, `area`, `plant`, `username`, `password`, `birthdate`, `supervisor_name`, `supervisor_reloj_number`, `deparment`, `fecha_ingreso`) VALUES
(6639, ' Dulce Maria Elena', 'Machado Molina', 'Villas de Alcala', 'D', 'Tecnico en Entrenamiento', '1', '118694', '$2y$10$awlhg0294JoNALMpRhtdr.wQtWBF0Y1fIjaOktfi3hPzS0ij1hVIa', '1999-11-24', 'Jorge Alejandro Ayabar DÃ­az', '66945', 'HUS', '2022-10-13'),
(6640, ' Ezequiel', 'Urieta Gomez', 'Paraje del Sur', 'D', 'Operador de Criticos', '2', '118727', '$2y$10$egL.u7fhi7IMMuUXH6feFu8RZMf.9lLIWTbMIIEi4bgjcrKOIZFFi', '1980-01-18', 'Contreras CastaÃ±eda, Helder', '26336', 'HUS II', '2022-10-17'),
(6641, ' David Alexis', 'Pano Sanchez', 'Parajes del Sur', 'D', 'Operador de Criticos', '2', '118744', '$2y$10$sajAVIKW0PJ9fwta1TUYQ.OJkN0teAFineYliNg.8MD6zz.vYFvaG', '2003-11-02', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2022-10-17'),
(6642, ' Guillermo', 'Toledo Nazario', 'Urbi Villa del Cedro', 'D', 'Operador de Criticos', '1', '118752', '$2y$10$vxbwLxqitgK/IpyOrUkwFesqzJcnSyvyzI3aoXc8/h0LgY/k.Zf0q', '1981-08-24', 'Jesus Lopez Solis', '73653', 'HUS', '2022-10-17'),
(6643, ' Jose Roberto', 'Martinez Ramirez', 'Infonavit Casas Grandes', 'D', 'Tec Proceso de Moldeo/Die Cast', '1', '118770', '$2y$10$AxR7gfv1I4XppChJ2ABy7OejDoOtUawh84C0TpoFYbx6rldbZl7qi', '1979-05-08', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2022-10-17'),
(6644, ' Gabriel', 'Guzman Cruz', 'Riberas del Bravo IX', 'D', 'Operador De Procesos', '2', '118854', '$2y$10$jOD/pzwxbvJsga/2wRVKi.Ky4GGh1UNcWsaLk3ZGchR5a2cnA61bO', '1994-04-17', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2022-10-24'),
(6645, ' Francisco Javier', 'Isidro Jose', 'Eco 2000', 'D', 'Operador De Procesos', '1', '118855', '$2y$10$G8LC12EIeKU6Se6O6hHloO.k2F2LUvEqvW3.uXcSqJLOK6WEPuXfO', '1997-07-28', 'Saul Arellano Escobar', '97722', 'HES', NULL),
(6646, ' Edgar Omar', 'Medinilla Crisanto', 'Portal del Roble', 'D', 'Operador de Criticos', '2', '118861', '$2y$10$hqvxUPeaeN/AbRVoGEQEU.YIJZi/noRkhN5tWhjXsLtc6KA5f3LM2', '1998-01-23', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2022-10-24'),
(6647, ' Brando Yoseth', 'Grajales Perez', 'Piedras del Sauzal', 'D', 'Operador de Criticos', '2', '118863', '$2y$10$InQIp67pjFW9NP9drpJqv.0Z7BdRm50L7Xw7/7SCXu8iraEdnHjVy', '1997-12-02', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2022-10-24'),
(6648, ' Hugo', 'Chairez Aguilar', 'Paraje San Juan', 'D', 'Operador de Criticos', '2', '118864', '$2y$10$arOz8lK4nVZtlDrbo9WzF.UlQFRigmZ4RgNM9.4at9eq4USNTnn/.', '2003-03-13', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2022-10-24'),
(6649, ' Silvio', 'Ramos Carrada', 'Arecas 1', 'D', 'Operador de Criticos', '2', '118867', '$2y$10$OCinplFUJyad6GZIDQgfbeP5ktkJ9tzbkxrFgH4oy0SxdFgG2uoLi', '1985-11-22', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2022-10-24'),
(6650, ' Jennifer', 'Barraza Herrera', 'Praderas de los Oasis', 'D', 'Tecnico en Ingenieria', '1', '118871', '$2y$10$7gNDA3MAqOdIb8tZFsg3Zu5O2Ujm2F22.5bHKLQ0fFHAap9mcVQdm', '1996-08-14', 'Hugo Gurrola', '75403', 'HUS', '2022-10-24'),
(6651, ' Hector', 'Cruz Vidal', 'Riberas del Bravo', 'D', 'Operador De Procesos', '2', '118921', '$2y$10$LfUNSj80PcZl.4HSPXXZOOSNH7HkCXSRdqBaR6dJlNFWGz6A8zOBS', '2004-05-31', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2022-10-25'),
(6652, ' Luis Raul', 'Hernandez Velazco', 'Sur Rincones de Salvarcar', 'D', 'Almacenista', '2', '118925', '$2y$10$pDNd2PM3MAM3KXOHdLutGe4NAmbuURg/chF7s7nmYH4ISvrCQEAQK', '1998-11-06', 'Jose Merced Gallegos Torres', '61749', 'HUS II', '2022-10-25'),
(6653, ' Yoani Adrian', 'Gonzalez Carrera', 'Las Haciendas', 'D', 'Operador De Procesos', '1', '118966', '$2y$10$IcENBRBL3Cq/GHgwWXgqNOsjUzqjKovlK6t7RwcV7aZF55v4yNlgm', '2004-08-26', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2022-10-27'),
(6654, ' Alfredo', 'Martinez Mendoza', 'Paraje de Oriente', 'D', 'Operador de Criticos', '2', '118968', '$2y$10$0s.LCODbtv8X3Lc2WV56l.MRGtGms.hJKH/g6a631HfzIqziI0wsS', '1983-04-08', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2022-10-27'),
(6655, ' Lluvia Cecilia', 'Castillo Arias', 'Paraje de San Juan', 'D', 'Operador De Procesos', '1', '119070', '$2y$10$XFTYnjdPJm7/mW8P0Y/hFuJ.lqeVnzrMcZ58pFpeSFI2EVr482caO', '1991-05-27', 'Arellano Mota, Arturo', '24791', 'HUS', '2022-11-08'),
(6656, ' Velia', 'Madrid Morales', 'El Granjero', 'D', 'Operador De Procesos', '1', '119072', '$2y$10$qpU/eXh/JwSwIV6Wb4ivE.PehSbDrLWWkun5z8hKJaBMyjKo0lFWm', '1974-06-04', 'Abel Fernandez Delgado', '98716', 'HUS', '2022-11-08'),
(6657, ' Jildardo', 'Rodriguez Pinales', 'Oriente Medanos', 'D', 'Operador De Procesos', '1', '119076', '$2y$10$BafDzQVD.9hk26.egIkYgekN60dRasRvikN3352WefT2cShfn46n2', '1975-01-17', 'Abel Fernandez Delgado', '98716', 'HUS', '2022-11-08'),
(6658, ' Nesai', 'Reyes Ramirez', 'Paraje de San Isidro', 'D', 'Lider de Produccion', '1', '119118', '$2y$10$RKVm42adE7ch5xvXqaYpAeHQ6pguGd/H1ZS/YjEco35l0Ke747inO', '1986-05-01', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2022-11-14'),
(6659, ' Edgar Ivan', 'Perez Garcia', 'Portal del Roble', 'D', 'Operador de Criticos', '1', '119361', '$2y$10$sjp0luZyfJkLwQGyxD0HZeSYeYczxyc9lQsu8ozHxhPzMMG8ld8xK', '2001-10-11', 'Jesus Lopez Solis', '73653', 'HUS', '2022-11-24'),
(6660, ' Carlos Eduardo', 'Fierro Hernandez', 'Cerradas de San Pedro', 'D', 'Operador De Procesos', '1', '119387', '$2y$10$Athxp9uok4FFSbcCdpljjeMq0rrQuKPXN4VEazN3DJl8kjXCvmd1C', '1989-11-06', 'Velarde Inostroza Enrique', '71208', 'HUS', '2022-11-29'),
(6661, ' Oscar Alexis', 'Chavez Ibarra', 'Las Gladiolas', 'D', 'Operador De Procesos', '2', '119388', '$2y$10$HSsLUMLzOxhRmOS.BPbFX.UbfSmt4a2hlvuhOdlULW/0H14bbM.nO', '2004-09-15', 'Cecilia Adame Camacho', '97655', 'HUS II', '2022-11-29'),
(6662, ' Ronaldo', 'Gonzalez Perez', 'Tierra Nueva II', 'D', 'Operador de Criticos', '2', '119475', '$2y$10$jLmKiHTTbxtQHi2pghiWj.A4Dk3HdGYDXYTbPQ2kyWYaoJo4.sXlG', '1995-09-09', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2022-12-05'),
(6663, ' Mauricio', 'Cruz PeÃ±a', 'Jardines de Roma', 'D', 'Operador de Criticos', '2', '119528', '$2y$10$Nfug6Hs5PvC6TWaj3BoX1eqFikrOcL42Y/N6stYejKGPrps8yehdC', '1993-05-06', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2022-12-08'),
(6664, ' Ricardo', 'Tenorio Aguirre', 'Praderas del Sol', 'D', 'Operador de Criticos', '2', '119529', '$2y$10$.4osr6tlnodJyHxBDGXOYeJXeLDDpt3FPd0eYlvLzgdeMWoo3STh6', '1998-06-14', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2022-12-08'),
(6665, ' Adrian Edilfred', 'Lopez Ramirez', 'Parajes del Sur', 'D', 'Operador de Criticos', '1', '119534', '$2y$10$QJff.jzBJfgxY69manJtP.2BU7TObQJ8GI2eNu8InzibxBG/7QdmS', '1986-03-01', 'Jesus Lopez Solis', '73653', 'HUS', '2022-12-08'),
(6666, ' Eric', 'Morales Mendez', 'Parajes del Sur', 'D', 'Operador De Procesos', '2', '119629', '$2y$10$TRie95fq6DGNN.MVL68Wa.QUT80UsUXPREW9rAaGvlMJKRNb/QYwi', '1991-11-08', 'Erik Rey Mata Texna', '61890', 'HUS II', '2022-12-19'),
(6667, ' Victor Joany', 'Barron ZuÃ±iga', 'Municipio Libre', 'D', 'Operador De Procesos', '1', '119646', '$2y$10$UY6h8r9yYD6lAd30fcew2.Ly6aMdyfAiHvxx569xAZnKK9GJxA2EC', '2001-11-11', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2022-12-20'),
(6668, ' Bianca Anallely', 'Montalvo Romero', 'Sierra Vista', 'D', 'Operador General', '1', '119685', '$2y$10$ZYfsGLHz.5TEfI9xAA/jw.jVJRH1zXdsTuErQy.9WBFKuRptMSgWC', '1997-10-28', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2023-01-03'),
(6669, ' David', 'Morales Concepcion', 'Cerradas del sur', 'D', 'Operador De Procesos', '1', '119686', '$2y$10$zIW0VOeMBYAwpLt1Vv45iO4ZB4k16IF5kpRKrxfAbXSrVzS6s9Fti', '1998-11-07', 'Velarde Inostroza Enrique', '71208', 'HUS', '2023-01-03'),
(6670, ' Raul', 'Porfirio Palacios', 'Paraje de Oriente', 'D', 'Operador De Procesos', '1', '119723', '$2y$10$L1N0C9z9a1Ve4YuadzvrfuV./rp0qYkk7AxM/tUjV/xcuddr5ykHC', '2003-01-07', 'Velarde Inostroza Enrique', '71208', 'HUS', '2023-01-05'),
(6671, ' Luis Angel', 'Trejo Martinez', 'Paraje del Sur', 'D', 'Operador General', '1', '119726', '$2y$10$RlhWnvP5YqWQMli6ACj7m.e0ltvng52BxSQtDD3aS9K3mLjQQ01Em', '1996-08-14', 'Briseida Bautista Tolentino', '300011', 'HUS', '2023-01-05'),
(6672, ' Raul', 'Monreal Ceballos', 'Portal del Oriente', 'D', 'Operador De Procesos', '1', '119731', '$2y$10$n7f82FagoaS4ePmvTFoXku8C.O8UJgw90GCqgNoXT/UISjv3Pzt.e', '1985-08-02', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-01-05'),
(6673, ' Luis Ricardo', 'Tavera Castilla', 'Zaragoza', 'D', 'Operador De Procesos', '1', '119732', '$2y$10$RrXOLRHOzm6Xyv1IQU9dJ.wLy/u5veDMxWzQJiR0XgIRADJliUzjW', '1982-12-13', 'Varona Hernandez, Braulio', '61651', 'HUS', '2023-01-05'),
(6674, ' Vicente', 'Porfirio Tomas', 'Paraje de Oriente', 'D', 'Operador De Procesos', '1', '119739', '$2y$10$X8BCwfjp0oSuaUlj7j9Nn.5vEKPLfqrPV0D9AQpb48jKXXdFsmDZO', '1995-07-19', 'Velarde Inostroza Enrique', '71208', 'HUS', '2023-01-05'),
(6675, ' Jesus Eduardo', 'Ramirez Rivera', 'Paraje de San Isidro', 'D', 'Almacenista', '1', '119741', '$2y$10$pI.DG4pEQXZXVlCnk3XmT.Hsp9AnLIzWay7FVv3lH0Xzs3/D0Wiiy', '1989-03-24', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2023-01-05'),
(6676, ' Maria Angeles', 'QuiÃ±ones Rodriguez', 'Paraje de San Isidro', 'D', 'Operador General', '1', '119743', '$2y$10$vLsguMBharFD3RZVvuXkSe44RGY55ogT53gHeXsKnWyKdoczDkqui', '2001-07-31', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2023-01-05'),
(6677, ' Agustin', 'Mendoza Francisco', 'Senderos de San Isidro', 'D', 'Operador General', '1', '119767', '$2y$10$pyVpXR8FKmEK3szj83WH8upjQEHwp53QTTjnbRZnAVPPX6F4yiLrG', '1994-11-11', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2023-01-06'),
(6678, ' Heriberto', 'Merlo Reyes', 'Paraje del Sur', 'D', 'Operador Especialista', '1', '119772', '$2y$10$BpELmqNvj8ZTtgW8s9pRTuhwMLne7a9YDcCTJE8QxMShiDUCrX7nK', '2003-03-25', 'Varona Hernandez, Braulio', '61651', 'HUS', '2023-01-06'),
(6679, ' Carmen Octaviano', 'Silva Cordova', 'Senderos de San Iisdro', 'D', 'Operador De Procesos', '2', '119783', '$2y$10$VU57gUbP6wczMOj5q2UYGOO9zjl6EHDHudCGHjnmGYDIxjLDlgpXq', '1974-03-22', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2023-01-06'),
(6680, ' Elizabeth', 'Tecalco Martinez', 'Villas de Alcala', 'D', 'Operador De Procesos', '1', '119784', '$2y$10$5KQP2kH1E7tTi5oMW85wkeYbBc55PkqoXrS6fqwsS9VZT0BoJqgfG', '1995-04-14', 'Arellano Mota, Arturo', '24791', 'HUS', '2023-01-06'),
(6681, ' Edgar Alberto', 'Hernandez Hernandez', 'Valle de Allende', 'D', 'Operador De Procesos', '1', '119804', '$2y$10$sAc7ucm/RqsfovUeK0DKB.D41UHbPrRxiZjdRIPtT1D84duN1Y.tq', '2001-02-01', 'Saul Arellano Escobar', '97722', 'HUS', '2023-01-09'),
(6682, ' Dorca Angelica', 'Sanchez Zamudio', 'Cerradas San Angel Fracc.', 'D', 'Operador De Procesos', '2', '119810', '$2y$10$zE50hF0qGEE9iA6l1RYCz.wBG8zNwNArqszsoRjdXMwBNf4RGJgqW', '1999-09-26', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2023-01-09'),
(6683, ' Valentin', 'Borja De Jesus', 'Senderos de San Isidro', 'D', 'Operador de Criticos', '2', '119812', '$2y$10$AJZgnXnByKZD/rJf/H5aSePaQih5rh.OqOI60NkpnZ9/k.jlrrAIu', '1995-02-14', 'Garcia Gaucin, Erik', '28228', 'HUS II', '2023-01-09'),
(6684, ' Damian', 'Alcudia Olan', 'Morelos I', 'D', 'Almacenista', '2', '119813', '$2y$10$EaIgSLYe4ngtzP827yfGLOFOvTbbRYzUmfzI9Iw.5zjbSHRH9ZRdi', '2001-09-27', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2023-01-09'),
(6685, ' Alberto', 'Rojas Chavira', 'Terrenos Nacionales', 'D', 'Almacenista', '1', '119816', '$2y$10$vN7WknWLVMzKSODnzWt2s.oVJffPniJAJ8RROO87itL1Y49bfAMjW', '1980-04-08', 'Resendez Gardner Raul', '98277', 'HUS', '2023-01-09'),
(6686, ' Carlos', 'Quinta Severiano', 'Arecas', 'D', 'Operador De Procesos', '2', '119823', '$2y$10$3CyXf3qBbJZeAjRa8ci1deUAdtLmYeaCHfxb4oHniCydjNJrhAe6u', '1991-03-20', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2023-01-09'),
(6687, ' Pablo Jose', 'Ornelas Soto', 'Las Haciendas', 'D', 'Operador De Procesos', '2', '119824', '$2y$10$GC99BCeuYm4T.1PsQf08LeugZvhURyg5Jt1amwPwZLRdOIdKtFwPC', '1995-10-05', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2023-01-09'),
(6688, ' Jorge Daniel', 'Morales Mulato', 'Valle del Marquez', 'D', 'Operador De Procesos', '2', '119826', '$2y$10$a1eB5bfVarVJHjFHY3M4n.qck1kJTSLA6Ee2bsrRBtHYQvvNEgYs.', '1971-03-10', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2023-01-09'),
(6689, ' Marco Ivan', 'Calzada Rojas', 'Paraje del sur', 'D', 'Operador De Procesos', '1', '119853', '$2y$10$JFir0/A4B4Jc/5B/INJMPuVAFn.Zq.zD9h3jWWyLNbv4Y40puNMx6', '2001-01-04', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-01-10'),
(6690, ' Henry Christopher', 'Gomez Mendez', 'Torres del Pri', 'D', 'Operador De Procesos', '1', '119854', '$2y$10$hKIWA0w3F9arKAfhoxngMOi4tEvq85zrRQW3J.I7sUunQ1FYVgy8i', '1972-03-31', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2023-01-10'),
(6691, ' Daniel Gerardo', 'Chavez Olague', 'Paraje de Oriente', 'D', 'Operador De Procesos', '1', '119856', '$2y$10$.SRK8K1TV1RAxkxVbaeCWObN4b6d67YgYWS4QrBasQ36j79G4Or42', '1976-03-15', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-01-10'),
(6692, ' Cirilo', 'Solano Veneroso', 'Parajes del valle', 'D', 'Operador De Procesos', '1', '119858', '$2y$10$2CkX0UDn.XaXKQUpt18Scu4i7F4UDiL6edGXp2ABspgweqwlAcMNa', '1965-02-11', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-01-10'),
(6693, ' Jose Osbaldo', 'Montelongo Zapata', 'El Fortin', 'D', 'Operador General', '1', '119861', '$2y$10$o2rRNTgr22RqlOHnHMYO2eCxSPoN/bTP7o.sYov6uw9ViGuTsKYg.', '1997-03-03', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2023-01-10'),
(6694, ' Uriel', 'Solano Delgado', 'Praderas del Sol', 'D', 'Operador de Criticos', '1', '119862', '$2y$10$yltDBr4fLMokLgRiX8MoB.ZdOPf5ZVhMcLqHsKdn3sCFuncaXFUDK', '2004-02-25', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-01-10'),
(6695, ' Miguel', 'Rosas Flores', 'Valle de Fundadores', 'D', 'Operador de Criticos', '2', '119863', '$2y$10$ayKodVWbBO9Px9shhSGaHOTBCh910mu3GqbI6HUYkdIqQVJXzEpIi', '1987-11-26', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2023-01-10'),
(6696, ' Jorge Alberto', 'Lopez Dominguez', 'Info Oasis', 'D', 'Operador De Procesos', '1', '119864', '$2y$10$3TkQu4gjN2fmzDg1MN8o9O4uqlVWWRzXUjHM1D.zXkpjkXafVavtm', '1997-06-30', 'Arellano Mota, Arturo', '24791', 'HUS', '2023-01-10'),
(6697, ' Cesar Obed', 'Rosales Martinez', 'Paraje de Oriente', 'D', 'Operador de Criticos', '2', '119865', '$2y$10$zgkVzP0s3TrTU9sy0ayNeueDmYmva7cBQa84ok02dcIdFq9BTF692', '2003-10-18', 'Alan Omar Escobedo Gonzalez', '32976', 'HUS II', '2023-01-10'),
(6698, ' Ulises', 'Navarro Renteria', 'Parajes del Sol', 'D', 'Operador de Criticos', '2', '119884', '$2y$10$U09ILdhoXc.Z4b/e5yHU5u3ur4fzriDpeXM1mj0urhtu4L1Ax6H0.', '1996-08-31', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2023-01-12'),
(6699, ' Juan Carlos', 'Martinez Valencia', 'Urbivilla del Cedro', 'D', 'Operador De Procesos', '2', '119890', '$2y$10$eIQYAAl7Tdzf8w4hbLUEne9vPayNEmwjaOJJYW.xcy/8B0V8KqXdS', '1999-08-02', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2023-01-12'),
(6700, ' Saul Armando', 'Amaro Ponce', 'Hacienda de las Torres', 'D', 'Operador General', '1', '119899', '$2y$10$VbxqhAQ3nLIK2z2LW9psAOGzdAQ1MkvqYkVtGSlgD16KOw8ExuNu2', '1994-02-23', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2023-01-12'),
(6701, ' Marcos', 'Hernandez Lopez', 'Valle de Allende', 'D', 'Operador de Criticos', '2', '119905', '$2y$10$okxLbzjSAlbwIRdH6eKUDuuq0slaej.4T.pl405TZGCCL/aXkh0EG', '2003-09-22', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2023-01-12'),
(6702, ' Luz Del Carmen', 'Hernandez Colmenares', 'Paraje del Sur', 'D', 'Materialista', '1', '119910', '$2y$10$YI7npQrNc3kBGR/A1/YXuebDCtyfCybHPCtbZT8aSmSljx/g.wZTu', '1994-06-22', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2023-01-12'),
(6703, ' Alexis De Jesus', 'Uscanga Criollo', 'Carlos Castillo Peraza', 'D', 'Operador Especialista', '2', '119915', '$2y$10$/Q4UO8U.h17pQ3xOK43kZ.v4XReJG16XWP0ByBKeV4IQ5w.QphMO.', '1999-06-08', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2023-01-12'),
(6704, ' Jorge Alonso', 'Saucedo Longoria', 'Paraje de San Isidro', 'D', 'Almacenista', '1', '119916', '$2y$10$x9xALM0J5RXAkpvKUJvLWuxFjlkRz4QDoJ7y9HaYaaVBy4pbNFEnW', '2002-06-15', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2023-01-12'),
(6705, ' Abraham Roberto', 'Hernandez Valadez', 'Urbivilla Bonita', 'D', 'Operador De Procesos', '1', '119934', '$2y$10$CyzNXyT2XnId06P.baaBT.pFJs1ZQLwXl9ViX4LDQUyROy9a55EVy', '1982-06-07', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-01-16'),
(6706, ' Pedro', 'Herrera Gardea', 'Fraccionamiento El Fortin', 'D', 'Operador De Procesos', '1', '119953', '$2y$10$AQm4r.LXov/VVsYtRPW0MODTz9ERlg5Ecn5HsGVb3obb4NayOy7Qe', '1975-04-11', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2023-01-17'),
(6707, ' Elizabeth', 'Hernandez Temoxtle', 'Arecas', 'D', 'Operador De Procesos', '1', '119954', '$2y$10$alyJJ7zH6UQcV5YGzo//B.Njeo3/bxsoSTBe1FPqEuV2YtX9sIAmC', '2002-01-22', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2023-01-17'),
(6708, ' Jose Manuel', 'Bian Sanchez', 'Urbivilla del Cedro IV', 'D', 'Operador De Procesos', '1', '119955', '$2y$10$SemjSdrdS4wJ8AvHFgVSHuT3ZI7rm49SnKcS.1h0eBYjbtmxTQDlC', '1996-08-15', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2023-01-17'),
(6709, ' Alejandro', 'Barron Bermudez', 'Oasis', 'D', 'Operador De Procesos', '2', '119956', '$2y$10$vM.SQiS8ET0upFwQZ526wOb9FsDyXJujX8tu2qtgLTxcM2voyqVPC', '1978-09-28', 'Erik Rey Mata Texna', '61890', 'HUS II', '2023-01-17'),
(6710, ' Andres Candelario', 'Meza De La Cruz', 'Urbivilla del Prado', 'D', 'Operador De Procesos', '1', '119957', '$2y$10$e86SygsJLI08MgGKJNy1deb68vg1vYQUPa/M.bvtefFnaSMF4D9HG', '1992-07-22', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2023-01-17'),
(6711, ' Alan Ricardo', 'Hernandez Alvarado', 'Parajes de Oriente', 'D', 'Operador de Criticos', '2', '119991', '$2y$10$s4lU9Oei.vrssjha.57ywuy/DuFGWhImeaH25C1Ojc.D54GEi8Nhe', '2003-11-05', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2023-01-19'),
(6712, ' Jose Luis', 'Lopez Cruz', 'Sauzal', 'D', 'Operador de Criticos', '2', '119994', '$2y$10$oKGaxA8DXD2SdIRfLSFwMuV5RYgs2C/5/EWZZmiEw4B5jlClk4Osu', '1994-06-07', 'Erik Rey Mata Texna', '61890', 'HUS II', '2023-01-19'),
(6713, ' Andres', 'Nava Guardado', 'Riberas del Bravo', 'D', 'Operador De Procesos', '1', '119996', '$2y$10$wkwhRYKOPfMcA0RVGeaP1.UEEzzUjrBvils1oZ0ktFLnPP.E4EyzG', '1986-12-14', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2023-01-19'),
(6714, ' Noel', 'Hernandez Hernandez', 'Paraje de San Isidro', 'D', 'Operador De Procesos', '1', '119997', '$2y$10$NKzobsuU1ieCCOLllrNz8.exa6OxJgBmjfyRz2h1eykGyHPTzWpn6', '1988-10-11', 'Luis Alberto, Moreno Kolb', '106582', 'HUS', '2023-01-19'),
(6715, ' Paul', 'Simon Jimenez', 'Jardines de Roma', 'D', 'Operador Especialista', '2', '120000', '$2y$10$NytryMzsA6I5RrrN2Oi52OdjK9JmYErlHJecUpOc/BKcVeN5brERa', '2003-06-10', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2023-01-19'),
(6716, ' Christian Arturo', 'Solis Rodriguez', 'Cerradas del Alamo Fracc', 'D', 'Operador De Procesos', '2', '120069', '$2y$10$hBORpBxF8KZWTbcHaXIOO.l3Qr1T29Ot0HHJ.K6LI160eEt1uWsfq', '2004-06-22', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2023-01-24'),
(6717, ' Hermilio', 'Quinta Bartolo', 'Urbivilla del Campo', 'D', 'Operador de Criticos', '2', '120115', '$2y$10$1h1/f5iPVHFnNb56t0jqYO5hNQrLEvHSUN72.h4/QwZVQkx.KnKt.', '1990-06-01', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2023-01-26'),
(6718, ' Victor Manuel', 'Tomas Mireles', 'Horizontes del Sur', 'D', 'Operador De Procesos', '2', '120169', '$2y$10$fq5RAfhD4GRUhD2gmeR8W.huxuDmKlsJXm0B7ZJkPSzKyJxl8IcPy', '1994-07-28', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2023-01-30'),
(6719, ' Fabian Alonso', 'Guerrero Rodriguez', 'Paraje de San Isidro', 'D', 'Operador de Criticos', '2', '120172', '$2y$10$rxIprPnPxV1X3H8Klum/1uxP.oxen0qrEUZhXgVOF9mpPvCEeB0Fa', '2004-12-14', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2023-01-30'),
(6720, ' Oscar Daniel', 'Martinez Dominguez', 'Jose Sulaiman', 'D', 'Operador De Procesos', '2', '120173', '$2y$10$986.gP/rWlq155Q5IvT5y.VqvYD/tJ/bvJT6M4/hahNF/E1Ctw29i', '1998-03-25', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2023-01-30'),
(6721, ' Jose De Jesus', 'Rueda Valenzuela', 'Morelos', 'D', 'Tec Mtto Equipo de Moldeo', '1', '120179', '$2y$10$OQCyZjQyha7g1tl8xeR/neHEyoosC2s6q0m.0h6TnsigP69oW9pzm', '1990-07-03', 'Castro Molina, Jesus', '46787', 'HUS', '2023-01-30'),
(6722, ' Elias', 'Isidro Jose', 'Las Haciendas', 'D', 'Operador General', '1', '120194', '$2y$10$FHps3aaBcup5PZYQGaMO4.oIqqQZQQr2EJn52tSIH/iwV636Bu4Jq', '1983-05-03', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2023-01-31'),
(6723, ' Jose Luis', 'Gomez Agustin', 'Las Haciendas', 'D', 'Operador General', '1', '120196', '$2y$10$snSubGT0kLq205AD4gg12.jaL5nRFvBKi3zr.qjwFA8OgMpxImvtu', '2002-08-10', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2023-01-31'),
(6724, ' Jorge Axael', 'Marquez Chontal', 'El Mesquital', 'D', 'Operador De Procesos', '1', '120199', '$2y$10$VlUKsZ8.Tb6pAKQO1VFIJ.UTAooestWQu/WxgWLpaPeE4bcGauSlS', '2004-08-09', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2023-01-31'),
(6725, ' Jorge Luis', 'Palacios Gonzalez', 'Complejo Cielo', 'D', 'Operador de Criticos', '1', '120203', '$2y$10$IWrqEeEn8NTULPyjG1j1bOvZvsrSuPTmYhLBUyui1y3g2g0C5Bf2e', '1999-09-04', 'Jorge Luis Rios Ramirez', '71668', 'HUS', NULL),
(6726, ' Edgar Roberto', 'Martinez Guerra', 'Cerradas San Pedro', 'D', 'Operador De Procesos', '1', '120204', '$2y$10$jpqVy88jtYjv2A1YQf3JU.wOYR7EtntCe7/8vZlUZ4QPhYNW4f2E2', '1990-09-25', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2023-01-31'),
(6727, ' Jose Alfredo', 'Posada Baltazar', 'El Mezquital', 'D', 'Almacenista', '1', '120206', '$2y$10$hiY916UWjv3Iz99wOxh6u.wLsoP4l//8BqGSJEmUOvB.LrDaZD9S2', '2000-07-26', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2023-01-31'),
(6728, ' Jesus', 'Antonio Pacheco', 'Praderas del Sol', 'D', 'Operador de Secundarios', '2', '120225', '$2y$10$/bH33j1ykYjmUxYZuk3ngOJF0EGR4fOwQcXV4cEK0Mt08hzWneYam', '1979-01-28', 'Erik Rey Mata Texna', '61890', 'HUS II', '2023-02-02'),
(6729, ' Iris Marlen', 'Martinez Martinez', 'Cerrada de Oriente', 'D', 'Operador De Procesos', '2', '120264', '$2y$10$iBWSB0hmnd7t9yc4cJLDSeBOL3zhdo5QpMw5XEEWdfZmOyEQtRfLS', '2002-07-30', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2023-02-07'),
(6730, ' Mariano', 'Rodriguez Mayo', 'Hacienda Santa Fe', 'D', 'Operador Especialista', '1', '120267', '$2y$10$M/.sdm4UgJb3SnuC31bENeMjVVKT0elgGmRER6gSBRYbB1WhX/2zu', '1993-08-08', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2023-02-07'),
(6731, ' Froylan', 'Bravo Hilario', 'Paraje del Oriente', 'D', 'Operador Especialista', '2', '120354', '$2y$10$V1CNL6n2yQSLZmHjOzoNd.mS3vCp557EEUrw1kYNYAmF6UxCMyaPG', '2003-03-04', 'Javier MartÃ­nez Acosta', '61908', 'HUS II', '2023-02-10'),
(6732, ' Brandon', 'Cervantes Martinez', 'Cerradas Santa Isabel', 'D', 'Operador De Procesos', '1', '120359', '$2y$10$kAjjtXxtdqgWPbuXq.W.6eI4LEOPJBqAzTMvgpmusBmuxdHhyiKAG', '2004-08-18', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2023-02-10'),
(6733, ' Joaquin', 'Fuentes Huerta', 'Mezquital', 'D', 'Tecnico de Control Ambiental', '1', '120360', '$2y$10$Vtj6X0a6AJPCkKfmCI9EkeMaPNDUkeF2gvpgPRmeUiURJHFwqTxSm', '1993-10-06', 'Jessica Alejandra Aguilar Guti', '109077', 'HUS', '2023-02-10'),
(6734, ' Mario Alberto', 'Saucedo Mendoza', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '120368', '$2y$10$yLeHejMmIWg9tHVDGpn/d.wbqJcaAY56SgFup1kdtTcXecJ1D.0ne', '1997-01-14', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-02-10'),
(6735, ' Amos', 'Santiago Hipolito', 'Lomas del Valle', 'D', 'Operador De Procesos', '1', '120408', '$2y$10$sjpHw0gEeRp7L1tw0518GuNo1HxFBD03daw46tEiy5tOJDfea0h7C', '1996-08-01', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-02-14'),
(6736, ' Manuel De Jesus', 'Acosta Herrera', 'Valle Fundadores', 'D', 'Operador De Procesos', '1', '120415', '$2y$10$rmAIpReG0SApSaTM4KgNLerdhp8ccrWyJoqDp.DnugNZ6xy/yUuc.', '1983-02-28', 'Velarde Inostroza Enrique', '71208', 'HUS', '2023-02-14'),
(6737, ' Nallely', 'Ramirez Rivera', 'Manuel Valdez', 'D', 'Operador de Secundarios', '2', '120502', '$2y$10$dJewnql4k591e.5c1fJrnuTDVFgIwK/Da.Cs8FsBmia3C.4na1aAi', '1998-04-14', 'Santiago Antonio Pacheco', '72187', 'HUS II', '2023-02-20'),
(6738, ' Evangelina', 'Quijano Hipolito', 'Urbivilla del cedro', 'D', 'Operador General', '1', '120551', '$2y$10$Hv8MjE7v7lnFKb0Zkmqh2.IogiqP5khVRwhiyyH6K3tWBrcLghO7O', '1989-01-07', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2023-02-23'),
(6739, ' Erick', 'Romero Cabrera', 'Terrenos Nacionales', 'D', 'Operador de Criticos', '2', '120553', '$2y$10$ItCfFvNjAaTBW504dfU9XuA0vjfOLzTapcvJrYInGJ54zg6VJk7gi', '2004-08-18', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2023-02-23'),
(6740, ' Abner', 'Concepcion Lorenzo', 'Paraje de San Jose', 'D', 'Operador de Criticos', '2', '120602', '$2y$10$CPbwq1wYGzqYbESFnqM2wOZ52C3BlreHj0cJMqgSvOH8eaI2hsvka', '1995-09-24', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2023-02-27'),
(6741, ' Juan Francisco', 'Aguilar Escobedo', 'Riveras del Bravo', 'D', 'Almacenista', '2', '120604', '$2y$10$2VO/1FGHaknU/3Z3oxsom.pR26JT0eNd.rE5mgfxt/YYOXBKAXPMS', '1997-11-12', 'Bacilio Abel Rocha Carrillo', '68476', 'HUS II', '2023-02-27'),
(6742, ' Isai', 'Concepcion Lorenzo', 'Paraje de San Jose', 'D', 'Operador de Criticos', '2', '120610', '$2y$10$52Yn0BkRaDg4waFCCikiD.kfK6Jkvy3TfOxYJd9MqKMiPnPIgVby6', '1997-05-30', 'Santiago Antonio Pacheco', '72187', 'HUS II', '2023-02-27'),
(6743, ' Osvaldo', 'Alejandro Valerio', 'Carlos Chavira Becerra', 'D', 'Operador De Procesos', '1', '120634', '$2y$10$jIhqMvWhI76PGW60Gs2.Qegb4zzuIiXZnFbbYLfGO/j.5Iww9ZMXa', '2004-07-16', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-02-28'),
(6744, ' Felipe', 'Jacinto Sebastian', 'Paraje de Oriente', 'D', 'Operador General', '1', '120635', '$2y$10$DfB.Q1Hcbvy0kwliXT.eLOJ6WoqYmOqHFXx9SsCVEjxsqhE/l6f9q', '1990-05-11', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2023-02-28'),
(6745, ' Jonathan', 'Guzman Cruz', 'Riveras del Bravo', 'D', 'Operador De Procesos', '2', '120655', '$2y$10$vfHrWshL48xJGmFw4OLfzO.vSbXbULfwxUl7qEb4kUYFrm6RawL8u', '1996-04-18', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2023-03-02'),
(6746, ' Martin', 'Rodriguez Chavez', 'Jardinez de San francisco', 'D', 'Tecnico Lider de Automatizacion y Control', '1', '120681', '$2y$10$eWt27oooKpuoTOcWMTHnmOrE1p.1h6AWOBQGf/CE/z95UKANyBI46', '1978-12-26', 'Fernando De La O Alvarez', '70963', 'HUS', '2023-03-06'),
(6747, ' Cesar Madai', 'Hernandez NiÃ±o', 'Sierra Vista', 'D', 'Operador de Criticos', '2', '120720', '$2y$10$BH/yQ9dHcgep3Av7edvNGeEKLj2VoMWZenM3VauHvsPNykxEhw1oC', '1998-06-15', 'Erik Rey Mata Texna', '61890', 'HUS II', '2023-03-09'),
(6748, ' Pedro Manuel', 'Espinoza Martinez', 'Paraje del Oriente', 'D', 'Operador de Criticos', '2', '120725', '$2y$10$XgFZGRo3L8N//CJqzhi0PuGDtN1WA8Vopwvo9XCL15ZksvPK5Bqq.', '1998-09-29', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2023-03-09'),
(6749, ' Luis Gerardo', 'Flores Ochoa', 'Las Haciendas', 'D', 'Operador De Procesos', '1', '120771', '$2y$10$QoxNTj0mvlcdhOmZhAw0de4YGoiF7bVHHPe71e/NkRYKZ1KGeJqS.', '1999-02-15', 'Velarde Inostroza Enrique', '71208', 'HUS', '2023-03-13'),
(6750, ' Luis Fernando', 'Cuellar Lopez', 'Senderos de San Isidro', 'D', 'Operador de Criticos', '2', '120823', '$2y$10$joQm1rqTG60r0mzE9cwUDukO4yuFOXHeqlImrows8v9NZHCLIBZP.', '1998-05-26', 'Erik Rey Mata Texna', '61890', 'HUS II', '2023-03-16'),
(6751, ' Ernesto Antonio', 'Tejada Carretero', 'Privada Florencia', 'D', 'Operador De Procesos', '1', '120838', '$2y$10$rLVk8xXreI.j1qoFAjyu5.cUdNPt6ku6TtfhSWr/7IfiEEDurX5NS', '1998-02-15', 'Saul Arellano Escobar', '97722', 'HUS', '2023-03-16'),
(6752, ' Jairo', 'Fuentes Narcizo', 'Paraje de Oriente', 'D', 'Operador de Criticos', '2', '120933', '$2y$10$y2OwAAwqbRHgyBQPNuIj7ekspHeTEfrOzavnTKWdbe4QY60RO2vmm', '2001-11-18', 'Santiago Antonio Pacheco', '72187', 'HUS II', '2023-03-23'),
(6753, ' Jairo Benjamin', 'Cruz Reyes', 'Profesora Ma Martinez', 'D', 'Operador de Secundarios', '1', '120935', '$2y$10$8sYmcfXvp67P8kqH4wlS1.m21Rm11FTM05C7.daafCpxuw.KlF.IC', '1996-02-17', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2023-03-23'),
(6754, ' Jose Abel', 'Ramirez Reyes', 'Sor Juana Ines de la Cruz', 'D', 'Operador General', '1', '120937', '$2y$10$fZRVDmLsUCFdYr3GnocHo.Thy9JgVdt5whqJRgQg11WZmTenO32eS', '2002-03-26', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2023-03-23'),
(6755, ' Rosendo', 'Cruz Perez', 'Oriente Zaragoza', 'D', 'Operador de Criticos', '2', '120958', '$2y$10$5SZklX.sXIJw9iVPYSg.S.lilzzLgGex/e.uSQaHEIJZoZUaEvW5G', '1991-08-30', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2023-03-23'),
(6756, ' Heladio', 'Rodriguez Heredia', 'Oriente Paraje del Sur', 'D', 'Operador General', '1', '121022', '$2y$10$XMnC8vq3Qvm03edXSnfOP.swiD860nEOJOuIe.3s.ukzzjGxBlp7O', '1994-02-18', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2023-03-27'),
(6757, ' Alfredo Misael', 'Hernandez Duran', 'Villa Bonita', 'D', 'Tec Esp en Mtto Equipo', '1', '121026', '$2y$10$xaGmm2M8UTBhyxl6VWw7M.806vvypXHCjWs/ihVj8s7aRYNUO3W6S', '1994-09-15', 'Mauro Sanchez', '61715', 'HUS', '2023-03-27'),
(6758, ' Jose Alberto', 'Hernandez Coronado', 'Fcto La Enramada', 'D', 'Operador de Criticos', '1', '121042', '$2y$10$WhU2Hz49iOPTnJeWr47KbOxxCt9ppTgKvpPWMHCvxVtvta0KQxRc6', '1986-01-31', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-03-28'),
(6759, ' Juan', 'BolaÃ±os Quintero', 'Roma', 'D', 'Operador de Criticos', '2', '121065', '$2y$10$OYeX54ssF7l2NSpCbGziVOK7dZbvfHiquMEbRBTDAYbGva1UJWH5W', '1999-12-05', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2023-03-30'),
(6760, ' Julio Alejandro', 'Lares Contreras', 'Urbi Villa del Campo', 'D', 'Operador De Procesos', '1', '121070', '$2y$10$JG0UbhRrdFUIvmHu4QQgcOCPAxlu7DUcKniaH.eFylMxVvCUbPaoi', '2002-01-14', 'Saul Arellano Escobar', '97722', 'HUS', '2023-03-30'),
(6761, ' Gabino', 'Sanchez Oropeza', 'Riberas del Bravo VIIII', 'D', 'Operador de Set Up', '1', '121106', '$2y$10$MQeX6Jkd7YRzxa0q9Je0/u23PhubdZBYdisXhbwCymSpsZ5oZViP6', '1993-10-25', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2023-04-03'),
(6762, ' Edelia Irasema', 'Rodriguez Martinez', 'Praderas del Sur', 'D', 'Operador De Procesos', '1', '121107', '$2y$10$FK.TbqoevArRcKZWCR7uSOaVDNoDfBUptkfs2V5NIiepm.1rJYQtW', '1981-01-01', 'Abel Fernandez Delgado', '98716', 'HUS', '2023-04-03'),
(6763, ' Eloy', 'Lopez Morales', 'Fray Garcia de San Fco.', 'D', 'Operador De Procesos', '1', '121186', '$2y$10$08iVJE6JonwprB8wZoEUWOSH/nFIKB6pwVn.ncaZgERnuHWf7NeXe', '1978-09-11', 'Saul Arellano Escobar', '97722', 'HUS', '2023-04-10'),
(6764, ' Jesus Manuel', 'Hurtado Franco', 'Infonavit Solidaridad', 'D', 'Operador General', '1', '121192', '$2y$10$ywMUusntOEWkEEN8OG0Dy.L99iqzjRWhp/G7va1Zu7qixy/UrNmoa', '1993-10-22', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-04-10'),
(6765, ' Cristian Roman', 'Aquino Najera', 'Urbi Alameda Versalles', 'D', 'Operador De Procesos', '1', '121196', '$2y$10$yJsZ6X4X3O5A3Y6sPHMxLOcc2Wa7t8g7aL54/8Q2hdFDue9aanBxe', '2004-11-21', 'Varona Hernandez, Braulio', '61651', 'HUS', '2023-04-10'),
(6766, ' Jose Antonio', 'Gutierrez Andres', 'Las Haciendas', 'D', 'Operador de Criticos', '2', '121206', '$2y$10$SYvmXuZcna0J5/dh/hryqOnZaRYJ5GkQScXi4gIPnsqpwsC2Z2vEG', '1997-03-10', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2023-04-11'),
(6767, ' Yael', 'Mata Fajardo', 'Arenales', 'D', 'Operador De Procesos', '2', '121215', '$2y$10$7CmL/3FrxTCCvL/1Qj6sl.hEXl.LDyfYuWricW2xWnSIZvw2hJVRa', '2004-05-15', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2023-04-11'),
(6768, ' Lennin Said', 'Orona Aldama', 'Fray Garcia de San Franci', 'D', 'Operador de Criticos', '2', '121286', '$2y$10$o6vgqKC0RY.BeRaWVVR0o.LNJfCxOgkgfZfM71hIrA6jJkUzxtnPO', '2001-02-14', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2023-04-14'),
(6769, ' Eduardo', 'Pereda PeÃ±a', 'Valle de Olivos', 'D', 'Operador De Procesos', '1', '121288', '$2y$10$hrhToH2.gYnQ1HskjDTViOBcDCGpQc2kwhifsPc6oJRJjrgitepJy', '1997-06-25', 'Resendez Gardner Raul', '98277', 'HUS', '2023-04-14'),
(6770, ' Cynthia Lucia', 'Villado Torres', 'Bosque Bonito', 'D', 'Operador General', '1', '121398', '$2y$10$x5eVi4/ZSzP4cYxo1HccXueUJgFoTIdFj4f5M6OfOQd9cthRByDJO', '1986-07-14', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', NULL),
(6771, ' Jesus', 'Quijano Lorenzo', 'Fray Garcia De San Franci', 'D', 'Operador De Procesos', '1', '121400', '$2y$10$6Mm3phfpSMTOXhskVXBqzujQBTWeG5flG4RtHJ4W8NQMnED7v2WG6', '1980-12-25', 'Velarde Inostroza Enrique', '71208', 'HUS', '2023-04-24'),
(6772, ' Julio Eduardo', 'De La Cruz Santiago', 'Paraje de San Isidro', 'D', 'Almacenista', '1', '121416', '$2y$10$Q0.g8f0pv68Vmzf5Jxy9kO48taBGFBTZknqkHqgzJ4AgRQtIbd1jG', '1998-07-01', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2023-04-25'),
(6773, ' Ricardo', 'Duran Gutierrez', 'Aguilaz de Zaragoza', 'D', 'Operador General', '1', '121418', '$2y$10$o41DtzmYnMlLyqtFAZd50euytUB0eeVlMT.f1SRw5ttC/Q43FQuhC', '1988-01-08', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2023-04-25'),
(6774, ' Alba', 'Pacheco Cecilio', 'Manuel Jesus Clouthier', 'D', 'Operador De Procesos', '1', '121466', '$2y$10$I1Uy80n.poSfOsLdjupBgeC5WWhfpGiDqqHot4Uy/6v4LGrSvVnIC', '1988-02-19', 'Abel Fernandez Delgado', '98716', 'HUS', '2023-04-27'),
(6775, ' Francisco Javier', 'Moreno Alvarado', 'Las Haciendas', 'D', 'Operador General', '1', '121479', '$2y$10$J7QdcRupL9.TzYFtJ0EnXudlcsfAaeO4s5qtTWVeuo/Te82CmgBum', '2000-09-02', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2023-04-27'),
(6776, ' Karina', 'Hipolito Fonseca', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '121482', '$2y$10$vdV838N/or61vbclx3lnT.xWY538WGMNPx/NlAjf48EIfCsgkXxcS', '1984-11-07', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2023-04-27'),
(6777, ' Francisco Antonio', 'Cruz Martinez', 'Urbivilla del cedro', 'D', 'Operador de Criticos', '1', '121489', '$2y$10$qkaRmXjLozVBryu1.o64/.KOW/u.pcvpca2p2/LRq1gzO5ijEJm5.', '1996-01-17', 'Saul Arellano Escobar', '97722', 'HUS', '2023-04-27'),
(6778, ' Cristhian Abundio', 'Zavaleta Lara', 'Vistas de Zaragoza', 'D', 'Operador De Procesos', '2', '121544', '$2y$10$OrdzQCIyi7C3QLkSiIRaMeT85k2LTPu.5i7Ft1P2qwPaF8OvL2sSO', '2002-04-20', 'Javier MartÃ­nez Acosta', '61908', 'HUS II', '2023-05-04'),
(6779, ' Luis Fernando', 'Tenango Martinez', 'Paraje de San Juan', 'D', 'Operador General', '1', '121549', '$2y$10$inD381baMnq5DjiIJcV8/.rj6bIyyI35ZkOiCOqfVOI8DY9g/DT0i', '2004-12-17', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2023-05-04'),
(6780, ' Mauricio', 'Maldonado Ruiz', 'Cerradas San Angel', 'D', 'Tec Esp en Mtto Equipo', '1', '121640', '$2y$10$tYnxkL79vAie73EutgNcB.SvHFbfsKVCfamHpyGeY8KdPgVFIDWEC', '1992-01-03', 'Luis Albel Aguirre Ortiz', '61762', 'HUS', '2023-05-15'),
(6781, ' Daniel', 'Cortes Salazar', 'Paraje de San Isidro', 'D', 'Almacenista', '2', '121698', '$2y$10$/MCDdbeBNUvZJEuYiCjdruYXGnp7VkNT6B6UBX3sHzx1OKTTTdkMu', '1997-10-11', 'Bacilio Abel Rocha Carrillo', '68476', 'HUS II', '2023-05-18'),
(6782, ' Jonny', 'Valencia Garcia', 'Paraje de San Jose', 'D', 'Operador De Procesos', '1', '121707', '$2y$10$3y6Nz6EyJ5fk0wP/VbNEr.CQ2G9xnoYF/pUbsjo5Zr/goVhprABcq', '2001-02-21', 'Abel Fernandez Delgado', '98716', 'HUS', '2023-05-18'),
(6783, ' Pablo Cesar', 'Cruz De Jesus', 'Misiones de Creel', 'D', 'Operador General', '1', '121711', '$2y$10$vrqoBsusI42a5XgCBNs7jen.0hEkOM5jVD0nsZG36jhMRDsPtO/2a', '2003-04-04', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2023-05-18'),
(6784, ' Ezequiel', 'Gonzalez Chacon', 'Paraje de Oriente', 'D', 'Operador De Procesos', '1', '121752', '$2y$10$ZJsq0Bgcf4T92eOkmrTQ3.Sl1Jv6kXVGFDduLf8PiOCdImZzlab3y', '1990-04-01', 'Saul Arellano Escobar', '97722', 'HUS', '2023-05-23'),
(6785, ' Luis Angel', 'Raymundo Veracruz', 'Riveras del Bravo', 'D', 'Operador De Procesos', '2', '121798', '$2y$10$ok6QeEyyfAHG5mScjHstb.soybECCsyOtOUTRS3TQHAr4oYUwXMAy', '2005-02-06', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2023-05-25'),
(6786, ' Alonso', 'Ramirez Reza', 'Jardines de San Patricio', 'A', 'Analista de Comunicacion', '1', '121824', '$2y$10$GUN6cwXbH0iMv4BCkjWMEugtwnAjcW96aTEifukSUBE3iEVMVHoKG', '1999-02-09', 'Israel Rodriguez Andrade', '77183', 'HUS', '2023-05-29'),
(6787, ' Jose', 'Martinez Gregorio', 'Vistas de Zaragoza', 'D', 'Operador General', '1', '121982', '$2y$10$yKO1Z7i6tBQ4OTEEo8LSK.Ao5z14auUIQTS10IrYoP5Gd9M15uJ.K', '1989-09-15', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2023-06-05'),
(6788, ' Alberto', 'Vazquez Fuentes', 'Manuel Valdez', 'D', 'Operador De Procesos', '1', '122016', '$2y$10$73REuhHXnrprUtcQkXid4.i0ha/.RqDxrZb6YqxNuuOvv2qL2tgMG', '2002-04-08', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', NULL),
(6789, ' Jimmy De Jesus', 'Carvajal Pacheco', 'Parajes de San Isidro', 'D', 'Operador General', '1', '122022', '$2y$10$m2FGKHTJ0aoO4r8Zobr5weki5MevDKhZs/T/fwQVP58XrRX.p92qu', '2001-06-28', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2023-06-08'),
(6790, ' Victor', 'Martinez Rodriguez', 'Arecas', 'D', 'Almacenista', '1', '122048', '$2y$10$T7AnEsiAygJzj2HMO8x8jOVNIXXPWlS04500SyszGy/tdAci4EQ56', '1972-09-10', 'Resendez Gardner Raul', '98277', 'HUS', '2023-06-12'),
(6791, ' Luis Alberto', 'Solis PiÃ±on', 'Salvarcar', 'D', 'Operador General', '1', '122049', '$2y$10$z6XsSA58rg/KYW1uYt12iOF5.5XfigIWIL2D0l8umXKBrU4Pxhdeq', '1994-02-07', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-06-12'),
(6792, ' Laura Lizbeth', 'Aguero Silva', 'Sierra Vista', 'D', 'Operador de Criticos', '1', '122073', '$2y$10$mufz.fpXRob.InvOXue30u98l7K.58/VD9Xi06DlIm.eb9/wnH0sa', '1994-10-18', 'Vania Garcia', '100540', 'HUS', '2023-06-13'),
(6793, ' Carlos Daniel', 'Tenorio Santos', 'Portal del Roble', 'D', 'Operador General', '1', '122094', '$2y$10$4NBltgmVmhRCh7ezW/Bwhe.zygqUFMrBrem55URHEdlXDDFOYoIxa', '2000-08-28', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-06-15'),
(6794, ' Fabiola', 'Mendoza Fuentes', 'Olivia Espinoza de Bermud', 'D', 'Operador de Criticos', '1', '122098', '$2y$10$64T0GOH7PsukSK4iXTGgk.Pht37rTHff4U9ZJ18aDkHNnXuwU2SCi', '2001-06-10', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-06-15'),
(6795, ' Fatima Eustacia', 'Vasquez Contreras', 'Praderas del Sol', 'D', 'Operador de Criticos', '1', '122133', '$2y$10$iD6JPHM.IcBFXAZACT9hku4ImBpZi3xlonfRsD3teJVNlpUiL/oD6', '2001-09-20', 'Jesus Lopez Solis', '73653', 'HUS', '2023-06-19'),
(6796, ' Jose Daniel', 'Ruiz Orocio', 'Parajes del Sur', 'D', 'Tecnico de Ingenieria', '2', '122135', '$2y$10$jC2ONCOKQkpuGn6tItbW6Otl6fLuXbO33k/mHbhSH2jshJbyNZ05K', '1996-09-19', 'Purata Enriquez, Misael', '33458', 'HUS II', '2023-06-19'),
(6797, ' Yessica Fabiola', 'Gomez Gordillo', 'Villas de Alcala', 'D', 'Operador de Criticos', '1', '122138', '$2y$10$0Oe/EfbIPBK1EQsI6VD4yuLFcD8Z5gYvpeMeMgMVDZe1oo4bfcjv.', '1995-01-12', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-06-19'),
(6798, ' Dafne', 'Hernandez Pantoja', 'Urbivilla del cedro', 'D', 'Operador de Criticos', '1', '122139', '$2y$10$QDCTqUCOQGccH2HO6YlVNuBgDDjizkJwczZ7937K39eSd0Zd4WjMu', '1999-03-30', 'Saul Arellano Escobar', '97722', 'HUS', '2023-06-19'),
(6799, ' Hilario', 'Loyo Farias', 'Valle de Santiago', 'D', 'Operador De Procesos', '1', '122174', '$2y$10$JesExoRhCp/3xDQKNy61auP3WBemiB492LBx5xEstMiJ2hwzoWnlK', '2004-11-18', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2023-06-22'),
(6800, ' Yolanda', 'Fernando Marquez', 'Urbivilla del Cedro', 'D', 'Operador de Criticos', '1', '122175', '$2y$10$CHSMnnwu57WgPoxqtQPFB.QhA4VNdgHCignM3FOuMduDDv2lCiz5S', '1994-12-21', 'Saul Arellano Escobar', '97722', 'HUS', '2023-06-22'),
(6801, ' Eduardo De Jesus', 'Solano Lara', 'Urbivilla del cedro', 'D', 'Operador de Criticos', '1', '122177', '$2y$10$xRy7jtx.w9STRqgBU0Xauev6Bq/JC0Ih50PPkcI7t8X0Fh97WujFK', '1997-10-23', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2023-06-22'),
(6802, ' Azucena', 'Reyes Marcial', 'Portal del Roble', 'D', 'Operador de Criticos', '1', '122178', '$2y$10$ITE1oPrPeGn.Xhrvif4Di.esov4ElXeGSIoQYSCdslNXEaHF5jbC6', '1995-08-09', 'Daniel De Jesus Favela Najera', '73913', 'HUS', '2023-06-22'),
(6803, ' Rogelio', 'Castorena Cortez', 'Horizonte del Sur', 'D', 'Tec. Esp. en Mtto. Equipo', '1', '122287', '$2y$10$0c60vnJPdERk3Dd8kEAeHOaDenHodPWx2F6jvwgSfY4vbIwmL3CsK', '1988-03-07', 'Martinez Gonzalez Fernando', '24731', 'HES', '2023-06-29'),
(6804, ' Benjamin', 'Brigada Gaitan', 'La enramada', 'D', 'Tec de Mantenimiento Troqueles', '1', '122324', '$2y$10$twznHCllF9M25ALCXA0KIu33LboQBi3LIrAFx6rZCnxGvyoMgmIkG', '1996-06-23', 'Favela Alvarado, Jose Luis', '25333', 'HES', '2023-07-04'),
(6805, ' Julio Israel', 'Gonzalez Martinez', 'Paraje de Oriente', 'D', 'Operador De Procesos', '2', '122340', '$2y$10$fxahzYCXFtEBPRxH0T9RcOTYi7oavrzCiGDcFockr2lKRZgd4zD8C', '1997-02-18', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2023-07-06'),
(6806, ' Julio Cesar', 'Holguin Talamantes', 'Sur de los arcos', 'D', 'Operador Especialista', '1', '122341', '$2y$10$qzNqarDeIGiNUhuKxXw5A.GECyK.ILY9TnbqRTorMcjBJ1Ho/X9Oa', '1989-12-25', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-07-06'),
(6807, ' Ruben', 'Osorio Casimiro', 'Oriente Las Haciendas', 'D', 'Operador General', '1', '122342', '$2y$10$OAwH/z4i2jlmZXZ8t0ittuiNbhJtFOmlilanR6oZNnrBVEPPATt52', '1989-09-09', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-07-06'),
(6808, ' Sergio Alejandro', 'Guerrero Avila', 'Arecas', 'D', 'Operador General', '1', '122347', '$2y$10$x6URlA/BkDnkHet93.ZRuubGGbVDP8/C/iB1cNlXKnmdgBCnmhpyC', '2004-08-21', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-07-06'),
(6809, ' Toribio', 'Esteban Aguero', 'Parajes del Sur', 'D', 'Operador De Procesos', '1', '122348', '$2y$10$EcqYyZD3PnS4lv5xnMLt8euInKAfthp1z5PnftXScL/adqwxCW3zG', '1980-04-16', 'Saul Arellano Escobar', '97722', 'HUS', NULL),
(6810, ' Santiago', 'Valenzuela Pacheco', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '2', '122351', '$2y$10$Ac6pZ5iOwv7LrmHpU6m2eOtjjUqtyiD8gkPEhHZM6akS3fYC6b2PG', '1993-11-09', 'Erik Rey Mata Texna', '61890', 'HUS II', '2023-07-06'),
(6811, ' Angel', 'Mejia Aniceto', 'Senderos del Sol', 'D', 'Operador de Criticos', '2', '122404', '$2y$10$dIRQbi8P4R7sFeATu9pnbOUvqIzHEyEM3DBR.Zng9wLiklYi1YevS', '1997-10-05', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2023-07-10'),
(6812, ' Jose Adan', 'Navarrete Hernandez', 'Oriente Las Haciendas', 'D', 'Tec. Esp. en Troqueles', '1', '122405', '$2y$10$doz/VrIpYCEzK.Rihgp2a.Y0T4IeAfJba3qR5gbEkRpcr0RJBHy3e', '1982-07-18', 'Sanchez Cordova, Rene', '41563', 'HES', '2023-07-10'),
(6813, ' Angel Eduardo', 'Ortega Galindo', 'Paraje de Oriente', 'D', 'Operador De Procesos', '2', '122406', '$2y$10$2EQ.U7HM3EH3pshPbv3bHO4O94Oin9ahtJdw9Y0XlRDehZKxKzvvi', '2001-12-31', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2023-07-10'),
(6814, ' Francisco Javier', 'NuÃ±ez Chandomi', 'Jardines de Roma', 'D', 'Operador de Criticos', '1', '122442', '$2y$10$JRt4UCBFJ18.KTZUy.PQjO7IctJFOaiRtZ05N1dTgIQChT85vFC7S', '1999-11-24', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-07-13'),
(6815, ' Luis Alberto', 'Perez Vergara', 'Hacienda de las Torres', 'D', 'Operador De Procesos', '1', '122443', '$2y$10$a3C9mXH7jmXb1UL5tpvGwOtV9EpPGD4q4RCrtIa/GTUn6K7MvCxey', '1989-11-02', 'Abel Fernandez Delgado', '98716', 'HUS', '2023-07-13'),
(6816, ' Janzel Jacob', 'Meza Solano', 'Praderas del Sauzal', 'D', 'Operador De Procesos', '1', '122444', '$2y$10$f9uoFF8atFAM27JxdVD2..VgcQgP/Iijn6KxkWbnhFHWR18q8YQ2e', '2004-06-26', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-07-13'),
(6817, ' Vicente', 'Martinez Ledezma', 'Las haciendas', 'D', 'Operador de Criticos', '1', '122445', '$2y$10$MFXmzUU2Z7obK3UdK5Zbt.O81uL1TXCFs5o7Fovy16RBCPuzadySC', '1989-08-28', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-07-13'),
(6818, ' Moises', 'Conchi Zapo', 'Paraje de Oriente', 'D', 'Operador De Procesos', '1', '122449', '$2y$10$pQpEyPwrvVIRHvZtIzRAbuIJXLLzNklMqrCCd6Uh3mywbmROvEC0.', '2003-09-04', 'Abel Fernandez Delgado', '98716', 'HUS', '2023-07-13'),
(6819, ' Noe De Jesus', 'Paz Ayala', 'Privadas Florencia', 'D', 'Operador De Procesos', '1', '122453', '$2y$10$v423IpLUzMQu20z9X3WgPu6NdfnLvDS5DrMw6.cHgPpWxY6oFYJEK', '1999-01-03', 'Abel Fernandez Delgado', '98716', 'HUS', '2023-07-13'),
(6820, ' Jorge Yuren', 'CastaÃ±eda De la Cruz', 'Manuel Valdez', 'D', 'Operador De Procesos', '1', '122460', '$2y$10$L7aboGk3XbKKk7PBNa18RurACKZ6GW2lrI.HM21h655VAWxHZKXDG', '2003-10-18', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2023-07-13'),
(6821, ' Luis Angel', 'Balbuena Serena', 'Urbivilla del Cedro', 'D', 'Operador de Criticos', '1', '122463', '$2y$10$ae1nb1X1L/xCqLM.njukZeHlRTEaNvzyjvyArrJf6KCt750RwXiOm', '2003-12-27', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2023-07-13'),
(6822, ' Kevin Orey', 'Garcia Romero', 'Villas de Alcala', 'D', 'Operador General', '1', '122486', '$2y$10$YKbrAr0L6KvqYGjPnpU1x.y2PkZAo80xr3YPrP/gXAUARLJtt0Avi', '2004-02-15', 'Reyna Malaga, Jorge Luis', '46058', 'HES', NULL),
(6823, ' Jose Luis', 'Cruz Sabino', 'Arecas Fraccionamiento', 'D', 'Operador De Procesos', '1', '122546', '$2y$10$XxrnZVL9OuLwnWqvSQ06pOoyN3Bq8mkHOtHkcvaaIJg1OvXoGe6OG', '1998-03-19', 'Velarde Inostroza Enrique', '71208', 'HUS', '2023-07-20'),
(6824, ' Fernando', 'Cruz BolaÃ±os', 'Heroes de la revolucion', 'D', 'Operador de Criticos', '1', '122549', '$2y$10$IRSz35Y9KBtfhEmnyArGUOa71hBIseQlwDdFUr4zmVDaM2Sm4MQHa', '1989-12-06', 'Jesus Lopez Solis', '73653', 'HUS', '2023-07-20'),
(6825, ' Miguel Angel', 'Trujillo Rasgado', 'Paraje del Oriente', 'D', 'Operador General', '1', '122553', '$2y$10$MCzJs3mmBlvlkdTft9d5WOmK6BGlyWdSEtKYmoAxni9Qqq0PMqgPK', '1986-04-01', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2023-07-20'),
(6826, ' Ruben', 'Roque Jimenez', 'Heroes De La Revolucion', 'D', 'Operador De Procesos', '2', '122554', '$2y$10$7DBFDENx83p0VsrbldZLIuTl00qwJW83S8eJBlXaPOFuJLIC1.Fia', '1969-10-17', 'Javier MartÃ­nez Acosta', '61908', 'HUS II', '2023-07-20'),
(6827, ' Luis Fernando', 'De La Cruz Gardea', 'Manuel J Clouthier', 'D', 'Inspector Control de Calidad', '1', '122655', '$2y$10$78I4mRGU8T5tc0UJ9LrskOJBuPccPZSmTQmkE8jLuPiMRALBW3RrC', '1996-02-10', 'Oscar Garcia', '59965', 'HES', '2023-07-27'),
(6828, ' Josue', 'Huerta Reyes', 'Paraje de San Jose', 'D', 'Operador General', '1', '122656', '$2y$10$Z.TvcBPTIlmpVrxPTzf5KOtOB8rFIIYR0cWRvvzqEvAYLeYasoFM6', '2002-05-19', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-07-27'),
(6829, ' Oscar Daniel', 'Dominguez Palayot', 'Terrenos Nac Zaragoza', 'D', 'Operador General', '1', '122661', '$2y$10$e/jRbVEol9SbfHLDJHXoPOkcs/j8S/5vWjZ1uWO3xvPtN6R2BTh4m', '1991-05-08', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2023-07-27'),
(6830, ' Adan', 'Pioquinto Toto', 'Riveras del Bravo', 'D', 'Operador General', '1', '122662', '$2y$10$Eo5OQ/HZBZQHtc6P.Ty.ouN4Bx4wHbVFEwh5/oxHnD1OU.ZieifN2', '1977-09-12', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2023-07-27'),
(6831, ' Marisol', 'Cruz Garcia', 'Manuel Valdez', 'D', 'Operador General', '1', '122663', '$2y$10$jnk0/oCr6zYf9eIiWW9Z6.9Mqbp7xh2Q6RsMbMDbAdjlRGz0F3PEe', '1997-02-26', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2023-07-27'),
(6832, ' Ismael', 'Silva Vidal', 'Lomas del Valle', 'D', 'Operador General', '1', '122666', '$2y$10$1nCZ9v1HG70.1UHBn0aFgeXLZNFxNBV4VdoTxJnT3il4y4Xzae2mO', '1992-08-07', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2023-07-27'),
(6833, ' Marina Alexa', 'Lopez Vega', 'Unidad Habitacional Emili', 'D', 'Tecnico en Ingenieria', '1', '122725', '$2y$10$x890WSD/pDWoiemsiyVrZutmXm5h62ErQ.EaD.vNKEUJisWvT.H/6', '1999-04-24', 'Sosa Rascon, Lilia Veronica', '24858', 'HES', '2023-07-31'),
(6834, ' Sergio', 'Sotelo Fernandez', 'Loma Blanca', 'D', 'Lider de Control de Calidad', '1', '122799', '$2y$10$W.A/84rvSBfYXabRMQMotOaSJyhZMbV4LMaAP2HHnMPr1Zj6EIUtC', '1997-11-24', 'Maria De Los Angeles Jurado Ra', '71575', 'HUS', '2023-08-07'),
(6835, ' Luis Mario', 'Ovando Ovando', 'Paraje de San Isidro', 'D', 'Operador de Criticos', '2', '123306', '$2y$10$hemDztUZroKYYuGGZWBt/ecyHsgQs0GPlSU3.oVhLaxFA/f36MWYu', '1997-03-28', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2023-08-22'),
(6836, ' Omar Eduardo', 'Castro Solis', 'Villas de Alcala', 'D', 'Operador De Procesos', '2', '123308', '$2y$10$6WlA1QtnUJMMyFAWA5Q1K.sSq4FfljOZ/tDhQvJynlV2WgkV2bo6C', '1997-07-29', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2023-08-22'),
(6837, ' Eder Antonio', 'Valencia MuÃ±oz', 'Jardines de Roma II', 'D', 'Operador De Procesos', '1', '123339', '$2y$10$NLgu0NdPc61jm0qB2JSbYucBu1L2vF.xNg6UxSSYUtVJGF8kPBKYC', '2001-12-02', 'Saul Arellano Escobar', '97722', 'HUS', '2023-08-24'),
(6838, ' Fernando', 'Lara PeÃ±a', 'Las Haciendas', 'D', 'Operador De Procesos', '1', '123345', '$2y$10$7mpzBt9yRC4YDuwC50u1se8eIWYLBrRuCfJN1AfK40Sk.4Ha.7xyG', '1985-05-18', 'Saul Arellano Escobar', '97722', 'HUS', '2023-08-24'),
(6839, ' Abraham', 'Gonzalez Lechuga', 'Riveras del Bravo', 'D', 'Operador de Criticos', '1', '123346', '$2y$10$zd5qIpv.yFcDZ8UYOX4ny.AP4bA8CMSjuuEo69lMb7Xqw9AjkYmHa', '2003-05-13', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2023-08-24'),
(6840, ' Aldo Jair', 'Gracia Chontal', 'Manuel J Clouhthier', 'D', 'Operador de Criticos', '1', '123347', '$2y$10$Db0nHF4VzIEulLWRNWe9Xufk4xQT/Lt5RRJL/1Zg2g0Uu892NH2fe', '1997-12-28', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-08-24'),
(6841, ' Javier Uriel', 'Rodriguez Caballero', 'Cerradas de Alamo 2', 'D', 'Operador De Procesos', '1', '123348', '$2y$10$q9ekIIppU9MgoKDTK0aJ.OT8r0D0eNe69n3XMtOIAG77dP7ciyAnC', '1999-10-15', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-08-24'),
(6842, ' Marco Antonio', 'Rodriguez Leon', 'Riveras Etapa 9', 'D', 'Operador De Procesos', '1', '123350', '$2y$10$VhPqo1F8uL.Em5E/V/gszuFwo3BAkA3dQlhWXdcSJKX9VNTZqvemW', '1998-01-08', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2023-08-24'),
(6843, ' Aaron', 'Gonzalez Tetzoyotl', 'Riveras del Bravo 8', 'D', 'Operador De Procesos', '1', '123353', '$2y$10$RkEqK6nBkdPve1/PNj33Y.pH3tuIjAXRCtxRkb4O9zc5AwCF.va6G', '2004-09-15', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2023-08-24'),
(6844, ' Jesus', 'Vidal Sanchez', 'Urbivilla del Campo', 'D', 'Operador De Procesos', '1', '123354', '$2y$10$f97sxYXnHBKUFTwz42.qJ.Tmo54y7WWI8LQR81HlnAhcbAmioGgEy', '1999-07-06', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2023-08-24');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `colony`, `position`, `area`, `plant`, `username`, `password`, `birthdate`, `supervisor_name`, `supervisor_reloj_number`, `deparment`, `fecha_ingreso`) VALUES
(6845, ' Eduardo', 'Velazquez Eustaquio', 'Parajes del Sur', 'D', 'Operador de Criticos', '1', '123386', '$2y$10$w1Hy6tigopC3XJ3X/T4FtObN1apjIueyI9lvoq.o9I9qPeQUnbAkW', '2000-07-23', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-08-24'),
(6846, ' Veronica Yaneth', 'Hernandez Esquivel', 'Lomas de Valle', 'D', 'Operador De Procesos', '1', '123398', '$2y$10$BmzSTOpTgbu2wHWu3qHuHO3OIjiOg8/I0aDvm9XCBoIRQX3.h8OkW', '1997-07-15', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2023-08-25'),
(6847, ' Ibhar Julian', 'Ibarra Huizar', 'Calzada del Sol', 'A', 'Analista de Comunicacion', '1', '123409', '$2y$10$/eHwQ1.FXmvYV8bpHLSfmOVaHWZZAafFy2AdMUMu/LleUXuaTow3G', '1996-09-06', 'Israel Rodriguez Andrade', '77183', 'HUS', '2023-08-28'),
(6848, ' Leydi Diana', 'Pulido Nabor', 'Las Haciendas', 'D', 'Operador De Procesos', '1', '123453', '$2y$10$b/wmfcNbTYNipiZMsVAp4.A37EY/gK.jsyroqspW7ANPY/nGDsOxi', '1997-10-17', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2023-08-29'),
(6849, ' Ramiro', 'Dominguez Contreras', 'Cerrada de Oriente', 'D', 'Operador de Criticos', '1', '123459', '$2y$10$CfJqWPIzRjW3BiV6faQeh.9si/7vnkm5q19deDsYxrUV.gbFUgyH6', '1988-01-05', 'Saul Arellano Escobar', '97722', 'HUS', '2023-08-29'),
(6850, ' Jose Maria', 'Duarte Cruz', 'Cerradas de San Pedro', 'D', 'Operador De Procesos', '1', '123462', '$2y$10$MrWJudt5JbhnABL6h/17eOmrKef3PfB737cbMOPrKJOsCgmDgJ796', '2003-10-14', 'Velarde Inostroza Enrique', '71208', 'HUS', '2023-08-29'),
(6851, ' Zoraida', 'Vazquez Heredia', 'Jardines Roma II', 'D', 'Operador De Procesos', '1', '123548', '$2y$10$l04Dh1b4GctLd50.SjR4HOZHc95OQ4R314htLUwZlePaOVq2jW7SS', '1989-03-08', 'Abel Fernandez Delgado', '98716', 'HUS', '2023-09-04'),
(6852, ' Angel Ismael', 'Lopez Meza', 'La Perla', 'D', 'Operador De Procesos', '2', '123549', '$2y$10$Go7S2t.nQvx3NlAWE6Lzl.l.mRl4p2dQ12xayTjlv4wyU0MLhIRmS', '1998-01-28', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2023-09-04'),
(6853, ' Esmeralda', 'Alto Jacinto', 'Portal del Roble', 'D', 'Operador De Procesos', '2', '123551', '$2y$10$G/N/b0jcObveRLsDj.oUZ.D8VeX/oPzJnWa6DG9nDNN1U4Ipw/iLm', '1997-08-15', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2023-09-04'),
(6854, ' Oliva', 'Galan Aburto', 'Portal del Roble', 'D', 'Operador De Procesos', '1', '123552', '$2y$10$SEuOxZl5ruIQUoyQA1H8YexJh3zvUzIvhKJ8hCti5f0lSJYxtuvW6', '1970-08-04', 'Varona Hernandez, Braulio', '61651', 'HUS', NULL),
(6855, ' Aldo Jesus', 'Garcia Ramirez', 'Lomas del Valle', 'D', 'Operador De Procesos', '1', '123553', '$2y$10$ho69BeAsdUM.OUiprAzghu3iUz7pyXfvoEFZqbVRq7Tv8hWArz0pW', '2002-11-14', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2023-09-04'),
(6856, ' Raquel Alejandra', 'Montelongo Rivera', 'Salvarcar', 'D', 'Operador General', '1', '123563', '$2y$10$tjoc5OX/WIjOpZHLuG9CdO6/rqLPuGnJzX0..a.F.KvIyEm.4aCAe', '2000-07-04', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2023-09-05'),
(6857, ' Rebeca', 'Arias Solorzano', 'Uribivilla del Cedro', 'D', 'Operador De Procesos', '1', '123564', '$2y$10$Pz2WVSdJ7ZiGSL.wThUyee8siuG0.9NlrKH6Eo9nq1a4fXzMBFtUy', '1979-12-11', 'Arellano Mota, Arturo', '24791', 'HUS', '2023-09-05'),
(6858, ' Erick', 'Anaya Sierra', 'Urbi Villa Bonita', 'D', 'Operador General', '1', '123609', '$2y$10$edEHaut078SYF3BTMqY5Juj8XoWojejAO24mz7yj1ruQrDrh2Mulq', '1995-08-27', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2023-09-07'),
(6859, ' Eduardo', 'Rodriguez Peralta', 'Parajes del Valle', 'D', 'Operador De Procesos', '1', '123610', '$2y$10$wmuL4mBRV7v7vrChxCsekeA.Ss5/Co6aO0c3ygEx38t8.rJZOVsdi', '2003-07-24', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-09-07'),
(6860, ' Carlos Manuel', 'Camargo Ramos', 'Praderas del Sol', 'D', 'Operador General', '1', '123611', '$2y$10$uiH5q659RIf2XcCYnvTVeOC7/4yRf3.e7rB2.JClzNkZ8Mkm2T9IO', '2002-07-06', 'Sanchez Cordova, Rene', '41563', 'HES', '2023-09-07'),
(6861, ' Rafael', 'Graciano Landeros', 'Praderas de Henequen', 'D', 'Operador De Procesos', '1', '123612', '$2y$10$UlSieyr.B2KTtqgynO.X/e4Obs2N20FwMcmVeqyVGmIb34mSh.WWu', '2002-02-15', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-09-07'),
(6862, ' Jose Bernardo', 'Gutierrez Quezada', 'Paraje del Sur', 'D', 'Operador De Procesos', '1', '123615', '$2y$10$aeE2OKMxVpuBK7IbktUDjeaXDQnxFbtNvqojFAzCwO0cgaPHnO.HO', '1984-09-02', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-09-07'),
(6863, ' Miguel Angel', 'Garcia Martinez', 'Lomas Del Valle', 'D', 'Operador De Procesos', '2', '123617', '$2y$10$nyjEkfpjHHwKwN0/v.vI7.q2as3OfiWNyYBtuXKW.rAxmgv81KkLK', '1993-09-29', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2023-09-07'),
(6864, ' Jorge Ivan', 'Alfonsin Gonzalez', 'Carlos Castillo Peraza', 'D', 'Operador De Procesos', '1', '123621', '$2y$10$FMhFVpwpUnIR2bQV5N9jiO4bHsH8eXXtRys5EZCLs.SgxVjO4872S', '1994-10-17', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-09-07'),
(6865, ' Adolfo', 'Galindo Cruz', 'Paraje del Sur', 'D', 'Operador De Procesos', '2', '123622', '$2y$10$cPqN0uc56OHmlFFCgMv2wuhnOe5GBEUw4wlE.sEypHk/eypevSHzC', '1976-02-20', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2023-09-07'),
(6866, ' Kevin', 'Valeriano Bernardino', 'Praderas del Sol', 'D', 'Operador General', '1', '123623', '$2y$10$C0nfSBan7rrFQAzqYGlMm.yh4Y43vu1keyijOfl6U0c8Xh2qRULiG', '2001-03-14', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2023-09-07'),
(6867, ' Juan Carlos', 'Chipol Fonseca', 'Riveras del Bravo Etapa 4', 'D', 'Operador de Criticos', '1', '123642', '$2y$10$mOy2L/oqsXpmDnB91hgRL.LkBZl2ydINsTgXTMHrznkuPtxrGmMEq', '1995-11-27', 'Jesus Lopez Solis', '73653', 'HUS', '2023-09-11'),
(6868, ' Jazmin', 'Sifuentes Luna', 'Las Haciendas', 'D', 'Operador General', '1', '123670', '$2y$10$hh1K1OB6MdVHpsXHWJtB4OTiCDDvwLyO9lBNA3s0/MSdIwcmZJSV6', '2005-08-26', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2023-09-12'),
(6869, ' Omar', 'Estrada Leyva', 'Parajes del Sur', 'D', 'Operador De Procesos', '1', '123671', '$2y$10$YaKgMEmqaKgQucwo.4IU/.HTN5mxUyQiiUJuWG7hikO2k3OBEONnC', '1998-07-26', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2023-09-12'),
(6870, ' Manuel', 'Armendariz Villegas', 'Zaragoza', 'D', 'Operador De Procesos', '1', '123674', '$2y$10$8Sw2.qxISQ9idCGzy1AkV.1dSHotg6JN4v9yj212K0PcROLu/eXDq', '1978-05-20', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2023-09-12'),
(6871, ' Jose', 'Garcia Cobos', 'Cerradas del Sur', 'D', 'Operador De Procesos', '1', '123741', '$2y$10$HGubNBMyxZLqTZC2YpAO4uLln9ukZqPS4q7ydf22q81aYkFOP1ye6', '1998-08-10', 'Velarde Inostroza Enrique', '71208', 'HUS', '2023-09-18'),
(6872, ' Maria Guadalupe', 'Lopez Guillen', 'Villas de Alcala', 'D', 'Operador de Criticos', '1', '123742', '$2y$10$f72vUuJRRwegvXFmpPeQgu8Lnp.VcctNp87tGlzTMvU3xMNSdU7rG', '2005-03-24', 'Daniel De Jesus Favela Najera', '73913', 'HUS', '2023-09-18'),
(6873, ' Francisco', 'Corro PestaÃ±a', 'Riveras del Bravo', 'D', 'Operador General', '1', '123772', '$2y$10$tNVFHYs.xW/ZOxizjZFI3ull0Ga16sZg805pgpzXHOPltxilqEKL2', '2005-05-02', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2023-09-19'),
(6874, ' Evelyn', 'Ruiz Aguirre', 'El Sauzal', 'D', 'Operador General', '1', '123775', '$2y$10$RD6TmiWFPb13BFShgdHD2e/jp5dUgxgLbl0FMFqaU4IPBXfMenv32', '2005-07-26', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2023-09-19'),
(6875, ' Alexa Paola', 'Poxtan Salazar', 'Praderas del Sol', 'D', 'Tecnico de Calidad', '2', '123778', '$2y$10$w8K.T3D7r2FOPDMa.BILO.6/rA2ixjiBh4xZ3VKT8L926CiBFiNOe', '2002-11-08', 'Mario Chacon', '72893', 'HUS II', '2023-09-19'),
(6876, ' Elizabeth', 'Juarez Cuevas', 'Info Amp Aeropuerto', 'D', 'Operador General', '1', '123779', '$2y$10$rVpIHWt8SV/FMun06XZsX.JCYNWv7Tfwm6SXKu/6TKehGmUG.pMLi', '1987-05-22', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2023-09-19'),
(6877, ' Manuel Adrian', 'Bustillos Rodriguez', 'Praderas del Sol', 'D', 'Operador De Procesos', '1', '123807', '$2y$10$NlUB3zH0FmE7pLZpXiyahOXbiqugm4h50ixQFbCA/SzfgaBRpRV5W', '2004-10-18', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2023-09-21'),
(6878, ' Oscar Antonio', 'Dominguez Arce', 'Las Haciendas', 'D', 'Operador General', '1', '123816', '$2y$10$02I2.cbaOGt2A.zj0CuDKul4pJHz/V18oRcSGWVB7kB7gryAEaDHu', '1984-06-13', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2023-09-21'),
(6879, ' Joana Monserrat', 'Santos Ramirez', 'Riveras del Bravo', 'D', 'Operador De Procesos', '1', '123820', '$2y$10$c/RFqpxBWNJnCr.3u0e4ledML2NGjlFdO/3yFCYDwlWCLf0Cdux1a', '2005-01-03', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2023-09-21'),
(6880, ' Martin', 'Hilario Moreno', 'Riberas el Bravo', 'D', 'Operador General', '1', '123821', '$2y$10$jJi.lc4q6WaeDbV4EQmAc.ESkn1B0iLWfGqxI5JVWDuyjjSqFCa2q', '1984-08-25', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2023-09-21'),
(6881, ' Yaneth Guadalupe', 'Garcia Favela', 'Hermila', 'D', 'Operador General', '1', '123822', '$2y$10$HrvM17XPD76RyjDHN9vZlOo2kyZ0mmrTCGSeHb64m3rLCOQAQzfjO', '2001-04-11', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2023-09-21'),
(6882, ' Gabriel', 'Guerrero Del Carmen', 'Paraje del Sur', 'D', 'Operador De Procesos', '1', '123827', '$2y$10$JskJsdlri6fuWich5beSGum7Qs9SoCGxOwoJbxqoP5a4fZfsfB54i', '2000-09-28', 'Saul Arellano Escobar', '97722', 'HUS', '2023-09-21'),
(6883, ' Isidoro', 'Pantoja Antonio', 'Cerradas Del Parque', 'D', 'Operador de Criticos', '1', '123891', '$2y$10$ZbdZ2dDzAZ5pAn9RvQNvae8HZy9Y6I364IsK8YAX.7HJWyPJ6bvGm', '1989-04-04', 'Saul Arellano Escobar', '97722', 'HUS', NULL),
(6884, ' Misael', 'Septimo Martinez', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '123892', '$2y$10$vSnHlSOKhfaSXQtJexx/qOrBpnJLgqSig9b8A4HmKuqHAgPHPhbfu', '1986-08-12', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2023-09-26'),
(6885, ' Fernando Gabriel', 'Casillas NuÃ±ez', 'Cerradas Del Sur', 'D', 'Operador De Procesos', '1', '123894', '$2y$10$GAPhgOU54Oq6z7BXOHMNdedknFsqddiRz8wZO534AWYnfQT1phn12', '2003-08-09', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2023-09-26'),
(6886, ' Crystian Yareth', 'Basto Arias', 'Urbivilla del Cedro', 'D', 'Operador General', '1', '123944', '$2y$10$EFBcrQr6Aw/IRGOolYHqtO8Y2GJDZCtGnDG2Kl6DZoIUrZtgSSPM2', '1999-05-06', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2023-09-28'),
(6887, ' Alejandra', 'Espinoza Alvizo', 'Praderas Del Sol', 'D', 'Operador De Procesos', '1', '123946', '$2y$10$.V./VMAlX6RnfV8QwIIRL.wSoAilvPfFqZyNilW3DgXZ7l0uySc6.', '1987-01-25', 'Vania Garcia', '100540', 'HUS', '2023-09-28'),
(6888, ' Marcelo Chayane', 'Lopez Dominguez', 'Paraje del Sur', 'D', 'Operador De Procesos', '1', '123947', '$2y$10$nAfK8FASmpoQJyJqSpaFsOgxrE1rTb7UsMZsDRWSFrhsL.oXz5tMy', '2005-01-15', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2023-09-28'),
(6889, ' Carolina Isabel', 'Morales Vasquez', 'Cerradas del Alamo II', 'D', 'Operador General', '1', '123950', '$2y$10$YsEU.b54v7R3y04HeNH40.XAGpqdcE6btKgJPlAzeJHbzwxXuahgi', '1996-09-24', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2023-09-28'),
(6890, ' Nestor David', 'Reyes Rodriguez', 'Los Arenales', 'D', 'Almacenista', '1', '123951', '$2y$10$9J8WWQ9hwYbSjT6JjMfbY.7M/CEv6xxOFjhua2tWWDZaDmPDblTve', '1991-07-16', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2023-09-28'),
(6891, ' Marcos', 'Santos Marin', 'Paquime', 'D', 'Almacenista', '1', '123966', '$2y$10$4NAHoTxkKVIcXVElqnRi1OgqKE4HjFjXSJhuk0fvuvlKzXw4BQru.', '1982-10-07', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2023-09-28'),
(6892, ' Daniel', 'Chavez San Agustin', 'Riveras del Bravo', 'D', 'Operador de Criticos', '1', '124033', '$2y$10$bMk2MHiZObga30klRy0qBO9WwugIolmnW2z.lkp17WIIsoa11gfjW', '1988-05-17', 'Jesus Lopez Solis', '73653', 'HUS', '2023-10-03'),
(6893, ' Yusalet', 'Helo Martinez', 'El papalote', 'D', 'Tecnico de ingeneria', '1', '124067', '$2y$10$iVP0WvPvo/o69oNTb3eJY.JiqrTu0L7S2SuvuYEbsUJXUQbgGY2Pa', '2001-07-15', 'Raymundo Fernandez Delgado', '71226', 'HUS', '2023-10-05'),
(6894, ' Tito', 'Martinez Morales', 'Riber', 'D', 'Operador de Criticos', '2', '124068', '$2y$10$aG7eOnf3Jbo.d/d8RVfELuJuxf5Y9ymm93JOj5g5Mfxap.J8PxhLi', '1997-12-27', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2023-10-05'),
(6895, ' Jesus', 'Madriz Sambrano', 'Parajes de San Juan', 'D', 'Operador de Criticos', '1', '124073', '$2y$10$yu5d5Q4B455qdOwMRjsVBeHg2OuJjY/5Swt5tum8MjBQAzHTOARIG', '2001-10-26', 'Jesus Lopez Solis', '73653', 'HUS', '2023-10-05'),
(6896, ' Wilber', 'Merlo Reyes', 'Villas De Alcala', 'D', 'Operador De Procesos', '1', '124074', '$2y$10$Di3bJODFeTeA1Vx1J1B5f.uGB5nCnQeHkHtIubhpimF8Kucs1xkdK', '2005-08-16', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2023-10-05'),
(6897, ' Juan', 'Sarmiento Castillo', 'Urbivilla Del Cedro', 'D', 'Operador de Criticos', '2', '124081', '$2y$10$t.KmGnQEBKjiq56tcf0QO.CyHOfqQFOKk1MOq5LxSGNvFyQOue/Ki', '2000-10-30', 'Garcia Gaucin, Erik', '28228', 'HUS II', '2023-10-05'),
(6898, ' Ricardo', 'Calvillo Garcia', 'Parajes de San Isidro', 'D', 'Operador General', '1', '124151', '$2y$10$BE5Tirl5abJhWzXm1j2w.uQ/SMatQ2HDNG09iLeBX/vjOKnJwS/vS', '1997-09-14', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2023-10-10'),
(6899, ' Ignacio', 'Murillo Castro', 'Villas de alcala', 'D', 'Operador General', '1', '124156', '$2y$10$/WH6G/97lt248wJ6H.5HH.uUqJdFOSvQ9EFcL8T/JHKb3YCnwqFMC', '1977-02-01', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2023-10-10'),
(6900, ' Lizbeth', 'Lopez Morales', 'Praderas Del Sur', 'D', 'Operador General', '1', '124157', '$2y$10$8nfN43TpIlijuIBV2ApeKOSqxogLccjqljjwW5mWbjBqpcuJcr6kC', '1998-11-07', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2023-10-10'),
(6901, ' Karen Guadalupe', 'Chable Gonzalez', 'Cerradas del Parque', 'D', 'Operador General', '1', '124160', '$2y$10$4pZvJIUyS3pPfySmSeKXT.Uv4IVRL6bChc0FcLda3T4Z/H9BnSth.', '1998-11-17', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2023-10-10'),
(6902, ' Jose Manuel', 'Villa Arreola', 'El papalote', 'D', 'Operador General', '1', '124161', '$2y$10$TbNid1S16n6PErcHeKcP4.Ic0lGlH87Ztndw2Xw42XTWGvwdi9/zO', '2000-10-09', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2023-10-10'),
(6903, ' Victor Manuel', 'Valdivia Serena', 'Las haciendas', 'D', 'Operador De Procesos', '1', '124163', '$2y$10$jFptyos6Uvtg216DF2HmjOLuwpLMWpIt.dU/4K/jHiWRlSR8Ia3CK', '1998-04-01', 'Velarde Inostroza Enrique', '71208', 'HUS', '2023-10-10'),
(6904, ' Alejandro', 'Salazar Salome', 'Paraje de Oriente', 'D', 'Almacenista', '1', '124164', '$2y$10$DLwENWk2U.ifOExJ/sBSLO77j5EN4saoSBSFBCv7S0ZPxHLqouFcK', '2003-04-16', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2023-10-10'),
(6905, ' Gerardo De Jesus', 'Lopez Garcia', 'Urbilla Bonita', 'D', 'Operador de Criticos', '2', '124166', '$2y$10$CmRc5dX/SqUrTc5pyQggI./JUwpowdeXv/B7UwFOC0SNzMohEQ0tK', '1997-02-25', 'Revolorio Ponce, Paulino', '26485', 'HUS II', '2023-10-10'),
(6906, ' Jose De Jesus', 'Alvarado Morales', 'Riveras Del Bravo VII', 'D', 'Operador de Criticos', '1', '124183', '$2y$10$VLiPgtGNvL8tF6Wwm/qwNeYin9wMyEgW2HonLjF8y9AYxjjIY6jPC', '2000-03-18', 'Jorge Luis Rios Ramirez', '71668', 'HUS', NULL),
(6907, ' Enrique', 'Salvador Ezequiel', 'Valle Fundadores', 'D', 'Operador De Procesos', '1', '124187', '$2y$10$hr8VSaUv5jDJBnAouZiZluZIIApj0qHz.i9MVKIoAKrQFuwA7/Ycq', '1998-11-26', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-10-12'),
(6908, ' Lazaro Vicente', 'Vera De los Santos', 'Hacienda Universidad Torr', 'D', 'Operador De Procesos', '1', '124192', '$2y$10$hKRYYdhuNnxfgkMTXzCp5u3oShPTF3OAkfNpSOMZwUXMf6S7bTz7O', '2005-04-05', 'Velarde Inostroza Enrique', '71208', 'HUS', '2023-10-12'),
(6909, ' Luis Miguel', 'Orona Torres', 'Parajes de San Isidro', 'D', 'Operador De Procesos', '1', '124194', '$2y$10$pVo4sFf4MssJupzy2sD.tu3IXwdAqH7Ea2KG4BLLIEq58T1plPCN.', '1992-01-07', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2023-10-12'),
(6910, ' Jesus Antonio', 'Rodriguez Herrera', 'Valle de santiago', 'D', 'Operador de Criticos', '1', '124302', '$2y$10$xL7tomOqSnk3ykNwaV/f.ebCSKcwcAF3velGB2R92HkL8eOX4kpM.', '1997-06-13', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-10-16'),
(6911, ' Ausencio', 'Sanchez Ramirez', 'Hacienda de las Torres Un', 'D', 'Operador de Criticos', '1', '124305', '$2y$10$di4XPC2Cmv5ss15SwhnQ9uv3q9fuE7e8DBphWHaz54N1ocLRfXgbG', '1993-11-15', 'Saul Arellano Escobar', '97722', 'HUS', '2023-10-16'),
(6912, ' Tomas', 'Martinez Morales', 'Paraje de San Jose', 'D', 'Operador de Criticos', '1', '124311', '$2y$10$phqSv./EJNTThvyla9CwZe4AvRvEruWYNfMzk9ebkNdFhzYompcc6', '2005-09-22', 'Jesus Lopez Solis', '73653', 'HUS', NULL),
(6913, ' Francisco', 'Cecilio Salvador', 'Paraje del Oriente', 'D', 'Operador de Criticos', '1', '124320', '$2y$10$MxWtNs5tx4sOMi90V3WmeudbNZRHPrbQKw5.wmNHRIroMwH/qzCai', '1986-12-03', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', NULL),
(6914, ' Jose Francisco', 'Torres Ramos', 'Riberas del Bravo', 'D', 'Operador General', '1', '124336', '$2y$10$0TTECk2rQpgdhHHlzBhYz.2SufcZs1WKyY/VRUumqJRHopsZ7/Pmi', '1979-06-13', 'Briseida Bautista Tolentino', '300011', 'HUS', '2023-10-17'),
(6915, ' Lazaro', 'Aburto Perez', 'Ribera del Bravo', 'D', 'Operador General', '1', '124337', '$2y$10$LlwpScrS85ndDE6uJPw1uu05uEzFlfTdxDPbPf2bMuMcYBMkfGNR6', '1991-02-03', 'Briseida Bautista Tolentino', '300011', 'HUS', '2023-10-17'),
(6916, ' Cesar', 'Garcia Gachupin', 'Urbivilla del cedro', 'D', 'Operador De Procesos', '1', '124436', '$2y$10$99se1exXYV4C6mza6tdLC.0iO45seqEjrL.RFHgmsClYKcguD1NpO', '2004-04-30', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2023-10-26'),
(6917, ' Ivan', 'Hernandez Gil', 'Paraje del Sur', 'D', 'Operador General', '1', '124437', '$2y$10$d48krbMf/NFU0YvFh8V79.82BXkVFJXoHujeKpiwoj.y38uF5cgbu', '1990-09-19', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2023-10-26'),
(6918, ' Edwin Ariel', 'Acosta Hernandez', 'Parque Zaragoza', 'D', 'Operador General', '1', '124438', '$2y$10$yqrcoXzQozxeH70rU.1qcuKlHhhw4dzB43VEduOXhcOwNeMLtf7oC', '1998-09-08', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2023-10-26'),
(6919, ' Juliana', 'Gachupin Eduardo', 'Finca Bonita', 'D', 'Operador General', '1', '124440', '$2y$10$DAWk6vomKlExoJmkQL5xOeNZgPdmx.k79UsNZKzcuGovWEUPsVDLW', '2000-05-20', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2023-10-26'),
(6920, ' Kevin', 'Mota Limon', 'Urbi Vila del Campo', 'D', 'Operador de Criticos', '1', '124441', '$2y$10$jHG5TyuKy4zpsYB50ModKuoIJT0KjbO3Od/zgVG1bWUeBcwIf2j1i', '1997-02-28', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2023-10-26'),
(6921, ' Felix', 'YaÃ±ez Valencia', 'Riveras del Bravo', 'D', 'Operador General', '1', '124445', '$2y$10$Oqlb.7wMFrNA.ZTfiorbluKObMGoii.Xeez7x7ckjELD7t6ocBneG', '1976-06-19', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2023-10-26'),
(6922, ' Rosela Patricia', 'Zavala Rivera', 'Heroes De La Rev', 'D', 'Operador General', '1', '124446', '$2y$10$pZlPdT8Qy18hFw.ZATWgYuKADQZ/M0CJm34oKUrGARPK71VlaW7Yi', '2005-10-15', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2023-10-26'),
(6923, ' Angel Arturo', 'Tentle Fuentes', 'Cerradas de Oriente', 'D', 'Operador De Procesos', '1', '124490', '$2y$10$bMqLNunY2aOswf31j4H4c.Buw3InYQTQ04j10hwUJSvrD0ARrUNKG', '2003-05-15', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-10-31'),
(6924, ' Angel Roberto', 'Padilla Vazquez', 'Hacienda de la Torres', 'D', 'Tecnico Electromecanico', '1', '124509', '$2y$10$OHHDZq4NGisZ7cIXxDRt1.4kvZ9.4WlzuysI5GIYB0aZ7rweOrwXW', '1999-12-18', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2023-11-02'),
(6925, ' Alina Margarita', 'Uscanga Mendoza', 'Urbilla del cedro', 'D', 'Operador General', '1', '124510', '$2y$10$h6VvDXUGqJgB0nDHZXzzsO5ISN0rywuQU/5cdtLs2VZA6w1TangCC', '1988-09-26', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2023-11-02'),
(6926, ' German', 'Lopez Perez', 'Aguilas de Zaragoza', 'D', 'Operador De Procesos', '1', '124511', '$2y$10$0crCWIXWb3fkAMxwt3H8UegX5/pCjAsAVPOpSlvzS2mquRiFlahSK', '1971-07-31', 'Saul Arellano Escobar', '97722', 'HUS', '2023-11-02'),
(6927, ' Ismael', 'Marcial Garcia', 'La Enramada', 'D', 'Operador De Procesos', '2', '124514', '$2y$10$QF5F3kB4wKsNsHLKsKUfkOwNJIThloopmn5DWs9iXrZEJ.Tdbn/6K', '1995-06-17', 'Javier MartÃ­nez Acosta', '61908', 'HUS II', '2023-11-02'),
(6928, ' Rodrigo', 'Salazar Solis', 'Praderas De Los Alamos', 'D', 'Operador General', '1', '124541', '$2y$10$Wn67/j1qJDiJ03WZG0xeK.KgncmfVElljP2UVWcaTmiuR8YK5yBZa', '1996-02-29', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2023-11-06'),
(6929, ' Alan', 'Hernandez Rodriguez', 'Bosques de Salvarcar', 'D', 'Operador General', '1', '124542', '$2y$10$v97q/7uhI3XXf3gphjpWYeVdMLoAfZk49JEXGA/i/dr3aSwgT.JYO', '1994-09-12', 'Lopez Vazquez, Romulo', '61770', 'HUS', NULL),
(6930, ' Victor Alfonso', 'Esteban Anastacio', 'Portal del Roble', 'D', 'Operador General', '1', '124543', '$2y$10$FXAXYZ4f0A5YEQOt41qnwu/fx/2Ki9wrPDwwh8R9ReT8t1NhJtvOW', '1993-03-18', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2023-11-06'),
(6931, ' Jesus Enrique', 'Olivas Salazar', 'Los Alcaldes', 'D', 'Operador General', '1', '124545', '$2y$10$vbHNkPcLAKTofWEaTdz5n.t.vuF9tEbmajOK5nErPuX1TVL.Bthq6', '2002-02-07', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2023-11-06'),
(6932, ' Kevin Uriel', 'Chavez Ibarra', 'Oriente las Gladiolas', 'D', 'Operador De Procesos', '2', '124558', '$2y$10$SpzH0DXng2k7lPdOu6CtY.frvy1tCrwYzYZeqnBwobDE7Ac0NX.7m', '2005-08-08', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2023-11-07'),
(6933, ' Irma', 'Moreno Veloz', 'Praderas del Sur', 'D', 'Operador General', '1', '124559', '$2y$10$mRm.gnPvcA/f7WkVvN1jm.vOPN7AW1I7778OXUouRS6KMFlC.O08a', '1974-05-07', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2023-11-07'),
(6934, ' Angel Alberto', 'Magdaleno Lara', 'Bosques De Salvarcar', 'D', 'Operador General', '1', '124560', '$2y$10$1UCGy1MtC8K96cFCzBXd8.zhpc4YrNd//MTvIQLknL.f9r1WypJ9m', '2000-05-23', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2023-11-07'),
(6935, ' Vanesa Monserrat', 'Suarez Hidario', 'Tierra Nueva', 'D', 'Operador De Procesos', '2', '124561', '$2y$10$vTk5ncdGVqO7gppjLzwZ4Ol1gB3kFGp3E.xv6sWUZP4E9rjKIAdpK', '2000-08-05', 'Javier MartÃ­nez Acosta', '61908', 'HUS II', '2023-11-07'),
(6936, ' Ana Luisa', 'Barradas Sanchez', 'Paraje de Oriente', 'D', 'Operador General', '1', '124583', '$2y$10$0Qhff.8LPdF6FVCRsGLdCuU2GWMoxmZi.REVBYDxx56RMnATP1cDm', '1984-10-28', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2023-11-09'),
(6937, ' Alan', 'Alfonso Flores', 'Villas de Alcala', 'D', 'Operador General', '1', '124584', '$2y$10$wQZHytcdoKtMnDpQHkLskOIG64fWPXBJ5k2DnTZ.Gg2yCsRwQ0Iy6', '1998-08-19', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2023-11-09'),
(6938, ' Sofia Gabriela', 'Gachupin Orozco', 'Infonavit Casas Grandes', 'D', 'Lider de Control de Calidad', '1', '124585', '$2y$10$BDYOz1gQcxIfiFodar0yq.pEBHmC8BbsIz9/5hj/5ZeYtFwj/bMia', '1996-09-13', 'Abril Azeneth Ibarra Franco', '68171', 'HUS', '2023-11-09'),
(6939, ' Jesus Guadalupe', 'Mesta Hernandez', 'Paraje de San Isidro', 'D', 'Tec Esp en Mtto Equipo', '1', '124587', '$2y$10$oY84f/zM03YIMkyL8kn8seVTwP4VrqggRDReMUWv8cjZksUer6frK', '1988-01-27', 'Mauro Sanchez', '61715', 'HUS', '2023-11-09'),
(6940, ' Agustin', 'Ramirez Hernandez', 'Cerrada de Oriente', 'D', 'Operador De Procesos', '1', '124588', '$2y$10$6HbGK5Bbmw7Bd3k42e4SXefitssf.tlhK0g/oxjA41SLatbh4gPNa', '1980-06-24', 'Saul Arellano Escobar', '97722', 'HUS', NULL),
(6941, ' Emilio', 'Villegas Rodriguez', 'Arecas', 'D', 'Operador General', '1', '124589', '$2y$10$tzSWozddZKd1/kF3XzFUPOIiKGlbNQ4GaKBvR4k4WIHjnDQJzsRKS', '2005-09-22', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2023-11-09'),
(6942, ' Elizabeth', 'Martinez Rosario', 'Mezquital', 'D', 'Operador De Procesos', '1', '124591', '$2y$10$TQTTCkOyfaqJ34wCFgAQLuj/RyqEMjIx.nFuVFU6ddQsXDzZJQY.u', '1996-04-23', 'Saul Arellano Escobar', '97722', 'HUS', NULL),
(6943, ' Mario', 'Camino Montan', 'Mezquital', 'D', 'Tec Esp en Troqueles', '1', '124594', '$2y$10$RacBl6xCp2mBd9vWcSvKRuqScksePsonV16L6aW.M9rA9QgHYYZru', '1981-02-13', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2023-11-09'),
(6944, ' Francisco Javier', 'Rito Hernandez', 'Horizonte del Sur', 'D', 'Operador General', '1', '124629', '$2y$10$ebBAfSs2ob8R94jjieFRV.WTnnkM5X78Hpy2P/oQTMgO6QCzxlbpy', '2002-02-08', 'Jose Jesus Meza Jimenez', '70699', 'HUS', NULL),
(6945, ' Manuela Berenice', 'Morales Sanchez', 'Lomas del Valle', 'D', 'Operador De Procesos', '2', '124630', '$2y$10$20LR.2blSTjD2OL3j79nY.0xKYwnKXh5v3K0TycvZhjxXJy8hc36O', '1996-04-23', 'Cecilia Adame Camacho', '97655', 'HUS II', '2023-11-13'),
(6946, ' Ana Luisa', 'Macario Seba', 'Riberas del Bravo', 'D', 'Operador De Procesos', '1', '124644', '$2y$10$.VR/jAYIKMHwJoGWFlnQCecBMf8pHF.oV2IUgsFb5SbbmPf7TtMWu', '1988-12-04', 'Velarde Inostroza Enrique', '71208', 'HUS', '2023-11-14'),
(6947, ' Nancy', 'Perez Castillo', 'Privadas Florencia', 'D', 'Operador de Criticos', '1', '124645', '$2y$10$hpPQ4UcUYVPLxLYOhYrRaeAI5Kewqkq4i0yfPGoIezd6tdW2Ha1qG', '1989-07-05', 'Jesus Lopez Solis', '73653', 'HUS', '2023-11-14'),
(6948, ' Enrique', 'Perez Velasco', 'Heroes De Mexico', 'D', 'Tec. Esp. en Mtto Equipo', '1', '124646', '$2y$10$7aAjF.ewEcswzmdxCemqf.1TIdIM9rfb7RinJ.zSMFKCyLM..LEfy', '1989-01-02', 'Mauro Sanchez', '61715', 'HUS', '2023-11-14'),
(6949, ' Marisela Alejandra', 'Martinez Alvarez', 'Urbi Villa del Campo', 'D', 'Operador General', '1', '124648', '$2y$10$T.H38b/ACIugidMgIbEgGOZt8AXcGvMbGt.FISdS1bXmHO8rguWWK', '1990-01-05', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2023-11-14'),
(6950, ' Rosalia', 'Ortiz Andres', 'Cerradas del Sur', 'D', 'Operador General', '1', '124651', '$2y$10$.91fgqg1YEbaO7HoBk1KUeL3Mx6NAkMvwsmJU/uW.cMFUpKEQEJHy', '2000-01-29', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2023-11-14'),
(6951, ' Alexis Enrique', 'Gutierrez Lopez', 'Villa Bonita', 'D', 'Operador De Procesos', '1', '124668', '$2y$10$/0JkpdUwjYoZkgF307dCu.p/TlzMMJr5YP1/5qdG3W535Vl0l/Grq', '1995-02-24', 'Velarde Inostroza Enrique', '71208', 'HUS', '2023-11-16'),
(6952, ' Mary Catalina', 'Lozano Martinez', 'Paraje del Sur', 'D', 'Operador General', '1', '124672', '$2y$10$IjwIysko4hD6kL4f6rIxo.Vm/t2RRq38URXJOvbnVeFdK1I1BkmoS', '2003-02-05', 'Fabiola Ramon', '84289', 'HUS', '2023-11-16'),
(6953, ' Mayra Carmela', 'Martinez Porras', 'Paraje De San Isidro', 'D', 'Operador De Procesos', '1', '124673', '$2y$10$1NW3lFeWQzJJptYMegN0EO0WAAw1jSmWs7Bzf5MpRafj.n5aPqZQS', '1993-08-20', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2023-11-16'),
(6954, ' Citlali', 'Perez Barahona', 'Paraje de San Isidro', 'D', 'Operador General', '1', '124703', '$2y$10$WcunsaD3PleXfK3mJ1m3PObZJMvjFGxKIMlVOQGqabNokrK1NBFPW', '1996-10-21', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2023-11-21'),
(6955, ' Heriberto', 'Vasquez Lopez', 'Manuel Valdez', 'D', 'Operador De Procesos', '1', '124727', '$2y$10$DysQCxz/gNSL1358u9DFg.a.dpC4IrPN.bpCAOBqwsk0jg7ObU99u', '1993-11-29', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2023-11-23'),
(6956, ' Librado Alfonso', 'Ramirez Contreras', 'Paraje de San Isidro', 'D', 'Operador De Procesos', '1', '124733', '$2y$10$AAUkVxzdBavrf3.BgkH7UejXH2FNStfi7VhQ.yqRiTQPPrqY1VW5i', '1993-10-02', 'Velarde Inostroza Enrique', '71208', 'HUS', '2023-11-23'),
(6957, ' Sarai', 'Orozco Gonzalez ', 'Paraje de San Isidro', 'D', 'Operador General', '1', '124750', '$2y$10$3nYl0Aqyp.DFYrU769HMDe0NefVWnRAoEGwSLa25v5F2gE0RnpHRu', '1997-11-04', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2023-11-27'),
(6958, ' Anel Yudit', 'Vela Rios', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '124752', '$2y$10$cEOjnxkgtMPMl0ZqDUJrcektJoCe4IMlllbg8w8IdXSj2l.7.xOCK', '1997-07-12', 'Saul Arellano Escobar', '97722', 'HUS', '2023-11-27'),
(6959, ' Diana Ivone', 'Cuevas Flores', 'Paraje de Oriente', 'D', 'Operador De Procesos', '2', '124753', '$2y$10$iwEKZNr2uPLqiWaKkKbK8OifTlD9ZD/J/fpz1ibT51WV9k0e6KeSG', '1993-04-09', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2023-11-27'),
(6960, ' Alex Fernanda', 'Najera Gurrola', 'Paraje de San Jose', 'D', 'Operador De Procesos', '1', '124754', '$2y$10$8PNlruM7DZ/vTmPs32hcm..ETZBoVuu6UMRND5zTqVw9s5INlcGmq', '2001-06-04', 'Velarde Inostroza Enrique', '71208', 'HUS', NULL),
(6961, ' Juan Antonio', 'Martinez Favela', 'Villa Bonita', 'D', 'Operador De Procesos', '1', '124760', '$2y$10$VzMqqL8rGmz4.DejtFJ6.uLpqRh2s01YCtQyFdJdgNLry6M8ou1xS', '1999-10-27', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2023-11-28'),
(6962, ' Eusebio', 'Murguia Sebastian', 'Senderos del Sol', 'D', 'Operador De Procesos', '2', '124761', '$2y$10$EUDOR4VzLeogENHmkJ0kBeg.C57cKgbgRSQmNOddVWeeqADGM5uIy', '2003-01-09', 'Erik Rey Mata Texna', '61890', 'HUS II', '2023-11-28'),
(6963, ' Carlos Evaristo', 'Vera Osorio', 'Paraje de San Isidro', 'D', 'Operador De Procesos', '1', '124762', '$2y$10$Ydp.zXg7ovVUHeQWiXkhPuLX6fouzlXmkpsYsnXjihzqyLm5KWT8u', '1979-10-26', 'Saul Arellano Escobar', '97722', 'HUS', '2023-11-28'),
(6964, ' Yazmin', 'Perez Jose', 'Jardines de Roma', 'D', 'Operador De Procesos', '1', '124770', '$2y$10$nWd1OkjTIpRzAg8vbdaoG.6VxxVymBA4gzcJGkQP1q51pURZZTafq', '1984-12-07', 'Saul Arellano Escobar', '97722', 'HUS', '2023-11-28'),
(6965, ' Edwin', 'Miss Hernandez', 'Cerradas San Pedro', 'D', 'Operador De Procesos', '1', '124772', '$2y$10$HCKaf1PUAopissFnnOAV2.vJN80pD9tjk9j.vhXxOF0nGtdrSKrZS', '1986-08-02', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-11-28'),
(6966, ' Juan Antonio', 'Estrada Noris', 'Urbivilla Del Cedro', 'D', 'Operador De Procesos', '1', '124782', '$2y$10$SMTTEI3wFALDRDS/PKROzuE4Sc.lMQnBwqu/8XtODjp02CfQ.tVfm', '1998-11-28', 'Saul Arellano Escobar', '97722', 'HUS', '2023-11-30'),
(6967, ' Maria Isabel', 'Gamboa Castro', 'Rincones de Salvarcar', 'D', 'Operador de Criticos', '2', '124783', '$2y$10$jkLrVHZvwOMa0eZaEDUGGugC2sJwC4zqrxeg/LdzZ0EH0ozNI.Qeu', '1988-01-23', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2023-11-30'),
(6968, ' Pedro', 'Cassio MuÃ±oz', 'Terranova Sur', 'D', 'Operador De Procesos', '1', '124787', '$2y$10$SV/2UOxEMa2W3hN07RJ69ekxTUB9icFeUkDim7CoBcRvALClmHgV.', '1984-01-26', 'Saul Arellano Escobar', '97722', 'HUS', NULL),
(6969, ' Leticia', 'Martinez Jimenez', 'Parajes del sur', 'D', 'Operador De Procesos', '1', '124790', '$2y$10$M60y7KHot3g6lyYsQ2zFnuQq1ijPIfQzB.kJcl0auTg7Ubj5Hjvae', '1987-03-10', 'Saul Arellano Escobar', '97722', 'HUS', '2023-11-30'),
(6970, ' Maria Del Carmen', 'Ramirez Montero', 'Riveras del Bravo', 'D', 'Operador De Procesos', '1', '124791', '$2y$10$4Nf5gfxjIIhf5twjURXhe..c49U2nfgNFTCM7R1NKDohyi4jxUggW', '1994-09-07', 'Saul Arellano Escobar', '97722', 'HUS', '2023-11-30'),
(6971, ' Daniela Areli', 'Rodriguez Alarcon', 'Paraje del sur', 'D', 'Operador General', '1', '124850', '$2y$10$7B4NICstDQ232DyG.mIV1ODPDtkDZwlnQGGHPmo3p2M5huVXdAymm', '2001-06-09', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2023-12-05'),
(6972, ' Alma Delia', 'Cordova Villanueva', 'Paraje del Sur', 'D', 'Operador General', '1', '124851', '$2y$10$xFWMYW0f.G9XhdXSn7mrjuTpmwKHwu3Hu1YOyfBb2c2S1QGihNepi', '1974-05-07', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2023-12-05'),
(6973, ' Maria Luisa', 'Ventura Alto', 'Parajes del Sur', 'D', 'Operador General', '1', '124852', '$2y$10$bbk2BuJpo29PFw.rV1WzLOBl7WzvhN0YUQyWvMV1C5LWgC.WuYOz.', '1993-05-28', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2023-12-05'),
(6974, ' Dolores Guadalupe', 'Jimenez Isidoro', 'Paraje del sur', 'D', 'Operador De Procesos', '1', '124854', '$2y$10$TyXNR8.l1Xw9fksTiemWRuydLcp1KH9V5.3khReJT1d9TCE.dRGei', '1995-08-29', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-12-05'),
(6975, ' Angel Abelino', 'Morales Manchame', 'Riveras del bravo', 'D', 'Operador De Procesos', '1', '124856', '$2y$10$jKJ438xTBmXqMI4XpQgi/OeBsqvp1t1nAHn9XqrmJCFMCC33rgzHu', '2001-11-01', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2023-12-05'),
(6976, ' Juana', 'Agustin Gonzalez', 'Paraje De San Isidro', 'D', 'Operador de Criticos', '2', '124858', '$2y$10$4wkswcm1hCFeugx/p39IZ.wajbVt07FnxqouVA69uOz4XMmGVOA4u', '1992-07-21', 'Pablo Alberto Olivas Vargas', '98097', 'HUS II', '2023-12-05'),
(6977, ' Dulce Raquel', 'Velazquez Sanchez', 'Paraje de San Isidro', 'D', 'Operador General', '1', '124870', '$2y$10$urfWyVDXTQIAlIkZWmTnL.bfqNkIihkPLB0OZXe2TPrKSLQpc09yK', '2000-03-04', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2023-12-07'),
(6978, ' Camerino', 'Jaime Maturana', 'Cerradas del Parque', 'D', 'Operador General', '1', '124871', '$2y$10$6C7y.IWSo0vDTGyMls42aO/yB2u4VQVfKhUjLaOBE1lD/U11sHpH2', '1984-12-10', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2023-12-07'),
(6979, ' Ruth Margarita', 'Aguilar Medina', 'Paraje de San Isidro', 'D', 'Operador General', '1', '124873', '$2y$10$KZaB5KKC4cg8fdt7rHl1CedwH7fe0jchrq3HH4JfFDPZB997zN4qW', '1978-09-11', 'Vania Garcia', '100540', 'HUS', '2023-12-07'),
(6980, ' Itzel', 'Gutierrez Moreno', 'Paseo de La Canada', 'D', 'Operador General', '1', '124876', '$2y$10$9lG5OOcLcIP.Rp.cw5/w/eIJHmibNHp7hRbuzouuTykgBU5f1hVoi', '1997-07-27', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2023-12-07'),
(6981, ' Lixandro', 'Trujillo Aguilar', 'Terrenos Nacionales', 'D', 'Operador General', '1', '124877', '$2y$10$JJa5rUkC4K8EW1GymEFRW.72ERpoLA5sgbM4HVJo8tK50UM6YINoO', '1992-12-06', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2023-12-07'),
(6982, ' Julio Fernando', 'Pascual Santiago', 'Sierra Vista', 'D', 'Operador General', '1', '124883', '$2y$10$dyRWujEyfjEA0umqjTSGau0HrbR4YIyY28BBFG6SBsMVdmragWh.y', '2001-12-24', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2023-12-07'),
(6983, ' Daniela', 'Morales Cuello', 'Portal del Valle', 'D', 'Operador General', '1', '124884', '$2y$10$f1w6wIFzfXr6Mrj/IVXNkuKRGjqtxFL0dVUBW7nys7OrFzZou1x96', '1999-05-07', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2023-12-07'),
(6984, ' Alejandro Trinidad', 'Irigoyen Gurrola', 'Villa bonita', 'D', 'Operador De Procesos', '1', '124886', '$2y$10$nS5NWDrxg8PLNLYb9k.YXutOC1MCHdRis.skofiw/26GxWl3NZheq', '1982-10-26', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-12-07'),
(6985, ' Valeria Isabel', 'Machado Hernandez', 'Paraje del Sur', 'D', 'Operador General', '1', '124888', '$2y$10$42.3.rQo61GUmHSbpxtNVuewOghCe2rzZjcB1uHanIJ42rjXsjXbq', '1992-12-30', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2023-12-07'),
(6986, ' Francisco Javier', 'OrdoÃ±ez Arce', 'Terrenos Nac Zaragoza', 'D', 'Operador General', '1', '124889', '$2y$10$rEmMnA/4FlqPmgIX3AMugeAAxzE8xyGwENC8p7p8YkMV.6.oB3aQW', '1996-09-14', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2023-12-07'),
(6987, ' Ana Laura', 'Aguero Valdiviezo', 'Senderos de San Isidro', 'D', 'Operador General', '1', '124903', '$2y$10$1qw8pcpedz1xLYq9F4DNR.S9vcfIkH2T2ENuyayZ/qptjFkYO7RkK', '1991-01-03', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2023-12-08'),
(6988, ' Jose Antonio', 'Santamaria Cid', 'Praderas del Sol', 'D', 'Operador General', '1', '124904', '$2y$10$RrDasqy0ICZf3/kNeAkIAOUHRK6BHcBWGUMbeoBRqR2h3iC1/UzVi', '1991-06-14', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2023-12-08'),
(6989, ' Carlos', 'Poxta Quino', 'Riberas del Bravo III', 'D', 'Operador General', '1', '124907', '$2y$10$TrLEfHAquAvraX.y1.0v0.BtVraRXXMoyGV55Mqf7Y1Oo6lDPYRPu', '1982-05-08', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2023-12-08'),
(6990, ' Alexander', 'Fajardo Aquino', 'Urbivilla del Campo', 'D', 'Operador de Criticos', '1', '124908', '$2y$10$//NxpfWC8tfyU4OQ6putte25Y7QZYur8.lT8wvVht9qoZv6EI9Xpi', '1999-04-09', 'Saul Arellano Escobar', '97722', 'HUS', '2023-12-08'),
(6991, ' Maria Silvia', 'Poxta Quino', 'Rivera del Bravo', 'D', 'Operador General', '1', '124910', '$2y$10$RlwV3A.z3Ok.Ek6h/KYKsuVN9dCw6aWCUsHzPnYvNoiyXRgc69DAC', '1984-02-10', 'Vania Garcia', '100540', 'HUS', '2023-12-08'),
(6992, ' Chantal De Maria', 'Viramontes Rodriguez', 'Parajes de San Isidro', 'D', 'Operador General', '1', '124916', '$2y$10$xVoNAzZhWlA2bPmIll4rFOL9.vAHFlhe5kNA08vW8G70.9W3LfPeS', '1990-08-19', 'Vania Garcia', '100540', 'HUS', '2023-12-08'),
(6993, ' Juan Alberto', 'Cordova Perez', 'Urbivilla del Cedro', 'D', 'Operador De Procesos', '1', '124918', '$2y$10$uwuzcrvD8fz8w.HUfzL2M.I9BU7b5AsebSmUp5DXk/cQaQNZ4S3vG', '1978-06-07', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-12-08'),
(6994, ' Diego', 'Quino Toto', 'Riberas del Bravo ', 'D', 'Operador General', '1', '124921', '$2y$10$Zv0KY6vgN/jlpG4Mg42z.OgZ6h3MC4lzikg0.ULjz3v1ca4GViOBS', '1982-11-13', 'Vania Guadalupe Garcia Flores', '100540', 'HUS', NULL),
(6995, ' Abrahan', 'Salvador Ezequiel', 'Valle Fundadores', 'D', 'Operador De Procesos', '1', '124924', '$2y$10$Jc6ppHqxQ9BLFs0EIH2WqunLK4ttCrOb5XO4isQhIi0Fs9vQOrzGK', '2002-04-01', 'Daniel De Jesus Favela Najera', '73913', 'HUS', '2023-12-08'),
(6996, ' Adelina', 'Alfonso Mendoza', 'Paraje de San Juan', 'D', 'Operador General', '1', '124925', '$2y$10$PapsIOLqfzn2c9Q13GX8zuhXbctTM34g0QsM5kq9q8ZIOb8LV8e42', '1995-07-08', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2023-12-08'),
(6997, ' Brenda Escarlette', 'Mendiola Chavez', 'Las Haciendas', 'D', 'Operador General', '1', '124950', '$2y$10$VhrbQF/irOwq.KIP.RzpHOVcdsSZAkQ/B6nxu2Uc5rPDfeSFAC6Lq', '1988-12-03', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2023-12-12'),
(6998, ' Charito', 'Guzman Nava', 'Zaragoza', 'D', 'Operador General', '1', '124951', '$2y$10$.qkWuGXM4pBqQROLi3ksrOdxWSQNz1QzW6q5UKRRvG37IVj9DeND6', '1993-06-11', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2023-12-12'),
(6999, ' Jose Margarito', 'Hernandez Herrera', 'Villas del Sur', 'D', 'Operador De Procesos', '1', '124953', '$2y$10$rPEdyKLAmZXm8f9edPOwye2fQGyRlUg2nF1oG0xnIXO1Kv2ozLEsW', '2000-10-18', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2023-12-12'),
(7000, ' Raul Manuel', 'Hernandez Zapata', 'Misiones de creel', 'D', 'Tec. Esp. en Mtto Equipo', '1', '124954', '$2y$10$NqhU0qpmulMRojLGpcQu/emzgFte0XKt9rOZvqQk50lE5CRXN.qjS', '1993-02-15', 'Mauro Sanchez', '61715', 'HUS', '2023-12-12'),
(7001, ' Graciela', 'Calvo Velasco', 'Praderas Del Sol', 'D', 'Operador General', '1', '124955', '$2y$10$OI7vg/Dj74TAabIOaqrNRe35Xa2gct1McnclrBtBF5hCmd1z25bvu', '1973-01-28', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2023-12-12'),
(7002, ' Reyna', 'Esparza Gonzalez', 'Complejo Cielo', 'D', 'Operador General', '1', '124956', '$2y$10$9787FRqiM7X1rXQVS3lB0.yyVbsXGoeVWVs7KJ7bGT1F3GSwiiHi.', '1992-07-14', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2023-12-12'),
(7003, ' Tomas de Jesus', 'Martinez Guerra', 'Senderos del Sol', 'D', 'Operador De Procesos', '1', '124964', '$2y$10$HUt1JTk9BDJobKBwuct6bOkkV.cvNumb6BMBaZZBXwtrNKOMNkbnm', '2000-06-30', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2023-12-14'),
(7004, ' Silvia Lizbeth', 'Dionisio Castillo', 'Paraje de San Isidro', 'D', 'Operador General', '1', '124968', '$2y$10$aeE1PCVQTZrIFqG0kiaV8OGgF75s5w2cdomVMRxXrXb88IkERmIrC', '1994-11-06', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2023-12-14'),
(7005, ' Rosalinda', 'Ramon Carlos', 'Senderos de San Isidro', 'D', 'Operador General', '1', '124970', '$2y$10$juD2n0FsP85t5Nzv7bMcfOXJ7ZP5faXsjMMcNSeANGsONDypsCMym', '2003-01-27', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2023-12-14'),
(7006, ' Laura Jazmin', 'Luna Garcia', 'Senderos de San Isidro', 'D', 'Operador General', '1', '124973', '$2y$10$6fmqK/n2cOsZ1Np8Gbvkk.EsGi7Hlg1CGmNhogXTPe8wQ0pStVk76', '1996-06-15', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2023-12-14'),
(7007, ' Jose Angel', 'Trejo Alvidrez', 'Villas De Alcala', 'D', 'Operador De Procesos', '1', '124977', '$2y$10$.C1Abo1rzQ7k2rUAzUvnPOMIoEi.dJ9ycqamZZ/jAjQNPWDbB3BlO', '1984-07-04', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', NULL),
(7008, ' Humberto', 'Garcia Marin', 'Paraje de San Jose', 'D', 'Operador General', '1', '124978', '$2y$10$Ipj0lkavXms1pFPv3x26dOtcLCdk3kmSBeGjY/ch.dWlbKn5Ua7E6', '1978-05-13', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2023-12-14'),
(7009, ' Miranda', 'Gurrola Torres', 'Sierra Vista', 'D', 'Operador General', '1', '124985', '$2y$10$d0bbbfV1ek1qPbtO5xebsupRdyJspN2deGf8WeZpoX7Eqg.xP.7J2', '2003-01-31', 'Jose Jesus Meza Jimenez', '70699', 'HUS', '2023-12-14'),
(7010, ' Juan', 'Hernandez Giron', 'Rivera dela Barca', 'D', 'Operador De Procesos', '1', '125294', '$2y$10$cCE3LlGePcsT5UtkapDMoeFbxPO1NKxADxuDi1Ht5WAgsh0e52PjO', '1988-10-29', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2023-12-21'),
(7011, ' Maria Esther', 'Gaytan Martinez', 'Sur Hacienda de las Torre', 'D', 'Operador De Procesos', '1', '125296', '$2y$10$RhEZqx2PRPCbtEyR6.mxxOkGxCTqIUYTrtQrzXdFXA6/7j98uiSc.', '1989-03-24', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2023-12-21'),
(7012, ' Fernando Eduardo', 'Carrera Ramirez', 'Urbi Alameda Versalles', 'D', 'Operador General', '1', '125305', '$2y$10$E.m6lpeR8ITYNh9UZPuYvOpLOv7jtc6ZbICkTEqOOQb4Q8sk4BRhO', '1996-12-20', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2023-12-22'),
(7013, ' Lorena Jaqueline', 'Romero Meza', 'Villa Bonita', 'D', 'Operador General', '1', '125309', '$2y$10$qVvODO0tculgb4rBkDMWTu91WjDkDdW4eXj1hxSq5LvmCk80z9/1e', '2000-08-25', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2023-12-22'),
(7014, ' Blanca Leticia', 'Flores Alcon', 'Senderos de San Isidro', 'D', 'Operador General', '1', '125310', '$2y$10$31PyoC82n7yFd.AZhp8Gi./UGb5NIWhy7RFc/njg0SkacaAAOECzu', '1979-09-22', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2023-12-22'),
(7015, ' Javier', 'Loya Loya', 'Misiones del real', 'D', 'Operador General', '1', '125359', '$2y$10$d3Sq9LXXkmOL68jtTZI1F.st6RdHcgvl.2psluDhPChw4qp/zTLH.', '2005-04-13', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-01-04'),
(7016, ' Perla Judith', 'Miranda Tellez', 'Paraje de Oriente', 'D', 'Operador General', '1', '125360', '$2y$10$54e5lNcFZrjyDnnEsBari.FP6QZWWtjVl1/5agAUEiN3JhJt/e6iS', '1995-11-13', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-01-04'),
(7017, ' Adriana', 'Sanchez Arroyo', 'Parajes de San Jose', 'D', 'Operador General', '1', '125361', '$2y$10$Hey3JqXi2Zt5I1Fis8MuQOGlI1R7QDkhQGULuMtm4orKmPDBOFmSu', '1991-03-05', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-01-04'),
(7018, ' Juan Pablo', 'Ruiz Sanchez', 'Vistas de Zaragoza', 'D', 'Operador General', '1', '125362', '$2y$10$t7H62mzgEkHGURP2T.1X1uSkPmsY3puKR2.ltzqw9PG13ZO2xJ7Ay', '1995-11-28', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2024-01-04'),
(7019, ' MarÃ­a Guadalupe', 'RodrÃ­guez Arreola', 'Senderos de San Isidro', 'D', 'Operador General', '1', '125364', '$2y$10$nH/0L04WAaHzzzuVx6QlMeqFv40ddai/ycfg5J33KJl8rityevi32', '1985-12-12', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-01-04'),
(7020, ' Fernanda Gabriela', 'Martinez Mendez', 'Praderas del Sur', 'D', 'Operador General', '1', '125397', '$2y$10$IwEVGnMq0RJ5bjbn84rjl.HK2sMSrbt2oou7ttkeQfMbdRC0Onayy', '2004-06-19', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-01-09'),
(7021, ' Herlinda', 'Ramirez Castillo', 'Jardines del Aeropuerto', 'D', 'Operador General', '1', '125399', '$2y$10$7X/TBDVxpTnJ1kCwydcS7OHyLrdCdcTsktp1d3ORBefa5tH1OK74S', '1998-10-03', 'Vania Garcia', '100540', 'HUS', '2024-01-09'),
(7022, ' Moncerrat', 'Vargas Murrieta', 'Las Haciendad', 'D', 'Operador General', '1', '125401', '$2y$10$qDt9k6Wvhv7/mIdm3qxckuG6qN98JyyhUPRGw0b8Y3GRy86Yq5yjG', '1998-12-10', 'Vania Garcia', '100540', 'HUS', '2024-01-09'),
(7023, ' Gabriel Eduardo', 'Favela Soto', 'Paraje de San Isidro', 'D', 'Tec. Esp. en Mtto Equipo', '1', '125403', '$2y$10$/R4hyLCa5rmpxvBLe.icOu6OnfrWRddVOg/IAAl3hH5KIJVi7BT3y', '1996-09-14', 'Fernando De La O Alvarez', '70963', 'HUS', '2024-01-09'),
(7024, ' Erika Iovanna', 'Romero Gonzalez', 'Division del Norte', 'D', 'Operador De Procesos', '1', '125404', '$2y$10$CVuXdUBYtKi.uZBXtCt4QuUIwtxKetBznmtOGkVQjQ6nuaOlerWNS', '1989-09-22', 'Saul Arellano Escobar', '97722', 'HUS', '2024-01-09'),
(7025, ' Maria Isabel', 'Hijar Ravelo', 'Cerradas San Mateo', 'D', 'Operador General', '1', '125405', '$2y$10$QNIA/.wOborgs5cuAZ/v3eUVzZqEIzN3FtAE3L0SAqjcbWrLi57k.', '1988-08-04', 'Brenda Guadalupe Devora MuÃ±oz', '96747', 'HUS', '2024-01-09'),
(7026, ' Alberto', 'Linares Dominguez', 'Las Haciendas', 'D', 'Operador General', '1', '125407', '$2y$10$9RibzIJxPNrVakBAOyYN1eiCCjQXplRLQV0iH5S69IMYsnDQsPRH6', '2001-06-06', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-01-09'),
(7027, ' Mario De Jesus', 'Hernandez Zunun', 'Valle de Allende', 'D', 'Operador De Procesos', '1', '125409', '$2y$10$blu.7txl27ivC/tmaWZUKudJtY5334i04Q8XCpKIZ2m0nJZzOGlE.', '2005-03-16', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-01-09'),
(7028, ' Fernando', 'Hernandez Rodriguez', 'Aguilas de Zaragoza', 'D', 'Operador De Procesos', '1', '125410', '$2y$10$L/g8.zyej4dUfEpBhCwQjOxCSMefGajb/LRrtEZL2qQQO9G7HpE.C', '1996-01-28', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-01-09'),
(7029, ' Mayte Arely', 'Campos Guereca', 'Morelos 1', 'D', 'Operador General', '1', '125412', '$2y$10$ChsFEL1riplohz6ioTzHw.eHRZDESQDxEm8G1VUS637qPPIvehDhC', '2000-01-23', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-01-09'),
(7030, ' Jose Leyver', 'Canizalez Gutierrez', 'Jardines de Roma', 'D', 'Operador De Procesos', '1', '125414', '$2y$10$b1XC.gkI5u8A..zLGW0OIeI2uJ1FI5EGE/FmL6eoRxb.8BJ4ZzJt6', '1991-05-08', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-01-09'),
(7031, ' Roberto', 'Solano Lara', 'Zaragoza', 'D', 'Operador de Criticos', '1', '125416', '$2y$10$bBpXi6lDWPR/aPSsEBdgG..v4/./DZI.YGsNX2To6NGPSjVGitN02', '1995-07-13', 'Jorge Luis Rios Ramirez', '71668', 'HUS', '2024-01-09'),
(7032, ' Omar Alberto', 'Salas Magallanes', 'Tierra Nueva II', 'D', 'Almacenista', '1', '125452', '$2y$10$yVkM.Sbp3i/PVkz2sxCZfeaJ3zfp9Te0Lhiywpixm4WR4//EDSAfO', '1995-11-06', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2024-01-11'),
(7033, ' Gonzalo De Jesus', 'Nazarala Perez', 'Parajes del Valle', 'D', 'Operador General', '1', '125455', '$2y$10$dEL/24Sx1wv0EPOUQdbNluVPkh/qNDmg9XXDQGQlqwJwkvFh9Z9F6', '1990-03-09', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2024-01-11'),
(7034, ' Antonio De Jesus', 'Cano OcaÃ±a', 'Paraje de San Isidro', 'D', 'Operador General', '1', '125456', '$2y$10$QyL.l1jumIKOrOYy5ZIomOEh77uocF58BtGo7ICb.VZ7A0jn9FLcy', '2001-06-13', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2024-01-11'),
(7035, ' Jorge David', 'Guzman Perez', 'Cantares Residencial', 'D', 'Almacenista', '1', '125458', '$2y$10$f7.QJo.qyMu1.oNhWWFJ8O1GiNM9ZpYTffP67g7AoXOEeLnQ9osje', '1997-03-25', 'Resendez Gardner Raul', '98277', 'HUS', '2024-01-11'),
(7036, ' Giezys', 'Romero Bernal', 'Rincones de Salvacar II', 'D', 'Operador General', '1', '125459', '$2y$10$zF8MFvqIBocfTz9wcBvy0un28A1ZtakgC0l.rcSiDhImUL7OxzAs6', '2002-12-01', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2024-01-11'),
(7037, ' Elvia Trinidad', 'Heredia Delgado', 'El Fortin', 'D', 'Operador General', '1', '125460', '$2y$10$6.wX97vwhoC.MruJuVmumu9qgkGlGWqcqw/EKAG6Xq4IZLWtEPHx2', '1986-12-17', 'Vania Garcia', '100540', 'HUS', '2024-01-11'),
(7038, ' Carmina Raquel', 'Aguirre Sanchez', 'paraje de oriente', 'D', 'Operador General', '1', '125462', '$2y$10$dYB1ROALDbkuZYVhH1KOwutk../F1gRN7r6WVl.2zJwOoOlYkiO/m', '1989-11-18', 'Aguilar Flores, Eduardo Alonso', '25788', 'HUS', '2024-01-11'),
(7039, ' Estela', 'Perez Jimenez', 'Rincones del RÃ­o', 'D', 'Operador De Procesos', '1', '125463', '$2y$10$3QffjJRXQ.CzZBd1YKev2OISTbCsfSTWeiXtbHCUhhe/rntAhNbvu', '1996-08-27', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-01-11'),
(7040, ' Soledad', 'Cano Carrillo', 'Paraje de San Jose', 'D', 'Operador General', '1', '125466', '$2y$10$LMV9N4DoQAmQAl/nzyH3O.X2U0ds3faHJxPWfkLMbmaHmE.4ct96W', '1983-03-20', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-01-11'),
(7041, ' Keisla Lizbeth', 'Marquez ', 'Cerrada del oriente', 'D', 'Operador General', '1', '125467', '$2y$10$AiF4RnsDnQFD3FGrgvPGfuimTV7Jpi6Nn3aqK6BgKMUx.D2pqM7yq', '1996-03-03', 'Maria Eloisa Barron Salas', '61631', 'HUS', NULL),
(7042, ' Brenda Michell', 'Martinez Contreras', 'Olivia Espinoza De Bermud', 'D', 'Operador General', '1', '125469', '$2y$10$92D4lrYe/WG/W1DarjsXau4Ri9gyZkXE9y4r4GGoEWZpQ5eZRgRWK', '2005-10-25', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-01-11'),
(7043, ' Maria De Jesus', 'Elizalde Villegas', 'Parajes de San Isidro', 'D', 'Operador De Procesos', '1', '125470', '$2y$10$d0ftyUAJO76PYnbDM3lI5u/zh7817/N2wybBvwE1f4iiyqylxvcUa', '1985-10-13', 'Jesus Lopez Solis', '73653', 'HUS', '2024-01-11'),
(7044, ' Alexis Rene', 'Rodarte Avila', 'Las Gladiolas', 'D', 'Operador De Procesos', '1', '125471', '$2y$10$mjBL3c85u9jPDKW42nqaUu1PbCN3cNLZSEeNNURlT8DX.OMkQ04Z6', '2001-10-07', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-01-11'),
(7045, ' David Eduardo', 'Hernandez Soto', 'Paraje de Oriente', 'D', 'Operador De Procesos', '1', '125503', '$2y$10$Job13nRwt8j/thrxH81dKeuOlYUdVBs/JYw.PatYPlsjwfk9usGMi', '2000-12-29', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2024-01-15'),
(7046, ' Osiel Alejandro', 'Fernandez Herrera', 'Real Del Desierto', 'D', 'Almacenista', '1', '125505', '$2y$10$ge6G2g7yjVrwGn5czOj.jedSbV/P.pxwxsuj2EwjkUMefcOdafz2u', '1991-03-10', 'Resendez Gardner Raul', '98277', 'HUS', '2024-01-15'),
(7047, ' Jose Miguel', 'Reyes Perez', 'Paraje del Oriente', 'D', 'Operador De Procesos', '1', '125510', '$2y$10$sVHk8ThezT0QURaXpnQx6uNKMJNj0bvI.gfZWJpef4eu7aVJwfYkW', '2005-07-31', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2024-01-16'),
(7048, ' Salma Michel', 'Poxta Flores', 'Riberas del Bravo VII', 'D', 'Operador General', '1', '125512', '$2y$10$4Man4R6zMBwgcIuyhKlZbeg2wfPmB1mJ4DHZ1orvAYIrr9kOE14MK', '1999-05-28', 'Vania Garcia', '100540', 'HUS', '2024-01-16'),
(7049, ' Diryara', 'Hernandez Lopez', 'Portal del Valle', 'D', 'Operador General', '1', '125516', '$2y$10$i6/PssFYQc/lTmFDlr3fceNGXkPRF1bAC2NxLk3qbSvlvgmt/N7Eu', '1989-08-16', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-01-16'),
(7050, ' Lizbeth Jaqueline', 'Mireles Hernandez', 'Villas de Alcala', 'D', 'Operador De Procesos', '1', '125519', '$2y$10$Mlxg.ReOyL04KiSiWxXZ2utZjzxopCxHW99Jl9g7QaNtdBRr2Ds.K', '1998-12-18', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-01-16'),
(7051, ' Rodrigo Yareth', 'Hernandez AcuÃ±a', 'Paraje De San Jose', 'D', 'Operador De Procesos', '1', '125522', '$2y$10$iVd7fEJ37MU9y.LQ7YKh/eGA4yhrKW8edKmIgpXxG7/7JacyJNdqu', '2005-07-08', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', NULL),
(7052, ' Miguel', 'Aguilando Martinez', 'Cerradas del Alamo', 'D', 'Operador De Procesos', '2', '125550', '$2y$10$zZ2Uq5jY/nDaTydaQCP/LubMoSLLrls0Rk5o0SgKlSrqQsJJ6GJJK', '1989-09-29', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2024-01-18');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `colony`, `position`, `area`, `plant`, `username`, `password`, `birthdate`, `supervisor_name`, `supervisor_reloj_number`, `deparment`, `fecha_ingreso`) VALUES
(7053, ' Gustavo', 'Candelario Segura', 'Urbivilla del campo', 'D', 'Operador De Procesos', '2', '125551', '$2y$10$FfwFCQ6HdxXif9an56Py/O5EMr4SDxEjk7K6svdOCm.9Oi43QaX3K', '1988-01-16', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2024-01-18'),
(7054, ' Rigoberto', 'Hernandez Manuel', 'Parajes del Sur', 'D', 'Operador De Procesos', '2', '125554', '$2y$10$zwFdBsP2BrVQvK2xg2/cPe05Sz7eskVRn2lwtvDoywqY3TtjrsTbu', '1994-11-30', 'Becerra Ramirez, Juan Ramon', '25259', 'HUS II', '2024-01-18'),
(7055, ' Gustavo Adolfo', 'Lopez Calvillo', 'El Campanario Cuatro Sigl', 'D', 'Almacenista', '1', '125556', '$2y$10$q/swBeCO2QuJ0MB01ts7qOUVZib7Zo/y7jqWQHtF1xiTPzkhgWgH6', '1991-07-17', 'Resendez Gardner Raul', '98277', 'HUS', '2024-01-18'),
(7056, ' Caleb Norberto', 'Escobar Holguin', 'El Granjero', 'D', 'Tec Esp en Mtto Equipo', '1', '125569', '$2y$10$5/Qr97sZYr/L4GbEQ2PUKOZdcC99XSrWAQJFMNkBMKURFSHeeS7XS', '1993-06-06', 'Mauro Sanchez', '61715', 'HUS', '2024-01-18'),
(7057, ' Azael Jonary', 'Solis Vazquez', 'Urbilla del Prado', 'D', 'Almacenista', '1', '125585', '$2y$10$aFaQo4IAUwzFUkFTzeXbVu0y/ZrsAaTgkUYm96W2t1tbAA9u1s9Su', '1990-09-17', 'Resendez Gardner Raul', '98277', 'HUS', '2024-01-22'),
(7058, ' Norma Leticia', 'Hernandez Ontiveros', 'Carlos Castillo Peraza', 'D', 'Operador De Procesos', '2', '125587', '$2y$10$dwrVQIISQl9BIJZU3S6xgegz.rMBwx9rxnWAyEw0nEeSYA3kdsDXO', '1995-02-12', 'Gutierrez Perez, Lucia', '61812', 'HUS II', '2024-01-22'),
(7059, ' Hugo Eduardo', 'Solis Rodriguez', 'Cerradas del Alamo', 'D', 'Operador De Procesos', '2', '125588', '$2y$10$mvgfCurdinilTz6bDqg2fe8coA38FgpTvHIg8fmSbQxsk/NwMNDrm', '2001-10-29', 'Salazar Resendez, Roberto', '26438', 'HUS II', '2024-01-22'),
(7060, ' Benjamin', 'Aguilera Jimenez', 'Parajes de Oriente', 'D', 'Operador De Procesos', '2', '125590', '$2y$10$fJENZBvDQWUI9Wm6OzjxR.tN7/iJJHYCJwfZaClX8t2koIPAyD0EK', '1981-07-04', 'Perez Sandoval, Jose Luis', '28925', 'HUS II', '2024-01-22'),
(7061, ' Cristian Alexis', 'Navarro Alaniz', 'Parajes de Oriente', 'D', 'Operador De Procesos', '2', '125592', '$2y$10$kz3GRUA8lMmixbtmhhjf3.6BvorqoPnuLLJXrXXt2QgKktDcaFmdW', '2005-10-24', 'Regalado Jasso Miguel Aaron', '98275', 'HUS II', '2024-01-22'),
(7062, ' Fidel', 'Garcia Lozano', 'Los Fresnos', 'D', 'Almacenista', '1', '125593', '$2y$10$kpYEb1UxXHBtuQUpv0a/guUoV4U8aGiemDOZvkD.cK1134dcQKeTi', '1994-12-13', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2024-01-22'),
(7063, ' Jose Armando', 'Monterrubio BolaÃ±os', 'Senderos de San Isidro', 'D', 'Operador de Criticos', '1', '125598', '$2y$10$jhsLgUHZReYK1imKmTDnTu.NcZcKA83/.gLpIhzS2vcmjJinG3aHa', '1998-11-15', 'Jesus Lopez Solis', '73653', 'HUS', '2024-01-22'),
(7064, ' Aideth Yarely', 'Acosta Ortega', 'Urbi Villa del Cedro', 'D', 'Operador De Procesos', '1', '125599', '$2y$10$xvXhCi7t75CQGxD/Y1YBQum2/C4Nr04EhSv/9kSxi1VZFjhH.P9FW', '1992-03-18', 'Jesus Lopez Solis', '73653', 'HUS', '2024-01-22'),
(7065, ' Javier', 'Cabrera Vazquez', 'Urbivilla del Campo', 'D', 'Operador De Procesos', '2', '125601', '$2y$10$Kpgqc.v5f3k5KEXZHghH3.v/6vJ2z0ZXn4AcxKzW80O0PLStVS0du', '1995-12-13', 'Reyes Hernandez, Abelardo', '26384', 'HUS II', '2024-01-22'),
(7066, ' Lizbeth Del Carmen', 'Cabrera Cruz', 'Portal del Roble', 'D', 'Operador General', '1', '125602', '$2y$10$c5XLq252H7SLdPQZ.AcYluVdqwU04Yno4nV6jbqT14pn2pNsdsOnW', '1999-07-15', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2024-01-22'),
(7067, ' Julio Cesar', 'Rodriguez NuÃ±ez', 'Fray Garcia de San Franci', 'D', 'Operador De Procesos', '1', '125604', '$2y$10$TXrUzVGRkMCN1hgTA1XKY.TxrtPxw5J1suF6ZDUvkuiVdzNlBPJ2.', '1987-12-30', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-01-22'),
(7068, ' Daniela', 'Aguirre OrdoÃ±ez', 'Parajes del Sol', 'D', 'Operador General', '1', '125631', '$2y$10$UycaF2zy4U42o.7NatgGvO.3NbtLFBgkyfLkDznwi.IODaEvJt0Qa', '2004-06-11', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2024-01-25'),
(7069, ' David Rodolfo', 'Gonzalez Ortiz', 'Praderas del sol', 'D', 'Almacenista', '1', '125635', '$2y$10$dtgPjARabwVEa1S2eTdjH.brfUfmsB81D23I6RqdxXXJfa2OJA5zm', '1990-09-12', 'Resendez Gardner Raul', '98277', 'HUS', '2024-01-25'),
(7070, ' Nestor Giovanni', 'Arce Palacios', 'Hacienda de las Torres', 'D', 'Operador de Criticos', '1', '125636', '$2y$10$zTFYC3c/8OyrK4ExEtIQoeNOd/KrP7VqA5NbOGLscg1i7pWsrCjK2', '1987-04-10', 'Jesus Lopez Solis', '73653', 'HUS', '2024-01-25'),
(7071, ' Jorge Luis', 'Flores Martinez', 'Paraje de San Jose', 'D', 'Operador General', '1', '125637', '$2y$10$IouPpv9Mepz9dWNG31RDGuL1gtc9nyAWFMmZmOgvOosSQ945ZaE1S', '1996-04-12', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-01-25'),
(7072, ' Alan David', 'Lopez Sagarnaga', 'Paraje De Oriente', 'D', 'Operador De Procesos', '1', '125639', '$2y$10$ZIvva4FRDlgo41JsprFBg.u9RGXLxtGXxSOVjW/l1zfqiPqpHxTX6', '2002-02-27', 'Saul Arellano Escobar', '97722', 'HUS', '2024-01-25'),
(7073, ' Emmanuel', 'Cabrera De Luna', 'Torres del Sur', 'D', 'Operador De Procesos', '1', '125641', '$2y$10$otKevgEB63EdTXzP3OQxdejsomVqKcFcjUl3vtWbm41NclYuKWuu2', '2002-11-23', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-01-25'),
(7074, ' Nohemi', 'Diaz Solis', 'Sor Juana Ines de la C', 'D', 'Operador De Procesos', '1', '125642', '$2y$10$huVIgmY9QrJ4SvwKUDyDQOHV6wqeA8l3ZP2ZWRsc/QaUsq9Ax1IJq', '1990-01-18', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-01-25'),
(7075, ' Daniel', 'Rodriguez Martinez', 'Cerradas del Alamo', 'D', 'Operador De Procesos', '1', '125643', '$2y$10$NJCjeH/.8IIaGlb27UoeIuuoC7j62d6AOS3yEh0RfUIWpyzIaUne.', '2000-12-24', 'Saul Arellano Escobar', '97722', 'HUS', '2024-01-25'),
(7076, ' Blanca Lizeth', 'Alcala Hernandez', 'Cerrada de Oriente', 'D', 'Operador De Procesos', '1', '125645', '$2y$10$Avvh2Zy8lZSHCGVeAHF5oO73rTorCcO3TSFT8KRbJUXKhamQrXHOe', '1984-09-24', 'Saul Arellano Escobar', '97722', 'HUS', '2024-01-25'),
(7077, ' Leonel', 'Martinez Virgen', 'Rincon de la mesa', 'D', 'Operador de Criticos', '1', '125647', '$2y$10$CAyXKVVasqHohh9.2YioUOzh5S11R6MXtzwCybanQOrYi4kNMHUpu', '1990-10-17', 'Jesus Lopez Solis', '73653', 'HUS', '2024-01-25'),
(7078, ' Alan Ricardo', 'Santiago CabaÃ±as', 'Cerrada de Alamo', 'D', 'Operador De Procesos', '1', '125652', '$2y$10$sS9i79JzbG3zAtBUp/XOSeI1aZdvj51UuV.NMSOU.Pz0Z/Z/LxOAW', '1997-08-14', 'Saul Arellano Escobar', '97722', 'HUS', '2024-01-25'),
(7079, ' Alma Rosa', 'Molina Ramirez', 'Zaragoza', 'D', 'Operador De Procesos', '1', '125653', '$2y$10$yKcpBVnjz2xTIzOImEGVCuWzx5qMVVO703vw.0u3FXyIcWoL7QQL2', '1985-12-01', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-01-25'),
(7080, ' Jesus Eduardo', 'Alvarez Carballo', 'Cerradas de Santa Isabel', 'D', 'Operador De Procesos', '2', '125732', '$2y$10$1L4KCxhyL3NDsIjhSV3auuV.y5ukoEQxbNpFQfuQdZhMR35qBjcXG', '2000-03-31', 'Alvarez Gallegos, Cesar Eduard', '45085', 'HUS II', '2024-02-01'),
(7081, ' Ivan Eduardo', 'Rodriguez Loera', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '125735', '$2y$10$COH75U7ox1SkCSIW73wRVO2atreZQ/pKauG3zU7XS.uc5hy8xPhj6', '1998-01-16', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-02-01'),
(7082, ' Luis Angel', 'Francisco Tranquilino', 'Villa Residencial del Rea', 'D', 'Operador de Set Up', '1', '125825', '$2y$10$R/bv9mfzU/ZH9d7dc4826eKZE2PYc.rNLabVAZUgkAuK.ZlJQyJWW', '2001-11-27', 'Rogelio Arellano Unzueta', '105818', 'HUS', '2024-02-06'),
(7083, ' Jose Carlos', 'Ramos Ramon', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '125826', '$2y$10$mmv9nBz1290OGneX8Q9SvO30HB6/vblKtNZ/WPT/kZoXube0lqY.2', '1985-12-24', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-02-06'),
(7084, ' Olga Lidia', 'Mendez Jimenez', 'Urbivilla del Prado', 'D', 'Operador General', '1', '125828', '$2y$10$znW2BYI.VoctxMNKnbZDRu8diMoHywl0VbxTbLeJIcV4bzo5HTgNy', '1996-10-08', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2024-02-06'),
(7085, ' Cynthia Lizeth', 'Gutierrez Torres', 'Rincones de Salvarcar II', 'D', 'Operador De Procesos', '1', '125832', '$2y$10$QQplnhmla42Fa00fuC/KtuqE9NtRP.UvFBjUPQDQA8o1/udLllD8e', '1990-12-14', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2024-02-06'),
(7086, ' Rosalba', 'Ulloa Ventura', 'Parajes del Sur', 'D', 'Operador General', '1', '125864', '$2y$10$hv7kko1uF7TvR16NoK0Ud.qbQBIc7o.KmreEPfuFrFdjlfjsQR4aC', '1991-02-25', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2024-02-08'),
(7087, ' Karina', 'PiÃ±a Trejo', 'Portal del Valle', 'D', 'Operador De Procesos', '1', '125866', '$2y$10$9I/ocDdnIgqRhX/XzZjp7.RGqaVEIds0X9XXuCf2G8L9opujihry6', '1991-01-18', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-02-08'),
(7088, ' Blanca Estela', 'Rodriguez Blanco', 'Manuel Valdez', 'D', 'Limpieza', '1', '125867', '$2y$10$HbvwuY6qPubcmEsdaCAJIeuwBkow7yZJkxVneAGO63iwRrMAvES36', '1990-11-21', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2024-02-08'),
(7089, ' Luz Maria', 'Contreras Rodriguez', 'Zaragoza', 'D', 'Limpieza', '1', '125868', '$2y$10$GmB3Zfo4v588j9DoQqjvI.yVL4ri1LmOs5j0fB18KO3RMZ99jBPSm', '2000-07-04', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2024-02-08'),
(7090, ' Kevin Alejandro', 'YaÃ±ez Reyes', 'Riberas del Bravo', 'D', 'Operador De Procesos', '1', '125869', '$2y$10$oGdtXRxfKQjlltiZafsNjOBhywDwmBWMAdWg3SIHP2vgOM/DUa6UO', '2004-07-30', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2024-02-08'),
(7091, ' Celia', 'Martinez Martinez', 'Morelos I', 'D', 'Operador De Procesos', '1', '125904', '$2y$10$6gMWDxId9QumZfz/UeJXbebmJ4xLheTJuBky3YjNburbj3o9LkcD.', '1984-10-21', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2024-02-12'),
(7092, ' Anahi', 'Marquez Morales', 'Morelos I', 'D', 'Operador De Procesos', '1', '125908', '$2y$10$aJYVGv5ByzDimh4nOmXyDOSHj0mwVe9ZUrPmfIQk6zSNIqwc.lxB6', '1989-05-29', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2024-02-12'),
(7093, ' Maria Del Rosario', 'Cruz Remedios', 'Praderas del Henequen', 'D', 'Operador De Procesos', '1', '125911', '$2y$10$ievQObnqhjQtZKiyG5wXPuJnjfYkHg4D9at4KagwX2B0eSP9UQaQi', '1992-10-07', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', NULL),
(7094, ' Brenda Janeth', 'Soto Herrera', 'Senderos de San Isidro', 'D', 'Operador De Procesos', '1', '125914', '$2y$10$sUFr7bfz4kAbakcCaICBMuMBxrJDcSFuabxVSpirW4D3ASeDvVyra', '1991-10-22', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-02-12'),
(7095, ' Luis Roberto', 'Berlin Pulido', 'Valle de Allende', 'D', 'Operador De Procesos', '1', '125915', '$2y$10$O85Hj06R3GB.kk/.TINWQ.u.nL.yq5E34P.iTUSv4d6yv2rLT3cfW', '2000-05-12', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', NULL),
(7096, ' Anayeli', 'Martinez Castro', 'Urbivilla del Cedro', 'D', 'Operador General', '1', '125918', '$2y$10$RD0yUByIHcs/RzZTQ8OFpejb2xqr6SxcCV.PZcY1dUn/UD3WQkOX6', '2001-01-03', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2024-02-12'),
(7097, ' Moises', 'Hernandez Velazquez', 'Nuevo Hipodromo', 'D', 'Operador de Criticos', '1', '125919', '$2y$10$awehvEsZDK2EssFU8gUqAeHaXMTMLmY6iXC.N1QAEhMVpKEE.y77W', '1990-11-29', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-02-12'),
(7098, ' Daniela', 'Escobar Lopez', 'Riveras del Bravo', 'D', 'Operador De Procesos', '1', '125920', '$2y$10$Mmchln078t9a8rHUpq15BeSg52KhiViAq4EKxQ9YuKzD3QjKBQa.C', '1997-07-10', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-02-12'),
(7099, ' Yareli Josselin', 'Cruz Ledesma', 'Cerradas Del Parque', 'D', 'Operador General', '1', '125921', '$2y$10$7kaThIFxuWpKbG8tGGcyz.52EaQhWFdSxxVkfQLND89BYUbhDQVjm', '2003-11-08', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-02-12'),
(7100, ' Casandra Jaqueline', 'Alday Nava', 'Arecas', 'D', 'Operador General', '1', '127500', '$2y$10$jVfWVUjJ7KaLeahuTdObIu5qsz/H24jTHJLp3FRfmNXgb6jlzYhvG', '1998-07-07', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-02-19'),
(7101, ' Damhar Azeneth', 'Medina Bravo', 'Los Cedros', 'D', 'Tecnico Control de Inventarios', '1', '127502', '$2y$10$WtqoJV.NsZPhU8DDEdubUOiDwJhHSVZOSv.ioa8OiynsHr.TFc4XS', '1995-06-29', 'Falcon Munoz, Lilia', '25685', 'HUS', '2024-02-19'),
(7102, ' Raymundo', 'Campa Alonso', 'Valle Dorado', 'D', 'Inspector Control de Calidad', '1', '127504', '$2y$10$AISBZDkgzCs4KqyU48kGwuT4cMv4SopcJSx2k/6ulbBuuQ/A0QmsS', '1997-07-25', 'Oscar Garcia', '59965', 'HES', '2024-02-19'),
(7103, ' Juan Daniel', 'Castillo Gonzalez', 'Riveras del Bravo', 'D', 'Operador General', '1', '127520', '$2y$10$0fr8urduDLoVZKLQ2CSdLuoQcKWSAMxKcTC6NjRXfcmwo9ZmblcmK', '1990-08-08', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2024-02-20'),
(7104, ' Gudelia', 'Vargas Molina', 'Oriente La Perla', 'D', 'Operador General', '1', '127523', '$2y$10$/6Habp7kd1aNWsaKmZfBEumWpvY1X8Y5demmiZusF5ncWwk.dlZJa', '1982-07-17', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-02-20'),
(7105, ' Nestor Daniel', 'Olivas Acosta', 'Paraje del Sur', 'D', 'Operador General', '1', '127524', '$2y$10$rWboayzdZ2XJEkM6r8gg4uPpfyNuCB1CWdF.FaDWvmjdN4B0FLFFu', '1989-03-13', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-02-20'),
(7106, ' Ammy Yahaira', 'Velazquez Mauricio', 'Olivia Espinoza de Bermud', 'D', 'Operador General', '1', '127526', '$2y$10$mhgOlpER0iMu5BIvKAMCPuilZaoY9zLKcmmQFMzpftZTR7DjH7ne6', '2002-11-23', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-02-20'),
(7107, ' Blanca Patricia', 'Sanchez Arellano', 'Vistas de Zaragoza', 'D', 'Operador General', '1', '127528', '$2y$10$4D8.jl4QC2HWRTN2qvQsQOwcxJ07AVVS4S23AadLkbhuTuDWXw2a2', '1995-07-06', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-02-20'),
(7108, ' Luis Angel', 'Torres Ibarra', 'Parajes de San Isidro', 'D', 'Operador General', '1', '127531', '$2y$10$CNnbDlRBacPEE9eqKBYMAeE21SKnjCM.3vwpr7BSDcR90v/cqCDcy', '2004-08-11', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-02-20'),
(7109, ' Luis Hernan', 'Castro Olivas', 'Paraje del Sur', 'D', 'Operador General', '1', '127534', '$2y$10$JO12mAXNwcDcOnzplx0hxOheBQRkR5.Uq98Vl.x31kHVELajgBN.S', '2001-05-26', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2024-02-20'),
(7110, ' Victor Manuel', 'Guillermo Ferat', 'Las Haciendas', 'D', 'Operador General', '1', '127535', '$2y$10$bhwYRVcjWUrnIVnDuMBIi.aKlgSAXqFP4BipnEhxVbSqNwVo3jFnm', '1982-04-20', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-02-20'),
(7111, ' Laura', 'Chavez Hernandez', 'Horizonte del sur', 'D', 'Operador General', '1', '127539', '$2y$10$dpsR3bnbdTJ7dUQdVYin9e5Y8PloRAINUzrqX3jj8rxzb2ljMRAlC', '1992-06-03', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2024-02-20'),
(7112, ' Juan Carlos', 'Carvajal Montalvo', 'Morelos 1', 'D', 'Operador General', '1', '127567', '$2y$10$etRY3yf5C8opr3rEuwK9K.aK7CdUhFzr/UIxFsEFRKTfzouW5dFm.', '1975-05-03', 'Reyna Malaga, Jorge Luis', '46058', 'HES', '2024-02-22'),
(7113, ' Sarahi Yakira', 'Escobar Mendez', 'Paraje de San Isidro', 'D', 'Operador General', '1', '127568', '$2y$10$Wri/hEpKOuN8N5FkXaXw8.7BvhfCO02jz7bOoSoiQJw/YSf58KnIe', '2005-07-15', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2024-02-22'),
(7114, ' Dulver', 'Caso Gutierrez', 'Cerrada San Rafael', 'D', 'Operador General', '1', '127570', '$2y$10$RN0eOUwwLg9nsMCul3x3u.FmUzyaCH.Hsk/ifdarVv3UEVu96goJe', '2001-06-11', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2024-02-22'),
(7115, ' Jacqueline', 'Conde Raymundo', 'Horizontes del Sur', 'D', 'Operador General', '1', '127573', '$2y$10$ksnqx2USZsz5psql8Rq7UekIthBk/4cTuq6tALlZZzxv3pYyHxLiO', '1996-06-21', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2024-02-22'),
(7116, ' Viridiana', 'Osorio Maza', 'Portal del Roble', 'D', 'Operador General', '1', '127574', '$2y$10$UQkSwhkhG3yjeSiNRZsOaucjxyavO7D8KSqcGJtxLJI/R/F7s/Spu', '1983-02-01', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2024-02-22'),
(7117, ' Brian Miguel', 'Acosta Martinez', 'Senderos de San Isidro', 'D', 'Operador General', '1', '127576', '$2y$10$9lYaRiiu7OlnLkZMc0YQbe7Nwu.d.LMogBVl17rOzFn3aL4XjsSOC', '2003-03-01', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-02-22'),
(7118, ' Angela', 'Pedro Carrera', 'Valle de Allennde', 'D', 'Operador General', '1', '127577', '$2y$10$PcM/s7hAsMvU/RFgihT9hOcY9h3CnbdbbBvoFtdO3ZPsACF//OHRW', '1995-07-02', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2024-02-22'),
(7119, ' Mario', 'Sanchez NuÃ±ez', 'Misiones del Real', 'D', 'Tec Esp en Mtto Equipo', '1', '127640', '$2y$10$piMSc0vK6nHQ1lzqcIvcnua4sqZPIgwCwJ.X3p6pB/m2sTo7M9ofq', '1992-01-19', 'Mauro Sanchez', '61715', 'HUS', '2024-02-26'),
(7120, ' Mario Alberto', 'Araujo Ramirez', 'Salvarcar', 'D', 'Materialista', '1', '127641', '$2y$10$kDvWtOb0d34aPTYApOKRee/SUiJKoTnWqQUNKP0gHp2WWBkixEK0e', '2001-12-21', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2024-02-26'),
(7121, ' Geovanni', 'Olvera Rojas', 'La Enramada', 'D', 'Tecnico Manto Edificio', '1', '127643', '$2y$10$bAx/.Dmr.DfnbVf5SA8nj.1eAnWwjxkiTeEWuzykisQ/1ghc2MLka', '1996-07-02', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2024-02-26'),
(7122, ' Orlando', 'Romero Gonzalez', 'Campestre Virreyes', 'D', 'Tec Esp en Mtto Equipo', '1', '127677', '$2y$10$95l/3fYFlRvUiaShyC28cO50hDTiPU8m3MUlRB5dHFTF9B6WYGdju', '1982-05-05', 'Mauro Sanchez', '61715', 'HUS', '2024-02-29'),
(7123, ' Edgar Alejandro', 'Palacios Requejo', 'Praderas del Sur', 'D', 'Tecnico Manto Edificio', '1', '127678', '$2y$10$9RqF22EHPZXD/SYRmKiIqOJmZTIvzNLj9xK6dowQ.tYQbWG6QgYEK', '1996-10-30', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2024-02-29'),
(7124, ' Daniel Edson', 'Ibarra Sanchez', 'Hdas de las Torres', 'D', 'Tec Esp en Mtto Equipo', '1', '127712', '$2y$10$3eoeiAd0joreChsAIVeZ.uY3efgdzjU6utjYFBMfbmWt.CnNntfJe', '1993-10-08', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2024-03-04'),
(7125, ' Jose Ines', 'Guevara Rayos', 'Complejo Cielo', 'D', 'Jefe de Grupo', '1', '127721', '$2y$10$CHCe6Q7kw3nPtwryPaVEles2qK4jpMMsJi1DIbRrH1N0.Edo6K/CO', '1974-04-20', 'Ordaz Martinez, Juan Luis', '24710', 'HUS', '2024-03-04'),
(7126, ' Jonathan Misael', 'Lara Baylon', 'Parajes del Sur', 'D', 'Operador De Procesos', '1', '127821', '$2y$10$TRvBmV5lC4nHdZTo7eTTk.ULgA24bXrtFtmtD.l4Jz9yNKi8kj.h.', '2003-03-27', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2024-03-11'),
(7127, ' Kevin', 'Rodriguez Sanchez', 'La Mesa', 'D', 'Operador General', '1', '127822', '$2y$10$0x2hyWzGyYF.L/05FRGgMe5Xj02PMFSPnQjcXhzNEW1nQCAfrde2m', '2005-08-24', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-03-11'),
(7128, ' Mario Alberto', 'Lopez Rosario', 'Aguilas de Zaragoza', 'D', 'Operador De Procesos', '1', '127824', '$2y$10$6Tjg7si8t/d3bRbPCVUDi.94CZJP3cz.DGQx9lmLZLdCS9O4Wmxz.', '1992-01-08', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-03-11'),
(7129, ' Belem', 'Martinez Hernandez', 'El Fortin', 'D', 'Operador General', '1', '127825', '$2y$10$8uGgt5s3EmTAUm7dhVjm8.i8vIBPGrBbBRvx7jaOhuUA8xB26Pru.', '1996-12-15', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-03-11'),
(7130, ' Juana', 'Valentin Perez', 'Cerradas de Alamo II', 'D', 'Operador De Procesos', '1', '127913', '$2y$10$iTnBshpvhdDl3R.O5fYbW.2w/hDVq546Inl9MMVEkQY.L3znTHzA.', '1998-02-08', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-03-18'),
(7131, ' Emmanuel', 'Flores Tlapa', 'Carlos Chavira Becerra', 'D', 'Operador De Procesos', '1', '127914', '$2y$10$F6kjuH5uJJMK8UJ.KRl5lu3JK/GgmsGMbJFUwoZKD8vIzulWpdEy6', '2000-12-14', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-03-18'),
(7132, ' Veronica', 'Venegas Aguirre', 'Segunda Burocrata', 'D', 'Tecnico Control de Inventarios', '1', '128128', '$2y$10$wN6.B9zx3diZ578HLH/VgO/LtnWVA36HRFdrdQMHVKT/xRIgxhoiK', '1998-04-27', 'Gustavo Eduardo Muro Soto', '101050', 'HUS', '2024-04-01'),
(7133, ' Israel', 'Guzman Acosta', 'Manuel J. Clouhtier', 'D', 'Inspector Control de Calidad', '1', '128129', '$2y$10$JY.EoMCaOEAt2NdBSxIT/.1s3lYizKfB98gciS3mi5swRgFoD0eS.', '2001-05-19', 'Maria De Los Angeles Jurado Ra', '71575', 'HUS', '2024-04-01'),
(7134, ' Genaro Alonso', 'Casillas Diaz', 'Riberas del Bravo 3', 'D', 'Tec Proceso de Moldeo Die Cast', '1', '128254', '$2y$10$k1nyDH0uWbbR7zIl10rUIeraZHovxNE9ySnjwqKosf/inQnn/eLeW', '1999-03-06', 'Gustavo MacÃ­as Sandoval', '73857', 'HUS', '2024-04-11'),
(7135, ' Ricardo', 'Varela Arambula', 'Terranova', 'D', 'Operador de Set Up', '1', '128258', '$2y$10$NpbJmi5UuJCZcsWlZ633vuVO7FMso7ru1sCccSXXOSFn/bWoCcQq6', '1987-08-08', 'Raymundo Fernandez Delgado', '71226', 'HUS', '2024-04-11'),
(7136, ' Monserrat', 'Ramirez Echeverria', 'Villas de Alcala', 'D', 'Operador De Procesos', '1', '128331', '$2y$10$fclbdOrbJZxeZuCfmFeGsuTNQ7BrWa5S4Q/lvnsZIcJFfSQobdNw6', '1998-10-29', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-04-18'),
(7137, ' Jose Geovanny', 'Reyes Reyes', 'Oriente Real del Desierto', 'D', 'Operador De Procesos', '1', '128334', '$2y$10$gdgxya.mRNagdcD3T5VYt.0Lvoq.W8IbcRSncycq/fYxt4lziXgz2', '2001-06-21', 'Velarde Inostroza Enrique', '71208', 'HUS', NULL),
(7138, ' Jose Adan', 'Castro Triana', 'Urbi Quintas Granada', 'D', 'Tec Mtto Equipo de Moldeo', '1', '128362', '$2y$10$oIpd0xgGmk6fQbDIh9fy7ejWR3MU.ACOSz9aL4PLcCIgqzAOQEg4C', '1974-09-30', 'Castro Molina, Jesus', '46787', 'HUS', '2024-04-22'),
(7139, ' Alma Yuliana', 'Alejandro Vera', 'Manuel Clouhtier', 'D', 'Operador De Procesos', '1', '128365', '$2y$10$wIdUj.M2jABwLyhhCv4DBei.UipdQa7NZTuEVBfkIZn.eZGPJOfhS', '2001-02-04', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-04-22'),
(7140, ' Alberto', 'Andrew Valenzuela', 'Oriente Zaragoza', 'D', 'Almacenista', '1', '128368', '$2y$10$ypoQXp/e55dgcsnLOFdXZu/o6oMgzYzynBOmYOs46aUIdqgdqe1h6', '1988-01-22', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2024-04-23'),
(7141, ' Luis Carlos', 'Adame Morales', 'Cerrada de la Providencia', 'D', 'Almacenista', '1', '128369', '$2y$10$55Bu5gnaTsRv3AULXL2kie1KLUbtAQ1RgtNVvWiIKlO.CWeQ1xfiK', '2002-05-26', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2024-04-23'),
(7142, ' Rosario', 'Gutierrez Gutierrez', 'Arecas Fraccionamiento', 'D', 'Operador De Procesos', '1', '128537', '$2y$10$AM/XrteBu5TnLd4k3FIKTe6EwofCckzmelPaF8jvCsXZIcZ1albQi', '1996-02-24', 'Saul Arellano Escobar', '97722', 'HUS', '2024-05-09'),
(7143, ' Jonadab', 'Hernandez Lopez', 'Lomas del Valle', 'D', 'Operador De Procesos', '1', '128538', '$2y$10$4CnljeUIREdHVnJpl6VNG.bBLS0TAbFpS0WqpE.xRcng2TfSpogYS', '1986-09-18', 'Saul Arellano Escobar', '97722', 'HUS', '2024-05-09'),
(7144, ' Gustavo Angel', 'Flores Mendoza', 'Paraje de San Juan', 'D', 'Operador De Procesos', '1', '128539', '$2y$10$decP7xQDq2uM7xzH5lZdmOWRkZBGZPPEpuRx0VJraH8BvYUSIsqaS', '2002-05-19', 'Saul Arellano Escobar', '97722', 'HUS', '2024-05-09'),
(7145, ' Areli Guadalupe', 'Garcia Alvarado', 'RIveras del Bravo', 'D', 'Operador De Procesos', '1', '128540', '$2y$10$N/0W5ZHjOuneZpa3PR.SkuT7vOa2hKC3orfgHnD7uQHLdNs16K1xm', '1997-11-12', 'Saul Arellano Escobar', '97722', 'HUS', '2024-05-09'),
(7146, ' Luis Gerardo', 'Rivas Chavez', 'Carlos Castillo', 'D', 'Operador De Procesos', '1', '128541', '$2y$10$CyPX4SN12Hw2PbKOa0s9Q.w4VPAHyvEihTlZVLL/ZGkPtFnwksHpG', '1999-06-29', 'Saul Arellano Escobar', '97722', 'HUS', '2024-05-09'),
(7147, ' Martha Emilia', 'Luna Salvador', 'Urbivilla Bonita', 'D', 'Operador De Procesos', '1', '128545', '$2y$10$qHLYsJVZ36.eR1pUAmK.Pe2NL6iXgdPrJae.L575QafZ6A0r.ipje', '1992-07-18', 'Saul Arellano Escobar', '97722', 'HUS', NULL),
(7148, ' Karen Beatriz', 'Vazquez Alcantara', 'Las Haciendas', 'D', 'Operador De Procesos', '1', '128575', '$2y$10$clHtmfMamyJZsZp1JOqS/uuhWmE5t1Kk7.cehYy48nt/5Zs25pBCC', '1993-08-20', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-05-13'),
(7149, ' Jocelyn', 'Hernandez Salinas', 'Las Haciendas', 'D', 'Operador De Procesos', '1', '128576', '$2y$10$B0iyfFV43/JN0oFV.lPTsuUX8Ml4SPjFHFvW1Zf7Qi1PV6IpjqMaa', '1995-12-30', 'Saul Arellano Escobar', '97722', 'HUS', '2024-05-13'),
(7150, ' Yair', 'Maximo Alejandro', 'La Enramada', 'D', 'Operador De Procesos', '1', '128577', '$2y$10$CcylIJEq3XLrZ6CokrPD1eu5FZK1kDLWS/0xb7CpkhM3xCTgWQVQi', '2002-03-23', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-05-13'),
(7151, ' Juan Antonio', 'Rios Castro', 'Cerrada de Oriente', 'D', 'Operador De Procesos', '1', '128578', '$2y$10$OczjDlR.IEkbOwFUroSG0.RLTnk0cDmIAdNjm/TIO5K5hPex2PMse', '1976-10-14', 'Saul Arellano Escobar', '97722', 'HUS', '2024-05-13'),
(7152, ' Elvira Alejandra', 'Arzavala Arzavala', 'Paraje del Sur', 'D', 'Operador De Procesos', '1', '128601', '$2y$10$5EbqBJp3oahp/nHp.UHgQer/TBsxLpOiTM18DMDiMQhz92AVoqgsm', '1985-01-11', 'Saul Arellano Escobar', '97722', 'HUS', '2024-05-14'),
(7153, ' Fernanda Montserrad', 'Recio Rodriguez', 'Parajes del Sur', 'D', 'Operador General', '1', '128602', '$2y$10$WSHb/PWmqZqkYjgeFOR.NOrNNzaLXl5EMkhgrAoZub2bpmA0s/4FC', '1996-03-02', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2024-05-14'),
(7154, ' Erika Daniela', 'Gonzalez Gonzalez', 'Hacienda de las Torres', 'D', 'Operador General', '1', '128603', '$2y$10$qSiL1LH6XJuztB068nBD9eRG0nlzGJHr81b5j9vP3Eoook0WE4J7O', '1982-03-29', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2024-05-14'),
(7155, ' Maria Dolores', 'Guerrero Rojas', 'Paraje del Sol', 'D', 'Operador General', '1', '128604', '$2y$10$5/iKXYB0ugyD13N8tgNeyufAt7oUqcliowMeAA8B/ULSfbpUMYVQW', '1985-01-27', 'Diaz Verdeja, Jose Refugio', '24705', 'HES', '2024-05-14'),
(7156, ' Pascual', 'Ascencion Jimenez', 'Oriente Patria', 'D', 'Operador General', '1', '128605', '$2y$10$qmaE393Hp/2ED71xSaCLve.zBx5YIqBUS5M5DcbQ0fhFwKfjwkO5O', '1984-05-17', 'Ramon Montes NaÃ±ez', '75649', 'HES', '2024-05-14'),
(7157, ' Joana Lizeth', 'Flores Nava', 'El Fortin', 'D', 'Operador General', '1', '128732', '$2y$10$yGwV0GHwb/sgtozwbpxVFewntML0sZNjdjF7dk/TPu1OAdlpSmipK', '2003-04-24', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-05-27'),
(7158, ' Edwin Santiago', 'Franco Orozco', 'Las Haciendas', 'D', 'Operador General', '1', '128733', '$2y$10$sELIpij2Utdwz/XTN9hX9u8TwSDylLnfGlPvZq9TipQYQYzec1XJy', '2005-08-03', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-05-27'),
(7159, ' Valeria', 'Perez Luna', 'Parajes del Sur', 'D', 'Operador General', '1', '128735', '$2y$10$Rkjc5IOOeA/OCZE9hYttpeKYRriqR/CBIypETjUBOpZ48Nw2XMdXW', '1993-01-29', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-05-27'),
(7160, ' Victor Gerardo', 'Arciniega Banda', 'Sur Vista del Valle', 'D', 'Operador General', '1', '128736', '$2y$10$jxnNmF/FlcLCSKK/hfQFf.rRF99vlBzk5LI8INnYS7o9H5imr9YEW', '1992-11-30', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', NULL),
(7161, ' Maria Del Pilar', 'Gonzalez Cervantes', 'Manuel Valdez', 'D', 'Operador General', '1', '128738', '$2y$10$S9..RLqerb3mpOtuTNXhE.z7TEOj2fAjwRHkE/nv6K8sTp25c/ddK', '1999-06-06', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2024-05-27'),
(7162, ' Gisela Guadalupe', 'Lopez Hernandez', 'Terrenos Nacionales', 'D', 'Operador General', '1', '128739', '$2y$10$iD3hhsm.uW573n.cv7V9cuV7GYDbrXtC6TADqhjBL2H/DrPjs0Vwe', '2000-06-26', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2024-05-27'),
(7163, ' Sarai Deyanira', 'Reverte Hernandez', 'Mediano', 'D', 'Operador General', '1', '128740', '$2y$10$megN4HzSrgTjse/8gJObuOMb9TFkNctWTx/gdcpODJL4LmDNsW.MW', '1992-09-27', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-05-27'),
(7164, ' Brenda Liliana', 'Machado Guardado', 'Torres del Sur', 'D', 'Operador General', '1', '128741', '$2y$10$6NTkCWPs4033rj0AReOzlemixSrSLORZPN5kYaBaFOQDmgrzPdTLK', '1987-05-16', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2024-05-27'),
(7165, ' Sirli', 'Uscanga Nieves', 'Riveras del Bravo', 'D', 'Operador General', '1', '128742', '$2y$10$66I2rWuo/Whzm1qDy17SFuMQaRMfQ4EPMFKWoNF8AHfFn6XnIM1u6', '2002-09-04', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2024-05-27'),
(7166, ' Edith Alejandra', 'Paredes Escamilla', 'Praderas del Sol', 'D', 'Operador General', '1', '128744', '$2y$10$gQsXLR0Nl0zOXRF2ExEMxunmUeVOiFBLR.u0fkYoZY3DVmVKOu4Pi', '1994-04-10', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-05-27'),
(7167, ' Yoselin', 'Alor Flourenz', 'Urbivilla del Cedro IV', 'D', 'Operador General', '1', '128745', '$2y$10$nfscAzeMcmjos2WV5/pA.u2iRQHqgfRGXU.SiXgtHg1UpWUTsb7uW', '2003-12-11', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-05-27'),
(7168, ' Ivonne Jatziry', 'Duran Minjares', 'Eco 2000', 'D', 'Operador General', '1', '128746', '$2y$10$YwZQB2Er.vB3E/FB0V6cuuvSBxxAGP.zwAsA6EzUIsQUfBZiW0NaS', '2003-11-22', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-05-27'),
(7169, ' Uriel', 'Hernandez Morales', 'Arenales', 'D', 'Operador General', '1', '128748', '$2y$10$0QEsLiouMU6kt62OG4/ZAuJI/aWjbnP7IOA2xtcWeAFey4nHo32ky', '2002-08-27', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2024-05-27'),
(7170, ' Maleni Betzabel', 'Casillas Arenas', 'Bosques de Salvarcar', 'D', 'Operador General', '1', '128749', '$2y$10$B.HWvBJIHAxXL..TkdnmSOKrMPOLc6d6FVBJXjPGYWfGTPN4GK3iW', '1991-10-23', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-05-27'),
(7171, ' Maria Guadalupe', 'Ojeda Sanchez', 'Lomas del Valle', 'D', 'Operador General', '1', '128750', '$2y$10$W9ihoCKBi.lLJ87qfd29d.KTJIsh1mJ/a5DRrrQD.c2TqFhVimQbO', '1994-04-11', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-05-27'),
(7172, ' Mayra Beatriz', 'Garcia Barraza', 'Urbivilla del cedro II', 'D', 'Operador General', '1', '128751', '$2y$10$0/52ljg6SpceTzGNHDiGeuzcMyDtcxUv.avTTnyPO53M7rxeheVT6', '2002-10-12', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-05-27'),
(7173, ' Jessica Alejandra', 'Arenivas Carrillo', 'Lomas Del Valle', 'D', 'Operador General', '1', '128752', '$2y$10$5WMtEkQ0/1EyM.Urhg2qLur43HBCKRkCKmRiFeg/huMLm1.3S/LH2', '1992-04-19', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-05-27'),
(7174, ' Beatriz', 'Rosales Morones', 'Urbivilla Bonita', 'D', 'Operador General', '1', '128753', '$2y$10$z1vlI69OYqlFhBFK3Os8yOZZaqDRNFjdwyb024F85pN7o8NL.O5/G', '1996-02-29', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-05-27'),
(7175, ' Hilario', 'Cruz Mancha', 'Parajes de Oriente', 'D', 'Operador General', '1', '128754', '$2y$10$kIE4fCwXaTnLHwdlyy72.elObYt8u.K0ZbWET9IGSDaZvOq6ltnCC', '2001-07-17', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-05-27'),
(7176, ' Juan Arturo', 'Leon Garcia', 'Paraje de Oriente', 'D', 'Operador General', '1', '128756', '$2y$10$PlYayJc.z5oZaHELfy0sY.s2hz9veN2ULawRBn660oiCjMLYIfFB2', '1999-04-04', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-05-27'),
(7177, ' Eulalio', 'Gomez Santiz', 'Ejido Sauzal', 'D', 'Operador General', '1', '128757', '$2y$10$VW3xu1SljKcMVaHHDrBeS.dsDjjA.UovVZLFI76gA50hQ26A4k3cy', '2003-12-01', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-05-27'),
(7178, ' Severo', 'Salas Sosa', 'Hacienda de las Torres', 'D', 'Operador General', '1', '128758', '$2y$10$Ax2kh//4SMBqDOFJkyGWT.jeP22wngx3JhZN2afdToSifs.TnVWW6', '1992-10-25', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-05-27'),
(7179, ' Cristian', 'Perez Juarez', 'Hacienda de las Torres', 'D', 'Operador General', '1', '128760', '$2y$10$of6QDEY6BKVq6uqxkSZaYuxEFvEY..eBl1M2i1kz9loqTUDjBfawy', '1994-10-29', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-05-27'),
(7180, ' Lucia', 'Lucas Cruz', 'Riberas del Bravo', 'D', 'Operador General', '1', '128761', '$2y$10$YlEKkbF2cdMIHFTIRRkix.2IwRVpcryl7tnNJukAGPSc/y3tmR6XS', '1995-04-19', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-05-27'),
(7181, ' Karime', 'Flores Zepahua', 'Simona Barba', 'D', 'Operador General', '1', '128762', '$2y$10$HL2s0KVcRNdARAgEnhO0julhRF0B30ChKHK9rlQ3Ik9g.cItoyFG.', '1998-04-11', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-05-27'),
(7182, ' Astrid Melissa', 'Rodriguez GarcidueÃ±as', 'Praderas del Henequen', 'D', 'Operador General', '1', '128763', '$2y$10$IXq8RdUZ33teA7m7k7TTPubOoJzpoWcjiEsrs.WWcCCkmoM0zshfC', '1997-02-09', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-05-27'),
(7183, ' Lizzeth', 'Jose Gonzalez', 'Paraje de Oriente', 'D', 'Operador General', '1', '128764', '$2y$10$jgcYqRd8VX6Gmv9Ggyn9A.zXAtlzMXwNqFbVBYMTSw.k19RncPd2.', '1998-12-08', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-05-27'),
(7184, ' Edith Coral', 'Aguilar Rivera', 'Paraje de San Isidro', 'D', 'Operador General', '1', '128765', '$2y$10$49KnKtJf/68J7XlCuutYbumgl/1UPlzOZ.vRBtOKqtQ1x2u/uhqx6', '1998-01-19', 'Jesus Francisco Moreno Banda', '69340', 'HUS', NULL),
(7185, ' Ernesto', 'CastaÃ±eda Romero', 'Paraje de Oriente', 'D', 'Operador General', '1', '128767', '$2y$10$IKNLGc/vk1QZxuCV7N5vSuHuxouU.dlUyjkv26e6s6TMcwCC4LJHy', '1991-02-02', 'Fabiola Ramon', '84289', 'HUS', '2024-05-27'),
(7186, ' Maribel Sarahi', 'Leyva Novella', 'Arecas', 'D', 'Operador General', '1', '128768', '$2y$10$JIwfYdGmzUnJiLHW32nWwu6YmA.o2qUNSpWmvv.3oSRWzOB1A8.1y', '1993-04-08', 'Fabiola Ramon', '84289', 'HUS', '2024-05-27'),
(7187, ' Oscar Alejandro', 'Blanco Gutierrez', 'Paraje de Oriente', 'D', 'Operador General', '1', '128769', '$2y$10$emPzfgiF4bFQwsp5iqRIVuP4.OY7iVzFA1OfjkBuML06nD2ARmKtS', '1990-05-08', 'Vania Garcia', '100540', 'HUS', '2024-05-27'),
(7188, ' Yeimi Azucena', 'Garcia Guzman', 'Hacienda de las Torres', 'D', 'Operador General', '1', '128770', '$2y$10$HL0FcLK2QIhZ.cAVEuIGRuwtwuIPwhvgKUym5jSOYnBqagpG44NDy', '1994-04-08', 'Fabiola Ramon', '84289', 'HUS', '2024-05-27'),
(7189, ' Viridiana', 'Garcia Guerrero', 'Paquime', 'D', 'Operador General', '1', '128771', '$2y$10$jbOp7/0XIS/7Ku40BbnTzusdTgCWQbfew5MMWAx.QagviAEbPRAaG', '2005-04-15', 'Fabiola Ramon', '84289', 'HUS', '2024-05-27'),
(7190, ' Bryan Alejandro', 'Salazar Valdez', 'Eco 2000', 'D', 'Operador General', '1', '128773', '$2y$10$mi7GGi3vrJs2kSEbH9ub5e.r6ZdnP305NlBk0xlMkyx4EWtoBi4by', '2000-07-19', 'Fabiola Ramon', '84289', 'HUS', '2024-05-27'),
(7191, ' Genesis Rubit', 'Hidalgo Arellano', 'Rinconada de las Torres', 'D', 'Operador General', '1', '128774', '$2y$10$MXNpvObuxF5HlB1EmBg08OUKujPkKqgoJBaRYYV/qcbVzzZTr3u3i', '1994-07-20', 'Vania Garcia', '100540', 'HUS', '2024-05-27'),
(7192, ' Margarita', 'Alarcon Ortiz', 'Urbivilla del Cedro', 'D', 'Operador General', '1', '128775', '$2y$10$pW83UfzSkzsommUxeqMmlOWEauhnDcrHVWllvMNldHSlKp/kfc7WS', '1992-05-15', 'Fabiola Ramon', '84289', 'HUS', '2024-05-27'),
(7193, ' Estela', 'Torres Garcia', 'Simona Barba', 'D', 'Operador General', '1', '128776', '$2y$10$vEoijR2RF9U3/X1Y9Y3utOG2ljzyKd/D4V/F6ou7KFbKbwLNyFanm', '1988-05-11', 'Vania Garcia', '100540', 'HUS', '2024-05-27'),
(7194, ' Alma Josefina', 'Morales PiÃ±a', 'Riveras del Bravo', 'D', 'Operador General', '1', '128778', '$2y$10$EHePnNleMoFZAaPWaFx.tu9uiFxJeM3if0zMQuWsaPcdImiJCg4pm', '1994-08-24', 'Fabiola Ramon', '84289', 'HUS', '2024-05-27'),
(7195, ' Irvin Edgar', 'Arellanos Neri', 'Medanos', 'D', 'Operador General', '1', '128780', '$2y$10$EaQUSmNy2JMkAME4W12VQ.ArtIGxu.Kv7BITfMT/5pDg4Q3tqmXhG', '1995-01-21', 'Fabiola Ramon', '84289', 'HUS', '2024-05-27'),
(7196, ' Eva Ninel', 'Paulo UreÃ±a', 'Cerradas San Pedro', 'D', 'Operador General', '1', '128781', '$2y$10$8Ce4.sv7RdvQ5o2gSolBMegyB1qSx2ObgRhL79WdY2tg0eACJiVOG', '1990-01-18', 'Fabiola Ramon', '84289', 'HUS', '2024-05-27'),
(7197, ' Alejandra', 'Arellano Cuevas', 'Oriente Paraje del sur', 'D', 'Operador General', '1', '128782', '$2y$10$qTguKngb.XJzqUgGUKar3.sQc/pJgUdDPh3SJOlxkazsetfxVKtH6', '1997-04-25', 'Fabiola Ramon', '84289', 'HUS', '2024-05-27'),
(7198, ' Cutberta', 'De Jesus Martinez', 'Villas de Salvarcas', 'D', 'Operador General', '1', '128783', '$2y$10$L.Unoaa5uGrRNLCdDUtUaO0qefPjI873GJu.fGDh5CWPZpFi9c0CG', '1985-12-29', 'Fabiola Ramon', '84289', 'HUS', '2024-05-27'),
(7199, ' Karen Paola', 'Hernandez Salas', 'Riberas del Bravo VIII', 'D', 'Operador General', '1', '128785', '$2y$10$l21BmP5YoLzKREUpSyCuqutGdb2ejMIw8FOr7nIYvCgQIW8tyxOL.', '2001-05-18', 'Fabiola Ramon', '84289', 'HUS', '2024-05-27'),
(7200, ' Alenis Michel', 'Santillan Flores', 'Portal del Roble', 'D', 'Operador General', '1', '128786', '$2y$10$TyoB75jUAN6fL9jCw00t/OXndJ.XPa5y4hpHnWTEjLf7F7ed8V5yG', '1999-06-26', 'Fabiola Ramon', '84289', 'HUS', '2024-05-27'),
(7201, ' Leidi Patricia', 'Romero Merida', 'Paraje de Oriente', 'D', 'Operador General', '1', '128787', '$2y$10$/IE5GtNCY9b8wBI4B22TAOM7Tm5JZ7bQTO67q0KdiVdsjnVJD9iIS', '1999-03-17', 'Fabiola Ramon', '84289', 'HUS', '2024-05-27'),
(7202, ' Delia Patricia', 'Enriquez Bailon', 'Tierra Nueva', 'D', 'Operador General', '1', '128788', '$2y$10$y8qr1RoYs1/pZWRH.W4z2euo4MHbYmhBDU0FdDwusUWPHll5F3zze', '1989-01-04', 'Fabiola Ramon', '84289', 'HUS', '2024-05-27'),
(7203, ' Victor Hugo', 'Sanchez Gutierrez', '15 de Enero', 'D', 'Tec Esp en Troqueles', '1', '128790', '$2y$10$49ZrFKYijZxG8m7XrHYap.Uyf05uoiWo7YkWljMz1GY3xQ3njHyc.', '1998-07-14', 'Favela Alvarado, Jose Luis', '25333', 'HES', '2024-05-27'),
(7204, ' Elias', 'Castro Dias', 'Terranova', 'D', 'Operador General', '1', '128805', '$2y$10$.oihCImNhTVlX6AKpCo4qui4QKRru7uCYeqgo6D3syDkmV.oQcPnO', '2003-11-04', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-05-28'),
(7205, ' Margarita', 'Armas Cruz', 'Parajes del Sur', 'D', 'Operador General', '1', '128806', '$2y$10$7XVwKpyKG7RcsI1CEPIJke7pzl3oVI755hkX6aT8zVl3Dmm2UDUCC', '1987-01-01', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', '2024-05-28'),
(7206, ' Tomas', 'NuÃ±ez Ramirez', 'Parajes del Sol', 'D', 'Operador General', '1', '128807', '$2y$10$ySp2i1z5wFIYEyoAKgqyOON1YcwVQykQOrRUPxvIGtHOLg72ekd7q', '1993-07-02', 'Briseida Bautista Tolentino', '300011', 'HUS', '2024-05-28'),
(7207, ' Gabriela Fabiola', 'Serrato Villafranca', 'Fernando Baeza', 'D', 'Operador General', '1', '128809', '$2y$10$US6I/cQrRr.LKiSu0cpMoOoA.4TsSBlS3kCs9KxyIj.zYYuSwQCee', '1987-06-02', 'Briseida Bautista Tolentino', '300011', 'HUS', '2024-05-28'),
(7208, ' Daniela', 'Chavez Rosas', 'Urbivilla del Cedro', 'D', 'Operador General', '1', '128812', '$2y$10$PE0KEi0FFcKOfEuZ2sZjlOJ7odje8AExd7rfk1n6XVk/6QixeO4Dq', '2004-10-30', 'Briseida Bautista Tolentino', '300011', 'HUS', '2024-05-28'),
(7209, ' Elida', 'Nino Pacheco', 'Paraje del Sur', 'D', 'Operador General', '1', '128814', '$2y$10$362KIrYJQTdFpJaJ.qxlG.PrPlIwJlLUQj/Pxs5zk5va/xefyHn2e', '1983-12-15', 'Briseida Bautista Tolentino', '300011', 'HUS', '2024-05-28'),
(7210, ' Esteban', 'Cabrera Cansino', 'RIveras del Bravo', 'D', 'Operador De Procesos', '1', '128815', '$2y$10$EGD87TD4v15CROqYzoaNCuN6kfgMhDyS2uPmbCNw2a03bWx2uG16y', '1998-05-29', 'Saul Arellano Escobar', '97722', 'HUS', '2024-05-28'),
(7211, ' Rosa Isela', 'Rios Mateo', 'Riveras del Bravo', 'D', 'Operador General', '1', '128816', '$2y$10$PZTsoGGS/b2EnMuYQibplO8ahfxq.Tl3gvzAIou34SbPTQ4nVpJCK', '1998-01-11', 'Fabiola Ramon', '84289', 'HUS', '2024-05-28'),
(7212, ' Jose', 'Rios Hernandez', 'Riberas del Bravo VIII', 'D', 'Operador General', '1', '128818', '$2y$10$17p9yPu.fTxH6lIBw/NHveiTDZ1aPQRWtyAaSuNC7bh4PTmMBkfy.', '1991-01-03', 'Fabiola Ramon', '84289', 'HUS', '2024-05-28'),
(7213, ' Elizabeth', 'Martinez Rodriguez', 'Paraje de San Isidro', 'D', 'Operador General', '1', '128819', '$2y$10$Xd7185/pp4FcwL7UmLegk.w6.sncpeYXWmWVqphyRnjGVlkTDx8zi', '1993-02-26', 'Vania Garcia', '100540', 'HUS', '2024-05-28'),
(7214, ' Nidia Edith', 'Sanchez Cruz', 'Urbivilla Bonita', 'D', 'Operador De Procesos', '1', '128820', '$2y$10$.Jinad7yqaDPPUqpkyYCpuGu9fgMU1U074aDRp11Ep3ApILWu5YS6', '1993-06-15', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2024-05-28'),
(7215, ' Maricela', 'Martinez Aguilar', 'Sor Juana Ines de la C', 'D', 'Operador General', '1', '128821', '$2y$10$xz4PjLeCAznwZsO0c0dekeRdVKBbQnS7OQapZvlp9/2pqzxnq5s7G', '1992-05-15', 'Fabiola Ramon', '84289', 'HUS', '2024-05-28'),
(7216, ' Jose Ivan', 'Ramirez Rios', 'Paquime', 'D', 'Operador General', '1', '128822', '$2y$10$kpBXL9Krt2LTmQBskgYWOOyvxgLIY6gExnb5X9ylVgNNZQ2uacJAW', '2001-04-16', 'Fabiola Ramon', '84289', 'HUS', '2024-05-28'),
(7217, ' Aurea', 'Leon Chavez', 'Las Haciendas', 'D', 'Operador General', '1', '128824', '$2y$10$tG2F9dTAdlRqXA7cDsNLFuEetc4PfhJbkQ.FN2Gv4L/4QigiOZFBS', '1999-11-04', 'Fabiola Ramon', '84289', 'HUS', '2024-05-28'),
(7218, ' Alma Rosa', 'Milan Santillan', 'Paraje del Sur', 'D', 'Operador General', '1', '128832', '$2y$10$J2iyjGJfbsyaglVxNkX2MeWBCwc3Qki73XQzvTMTG3dPR2Qw9ajtC', '1982-05-08', 'Fabiola Ramon', '84289', 'HUS', '2024-05-28'),
(7219, ' Yuliana', 'Nolazco Nolazco', 'Paraje del Oriente ', 'D', 'Operador General', '1', '128835', '$2y$10$YIRnRzANGEgDl3J.Q92KOerqn5TAHa.ILXBeWbSEjvc2BZsyBMxeC', '1983-04-03', 'Gonzalez Lopez, Alfredo', '26334', 'HUS', NULL),
(7220, ' Jose Angel', 'Rivera De Jesus', 'Cerradas San Mateo', 'D', 'Operador General', '1', '128836', '$2y$10$4MIxFM3iWAXP3jugxYATne78jHuv6VfIo1WGy9Wnf6rf/NDN7EGSy', '2004-04-12', 'Briseida Bautista Tolentino', '300011', 'HUS', '2024-05-29'),
(7221, ' Brenda Berenice', 'Chacon Ibarra', 'Sur Colonial del Sur ', 'D', 'Operador De Procesos', '1', '128840', '$2y$10$raqdCtGHt4WAEbk7VBGoxe3XuVXdyi6OhuAciO9YvN493w7ST1/KK', '1993-06-05', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', NULL),
(7222, ' Sofia Mayte', 'Garcia Garcia', 'Paraje del Sur', 'D', 'Operador General', '1', '128842', '$2y$10$PatRhIhrG6BIrs6i2rJrFeqyvNB0VqWhhNo/0csnxLazAaZHKza52', '2001-02-28', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2024-05-29'),
(7223, ' Mayra', 'Hernandez Fernando', 'Villa Bonita', 'D', 'Operador General', '1', '128843', '$2y$10$i42Fx4uwxbMAwFVgxBTt/OehWBEOYCNZfDAsIwFop8Kc6D9k5/wxy', '1992-06-15', 'Eduardo Ivan Heredia Bernal', '104824', 'HUS', '2024-05-29'),
(7224, ' Perla Lizeth', 'Zamora Rodriguez', 'Cerradas del Sur I', 'D', 'Operador General', '1', '128844', '$2y$10$WRvAmvGniBuB8fu.ZelcoOCRMkGew8uQ7fzefjzCJL8HexhWDM7Re', '1998-12-01', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-05-29'),
(7225, ' Alondra Elizabeth', 'Vargas Castellanos', 'Aguilas de Zaragoza', 'D', 'Operador General', '1', '128845', '$2y$10$M1UT91eWuibaKf1ygREnOO3ViUsbztdWfeJHn4ow6P8ONB8CIF5g.', '1998-12-30', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', NULL),
(7226, ' Cesar Alan', 'SaldaÃ±a Flores', 'Rincon del Rio', 'D', 'Operador De Procesos', '1', '128846', '$2y$10$XleHnlJ7OyQCtRu2w4I6cOZJyMnn3X6FXe9VCNnRhkBFMc9FB8Tiq', '1996-07-28', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-05-29'),
(7227, ' Victor Hugo', 'Isidro Cantor', 'Las Haciendas', 'D', 'Operador General', '1', '128848', '$2y$10$DJEOYOQYiljIrg0qZ3j8Hurccme2ZMXDhmBR6GEpcz7I9ZLsdbCC2', '2004-04-26', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-05-29'),
(7228, ' Natanael', 'Silva Azamar', 'Las Haciendas', 'D', 'Operador General', '1', '128853', '$2y$10$EDkU3mCCY34S.R8cOeXS4.jNcneNWtDnV4FxsbUJqpeIe3EQv571i', '2001-04-20', 'Briseida Bautista Tolentino', '300011', 'HUS', '2024-05-29'),
(7229, ' Jose Antonio', 'Alaffita Hernandez', 'Villa Res del Real ', 'D', 'Operador De Procesos', '1', '128854', '$2y$10$yAVFOoqnjZn.mWwzjhzph.pl9CKtOA2Rrisg.HdKnXZWwJBM5rQF.', '1998-03-19', 'Velarde Inostroza Enrique', '71208', 'HUS', NULL),
(7230, ' Aleydis', 'Riveron Rodriguez', 'Villas de Alcala', 'D', 'Operador De Procesos', '1', '128856', '$2y$10$OwaiN804e4LLANzVAfgy8OaJYYz4JJRwS0hMrYI507YMKX0J51y7K', '2000-03-23', 'Saul Arellano Escobar', '97722', 'HUS', '2024-05-29'),
(7231, ' Monserrat', 'Duran Balles', 'Mezquital', 'D', 'Operador General', '1', '128857', '$2y$10$/8nT4QGjIQNmFKjwMOp2Ku09Wn/8884KZubygRK9UJh/DWxseVpa2', '2005-03-10', 'Rosales Terrazas, Mario Albert', '60889', 'HUS', '2024-05-29'),
(7232, ' Juan David', 'Aniceto Severiano', 'Paraje de oriente', 'D', 'Operador General', '1', '128860', '$2y$10$0mwaZX.L3FVXglwCH.zyqeubymchc6WA2pMP..wjnEn6UHkA4C6Sq', '2004-04-02', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-05-29'),
(7233, ' Lorena', 'Ramirez Montero', 'Riberas del Bravo IX', 'D', 'Operador De Procesos', '1', '128861', '$2y$10$2vUNrAzkgnqi2PIeCeA.iOudKfgFS9d2Shi79X/CmaLWbXYK05qvC', '1992-09-05', 'Saul Arellano Escobar', '97722', 'HUS', '2024-05-29'),
(7234, ' Perla Denisse', 'Gutierrez Gonzales', 'Parajes del Valle', 'D', 'Operador General', '1', '128862', '$2y$10$HAzSz57kFRB1NaokyKlwWO3vK640i1Kf3ZNgbbxCWidZ5m8gkaH6C', '2004-11-09', 'Fabiola Ramon', '84289', 'HUS', '2024-05-29'),
(7235, ' Maria De los Angeles', 'Carreon Marchand', 'Manuel Valdez', 'D', 'Operador General', '1', '128865', '$2y$10$d9epCBv./L86u0UOBS0ARe6xVuyExY4Awo1IKyCEa5vvTr9J5vv4W', '1970-01-14', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-05-29'),
(7236, ' Gricelda Yusilmith', 'Zamudio Soto', 'Aguilas de Zaragoza', 'D', 'Operador General', '1', '128868', '$2y$10$1vJq749O2q9dfNd5Fz3.e.a0XWVMdrFUtgk/aiLJpyQ9TbYtySO/2', '2005-08-23', 'Jesus Francisco Moreno Banda', '69340', 'HUS', NULL),
(7237, ' Edilberto', 'Peres Olan', 'Riberas del Bravo VII', 'D', 'Operador General', '1', '128884', '$2y$10$/k82wy91iuE8lcaHi69fPuqIe3N0IoMh17hxcD6aYcN0N/gbTHycK', '1994-12-04', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-05-30'),
(7238, ' Luis Angel', 'Olivera Dominguez', 'Parajes del Valle', 'D', 'Operador De Procesos', '1', '128885', '$2y$10$c7xwy93mhT8EkABnpL0IueNxbI9xOs0J9PcBwUQmoAFfVvWDD2JX.', '2003-11-02', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-05-30'),
(7239, ' Enrique', 'Vargas Gonzalez', 'Paraje de Oriente', 'D', 'Operador De Procesos', '1', '128886', '$2y$10$zE1g2IkG7ej9YEb66wEM3uRDOB7MzeBDfutsm7lkbEx2/QLQVNWUm', '1998-08-01', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', NULL),
(7240, ' Ana Karen', 'Najera Perez', 'Parajes del Sol', 'D', 'Operador De Procesos', '1', '128887', '$2y$10$4DVl7n4ZEyDYEz/sEDobHO5ja.XEFuQEkmqZx23B6DG8Q6E2tJyYS', '1992-07-04', 'Velarde Inostroza Enrique', '71208', 'HUS', NULL),
(7241, ' Flora', 'Zapot Zarate', 'Hacienda de las Torres Un', 'D', 'Operador De Procesos', '1', '128890', '$2y$10$Fkv3HwpT5MTtI.lYwUYl9OeakHcnmrW5hN8BbRCi4VBb7nDepEe02', '1973-01-21', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2024-05-30'),
(7242, ' Adal David', 'Duarte Talamantes', 'Cerradas del Alamo', 'D', 'Tec Esp En Moldes', '1', '128987', '$2y$10$08xQOobkA8ExI0qR8/S2EuQMKlR.aPP1Y/4de375kjsRSPbIXsXea', '1999-09-05', 'Jaime Estrada Renteria', '77575', 'HUS', '2024-06-10'),
(7243, ' Julio', 'Torres Jimenez', 'Terranova', 'D', 'Tecnico en Ingenieria', '1', '128988', '$2y$10$z3O3ZdMhqKizJpG.Hctby.8CG/jn5SeMnFA6mtvXWMt6vwLIw/mFC', '1991-12-08', 'Hugo Alberto Gurrola Rodriguez', '75403', 'HUS', NULL),
(7244, ' Cynthia Iveth', 'Hidalgo Lozano', 'Parajes del Valle', 'D', 'Operador General', '1', '128999', '$2y$10$og6xMnSiIqSoGknlobTCSuCTU3x6W90CJBnYhYQbSAomAOP3jkLFG', '1984-08-25', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-11'),
(7245, ' Betzabe', 'Ruiz Velasco', 'Paraje del Sur', 'D', 'Operador General', '1', '129001', '$2y$10$QMLpMBrbZBB5kdD3h0t4P.iahdaKqZwmSMBuvGmiCg9zPNmiVzqY6', '2004-12-29', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2024-06-11'),
(7246, ' Amparo', 'CastaÃ±eda Diaz', 'Riberas del Bravo VI', 'D', 'Operador General', '1', '129003', '$2y$10$c0ajXj7XXvIgbF2fVqTjqe6pV0PTNg2ceo88FbOv9dTvOGwj7EnGi', '1998-03-10', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-11'),
(7247, ' Roxana', 'Bustamante Guzman', 'Parajes del Valle', 'D', 'Operador General', '1', '129004', '$2y$10$kbXmfTWYaJvaQHQoOB7HPuL7vTkO1PBvK1NPF29hScFLSgYRR0It.', '1990-07-18', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2024-06-11'),
(7248, ' Lluvia Kareli', 'Rios Pacheco', 'Parajes del Valle', 'D', 'Operador General', '1', '129005', '$2y$10$vdPkiemIu8jCpOPUnQtE0ep..KfM0d9Ja09SmhGfq1ftfsvEhe.U.', '2003-03-27', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2024-06-11'),
(7249, ' Karla Denisse', 'Martinez Valero', 'Portal del Roble', 'D', 'Operador General', '1', '129006', '$2y$10$mx68e14DFKu/3KJf0NwNyOY71dbZVJpYZSljakqZWPzK9AdJxeyhi', '2002-06-03', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-11'),
(7250, ' Daniel Octavio', 'Ramos Garcia', 'Paraje Del Sur', 'D', 'Operador General', '1', '129007', '$2y$10$EeSISGz0qMQiCXKxHpNQlevLP7m/0Q31o.9B3yMtUnbfX8Ba1WnxK', '1999-09-07', 'Lopez Vazquez, Romulo', '61770', 'HUS', NULL),
(7251, ' Diana Laura', 'Ramirez Hernandez', 'Riveras del Bravo', 'D', 'Operador General', '1', '129008', '$2y$10$ssUcZL7MW.D/5mofVZWRve2AOdTmIbXPkZ8BjDkQzesyPaidwkorO', '1998-05-04', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-11'),
(7252, ' Gabino', 'de la Cruz Mendez', 'Puerta del Sol', 'D', 'Operador General', '1', '129009', '$2y$10$tEBk30XNhNEZP1JvA9ESIuLQv1DBJKR1B/b1lPczPVBCt9cx.PvzK', '1994-10-25', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-11'),
(7253, ' Yuri Itzel', 'Aguilar Reyes', 'Privadas Florencia', 'D', 'Operador General', '1', '129010', '$2y$10$9DberdmOHdzGEJBfjzZmYO2roM8jb2gm8hSoS/T2iOuJfNlitHoLa', '1998-11-04', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2024-06-11'),
(7254, ' Jose Luis', 'Sanchez Perez', 'Arecas', 'D', 'Operador General', '1', '129011', '$2y$10$.IjQuMdKoQrMfehqkLFRoOz50Nwf0LX2coEePrqITlslhpQOQKAk2', '1989-02-26', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-11'),
(7255, ' Blanca Esmeralda', 'Rodriguez Rangel', 'Cerradas del Alamo', 'D', 'Operador General', '1', '129012', '$2y$10$GKRXtsQ2WKlr8Fvu3YpIP.5T7XD6r08nYjeuo6w6/bdMLOX5hRAKW', '2000-02-15', 'Lopez Vazquez, Romulo', '61770', 'HUS', NULL),
(7256, ' Erick Joel', 'Elvira Martinez', 'Paraje del sur', 'D', 'Operador General', '1', '129013', '$2y$10$uCF6ROT6jCnuaay.5jwC0.JMDiq8r8ceBqP89Zrf5CzRf5yrB4lTq', '1992-12-24', 'Karla Alejandra Saucedo Pachec', '102643', 'HUS', '2024-06-11'),
(7257, ' Yazmin', 'Vazquez Torres', 'Morelos II', 'D', 'Operador General', '1', '129014', '$2y$10$IInNx9lavJmvAN4ES4aTTuiB3baQ2/Y/yE/ItYTYpuqXqv7WkNuHO', '2004-06-25', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-11'),
(7258, ' Oscar Luis', 'Barcenas Aragones', 'Los Arenales', 'D', 'Operador General', '1', '129015', '$2y$10$bGxHSRY/YL2RwMcqKTDPWeiAPKmTXblvbs/jxiQMh8zj74f4dAuoC', '1990-01-13', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-11'),
(7259, ' Dora Iris', 'Estrada CastaÃ±eda', 'Parajes del Sur', 'D', 'Operador General', '1', '129016', '$2y$10$Bku4FX/VDyXxD9yYflFzc.OA96j7D9cDettDo8SOK0Sq2jhkAhHBO', '1989-03-23', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-11'),
(7260, ' Pamela Griselle', 'NuÃ±ez Gonzalez', 'Fracc. Cerradas Santa Isa', 'D', 'Operador General', '1', '129017', '$2y$10$nAbZnwnpEdLgWeLsEEZCLeDG..ATbMTJnpwxICIdj.e4KfK6CH4L2', '2003-02-26', 'Lopez Vazquez, Romulo', '61770', 'HUS', NULL),
(7261, ' Janeth Magaly', 'Sanchez Garay', 'El Granjero', 'D', 'Operador General', '1', '129018', '$2y$10$NUiSSConNfP4vEqzIA4Y6uf/ArnidTbzjvGdpBzfQkRJYig4Rc7GO', '1995-01-22', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-11'),
(7262, ' Rafael', 'Tome Vichi', 'Paraje de San Jose', 'D', 'Operador General', '1', '129019', '$2y$10$UFLaWCSenZu4/ArlwVcAGuwEyh1yj8T9s07lqlAzTZVFt4zT5k1bi', '1988-08-24', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-11');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `colony`, `position`, `area`, `plant`, `username`, `password`, `birthdate`, `supervisor_name`, `supervisor_reloj_number`, `deparment`, `fecha_ingreso`) VALUES
(7263, ' Karla Veronica', 'Martinez Martinez', 'Paraje de Oriente', 'D', 'Operador General', '1', '129020', '$2y$10$pjMWX/fthKitdnpQ.vMlKOqkY2uL/bm4EsKmpVB8pa7RwJ/.vyXMu', '1995-10-13', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-11'),
(7264, ' Perla Guadalupe', 'Vazquez Cabrera', 'El papalote', 'D', 'Operador General', '1', '129021', '$2y$10$k792IOlJSFmCRt/rEDnPH.hV9Vygeg5As4m1x1oS6Q4odXelK5UHG', '1997-01-02', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-11'),
(7265, ' Jose Arnoldo', 'Constanza Borjas', 'Valle del Marquez', 'D', 'Operador General', '1', '129022', '$2y$10$NQZhaVl7Szu/RGTpvA7jkefGksQhmY9CzUKoRDuYe.GRQ38PfJBNC', '1983-01-18', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-11'),
(7266, ' Rocio Monserrat', 'Meraz Martinez', 'Parajes de San Pedro', 'D', 'Operador General', '1', '129023', '$2y$10$frO9Jvo0qnarNU6BpP.EkeAV6Ejtnen7ykyjQLmzTPakmVXLtzzB2', '1987-11-29', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-11'),
(7267, ' Cristal De Jesus', 'Viescaz Avena', 'Patria', 'D', 'Operador General', '1', '129024', '$2y$10$XjuaBpTrP.LbNsRuScTn2.f5komxDpt3replPIe57UEm8hQ7aBUFq', '1991-04-27', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-11'),
(7268, ' Rosario Aidee', 'Rojo Guerrero', 'Porfirio Silva', 'D', 'Operador General', '1', '129027', '$2y$10$wwt3w1EO8FBuPH7QSDyI0udWjdvvp5rPz6BJmK5To2ARhB6dqbQWy', '1989-05-27', 'Lopez Vazquez, Romulo', '61770', 'HUS', NULL),
(7269, ' Evelin Marlette', 'Castillo Gomez', 'Cerradas del parque', 'D', 'Operador General', '1', '129028', '$2y$10$ejxkVtY7ZFF7X3/oYWDLJeeMCrRF4I/J7z3FlSom2sqvqPJTbPOr6', '1999-08-23', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-12'),
(7270, ' Paulina', 'Chaga Melchi', 'Cerradas San Pedro ', 'D', 'Operador General', '1', '129029', '$2y$10$XoOVV5BDCvsf1L904w2f4e8PWcKlh78uPl3PXZF2945zXi.YwUEw6', '1996-07-30', 'Lopez Vazquez, Romulo', '61770', 'HUS', NULL),
(7271, ' Martha Cristela', 'Corral Flores', 'Senderos de San Isidro', 'D', 'Operador General', '1', '129031', '$2y$10$YKFQH5L.ZS/jRZ3b8Cb83OmqUS/BZvPkTw73/Z4LAJKjzty4RR6Dy', '1997-06-04', 'Lopez Vazquez, Romulo', '61770', 'HUS', '2024-06-12'),
(7272, ' Julian Israel', 'Mendivil Ballesteros', 'Florencia', 'D', 'Operador General', '1', '129032', '$2y$10$a3lC7TuzOFrqsS3M39XVIO9QmE9fRAxdrlXX9EFD90MqnBzh5.JCG', '1985-11-17', 'Sanchez Cordova, Rene', '41563', 'HES', '2024-06-12'),
(7273, ' Abraham De Jesus', 'Reyes Lorenzo', 'Paraje del Sur', 'D', 'Operador General', '1', '129033', '$2y$10$I5oS6WTKjP/ZeOTmSOWViuvW1G5MbVDyX/jV05eZ2sM2HnA1PuxQi', '2004-06-07', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-06-12'),
(7274, ' Edith Mariana', 'Garcia Ahumada', 'Praderas del Sol', 'D', 'Operador General', '1', '129034', '$2y$10$XRWothmvcolJkuYsHzTFpu9beh4L4QHbcouR30C8FA0Jsz6jzSh3a', '1985-07-26', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-06-12'),
(7275, ' Jose Ivan', 'Moreno Salas', 'Arecas', 'D', 'Operador General', '1', '129035', '$2y$10$HTkW028Cc7xwzQmUEOGScOtuafCjIgN.0OAn2BNQqP8opBoYdmse6', '1987-08-21', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-06-12'),
(7276, ' Juan Manuel', 'Natividad Saenz', 'Urbivilla del Campo', 'D', 'Tec Esp En Moldes', '1', '129090', '$2y$10$K82S8F1zuHm4gAl8oIIncOb7vKZjrUkdU1RldJRgGBLGgPW3.Zkx.', '1986-05-08', 'Jaime Estrada Renteria', '77575', 'HUS', '2024-06-18'),
(7277, ' Amayrani Stephania', 'Ramos Ruiz', 'Paraje de San Jose', 'D', 'Operador General', '1', '129091', '$2y$10$cSpDzXtuUb.b5VYAyK/4COQ1Q9pd/6NCkm2SJUtf6eLAw51I3vWqi', '1993-01-10', 'Fabiola Ramon', '84289', 'HUS', '2024-06-18'),
(7278, ' Josue Guadalupe', 'Quezada Loya', 'Villa Bonita', 'D', 'Operador General', '1', '129092', '$2y$10$IgnjxddXZxxgaXExqvkXN.ND3QrxLJNJGlur44svkhxTNZtRwNNhq', '2004-10-28', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-06-18'),
(7279, ' Geber', 'Hernandez Martinez', 'Paraje de San Jose', 'D', 'Almacenista', '1', '129095', '$2y$10$uhvFgBNvOKTg32.swpYnPOXK0fSJBdxueXdmlsNB5lJlOcnFxenJG', '1987-02-08', 'Urquiza Arredondo Francisco Ja', '24754', 'HUS', NULL),
(7280, ' Yahaira Azucena', 'Rodriguez Rodriguez', 'Cerradas del Alamo II', 'D', 'Operador General', '1', '129130', '$2y$10$bb03gncE2T.OdATh4G57N.ypkCu792vRfNHirwVwJEXfFjY1fVtmi', '1997-02-06', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-06-20'),
(7281, ' Gabriel', 'Delfin Castillo', 'Bosques de Salvarcar ', 'D', 'Operador General', '1', '129131', '$2y$10$L41OezuSrHcU19pJGHkN9./lz2/d5bWbadWPtOuYaAGAAIqvBNKXG', '1998-06-11', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', NULL),
(7282, ' Ezequiel', 'Salvador Martinez', 'Las Haciendas', 'D', 'Operador General', '1', '129132', '$2y$10$A.xl.QV3df.BS.gouAhWf.AGvEwXLvtdVK9BKLDc/uBXQXUv5Ia5S', '1983-05-20', 'Briseida Bautista Tolentino', '300011', 'HUS', '2024-06-20'),
(7283, ' Dana Yareth', 'Conde Menendez', 'Aguilas de Zaragoza', 'D', 'Operador General', '1', '129133', '$2y$10$QM8k8VMVhXrL77doB1.h3.UoFrxyvXzPQ.FjAAh/ifORNsLD9.WBG', '1997-12-26', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-06-20'),
(7284, ' Wendy Selene', 'Cerda Morales', 'Hacienda de las Torres', 'D', 'Operador General', '1', '129134', '$2y$10$qauy8sOYhavWstsv6dxuCeE0tWdcD6VaHjy6EebzIVTg.3zPfJf4G', '2002-11-18', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-06-20'),
(7285, ' Stephanie Natalia', 'Aguero Reyes', 'Los Portales', 'D', 'Operador General', '1', '129170', '$2y$10$MrvuFAF9r5BH.dSfLuPPrec31sRgEILQIGDdG27ehTLd7Ha2FtAMe', '2002-10-27', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-06-24'),
(7286, ' Adela', 'Alvarez MuÃ±oz', 'Paraje de San Jose', 'D', 'Operador General', '1', '129171', '$2y$10$y0A3IN787vmoedXSid.rTuGEmQ08KtlqfzoNcd6d45rzCkLk2w6Zm', '1975-12-07', 'Maria Eloisa Barron Salas', '61631', 'HUS', NULL),
(7287, ' Beatriz', 'Esquivel Ibarra', 'Zaragoza', 'D', 'Operador General', '1', '129172', '$2y$10$3dvCzwY/qjh5eYvwg6x6MeoAEfPbIV/kdqiOREsknthf9rW2YSpNO', '1978-06-15', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-06-24'),
(7288, ' Lizzett', 'Valencia Candelario', 'Paraje de San Isidro', 'D', 'Operador De Procesos', '1', '129173', '$2y$10$uvfXxwZraLq84WkTsZVKEe/MSmZVcyIVjXziZW5kOWSg.F3z5RoMW', '1990-10-05', 'Velarde Inostroza Enrique', '71208', 'HUS', NULL),
(7289, ' Lazaro Jassiel', 'Maldonado Galvez', 'Medanos', 'D', 'Operador De Procesos', '1', '129175', '$2y$10$BDKzzA11vxSIfVM89cKEDONj/VSgCv7zfSjUxPXAw1wiOZZUHJ9WC', '2003-06-21', 'Velarde Inostroza Enrique', '71208', 'HUS', NULL),
(7290, ' Brenda Selene', 'Vallejo MuÃ±oz', 'Urbivilla Bonita', 'D', 'Operador De Procesos', '1', '129176', '$2y$10$w3GdZvxCWlOZhqEpr1oBu.feq/Wh6h0n/7MEt64ZwSUUCX59dg6SO', '2006-01-20', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-06-24'),
(7291, ' Lluvia Selene', 'Bencomo Hernandez', 'Riberas del Bravo VII', 'D', 'Operador General', '1', '129177', '$2y$10$pj69QMsQqHQ74VB6OvrftOcknDaiF3bmXDgoWCxUxaXfHaM0zHJDW', '2001-03-11', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-06-24'),
(7292, ' Karla Lizeth', 'Ramirez Gonzalez', 'Hacienda de las Torres ', 'D', 'Operador De Procesos', '1', '129178', '$2y$10$lUWV2MAd6LYLNZjPIGP4a.isv.BO8D62/leuU7gBnDN3IovK85dfC', '2002-10-27', 'Mario Alberto Camacho Salcedo', '99866', 'HUS II', NULL),
(7293, ' Daniel Heriar', 'Garcia Ruelas', 'Morelos III', 'D', 'Operador De Procesos', '1', '129180', '$2y$10$Ozf9hf3jDAWI.aXNUTMlxuFZcdQpWXKmIZIFJYv6.Cm2ER6IObFLu', '1999-01-27', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2024-06-24'),
(7294, ' Salma Aramis', 'Rojas Gonzalez', 'Hacienda Santa Fe', 'D', 'Operador De Procesos', '1', '129182', '$2y$10$3jEYBfIo7B/JPW9N7mxq1u5hwuaebunHGkiHmPnsQMFrU7Gu0fo6i', '1999-05-12', 'Saul Arellano Escobar', '97722', 'HUS', '2024-06-24'),
(7295, ' Javier', 'Pascual Martinez', 'Villa Res del Real', 'D', 'Operador De Procesos', '1', '129184', '$2y$10$WQxaHdIJSMtZG/qGY7JYLeZwQENKBegZEw6wAGEMJt9xrEf2yp7Za', '1989-04-25', 'Velarde Inostroza Enrique', '71208', 'HUS', NULL),
(7296, ' Guillermo', 'CastaÃ±eda Hernandez', 'Manuel Jesus Clouthier', 'D', 'Operador De Procesos', '1', '129185', '$2y$10$uTVilJ0EhtogG6uuEgYGvOPb/VA4GztOE1jtknalOa23mb7F.7Bmu', '1975-02-19', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', NULL),
(7297, ' Iris Nathali', 'Reyes Duran', 'Sur los portales', 'D', 'Operador General', '1', '129186', '$2y$10$JL2yUBoIErgibmn4bK04Kur5IFCaU/oaWZh3GdD9VZRsSndB40jQ.', '1984-02-21', 'Jesus Francisco Moreno Banda', '69340', 'HUS', '2024-06-24'),
(7298, ' Angel De Jesus', 'Ramirez Vela', 'Paraje del Oriente', 'D', 'Operador De Procesos', '1', '129187', '$2y$10$/5sSowca.fm6fgCPAJczKetCZvQEKCgkpp6hbqfu7OEBp9YyM6Nsa', '1993-05-23', 'Saul Arellano Escobar', '97722', 'HUS', '2024-06-24'),
(7299, ' Ruperto Andres', 'Martinez Garcia', 'Manuel Valdez', 'D', 'Operador De Procesos', '1', '129188', '$2y$10$ZRlNnHqPOnnfO8rsik14MecOkPQL7L6Ebvcv2Tb.QdtfN4bqpUbBa', '1993-03-27', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2024-06-24'),
(7300, ' Candelario', 'Hernandez Velazquez', 'Aguilas de Zaragoza', 'D', 'Operador De Procesos', '1', '129189', '$2y$10$b0qsPyvcMFYopSeaON.Qwuxm2lR8r1rdIg0I3rnpaE/nb0IQDgcyW', '1997-02-02', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-06-24'),
(7301, ' Cecilia Berenice', 'Ferniza Balderas', 'Lomas del Desierto', 'D', 'Operador De Procesos', '1', '129190', '$2y$10$13A0/5NSYb4yIuErxEwWfewV/OiLMqSxJsRomc6L5nKAKBhWR997q', '1991-07-29', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-06-24'),
(7302, ' Perla Abigail', 'Hernandez Eslava', 'Portal del Valle', 'D', 'Operador General', '1', '129191', '$2y$10$4.dAbXeA65j48g4.YuBVTuJBhRXjKbnsgNF7awDbSANbIqYVgGg/K', '2005-06-18', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2024-06-24'),
(7303, ' Keivin', 'Carbajal Dominguez', 'Riveras del bravo', 'D', 'Operador De Procesos', '1', '129194', '$2y$10$kH4DjqwUMZN/XS.aAZtjr.t.tjsD.uTqCd8BSWIUMvJUdTDUjn4.2', '1993-06-01', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', NULL),
(7304, ' Nancy Sarahi', 'Aguilar Gonzalez', 'Parajes del sur', 'D', 'Operador De Procesos', '1', '129209', '$2y$10$O6BoQqcwXNj0YWsZ8Sx16u0gK884136hYYb7pVJTy/kqZwqTvtmQ2', '1999-02-22', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', NULL),
(7305, ' Erick', 'Rosas Hernandez', 'Riveras del Bravo', 'D', 'Almacenista', '1', '129234', '$2y$10$i8rIPWOVBhtYqaCEbFZUZOtgYfGHCsuRFwgbWEZjXgcSu9.UqpX3e', '2001-06-29', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2024-06-27'),
(7306, ' Ivan Alejandro', 'Carmona SeaÃ±ez', 'Paraje de Oriente', 'D', 'Operador De Procesos', '1', '129235', '$2y$10$qCARkVpUOcAWulz0HcibW.UU.qmku3O8qHm5Wq/Pebw.yckK06TKq', '2001-05-27', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', NULL),
(7307, ' Juan Jose', 'Aguilar Camacho', 'Infonavit Solidaridad', 'D', 'Operador De Procesos', '1', '129236', '$2y$10$AwX/UHFPI.18LFjuAbqOpOP1W6OqqmYDsffE7BgIOXP.eI8wp6VFe', '1979-04-30', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', NULL),
(7308, ' David', 'Wallmach Gonzalez', 'Eco 2000', 'D', 'Almacenista', '1', '129237', '$2y$10$duZXa/I5sjftQl2HLw/Y5.XLcEuV0nCJU.CUekqTwB3M6cQnhVX96', '2001-02-16', 'Israel Saenz MartÃ­nez', '99501', 'HUS', NULL),
(7309, ' Lucia', 'Gonzalez Gonzalez', 'Puente del Bravo', 'D', 'Operador De Procesos', '1', '129238', '$2y$10$ZuNyDljLkX9ixJ3M5e4cYeSiCwPsoDCVi6w3BQSE6Y6cUCb37SXOC', '1990-01-01', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-06-27'),
(7310, ' Alicia', 'Jimenez Hernandez', 'Carlos Castillo Peraza', 'D', 'Operador General', '1', '129290', '$2y$10$DMaGmYzZc/aAK8fiV1jbFeJZGXGuXV14PjlFc73zZ/bCkKJzwS.mO', '1980-04-20', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2024-07-02'),
(7311, ' Jessica Sherlyn', 'Sosa Hernandez', 'Portal del Valle', 'D', 'Operador General', '1', '129291', '$2y$10$9oMGEo0ne1Lt2mPZcMj8tuwBRUVlIZzlMXGI86FDMew3qtL1QrbYC', '2002-01-05', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2024-07-02'),
(7312, ' Edwin Esmelin', 'Calderon De Leon', 'Urbi Villa del Cedro', 'D', 'Almacenista', '1', '129292', '$2y$10$McCoBfyzWo6ts9x2Lfepa.eWJBTZlychKIKtmpfN1USDW/jOsVmKW', '1999-08-16', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2024-07-02'),
(7313, ' Jennifer', 'Robles NuÃ±ez', 'Praderas del Sur', 'D', 'Operador General', '1', '129303', '$2y$10$zjItgRiFkj7BeUN0fmLe3ehWWmGLkn18Wkld9nlZCrS/Wb3vNLKVe', '2002-03-08', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2024-07-04'),
(7314, ' Jose Santiago', 'Chable Reyes', 'Paraje de San Isidro', 'D', 'Operador General', '1', '129304', '$2y$10$yp.G/SaF9dgJAaBuUkr6IOSJOeDT254KIbZg3MrMT36qEiCYhiSY2', '1964-08-25', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2024-07-04'),
(7315, ' Alejandro', 'Rodarte De La Riva', 'Parajes de San Isidro', 'D', 'Operador General', '1', '129305', '$2y$10$cEYMQRhbkrAKFHQ86O8qs.egV00x0nL.pGm8N79bsAN/DsKIwwUKW', '1988-08-16', 'Rodriguez Rodarte, Jesus Migue', '25437', 'HES', '2024-07-04'),
(7316, ' Jose Antonio', 'Meza Jimenez', 'Puente Alto', 'D', 'Operador General', '1', '129306', '$2y$10$mDfhpdaDDegaLOZ3dFhifeyOkVvKJtzNppkZ25pCMoWJrFxIyBWI.', '1977-05-07', 'Guerrero Cervantes Alejandra D', '59948', 'HUS', '2024-07-04'),
(7317, ' Mauricio', 'Lopez Cruz', 'La Canada', 'D', 'Operador General', '1', '129308', '$2y$10$5wvbiL4w1bbGpKnd/W4IHe6h4GFQBKecWI2qFbZFP0Q/krSjwmevS', '1999-09-22', 'Jorge Abraham Aguilar Gaspar', '77372', 'HES', '2024-07-04'),
(7318, 'Mirian Yesenia ', 'Cabrera', 'N/A', 'AB', 'Directora de RH', '1', '548', '$2y$10$Cu5nKWAYvDa2X5CscG/4N.uchSHi6kwFukDLTSIvfkkhO7Tp.ig6O', '1970-01-01', '', '', 'HUS', NULL),
(7319, 'David', 'Melchor', 'N/A', 'AB', 'SR PLANT MANAGER', '1', '88114', '$2y$10$vSwFC61MzLi.NLfe9E2Mn.WfzVU6/nxeaVuZWwcaom9aPwTHNZoGC', '1970-01-01', '', '', 'HES', NULL),
(7322, ' Brenda Margarita', 'Garcia Reyes', 'Tierra Nueva', 'D', 'Operador General', '1', '129336', '$2y$10$Z9TMi5N4LmCBsYDi9PI58Oe0ZrBwcPR34crLqvENhB6pgcXFSDsSC', '1976-03-28', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-07-08'),
(7323, ' Hugo Andres', 'Quijano Hipolito', 'Urbivilla del Cedro', 'D', 'Operador General', '1', '129337', '$2y$10$aPnnMbW7Pk22YWpTECun2OhFZV85ylvI58jfgcg3.7mxtcbFfF3K6', '1996-10-02', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-07-08'),
(7324, ' Daniel Said', 'Vargas Casillas', 'Parajes de Oriente', 'D', 'Operador General', '1', '129341', '$2y$10$AWvLj7HF0bE8SeaZP3bWn.kzWzHjdiBMMLQO.B.9x6UiYQ.5JYC6C', '2001-12-28', 'Maria Eloisa Barron Salas', '61631', 'HUS', '2024-07-08'),
(7325, ' Armando', 'Rodriguez Govea', 'Mexico 68', 'D', 'Tec Esp en Troqueles', '1', '129342', '$2y$10$KK2U69DWjYvaWf8Cdd3ZDOQk46ZPCp7Mv7zXVg7oA7gek/2r/1CRa', '1992-08-27', 'Favela Alvarado, Jose Luis', '25333', 'HES', '2024-07-08'),
(7326, ' Juan Antonio', 'Sanchez Rodriguez', '15 de Enero', 'D', 'Tec Esp en Troqueles', '1', '129343', '$2y$10$kZOOq9b/QWnVP5Co26yvCO1Yaa7A19gddkaDjFPDmH3n7KpwyEQWi', '1967-01-03', 'Favela Alvarado, Jose Luis', '25333', 'HES', '2024-07-08'),
(7327, ' Viviana', 'Palma Alvarez', 'Horizonte del Sur', 'D', 'Operador General', '1', '129350', '$2y$10$v5B72B4z/eU45rvOi4/SOeMPKzSHPxW7i9np5pUXQm1J9F7CLjwzK', '2005-01-31', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-07-09'),
(7328, ' Imai Alexis', 'Olague Moreno', 'Portal del Valle', 'D', 'Almacenista', '1', '129353', '$2y$10$Cg2idQNIZDuQZwuuavwyJOz3vOM8Pw74jRmNj3E7N/vnbJhFfwRtG', '1994-10-14', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2024-07-09'),
(7329, ' Jonathan Urises', 'Saucedo Robles', 'Info Juarez Nuevo', 'D', 'Materialista', '1', '129380', '$2y$10$XLIqLpDP9advRsgSPbob5uB9cG3O8IUpAWjzIfLH7rKJ4XtpKaH3y', '1994-09-22', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2024-07-11'),
(7330, ' Luis Angel', 'Quijano Hipolito', 'Urbivilla del Cedro', 'D', 'Operador General', '1', '129382', '$2y$10$bd1S5obA2O/I7nzG/gibL.OCVXLq6p7kyHC1OBl9TxytmmKPIKCee', '2005-05-11', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-07-11'),
(7331, ' Jhonatan Israel', 'Casillas Arenas', 'Bosques de Salvarcar', 'D', 'Operador General', '1', '129383', '$2y$10$uhLx7r2tO1w1ygzKQU9yJewytB3IMrbX3bBruqRxJrTG/9I5KOknu', '2000-05-16', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-07-11'),
(7332, ' Karla Paola', 'Gomez Castillo', 'Hacienda Santa Fe', 'D', 'Operador General', '1', '129384', '$2y$10$Ug5wh3I8kKbAVMBS/n6oh.qQzDnbFbboZjEmDo0snulTRdhp67Gg2', '2001-07-25', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-07-11'),
(7333, ' Joleth', 'Gomez Castillo', 'Hacienda Santa Fe', 'D', 'Operador General', '1', '129386', '$2y$10$r8gXtgmMPNt8xiI8vuQY0.QX70LU7lQUYNlf616LUtOzqUG9y0vbq', '2005-04-15', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-07-11'),
(7334, ' Karla Mayela', 'Martinez Ortiz', 'Las Gladiolas', 'D', 'Operador General', '1', '129387', '$2y$10$HMrE/yD5NysfSD6U5HQhxODtsIVmr9N8WEYlj.kbd5d.3vqAkfbCK', '1978-12-24', 'Carlos Javier Gonzalez Cordova', '75402', 'HUS', '2024-07-11'),
(7335, ' Jose Armando', 'Martinez Ramirez', 'Horizonte del Sur', 'D', 'Operador De Procesos', '1', '129436', '$2y$10$FMtb/g1EWGJHbVBOyZgz7O5BwVNq040ZbdxcmSmGi4lEuXBefPzyK', '1997-04-01', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2024-07-18'),
(7336, ' Wendy Nayeli', 'Sanchez Vallejo', 'Rivera del Cozumel', 'D', 'Operador De Procesos', '1', '129439', '$2y$10$IhXUMQRXku/swdZ4.NO9l.GEsDfbtRycPgoD/zW2iRE2eyoxJ0Gsa', '2002-11-15', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2024-07-18'),
(7337, ' Jose Fabian', 'CastaÃ±eda Valles', 'Praderas del Sur', 'D', 'Operador De Procesos', '1', '129440', '$2y$10$rMdbxx6ghdUEHHMDE1XKuepvpjeNc17GTpqHCb9nhW26HTXaDda1C', '2002-05-22', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2024-07-18'),
(7338, ' Jonathan', 'Benito Martinez', 'Parajes de Oriente', 'D', 'Operador De Procesos', '1', '129441', '$2y$10$KiR6dUQYgMoA7DD4hiU4o.quZSFwXqrv7WSmetGyY5VzD3kT1q37a', '1996-09-18', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2024-07-18'),
(7339, ' Lizet Gabriela', 'Ramirez Celaya', 'Eco 2000', 'D', 'Operador De Procesos', '1', '129442', '$2y$10$59rTp7GrlEvV4jimegokSuXDSxUBmuk..Vqm1iySWbhf285eDE.QO', '1997-01-29', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2024-07-18'),
(7340, ' Luis Angel', 'Guzman Rincon', 'Puerto Castilla', 'D', 'Operador De Procesos', '1', '129445', '$2y$10$gmeyVe7Fu3XlTrJ0qGFFeOSAH7R38JxsWlOxEHLH6X/ZPMbM3JiCu', '1999-09-26', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2024-07-18'),
(7341, ' Juan Carlos', 'Alcala Cardiel', 'Portales de San Antonio', 'D', 'Operador De Procesos', '1', '129446', '$2y$10$uMuaLwxwQSxbYzQ6FjN7L.VLJizkaU6G0vMDyAsy59ImVo1GiwEgm', '1996-06-24', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-07-18'),
(7342, ' Maria Gisela', 'ZuÃ±iga Narvaez', 'Portal del roble', 'D', 'Operador De Procesos', '1', '129447', '$2y$10$LDzPV2pf3qZO9inh5Guau./5X3e3Hd/Mpjyx1owlu0UU4APSeHus2', '2005-09-06', 'Carlos Leonel Martinez Zapata', '76083', 'HUS', '2024-07-18'),
(7343, ' Griselda', 'Luis Martinez', 'Villas de Alcala', 'D', 'Operador De Procesos', '1', '129448', '$2y$10$IYPIj8WpRkMRdajJrTmj9.BJJghhqATmnDEQp.CweWe8P/TO4nvqi', '1995-03-08', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-07-18'),
(7344, ' Aaron Tomas', 'Avila Piedra', 'Salvarcar', 'D', 'Operador De Procesos', '1', '129450', '$2y$10$lcMjiYWGaSFDlmY3/XjbRODwtBwp9F7rSvhnRr8cSzlx35j20jdN.', '1999-03-18', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-07-18'),
(7345, ' Hector Orlando', 'Martinez Esparza', 'Carlos Castillo Peraza', 'D', 'Operador De Procesos', '1', '129451', '$2y$10$Cp3pvl3aa9VqrFLPeBigUeyv7j31py7ZRCxwULuqAw51WKDpkH6rC', '2002-02-06', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-07-18'),
(7346, ' Jonathan Joel', 'Estrada Gomez', 'Paraje de Oriente', 'D', 'Operador De Procesos', '1', '129452', '$2y$10$YHRUSPNM3dcEOpdt3lvRCeSZ1XjBcHY/zjwI.2e6fsEbfCl9kfZxa', '2006-04-13', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-07-18'),
(7347, ' Miriam Margarita', 'Terrazas Gomez', 'Hacienda de las Torres XI', 'D', 'Operador De Procesos', '1', '129456', '$2y$10$NZsCHUUOYw9ekJKVKREOkOWh6D8GEewbliQh2DnvPyIg1yCrQ645u', '1983-05-01', 'Saul Arellano Escobar', '97722', 'HUS', '2024-07-18'),
(7348, ' Luis Enrique', 'Lopez Espinoza', 'Villas de Alcala', 'D', 'Operador De Procesos', '1', '129457', '$2y$10$QMoiFHaNgDcxw8gwBdS5Ru7GHWG8dzlhNaXocaM14rzeBFHMFNoRe', '2002-01-06', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-07-18'),
(7349, ' Anayely', 'Palacios Maldonado', 'Arecas', 'D', 'Operador De Procesos', '1', '129458', '$2y$10$ZWmwCtnuEPhYAvXLjbqE7uc4k3ovjJEmTz1mnsxOx3g3dxQqAigB.', '1991-01-17', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-07-18'),
(7350, ' Esmeralda Del Pilar', 'Sosa Alvarado', 'Parajes de Oriente', 'D', 'Operador De Procesos', '1', '129459', '$2y$10$ar6d28vdl8UwqM.SAtVNreLWWZpiHjGxTxu/lOScAAazPex.NPkbW', '1998-12-27', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-07-18'),
(7351, ' Karen De Jesus', 'Martinez Caldera', 'Lomas del Desierto', 'D', 'Operador De Procesos', '1', '129460', '$2y$10$JbiPvqJrjCKxSv8aPTBM7OkN3FTWXq00R1i4NicNleNTjQMbb7Gfm', '2000-08-25', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-07-18'),
(7352, ' Wendy Sujey', 'Campa Andrade', 'Carlos Chavira Becerra', 'D', 'Operador De Procesos', '1', '129461', '$2y$10$2yTN0WWrotzUpJdWGgAMhuxGzGtG.rlX1Rq5Ot0Nh1p8SOYxQBuAu', '1993-09-24', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-07-18'),
(7353, ' Alexandra', 'Vicente Mendez', 'Tierra Nueva II', 'D', 'Operador De Procesos', '1', '129462', '$2y$10$CMEGMmUgVoyA1JjN71IYcOcGzN9Pn780YWUwgti5tqq9nm1t.EIxS', '1997-11-26', 'Saul Arellano Escobar', '97722', 'HUS', '2024-07-18'),
(7354, ' Nestor', 'Lopez Gonzalez', 'Rincones del Rio', 'D', 'Operador De Procesos', '1', '129463', '$2y$10$LShktsFFpmtHWeJrXRaYme9kR9Qs1vvmONeWwpA6iNYkGlAQc6yCy', '1998-02-26', 'Saul Arellano Escobar', '97722', 'HUS', '2024-07-18'),
(7355, ' Erik David', 'Garcia De La Cruz', 'Praderas del Sol', 'D', 'Operador De Procesos', '1', '129464', '$2y$10$5vs5q8rgd8utIiTjtcZxKezqXx4t414LmnbNWt0ZWtVgwpU7tduZW', '1993-12-16', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-07-18'),
(7356, ' Jose Isai', 'Ventura Fuentes', 'Boca del Rio', 'D', 'Operador De Procesos', '1', '129465', '$2y$10$q01D.TL94BVY9bmekpmhMuzMZeX6R8CydRt3fQFMu7Gx/LkCAfiVC', '2003-10-13', 'Saul Arellano Escobar', '97722', 'HUS', '2024-07-18'),
(7357, ' Pedro Omar', 'Garcia Ruelas', 'Morelos 3', 'D', 'Operador De Procesos', '1', '129466', '$2y$10$Vi56pb7KmmxiSpP.JethmOPHOlcP7EkzF8pKxZlEXW2E/NpIUgq/W', '1997-07-31', 'Saul Arellano Escobar', '97722', 'HUS', '2024-07-18'),
(7358, ' Christopher', 'Santacruz Herrera', 'Mezquital', 'D', 'Almacenista', '1', '129467', '$2y$10$AytmEHCW9TY8lXbKpGFBIOwokpSptMCEux/6wY4sImoluJkKLrVKy', '1998-05-11', 'Urquiza Arredondo Francisco Ja', '24754', 'HES', '2024-07-18'),
(7359, ' Eduardo', 'Saucedo Rojas', 'Las Haciendas', 'D', 'Operador De Procesos', '1', '129468', '$2y$10$smJuvs8NQDC/nxQwQTKVmOdOdy2O2Oe7dfd7oKw.pRYUk1ltQi1um', '1993-10-20', 'Saul Arellano Escobar', '97722', 'HUS', '2024-07-18'),
(7360, ' Abdiel Ivan', 'Gonzalez Coronado', 'Paraje de San Isidro', 'C', 'Ingeniero de DiseÃ±o', '1', '301224', '$2y$10$wvFoYDvDZdamuJ7pn075me6GXjCGtOcVB3gsIfCXBOh6643KjUVUW', '1997-01-22', 'Ivan Valero', '24932', 'HES', '2024-07-15'),
(7361, ' Jesse Israel', 'Juarez Cruz', 'PRADERA DORADA', 'B', 'Ingeniero de Prueba Sr', '1', '301261', '$2y$10$J6B5vjhF0q8aLRwVZQqDve0Qr4xdE.uabCK/al/JpHmw4Fl76DUtq', '1983-02-12', 'Daniel Alejandro Terrazas Mont', '77773', 'HUS', '2024-07-29'),
(7363, 'ALUCARDN', 'HELLSING', 'Municipio Libre', 'A', 'Desarrollador de software', '1', '000060', '$2y$10$W8bxaYx9TabR3o2r1Gjvo.l8YIs87qxuNjtjpbllM5Cr1I.jlWn06', '2001-08-06', 'Maribel Duran', '74051', 'HUS', NULL),
(7364, 'Antonio Aldair ', 'Nuñez Ovando', 'Municipio Libre', 'A', 'Desarrollador', '1', '00008800', '$2y$10$rLyCut20ZA4AH3TZxNmAbOiu91FFs0iMBsacfPxROEDI7zLZUwpz.', '2001-06-14', 'Maribel Duran Navarro', '74051', 'HUS', '2024-08-01'),
(7365, ' Juan', 'Rodriguez Gomez', 'Papagochic', 'D', 'Tec Esp en Troqueles', '1', '60046', '$2y$10$m8L8oCBTvWbmbspWetgo3.LtCHfuEAOU7vZCHXnAABcbSN2QRJsNy', '1970-10-26', 'Favela Alvarado, Jose Luis', '25333', 'HES', '2024-07-11'),
(7366, ' Isaac', 'Vazquez Martinez', 'Portal del Roble', 'D', 'Operador De Procesos', '1', '60327', '$2y$10$R8oLszmtymu5NMH8xXncDOUabEZAX78K0n4YGwsKP3GaEJ62iJyzG', '1988-06-16', 'Saul Arellano Escobar', '97722', 'HUS', '2024-07-23'),
(7367, ' Bernardo', 'Palacios Hernandez', 'Senderos de San Isidro', 'D', 'Tec Esp en Troqueles', '1', '84579', '$2y$10$Iv8UtUAijGid/irUUeDw1uNKF8M7m5iwgVX6Ap72Tei.TQhK8mjdi', '1984-12-23', 'Favela Alvarado, Jose Luis', '25333', 'HES', '2024-07-08'),
(7368, ' Joaquin', 'Miranda Geronimo', 'Parajes del Sur', 'D', 'Almacenista', '1', '124038', '$2y$10$6A6oAorOOxpVNstvCd4ogu5shPOplS0tVV/xBtEgngWYNbgJwLzD.', '1996-09-21', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2024-07-11'),
(7369, ' Maria Natividad', 'Reyes Lizardo', 'Portal del Valle', 'D', 'Operador De Procesos', '1', '129506', '$2y$10$571leAMoNcD1xr1dmrhHxO08heZkczFHttKwQYfcgQMZ8D9AdIsfi', '1984-09-08', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-07-23'),
(7370, ' Aurora', 'Ramirez De Jesus', 'Riberas del bravo', 'D', 'Operador De Procesos', '1', '129507', '$2y$10$55GUAcOtlTgqieeS6t3CAeLC29CcWcz1ltGbX.sfkhFcCynsrdmzO', '1991-11-18', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-07-23'),
(7371, ' Antonio', 'Castillo Tolentino', 'Cerradas de San Pedro', 'D', 'Almacenista', '1', '129508', '$2y$10$HzpT0nuXHH/VfNunJIY8bugL3sbfuyjQ8FQrF8RQHnkRipx00xx66', '1992-07-25', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2024-07-23'),
(7372, ' Rocio', 'De Leon Nava', 'Oriente Patria', 'D', 'Operador De Procesos', '1', '129509', '$2y$10$RCrYGofvQ82qCo1w/xiyWurEm/9xrKp0V5esqU8WpMv.VpGZelAQ6', '1989-05-30', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-07-23'),
(7373, ' Gerardo', 'Rubio Sifuentes', 'Horizonte del sur', 'D', 'Operador De Procesos', '1', '129510', '$2y$10$FmTbfUp1ntMypR/JrfpUd.CzuH4X7Q/AjZ2olmVBzKskFvsvOnOoW', '1987-07-30', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-07-23'),
(7374, ' Karina', 'Zamora Zamora', 'Manuel Gomez Morin', 'D', 'Operador De Procesos', '1', '129511', '$2y$10$gQoLzZbIlxh3Drb3XvFTGeJgNW5sHF2WnpISHDRje0u5CxpHUrh4K', '1999-05-10', 'Mario Alberto Camacho Salcedo', '99866', 'HUS', '2024-07-23'),
(7375, ' Sergio Gregorio', 'Enriquez Contreras', 'Misiones de Creel', 'D', 'Materialista', '1', '129546', '$2y$10$/Se1E7v/.aveY0k.3CIjXeb7mRwlVVUSw.G.Bj2SsRoqXVa2RaC7m', '1996-02-05', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2024-07-25'),
(7376, ' Erik', 'Rodarte Hernandez', 'Villa Residencial del Rea', 'D', 'Materialista', '1', '129547', '$2y$10$t7Vf7z/bnZeiNfXBd.cyEudEAzRKNuj.c8qsYgjPRsuwU5rfVuXam', '2001-09-03', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2024-07-25'),
(7377, ' Jorge Alberto', 'Ayala Renteria', 'Ejido Sauzal', 'D', 'Materialista', '1', '129548', '$2y$10$G9YR7eMYDgk3wYdxxddIveg.Wny011uSXrw.bUN54arKYSIhwg3hK', '2002-09-22', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2024-07-25'),
(7378, ' Cristian Yasberth', 'Coronado Rodriguez', 'Fray Garcia De San Franci', 'D', 'Almacenista', '1', '129549', '$2y$10$dqtth9ePupQ1vwrg6s3EAOkhgokUeVCVpXBdSCdS5KHepQtHtvxwC', '1992-03-22', 'Israel Saenz MartÃ­nez', '99501', 'HUS', '2024-07-25'),
(7379, ' Daniel Usiel', 'Martinez Garcia', 'Manuel Valdez', 'D', 'Materialista', '1', '129550', '$2y$10$sKLnBMD5FL3hQsL.0TK9Kuc6d9rrd/AcMdFjbSmQN9DeCJjPwch3C', '2002-08-16', 'Humberto Hicks MartÃ­nez', '71193', 'HUS', '2024-07-25'),
(7380, ' Hector Armando', 'Morales Garcia', 'Salvarcar', 'D', 'Operador De Procesos', '1', '129551', '$2y$10$tCRaUb4lZXud5VbXGXxbBeEgwOU1Ai9NRYV6OARVUUq4vaNkmqyLK', '1978-12-03', 'Saul Arellano Escobar', '97722', 'HUS', '2024-07-25'),
(7381, ' Ernesto', 'Illescas Escobedo', 'Riberas del Bravo VII', 'D', 'Operador De Procesos', '1', '129552', '$2y$10$aJGTinSCewpFDwLIxHapV.ykrmywRYU4f8ZCDru9cGwwLi.nlrRky', '2001-03-09', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-07-25'),
(7382, ' Esther Abigail', 'Dominguez Lazarin', 'Zaragoza', 'D', 'Operador De Procesos', '1', '129553', '$2y$10$OiJeahah/myu7eLeGsZyxO616.RdlzRiQ0X7xqIMbFBKk/UbnqtxS', '2003-07-02', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-07-25'),
(7383, ' Daniel', 'Velazquez Villegas', 'Cerradas del Sur', 'D', 'Operador De Procesos', '1', '129554', '$2y$10$udusXqbge8eFAppRed7YPePv1KiKVZZJ5w4TZ.BGv1T6Wp5bNouWa', '1992-07-19', 'Velarde Inostroza Enrique', '71208', 'HUS', '2024-07-25');

-- --------------------------------------------------------

--
-- Table structure for table `vacancies`
--

CREATE TABLE `vacancies` (
  `id` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `number_of_vacancies` int(11) NOT NULL,
  `shifts` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vacancies`
--

INSERT INTO `vacancies` (`id`, `position`, `number_of_vacancies`, `shifts`, `status`) VALUES
(17, 'Asistente de RH', 1, 'CC', 'Disponibles'),
(18, 'Tec. Mtto de Edificio', 1, '1.er', 'En entrevista'),
(19, 'Tec. Electromecanico', 1, 'AA', 'Disponibles'),
(20, 'Tec. de Calidad', 1, '1.er', 'En contrataciÃ³n'),
(31, 'operador', 2, '1.er', 'Disponibles'),
(33, 'Asistente RH', 1, '1.er,2.Âª', 'Disponibles');

-- --------------------------------------------------------

--
-- Table structure for table `votacion_opciones`
--

CREATE TABLE `votacion_opciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `votacion_opciones`
--

INSERT INTO `votacion_opciones` (`id`, `nombre`, `imagen`) VALUES
(40, 'Carro', 'uploads/2017-tesla-roadster-deck-model-petersen-automotive-museum.jpg'),
(41, 'Moto', 'uploads/imagesmoto.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `votacion_opciones_nuevo`
--

CREATE TABLE `votacion_opciones_nuevo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `anio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `votos`
--

CREATE TABLE `votos` (
  `id` int(11) NOT NULL,
  `opcion_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `votos`
--

INSERT INTO `votos` (`id`, `opcion_id`, `usuario_id`) VALUES
(32, 41, 6);

-- --------------------------------------------------------

--
-- Table structure for table `votos_nuevo`
--

CREATE TABLE `votos_nuevo` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `opcion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `approvals`
--
ALTER TABLE `approvals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `citas_cupos`
--
ALTER TABLE `citas_cupos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extravios`
--
ALTER TABLE `extravios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extravios_sodexo`
--
ALTER TABLE `extravios_sodexo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fechas_disponibles`
--
ALTER TABLE `fechas_disponibles`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operators`
--
ALTER TABLE `operators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `pdfs`
--
ALTER TABLE `pdfs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_id` (`survey_id`);

--
-- Indexes for table `recomendaciones`
--
ALTER TABLE `recomendaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registro_citas`
--
ALTER TABLE `registro_citas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reposiciones`
--
ALTER TABLE `reposiciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reposiciones_sodexo`
--
ALTER TABLE `reposiciones_sodexo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temporary_approvals`
--
ALTER TABLE `temporary_approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `approve_user_id` (`approve_user_id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `vacancies`
--
ALTER TABLE `vacancies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votacion_opciones`
--
ALTER TABLE `votacion_opciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votacion_opciones_nuevo`
--
ALTER TABLE `votacion_opciones_nuevo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votos`
--
ALTER TABLE `votos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `opcion_id` (`opcion_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `votos_nuevo`
--
ALTER TABLE `votos_nuevo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `opcion_id` (`opcion_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `approvals`
--
ALTER TABLE `approvals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `citas`
--
ALTER TABLE `citas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `citas_cupos`
--
ALTER TABLE `citas_cupos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `extravios`
--
ALTER TABLE `extravios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `extravios_sodexo`
--
ALTER TABLE `extravios_sodexo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fechas_disponibles`
--
ALTER TABLE `fechas_disponibles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `operators`
--
ALTER TABLE `operators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pdfs`
--
ALTER TABLE `pdfs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `recomendaciones`
--
ALTER TABLE `recomendaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `registro_citas`
--
ALTER TABLE `registro_citas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reposiciones`
--
ALTER TABLE `reposiciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reposiciones_sodexo`
--
ALTER TABLE `reposiciones_sodexo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `surveys`
--
ALTER TABLE `surveys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `temporary_approvals`
--
ALTER TABLE `temporary_approvals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7384;

--
-- AUTO_INCREMENT for table `vacancies`
--
ALTER TABLE `vacancies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `votacion_opciones`
--
ALTER TABLE `votacion_opciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `votacion_opciones_nuevo`
--
ALTER TABLE `votacion_opciones_nuevo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `votos`
--
ALTER TABLE `votos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `votos_nuevo`
--
ALTER TABLE `votos_nuevo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `temporary_approvals`
--
ALTER TABLE `temporary_approvals`
  ADD CONSTRAINT `temporary_approvals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `temporary_approvals_ibfk_2` FOREIGN KEY (`approve_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `votos`
--
ALTER TABLE `votos`
  ADD CONSTRAINT `votos_ibfk_1` FOREIGN KEY (`opcion_id`) REFERENCES `votacion_opciones` (`id`),
  ADD CONSTRAINT `votos_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `votos_nuevo`
--
ALTER TABLE `votos_nuevo`
  ADD CONSTRAINT `votos_nuevo_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `votos_nuevo_ibfk_2` FOREIGN KEY (`opcion_id`) REFERENCES `votacion_opciones_nuevo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
