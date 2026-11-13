-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 13-11-2026 a las 14:20:46
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `imparablev2_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'CATEGORIA 1', '2026-11-11 23:05:56', '2026-11-11 23:05:56'),
(2, 'CATEGORIA 2', '2026-11-11 23:06:01', '2026-11-11 23:06:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_exp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono_ref` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobro_metodos`
--

CREATE TABLE `cobro_metodos` (
  `id` bigint UNSIGNED NOT NULL,
  `venta_cobro_id` bigint UNSIGNED NOT NULL,
  `metodo_pago_id` bigint UNSIGNED NOT NULL,
  `monto` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre_sistema` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `web` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `nombre_sistema`, `alias`, `razon_social`, `nit`, `ciudad`, `dir`, `fono`, `web`, `actividad`, `correo`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'IMPARABLE V2', 'IMPARABLE', 'IMPARABLE S.A.', '11111111111', 'LA PAZ - BOLIVIA', 'LOS PEDREGALES #223', '2323232 - 7776666', NULL, 'ACTIVIDAD EMPRESA', 'imparable@gmail.com', 'logo.png', '2026-11-10 15:14:24', '2026-11-10 15:14:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disciplinas`
--

CREATE TABLE `disciplinas` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(700) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disciplina_plans`
--

CREATE TABLE `disciplina_plans` (
  `id` bigint UNSIGNED NOT NULL,
  `disciplina_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` json DEFAULT NULL,
  `datos_nuevo` json DEFAULT NULL,
  `modulo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_accions`
--

INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN TIPO DE INGRESO', '{\"id\": 2, \"nombre\": \"POR COMPRAS\", \"created_at\": \"2026-11-11T21:35:05.000000Z\", \"updated_at\": \"2026-11-11T21:35:05.000000Z\", \"descripcion\": \"\"}', NULL, 'TIPO DE INGRESOS', '2026-11-11', '17:35:05', '2026-11-11 21:35:05', '2026-11-11 21:35:05'),
(2, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN TIPO DE INGRESO', '{\"id\": 1, \"nombre\": \"POR COMPRAS\", \"created_at\": \"2026-11-11T21:35:30.000000Z\", \"updated_at\": \"2026-11-11T21:35:30.000000Z\", \"descripcion\": \"\"}', NULL, 'TIPO DE INGRESOS', '2026-11-11', '17:35:30', '2026-11-11 21:35:30', '2026-11-11 21:35:30'),
(3, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN TIPO DE SALIDA', '{\"id\": 1, \"nombre\": \"POR PERDIDA\", \"created_at\": \"2026-11-11T21:35:44.000000Z\", \"updated_at\": \"2026-11-11T21:35:44.000000Z\", \"descripcion\": \"\"}', NULL, 'TIPO DE SALIDAS', '2026-11-11', '17:35:44', '2026-11-11 21:35:44', '2026-11-11 21:35:44'),
(4, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN TIPO DE SALIDA', '{\"id\": 2, \"nombre\": \"VENCIMIENTO\", \"created_at\": \"2026-11-11T21:35:51.000000Z\", \"updated_at\": \"2026-11-11T21:35:51.000000Z\", \"descripcion\": \"\"}', NULL, 'TIPO DE SALIDAS', '2026-11-11', '17:35:51', '2026-11-11 21:35:51', '2026-11-11 21:35:51'),
(5, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', '{\"id\": 2, \"nombre\": \"ADMINISTRADOR\", \"created_at\": \"2026-11-11T21:47:36.000000Z\", \"updated_at\": \"2026-11-11T21:47:36.000000Z\"}', NULL, 'ROLES', '2026-11-11', '17:47:36', '2026-11-11 21:47:36', '2026-11-11 21:47:36'),
(6, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', '{\"id\": 3, \"nombre\": \"RECEPCIONISTA\", \"created_at\": \"2026-11-11T21:47:46.000000Z\", \"updated_at\": \"2026-11-11T21:47:46.000000Z\"}', NULL, 'ROLES', '2026-11-11', '17:47:46', '2026-11-11 21:47:46', '2026-11-11 21:47:46'),
(7, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA SUCURSAL', '{\"id\": 2, \"activo\": \"1\", \"nombre\": \"SUCURSAL 2\", \"created_at\": \"2026-11-11T21:59:37.000000Z\", \"updated_at\": \"2026-11-11T21:59:37.000000Z\", \"fecha_registro\": \"2026-11-11\"}', NULL, 'SUCURSALES', '2026-11-11', '17:59:37', '2026-11-11 21:59:37', '2026-11-11 21:59:37'),
(8, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA SUCURSAL', '{\"id\": 3, \"activo\": \"1\", \"nombre\": \"SUCURSAL 3\", \"created_at\": \"2026-11-11T21:59:44.000000Z\", \"updated_at\": \"2026-11-11T21:59:44.000000Z\", \"fecha_registro\": \"2026-11-11\"}', NULL, 'SUCURSALES', '2026-11-11', '17:59:44', '2026-11-11 21:59:44', '2026-11-11 21:59:44'),
(9, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PROVEEDOR', '{\"id\": 1, \"nombre\": \"PROVEEDOR 1\", \"contacto\": null, \"created_at\": \"2026-11-11T21:59:54.000000Z\", \"updated_at\": \"2026-11-11T21:59:54.000000Z\"}', NULL, 'PROVEEDORES', '2026-11-11', '17:59:54', '2026-11-11 21:59:54', '2026-11-11 21:59:54'),
(10, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PROVEEDOR', '{\"id\": 2, \"nombre\": \"PROVEEDOR 2\", \"contacto\": null, \"created_at\": \"2026-11-11T22:00:01.000000Z\", \"updated_at\": \"2026-11-11T22:00:01.000000Z\"}', NULL, 'PROVEEDORES', '2026-11-11', '18:00:01', '2026-11-11 22:00:01', '2026-11-11 22:00:01'),
(11, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', '{\"ci\": \"123456\", \"id\": 2, \"fono\": \"67676767\", \"foto\": \"2_3a1abb60-83ed-4641-b2df-e190ed816c23.jpg\", \"tipo\": \"EMPLEADO\", \"acceso\": \"1\", \"ci_exp\": \"LP\", \"correo\": \"juan@gmail.com\", \"nombre\": \"JUAN\", \"materno\": \"MAMANI\", \"paterno\": \"PERES\", \"role_id\": \"3\", \"usuario\": \"JPERES\", \"created_at\": \"2026-11-11T22:50:13.000000Z\", \"updated_at\": \"2026-11-11T22:50:13.000000Z\", \"fecha_registro\": \"2026-11-11\", \"sucursal_todos\": 0}', NULL, 'USUARIOS', '2026-11-11', '18:50:13', '2026-11-11 22:50:13', '2026-11-11 22:50:13'),
(12, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN USUARIO', '{\"ci\": \"123456\", \"id\": 2, \"fono\": \"67676767\", \"foto\": \"2_3a1abb60-83ed-4641-b2df-e190ed816c23.jpg\", \"tipo\": \"EMPLEADO\", \"acceso\": 1, \"ci_exp\": \"LP\", \"codigo\": null, \"correo\": \"juan@gmail.com\", \"nombre\": \"JUAN\", \"status\": 1, \"materno\": \"MAMANI\", \"paterno\": \"PERES\", \"role_id\": 3, \"usuario\": \"JPERES\", \"created_at\": \"2026-11-11T22:50:13.000000Z\", \"updated_at\": \"2026-11-11T22:50:13.000000Z\", \"fecha_registro\": \"2026-11-11\", \"sucursal_todos\": 0}', '{\"ci\": \"123456\", \"id\": 2, \"fono\": \"67676767\", \"foto\": \"2_3a1abb60-83ed-4641-b2df-e190ed816c23.jpg\", \"tipo\": \"EMPLEADO\", \"acceso\": \"1\", \"ci_exp\": \"LP\", \"codigo\": null, \"correo\": \"juan@gmail.com\", \"nombre\": \"JUAN\", \"status\": 1, \"materno\": \"MAMANI\", \"paterno\": \"PERES\", \"role_id\": \"3\", \"usuario\": \"JPERES1\", \"created_at\": \"2026-11-11T22:50:13.000000Z\", \"updated_at\": \"2026-11-11T22:56:58.000000Z\", \"fecha_registro\": \"2026-11-11\", \"sucursal_todos\": 0}', 'USUARIOS', '2026-11-11', '18:56:58', '2026-11-11 22:56:58', '2026-11-11 22:56:58'),
(13, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN USUARIO', '{\"ci\": \"123456\", \"id\": 2, \"fono\": \"67676767\", \"foto\": \"2_3a1abb60-83ed-4641-b2df-e190ed816c23.jpg\", \"tipo\": \"EMPLEADO\", \"acceso\": 1, \"ci_exp\": \"LP\", \"codigo\": null, \"correo\": \"juan@gmail.com\", \"nombre\": \"JUAN\", \"status\": 1, \"materno\": \"MAMANI\", \"paterno\": \"PERES\", \"role_id\": 3, \"usuario\": \"JPERES1\", \"created_at\": \"2026-11-11T22:50:13.000000Z\", \"updated_at\": \"2026-11-11T22:56:58.000000Z\", \"fecha_registro\": \"2026-11-11\", \"sucursal_todos\": 0}', '{\"ci\": \"123456\", \"id\": 2, \"fono\": \"67676767\", \"foto\": \"2_3a1abb60-83ed-4641-b2df-e190ed816c23.jpg\", \"tipo\": \"EMPLEADO\", \"acceso\": \"1\", \"ci_exp\": \"LP\", \"codigo\": null, \"correo\": \"juan@gmail.com\", \"nombre\": \"JUAN\", \"status\": 1, \"materno\": \"MAMANI\", \"paterno\": \"PERES\", \"role_id\": \"3\", \"usuario\": \"JPERES\", \"created_at\": \"2026-11-11T22:50:13.000000Z\", \"updated_at\": \"2026-11-11T23:01:16.000000Z\", \"fecha_registro\": \"2026-11-11\", \"sucursal_todos\": 0}', 'USUARIOS', '2026-11-11', '19:01:16', '2026-11-11 23:01:16', '2026-11-11 23:01:16'),
(14, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN USUARIO', '{\"ci\": \"123456\", \"id\": 2, \"fono\": \"67676767\", \"foto\": \"2_3a1abb60-83ed-4641-b2df-e190ed816c23.jpg\", \"tipo\": \"EMPLEADO\", \"acceso\": 1, \"ci_exp\": \"LP\", \"codigo\": null, \"correo\": \"juan@gmail.com\", \"nombre\": \"JUAN\", \"status\": 1, \"materno\": \"MAMANI\", \"paterno\": \"PERES\", \"role_id\": 3, \"usuario\": \"JPERES\", \"created_at\": \"2026-11-11T22:50:13.000000Z\", \"updated_at\": \"2026-11-11T23:01:16.000000Z\", \"fecha_registro\": \"2026-11-11\", \"sucursal_todos\": 0}', '{\"ci\": \"123456\", \"id\": 2, \"fono\": \"67676767\", \"foto\": \"2_3a1abb60-83ed-4641-b2df-e190ed816c23.jpg\", \"tipo\": \"EMPLEADO\", \"acceso\": \"1\", \"ci_exp\": \"LP\", \"codigo\": null, \"correo\": \"juan@gmail.com\", \"nombre\": \"JUAN\", \"status\": 1, \"materno\": \"MAMANI\", \"paterno\": \"PERES\", \"role_id\": \"3\", \"usuario\": \"JPERES1\", \"created_at\": \"2026-11-11T22:50:13.000000Z\", \"updated_at\": \"2026-11-11T23:01:22.000000Z\", \"fecha_registro\": \"2026-11-11\", \"sucursal_todos\": 0}', 'USUARIOS', '2026-11-11', '19:01:22', '2026-11-11 23:01:22', '2026-11-11 23:01:22'),
(15, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN USUARIO', '{\"ci\": \"123456\", \"id\": 2, \"fono\": \"67676767\", \"foto\": \"2_3a1abb60-83ed-4641-b2df-e190ed816c23.jpg\", \"tipo\": \"EMPLEADO\", \"acceso\": 1, \"ci_exp\": \"LP\", \"codigo\": null, \"correo\": \"juan@gmail.com\", \"nombre\": \"JUAN\", \"status\": 1, \"materno\": \"MAMANI\", \"paterno\": \"PERES\", \"role_id\": 3, \"usuario\": \"JPERES1\", \"created_at\": \"2026-11-11T22:50:13.000000Z\", \"updated_at\": \"2026-11-11T23:01:22.000000Z\", \"fecha_registro\": \"2026-11-11\", \"sucursal_todos\": 0}', '{\"ci\": \"123456\", \"id\": 2, \"fono\": \"67676767\", \"foto\": \"2_3a1abb60-83ed-4641-b2df-e190ed816c23.jpg\", \"tipo\": \"EMPLEADO\", \"acceso\": \"1\", \"ci_exp\": \"LP\", \"codigo\": null, \"correo\": \"juan@gmail.com\", \"nombre\": \"JUAN\", \"status\": 1, \"materno\": \"MAMANI\", \"paterno\": \"PERES\", \"role_id\": \"3\", \"usuario\": \"JPERES\", \"created_at\": \"2026-11-11T22:50:13.000000Z\", \"updated_at\": \"2026-11-11T23:02:17.000000Z\", \"fecha_registro\": \"2026-11-11\", \"sucursal_todos\": 0}', 'USUARIOS', '2026-11-11', '19:02:17', '2026-11-11 23:02:17', '2026-11-11 23:02:17'),
(16, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN USUARIO', '{\"ci\": \"123456\", \"id\": 2, \"fono\": \"67676767\", \"foto\": \"2_3a1abb60-83ed-4641-b2df-e190ed816c23.jpg\", \"tipo\": \"EMPLEADO\", \"acceso\": 1, \"ci_exp\": \"LP\", \"codigo\": null, \"correo\": \"juan@gmail.com\", \"nombre\": \"JUAN\", \"status\": 1, \"materno\": \"MAMANI\", \"paterno\": \"PERES\", \"role_id\": 3, \"usuario\": \"JPERES\", \"created_at\": \"2026-11-11T22:50:13.000000Z\", \"updated_at\": \"2026-11-11T23:02:17.000000Z\", \"fecha_registro\": \"2026-11-11\", \"sucursal_todos\": 0}', '{\"ci\": \"123456\", \"id\": 2, \"fono\": \"67676767\", \"foto\": \"2_3a1abb60-83ed-4641-b2df-e190ed816c23.jpg\", \"tipo\": \"EMPLEADO\", \"acceso\": \"1\", \"ci_exp\": \"LP\", \"codigo\": null, \"correo\": \"juan@gmail.com\", \"nombre\": \"JUAN\", \"status\": 1, \"materno\": \"MAMANI\", \"paterno\": \"PERES\", \"role_id\": \"3\", \"usuario\": \"JPERES1\", \"created_at\": \"2026-11-11T22:50:13.000000Z\", \"updated_at\": \"2026-11-11T23:02:54.000000Z\", \"fecha_registro\": \"2026-11-11\", \"sucursal_todos\": 0}', 'USUARIOS', '2026-11-11', '19:02:54', '2026-11-11 23:02:54', '2026-11-11 23:02:54'),
(17, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA SUCURSAL', '{\"id\": 3, \"dir\": null, \"fono\": null, \"activo\": 1, \"nombre\": \"SUCURSAL 3\", \"created_at\": \"2026-11-11T21:59:44.000000Z\", \"updated_at\": \"2026-11-11T21:59:44.000000Z\", \"fecha_registro\": \"2026-11-11\"}', '{\"id\": 3, \"dir\": null, \"fono\": null, \"activo\": \"0\", \"nombre\": \"SUCURSAL 3\", \"created_at\": \"2026-11-11T21:59:44.000000Z\", \"updated_at\": \"2026-11-11T23:04:04.000000Z\", \"fecha_registro\": \"2026-11-11\"}', 'SUCURSALES', '2026-11-11', '19:04:04', '2026-11-11 23:04:04', '2026-11-11 23:04:04'),
(18, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA SUCURSAL', '{\"id\": 3, \"dir\": null, \"fono\": null, \"activo\": 0, \"nombre\": \"SUCURSAL 3\", \"created_at\": \"2026-11-11T21:59:44.000000Z\", \"updated_at\": \"2026-11-11T23:04:04.000000Z\", \"fecha_registro\": \"2026-11-11\"}', '{\"id\": 3, \"dir\": null, \"fono\": null, \"activo\": \"1\", \"nombre\": \"SUCURSAL 3\", \"created_at\": \"2026-11-11T21:59:44.000000Z\", \"updated_at\": \"2026-11-11T23:04:16.000000Z\", \"fecha_registro\": \"2026-11-11\"}', 'SUCURSALES', '2026-11-11', '19:04:16', '2026-11-11 23:04:16', '2026-11-11 23:04:16'),
(19, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA UNIDAD DE MEDIDA', '{\"id\": 1, \"nombre\": \"UNIDAD\", \"created_at\": \"2026-11-11T23:05:41.000000Z\", \"updated_at\": \"2026-11-11T23:05:41.000000Z\"}', NULL, 'UNIDADES DE MEDIDA', '2026-11-11', '19:05:41', '2026-11-11 23:05:41', '2026-11-11 23:05:41'),
(20, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA MARCA', '{\"id\": 1, \"nombre\": \"MARCA 1\", \"created_at\": \"2026-11-11T23:05:47.000000Z\", \"updated_at\": \"2026-11-11T23:05:47.000000Z\"}', NULL, 'MARCAS', '2026-11-11', '19:05:47', '2026-11-11 23:05:47', '2026-11-11 23:05:47'),
(21, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA MARCA', '{\"id\": 2, \"nombre\": \"MARCA 2\", \"created_at\": \"2026-11-11T23:05:52.000000Z\", \"updated_at\": \"2026-11-11T23:05:52.000000Z\"}', NULL, 'MARCAS', '2026-11-11', '19:05:52', '2026-11-11 23:05:52', '2026-11-11 23:05:52'),
(22, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA CATEGORIA', '{\"id\": 1, \"nombre\": \"CATEGORIA 1\", \"created_at\": \"2026-11-11T23:05:56.000000Z\", \"updated_at\": \"2026-11-11T23:05:56.000000Z\"}', NULL, 'CATEGORIAS', '2026-11-11', '19:05:56', '2026-11-11 23:05:56', '2026-11-11 23:05:56'),
(23, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA CATEGORIA', '{\"id\": 2, \"nombre\": \"CATEGORIA 2\", \"created_at\": \"2026-11-11T23:06:01.000000Z\", \"updated_at\": \"2026-11-11T23:06:01.000000Z\"}', NULL, 'CATEGORIAS', '2026-11-11', '19:06:01', '2026-11-11 23:06:01', '2026-11-11 23:06:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_detalles`
--

CREATE TABLE `ingreso_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `ingreso_producto_id` bigint UNSIGNED NOT NULL,
  `tipo_ingreso_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `verificado` double NOT NULL DEFAULT '0',
  `faltantes` int DEFAULT NULL,
  `repuesto` double NOT NULL DEFAULT '0',
  `observacion` varchar(900) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cantidad_fisica` double DEFAULT NULL,
  `costo` decimal(24,2) NOT NULL,
  `subtotal` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_faltantes`
--

CREATE TABLE `ingreso_faltantes` (
  `id` bigint UNSIGNED NOT NULL,
  `ingreso_producto_id` bigint UNSIGNED NOT NULL,
  `ingreso_detalle_id` bigint UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_metodos`
--

CREATE TABLE `ingreso_metodos` (
  `id` bigint UNSIGNED NOT NULL,
  `ingreso_producto_id` bigint UNSIGNED NOT NULL,
  `metodo_pago_id` bigint UNSIGNED NOT NULL,
  `monto` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_pagos`
--

CREATE TABLE `ingreso_pagos` (
  `id` bigint UNSIGNED NOT NULL,
  `sucursal_id` bigint UNSIGNED NOT NULL,
  `ingreso_producto_id` bigint UNSIGNED NOT NULL,
  `proveedor_id` bigint UNSIGNED NOT NULL,
  `monto_efectivo` decimal(24,2) NOT NULL,
  `monto_qr` decimal(24,2) NOT NULL,
  `monto_total` decimal(24,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_productos`
--

CREATE TABLE `ingreso_productos` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sucursal_id` bigint UNSIGNED NOT NULL,
  `tipo_ingreso_id` bigint UNSIGNED NOT NULL,
  `proveedor_id` bigint UNSIGNED NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `saldo` decimal(24,2) NOT NULL,
  `tipo_compra` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `estado_ingreso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDIENTE',
  `estado_faltantes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_recepcions`
--

CREATE TABLE `ingreso_recepcions` (
  `id` bigint UNSIGNED NOT NULL,
  `ingreso_producto_id` bigint UNSIGNED NOT NULL,
  `ingreso_detalle_id` bigint UNSIGNED NOT NULL,
  `sucursal_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcions`
--

CREATE TABLE `inscripcions` (
  `id` bigint UNSIGNED NOT NULL,
  `sucursal_id` bigint UNSIGNED NOT NULL,
  `user_cliente_id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `venta_detalle_id` bigint UNSIGNED NOT NULL,
  `declaracion_jurada` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `fecha_pausa` date DEFAULT NULL,
  `dias_pausa` int DEFAULT NULL,
  `justificacion_pausa` text COLLATE utf8mb4_unicode_ci,
  `dias_restantes` int NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `user_pausa_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex_productos`
--

CREATE TABLE `kardex_productos` (
  `id` bigint UNSIGNED NOT NULL,
  `sucursal_id` bigint UNSIGNED NOT NULL,
  `ingreso_detalle_id` bigint UNSIGNED DEFAULT NULL,
  `tipo_registro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro_id` bigint UNSIGNED DEFAULT NULL,
  `modulo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `detalle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(24,2) DEFAULT NULL,
  `tipo_is` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad_ingreso` double DEFAULT NULL,
  `cantidad_salida` double DEFAULT NULL,
  `cantidad_saldo` double NOT NULL,
  `cu` decimal(24,2) NOT NULL,
  `monto_ingreso` decimal(24,2) DEFAULT NULL,
  `monto_salida` decimal(24,2) DEFAULT NULL,
  `monto_saldo` decimal(24,2) NOT NULL,
  `fecha` date NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'MARCA 1', '2026-11-11 23:05:47', '2026-11-11 23:05:47'),
(2, 'MARCA 2', '2026-11-11 23:05:52', '2026-11-11 23:05:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pagos`
--

CREATE TABLE `metodo_pagos` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000001_create_sucursals_table', 1),
(2, '2024_11_02_153309_create_roles_table', 1),
(3, '2024_11_02_153315_create_modulos_table', 1),
(4, '2024_11_02_153316_create_permisos_table', 1),
(5, '2024_11_13_000002_create_users_table', 1),
(6, '2024_11_13_000003_create_historial_accions_table', 1),
(7, '2026_04_02_203435_create_clientes_table', 1),
(8, '2026_07_11_124903_create_categorias_table', 1),
(9, '2026_07_11_124904_create_marcas_table', 1),
(10, '2026_07_11_124904_create_unidad_medidas_table', 1),
(11, '2026_07_11_124905_create_productos_table', 1),
(12, '2026_07_11_124928_create_tipo_ingresos_table', 1),
(13, '2026_07_11_124932_create_tipo_salidas_table', 1),
(14, '2026_07_11_124938_create_metodo_pagos_table', 1),
(15, '2026_07_11_124938_create_proveedors_table', 1),
(16, '2026_07_11_124939_create_ingreso_productos_table', 1),
(17, '2026_07_11_124940_create_ingreso_metodos_table', 1),
(18, '2026_07_11_140254_create_ingreso_detalles_table', 1),
(19, '2026_07_11_140255_create_salida_productos_table', 1),
(20, '2026_07_11_140303_create_ventas_table', 1),
(21, '2026_07_11_140304_create_venta_metodos_table', 1),
(22, '2026_07_11_140306_create_venta_detalles_table', 1),
(23, '2026_07_11_140855_create_kardex_productos_table', 1),
(24, '2026_07_11_141426_create_producto_sucursals_table', 1),
(25, '2026_08_30_111049_create_salida_detalles_table', 1),
(26, '2026_09_04_095816_create_traspasos_table', 1),
(27, '2026_09_04_095819_create_traspaso_detalles_table', 1),
(28, '2026_09_07_112006_create_ingreso_pagos_table', 1),
(29, '2026_09_09_093956_create_venta_cobros_table', 1),
(30, '2026_09_09_152725_create_proformas_table', 1),
(31, '2026_09_09_152745_create_proforma_detalles_table', 1),
(32, '2026_09_13_132625_create_configuracions_table', 1),
(33, '2026_09_20_145902_create_ingreso_faltantes_table', 1),
(34, '2026_10_17_103418_create_ingreso_recepcions_table', 1),
(35, '2026_10_17_103904_create_notificacions_table', 1),
(36, '2026_10_17_103913_create_notificacion_users_table', 1),
(37, '2026_11_08_162753_create_venta_lotes_table', 1),
(38, '2026_11_08_163156_create_disciplinas_table', 1),
(39, '2026_11_08_163202_create_promocions_table', 1),
(40, '2026_11_08_163235_create_inscripcions_table', 1),
(41, '2026_11_08_163240_create_movimiento_cajas_table', 1),
(42, '2026_11_08_163241_create_movimiento_metodos_table', 1),
(43, '2026_11_08_171238_create_telescope_entries_table', 1),
(44, '2026_11_10_105537_create_disciplina_plans_table', 1),
(45, '2026_11_10_105605_create_producto_promocions_table', 1),
(46, '2026_11_10_110747_create_cobro_metodos_table', 1),
(47, '2026_11_10_110855_create_user_sucursals_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id` bigint UNSIGNED NOT NULL,
  `modulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_cajas`
--

CREATE TABLE `movimiento_cajas` (
  `id` bigint UNSIGNED NOT NULL,
  `sucursal_id` bigint UNSIGNED DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modulo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro_id` bigint UNSIGNED DEFAULT NULL,
  `monto_total` decimal(24,2) NOT NULL,
  `metodo_pago_id` bigint UNSIGNED NOT NULL,
  `tipo_movimiento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(900) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_metodos`
--

CREATE TABLE `movimiento_metodos` (
  `id` bigint UNSIGNED NOT NULL,
  `movimiento_caja_id` bigint UNSIGNED NOT NULL,
  `metodo_pago_id` bigint UNSIGNED NOT NULL,
  `monto` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacions`
--

CREATE TABLE `notificacions` (
  `id` bigint UNSIGNED NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registro_id` bigint UNSIGNED DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion_users`
--

CREATE TABLE `notificacion_users` (
  `id` bigint UNSIGNED NOT NULL,
  `notificacion_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `visto` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `modulo_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria_id` bigint UNSIGNED DEFAULT NULL,
  `marca_id` bigint UNSIGNED DEFAULT NULL,
  `unidad_medida_id` bigint UNSIGNED NOT NULL,
  `caracteristicas` text COLLATE utf8mb4_unicode_ci,
  `precio` decimal(24,2) NOT NULL,
  `precio_compra` decimal(24,2) DEFAULT NULL,
  `stock_min` double DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_promocions`
--

CREATE TABLE `producto_promocions` (
  `id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `promocion_id` bigint UNSIGNED NOT NULL,
  `fecha_registro` date NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_sucursals`
--

CREATE TABLE `producto_sucursals` (
  `id` bigint UNSIGNED NOT NULL,
  `sucursal_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `stock_actual` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proformas`
--

CREATE TABLE `proformas` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo_proforma` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sucursal_id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `nit_ci` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` decimal(24,2) NOT NULL,
  `descuento` decimal(24,2) NOT NULL,
  `porcentaje_descuento` double NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `cancelado` decimal(24,2) NOT NULL,
  `saldo` decimal(24,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proforma_detalles`
--

CREATE TABLE `proforma_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `proforma_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `precio` decimal(24,2) NOT NULL,
  `descuento_uni` decimal(24,2) NOT NULL,
  `porcen_du` double NOT NULL,
  `descuento_total` decimal(24,2) NOT NULL,
  `porcen_dt` double NOT NULL,
  `precio_final` decimal(24,2) NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `total_uni` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocions`
--

CREATE TABLE `promocions` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_ini` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `inscripciones` int DEFAULT NULL,
  `fecha_regitro` date NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedors`
--

CREATE TABLE `proveedors` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contacto` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`id`, `nombre`, `contacto`, `created_at`, `updated_at`) VALUES
(1, 'PROVEEDOR 1', NULL, '2026-11-11 21:59:54', '2026-11-11 21:59:54'),
(2, 'PROVEEDOR 2', NULL, '2026-11-11 22:00:01', '2026-11-11 22:00:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permisos` int NOT NULL DEFAULT '0',
  `usuarios` int NOT NULL DEFAULT '1',
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `permisos`, `usuarios`, `status`, `created_at`, `updated_at`) VALUES
(1, 'SUPER USUARIO', 1, 0, 1, '2026-11-10 15:14:24', '2026-11-10 15:14:24'),
(2, 'ADMINISTRADOR', 0, 1, 1, '2026-11-11 21:47:36', '2026-11-11 21:47:36'),
(3, 'RECEPCIONISTA', 0, 1, 1, '2026-11-11 21:47:46', '2026-11-11 21:47:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida_detalles`
--

CREATE TABLE `salida_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `salida_producto_id` bigint UNSIGNED NOT NULL,
  `tipo_salida_id` bigint UNSIGNED NOT NULL,
  `ingreso_detalle_id` bigint UNSIGNED DEFAULT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `observacion` varchar(900) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida_productos`
--

CREATE TABLE `salida_productos` (
  `id` bigint UNSIGNED NOT NULL,
  `sucursal_id` bigint UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `descripcion` varchar(800) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursals`
--

CREATE TABLE `sucursals` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(800) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` int NOT NULL DEFAULT '1',
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sucursals`
--

INSERT INTO `sucursals` (`id`, `nombre`, `fono`, `dir`, `activo`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'SUCURSAL 1', 'SUCURSAL 1', 'ZONA LOS PEDREGALES', 1, '2026-11-10', '2026-11-10 15:14:24', '2026-11-10 15:14:24'),
(2, 'SUCURSAL 2', NULL, NULL, 1, '2026-11-11', '2026-11-11 21:59:37', '2026-11-11 21:59:37'),
(3, 'SUCURSAL 3', NULL, NULL, 1, '2026-11-11', '2026-11-11 21:59:44', '2026-11-11 23:04:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `telescope_entries`
--

INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(13909, 'a3374ec2-eb12-461b-8f4b-24e02bb04edf', 'a3374ec2-fef7-41ea-a2ae-f18743ed853e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.24\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:16:39'),
(13910, 'a3374ec2-ec79-418e-b190-b473a6313f11', 'a3374ec2-fef7-41ea-a2ae-f18743ed853e', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:16:39'),
(13911, 'a3374ec2-eea6-4470-b4a9-529c2a6f41be', 'a3374ec2-fef7-41ea-a2ae-f18743ed853e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.84\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:39'),
(13912, 'a3374ec2-ef96-4ccf-bebc-9fe859481bdd', 'a3374ec2-fef7-41ea-a2ae-f18743ed853e', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.42\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:39'),
(13913, 'a3374ec2-efb8-4920-80f3-b85ee899fb79', 'a3374ec2-fef7-41ea-a2ae-f18743ed853e', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:39'),
(13914, 'a3374ec2-fbf0-4bd6-99d3-c18917c37aa5', 'a3374ec2-fef7-41ea-a2ae-f18743ed853e', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"permisos_cache_version\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:39'),
(13915, 'a3374ec2-fc48-447d-a463-c308d4a69ab8', 'a3374ec2-fef7-41ea-a2ae-f18743ed853e', NULL, 1, 'cache', '{\"type\":\"hit\",\"key\":\"permisos_role_v1_1\",\"value\":\"*\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:39'),
(13916, 'a3374ec2-fe25-48e2-8e7d-0d9c6beb5929', 'a3374ec2-fef7-41ea-a2ae-f18743ed853e', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/sucursals\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\SucursalController@index\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6ImgzV2RZUFpyemVJZm02Uk9SSXVvVGc9PSIsInZhbHVlIjoiaUxHUWV0emVwblR0cHhFWHV5NytEZ0NzaGtsR3ZpRnB6cFU3ZlA0SEl1ZG5uWE8yd3JRMzJJNk9CQ2RqSHJSNC9xMXhOSTVURTVYelRiTnZwK0ovaTFGd1VIYlVLQ0lJelB6THZLL2VJa3ZRemhvczBxbGoyK1g0WXk2QzlLOCsiLCJtYWMiOiIxY2RkZTY1MTA3ZGE0ZTU1YWY0ZjRjOTRlZGM4MWNjYmJmYWVlYTExYmE3MmI1M2Y1MjMzZWUxNTU4MGE1OWZkIiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6InBzeXd5VGFrR0k5SE8xVCtMSXlpa3c9PSIsInZhbHVlIjoiSCtKcU9wODdYRjJCTW51QVJzUGF1NjE1VXFsK2c2QVNCL1hjNzJwckFqcGo4akVBRFdXVTZWMm9qYXJiYmpUUEZJTzhwUnNLZEZTeFFDZERuc2NEdlF4dkpiUVVzbXlCYXpIWk1aNm1xTy9waU9XWm4vemZoYnlMTFpLNVBERDIiLCJtYWMiOiI3M2IyNjk2YmRiNzc2OGFmMDhiYzc5MjE4MWZhODU0MTA2NzA4M2M3ZjAyZWE2OWFmN2RhOTI5MzBhNzE4NWE3IiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/inicio\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-inertia\":\"true\",\"accept\":\"text\\/html, application\\/xhtml+xml\",\"x-inertia-version\":\"c8bdfce04e03ced50b63f0f87a38dbf0\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6ImgzV2RZUFpyemVJZm02Uk9SSXVvVGc9PSIsInZhbHVlIjoiaUxHUWV0emVwblR0cHhFWHV5NytEZ0NzaGtsR3ZpRnB6cFU3ZlA0SEl1ZG5uWE8yd3JRMzJJNk9CQ2RqSHJSNC9xMXhOSTVURTVYelRiTnZwK0ovaTFGd1VIYlVLQ0lJelB6THZLL2VJa3ZRemhvczBxbGoyK1g0WXk2QzlLOCsiLCJtYWMiOiIxY2RkZTY1MTA3ZGE0ZTU1YWY0ZjRjOTRlZGM4MWNjYmJmYWVlYTExYmE3MmI1M2Y1MjMzZWUxNTU4MGE1OWZkIiwidGFnIjoiIn0=\"},\"payload\":[],\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"x-inertia\":\"true\",\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:16:39 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6ImRhU0EzcXFUYm9mdko3Wk5pM1hHNGc9PSIsInZhbHVlIjoiL0JLaDBIRy9LUjN5Nld2YWwzTTY0a3l2bTFoV1E4ZmZLcEttbGhkdXJzUDA3TXBldS9qSk16WExJMzNJanI2bHhFSGtGZXo4RWt1VG1UU1BVVVdkQjNlZmpTQktXWkN2dEVOOWJ6dU9nUkpJbk5HbXd6WXk4SFpwVXhoWk9mNUkiLCJtYWMiOiI2MzUzNDY1YmZkYThkMTNjMzJhYTc5Zjc0OTVkZGE5ZDM2MmUzNGM2ZmQwMmI1OGFjOWM4ZjUxNzhmYWE0NGZhIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:16:39 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6IldGZ1ZNNzVtbHhxd0JOUGtHMEJZYnc9PSIsInZhbHVlIjoiaFczMGsxK0lFTUU2cFJpV2NlNmZnalBWZjJTekZwNitVRUdSdEZtcFdSOVU0bGo1WWdqdldsNkwxOGgremdUMDBXWTlqSUIzdjlkYldBc2E2SXorb1pRM2Nnb3BZU29CZlZhYkNNNWsyOGtaODJBUnpFQlhNZkZWdjgwM1FvdTUiLCJtYWMiOiJlZTcyMzZjZGEzMjliNDY1MjA2ZTExMDgwNjk0NDExMjZlMWUzOTJhMmM3MTY1ZDk5NWYyNzI5MjcxMDIzOTI3IiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:16:39 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"component\":\"Admin\\/Sucursals\\/Index\",\"props\":{\"errors\":[],\"auth\":{\"user\":{\"id\":1,\"usuario\":\"admin\",\"codigo\":\"admin\",\"nombre\":\"admin\",\"paterno\":\"admin\",\"materno\":\"\",\"ci\":\"0\",\"ci_exp\":\"\",\"fono\":null,\"correo\":\"\",\"foto\":null,\"tipo\":\"ADMINISTRACI\\u00d3N\",\"role_id\":1,\"sucursal_todos\":1,\"fecha_registro\":\"2026-11-10\",\"acceso\":1,\"status\":1,\"created_at\":\"2026-11-10T15:14:24.000000Z\",\"updated_at\":\"2026-11-10T15:14:24.000000Z\",\"url_foto\":\"http:\\/\\/imparablev2.test\\/imgs\\/users\\/default.png\",\"full_name\":\"admin admin\",\"full_ci\":\"0 \",\"fecha_registro_t\":\"10\\/11\\/2026\",\"usuario_abrev\":\"admin\",\"permisos\":\"*\",\"user_sucursals\":[],\"role\":{\"id\":1,\"nombre\":\"SUPER USUARIO\",\"permisos\":1,\"usuarios\":0,\"status\":1,\"created_at\":\"2026-11-10T15:14:24.000000Z\",\"updated_at\":\"2026-11-10T15:14:24.000000Z\"}}},\"flash\":{\"bien\":null,\"error\":null},\"url_app\":\"http:\\/\\/imparablev2.test\",\"url_blank\":null},\"url\":\"\\/admin\\/sucursals\",\"version\":\"c8bdfce04e03ced50b63f0f87a38dbf0\",\"clearHistory\":false,\"encryptHistory\":false},\"duration\":200,\"memory\":28,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:39'),
(13917, 'a3374ec3-5480-4dfc-9f83-fe70c0c9562e', 'a3374ec3-6ee2-4b30-94e4-f5ed2babbc63', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.02\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:16:39'),
(13918, 'a3374ec3-55fa-49a0-82be-a94f8b2cae87', 'a3374ec3-6ee2-4b30-94e4-f5ed2babbc63', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:16:39'),
(13919, 'a3374ec3-57e9-4559-8a94-fafdf8f1f41a', 'a3374ec3-6ee2-4b30-94e4-f5ed2babbc63', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.63\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:39'),
(13920, 'a3374ec3-587a-4dba-8915-2f572a98ce7d', 'a3374ec3-6ee2-4b30-94e4-f5ed2babbc63', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.22\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:39'),
(13921, 'a3374ec3-5895-49d9-a0e5-a945f42c8b7b', 'a3374ec3-6ee2-4b30-94e4-f5ed2babbc63', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:39'),
(13922, 'a3374ec3-5b82-447a-bc51-d3cbf4a1234f', 'a3374ec3-6ee2-4b30-94e4-f5ed2babbc63', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `sucursals`\",\"time\":\"1.01\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Services\\\\SucursalService.php\",\"line\":93,\"hash\":\"06511a4872b89f844936ff9200e51a98\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:39'),
(13923, 'a3374ec3-5bea-4821-b19e-98545785f784', 'a3374ec3-6ee2-4b30-94e4-f5ed2babbc63', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select `sucursals`.* from `sucursals` order by `id` desc limit 5 offset 0\",\"time\":\"0.55\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Services\\\\SucursalService.php\",\"line\":93,\"hash\":\"4245f56e5f23e619acffb8876cb304ac\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:39'),
(13924, 'a3374ec3-5c10-42fc-8128-0510c76b0629', 'a3374ec3-6ee2-4b30-94e4-f5ed2babbc63', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Sucursal\",\"count\":3,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:39'),
(13925, 'a3374ec3-6e4c-46ac-98f1-04406e7e1936', 'a3374ec3-6ee2-4b30-94e4-f5ed2babbc63', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/sucursals\\/paginado?currentPage=1&orderAsc=desc&orderBy=id&page=1&perPage=5&search=\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\SucursalController@paginado\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6ImRhU0EzcXFUYm9mdko3Wk5pM1hHNGc9PSIsInZhbHVlIjoiL0JLaDBIRy9LUjN5Nld2YWwzTTY0a3l2bTFoV1E4ZmZLcEttbGhkdXJzUDA3TXBldS9qSk16WExJMzNJanI2bHhFSGtGZXo4RWt1VG1UU1BVVVdkQjNlZmpTQktXWkN2dEVOOWJ6dU9nUkpJbk5HbXd6WXk4SFpwVXhoWk9mNUkiLCJtYWMiOiI2MzUzNDY1YmZkYThkMTNjMzJhYTc5Zjc0OTVkZGE5ZDM2MmUzNGM2ZmQwMmI1OGFjOWM4ZjUxNzhmYWE0NGZhIiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6IldGZ1ZNNzVtbHhxd0JOUGtHMEJZYnc9PSIsInZhbHVlIjoiaFczMGsxK0lFTUU2cFJpV2NlNmZnalBWZjJTekZwNitVRUdSdEZtcFdSOVU0bGo1WWdqdldsNkwxOGgremdUMDBXWTlqSUIzdjlkYldBc2E2SXorb1pRM2Nnb3BZU29CZlZhYkNNNWsyOGtaODJBUnpFQlhNZkZWdjgwM1FvdTUiLCJtYWMiOiJlZTcyMzZjZGEzMjliNDY1MjA2ZTExMDgwNjk0NDExMjZlMWUzOTJhMmM3MTY1ZDk5NWYyNzI5MjcxMDIzOTI3IiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/sucursals\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6ImRhU0EzcXFUYm9mdko3Wk5pM1hHNGc9PSIsInZhbHVlIjoiL0JLaDBIRy9LUjN5Nld2YWwzTTY0a3l2bTFoV1E4ZmZLcEttbGhkdXJzUDA3TXBldS9qSk16WExJMzNJanI2bHhFSGtGZXo4RWt1VG1UU1BVVVdkQjNlZmpTQktXWkN2dEVOOWJ6dU9nUkpJbk5HbXd6WXk4SFpwVXhoWk9mNUkiLCJtYWMiOiI2MzUzNDY1YmZkYThkMTNjMzJhYTc5Zjc0OTVkZGE5ZDM2MmUzNGM2ZmQwMmI1OGFjOWM4ZjUxNzhmYWE0NGZhIiwidGFnIjoiIn0=\"},\"payload\":{\"page\":\"1\",\"currentPage\":\"1\",\"perPage\":\"5\",\"search\":null,\"orderBy\":\"id\",\"orderAsc\":\"desc\"},\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:16:39 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6Ik1hTnI0ZGZ3L285aEFjL2JBbzVLQkE9PSIsInZhbHVlIjoiVXFiQSticXVHV2RwQkdQdnFZSmVTejFQVXM4TUJhekZHRGRoODJ2bGdBOURWck1pU0gvSTVNUStocFJXR1d6OCtWc3N6cHVNblg3UWt1OEdCWjNCeXRWMzU5NnZBTzRHQndEWmtpQUlnUnZ1TjR5Snd5UW1LYkkrc0JZTGgxUFEiLCJtYWMiOiJkYTQ0N2MyYTU3NDVmZmNiOWY1MGQzZWMyYjc0ZmIzM2EwYjFjODg4MTg5ZWU3OTBhMjI5MjFmZTZlMWM2NjJhIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:16:39 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6IjNjQ3pWMTJDRUJDRWxkR0JyOWRka0E9PSIsInZhbHVlIjoiS3AyRDZpUjBxNnNNM2tBUFZFMjQ2ajdBVmY1cnUralJ4aVhXRkVuSVozVjE3WTVmQVNiZ1NvVXRDT2s5dDE0cGZDb2pQUWxqR2w0d3o5TUVyOUsrVERDN09uelRHcE9yQ0lPWmJPc0ZtcXZ3QkkvYzh0enZQVEwrWW1nUTVRSTQiLCJtYWMiOiJkNzM2ZTM2YjQ3MDg3OTViOTZlNTU4YWJlZmJiZmVhNzllNzdkODY1MmE3ODc3ZDI3MGRhOGRmYjVjZmFhODNkIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:16:39 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"data\":[{\"id\":3,\"nombre\":\"SUCURSAL 3\",\"fono\":null,\"dir\":null,\"activo\":1,\"fecha_registro\":\"2026-11-11\",\"created_at\":\"2026-11-11T21:59:44.000000Z\",\"updated_at\":\"2026-11-11T23:04:16.000000Z\",\"fecha_registro_t\":\"11\\/11\\/2026\"},{\"id\":2,\"nombre\":\"SUCURSAL 2\",\"fono\":null,\"dir\":null,\"activo\":1,\"fecha_registro\":\"2026-11-11\",\"created_at\":\"2026-11-11T21:59:37.000000Z\",\"updated_at\":\"2026-11-11T21:59:37.000000Z\",\"fecha_registro_t\":\"11\\/11\\/2026\"},{\"id\":1,\"nombre\":\"SUCURSAL 1\",\"fono\":\"SUCURSAL 1\",\"dir\":\"ZONA LOS PEDREGALES\",\"activo\":1,\"fecha_registro\":\"2026-11-10\",\"created_at\":\"2026-11-10T15:14:24.000000Z\",\"updated_at\":\"2026-11-10T15:14:24.000000Z\",\"fecha_registro_t\":\"10\\/11\\/2026\"}],\"total\":3,\"lastPage\":1},\"duration\":219,\"memory\":28,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:39'),
(13926, 'a3374ec4-4e74-4d65-ac9a-cf818f00ebc9', 'a3374ec4-5e49-4815-b46b-f34f741f3726', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.79\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:16:40'),
(13927, 'a3374ec4-4fd4-4173-96a0-47540416ff2b', 'a3374ec4-5e49-4815-b46b-f34f741f3726', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:16:40'),
(13928, 'a3374ec4-516d-4e22-b09f-d919f48cd5e4', 'a3374ec4-5e49-4815-b46b-f34f741f3726', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.54\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:40'),
(13929, 'a3374ec4-5219-4cfb-b713-b33676724761', 'a3374ec4-5e49-4815-b46b-f34f741f3726', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.26\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:40'),
(13930, 'a3374ec4-5234-42f5-b593-911713a8016d', 'a3374ec4-5e49-4815-b46b-f34f741f3726', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:40'),
(13931, 'a3374ec4-5b8f-490f-9549-8d996e39dbc8', 'a3374ec4-5e49-4815-b46b-f34f741f3726', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"permisos_cache_version\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:40'),
(13932, 'a3374ec4-5bda-4488-b7d1-d3adfd00d24c', 'a3374ec4-5e49-4815-b46b-f34f741f3726', NULL, 1, 'cache', '{\"type\":\"hit\",\"key\":\"permisos_role_v1_1\",\"value\":\"*\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:40'),
(13933, 'a3374ec4-5d7e-48ab-97ee-6f68d68058c8', 'a3374ec4-5e49-4815-b46b-f34f741f3726', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/proveedors\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\ProveedorController@index\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6Ik1hTnI0ZGZ3L285aEFjL2JBbzVLQkE9PSIsInZhbHVlIjoiVXFiQSticXVHV2RwQkdQdnFZSmVTejFQVXM4TUJhekZHRGRoODJ2bGdBOURWck1pU0gvSTVNUStocFJXR1d6OCtWc3N6cHVNblg3UWt1OEdCWjNCeXRWMzU5NnZBTzRHQndEWmtpQUlnUnZ1TjR5Snd5UW1LYkkrc0JZTGgxUFEiLCJtYWMiOiJkYTQ0N2MyYTU3NDVmZmNiOWY1MGQzZWMyYjc0ZmIzM2EwYjFjODg4MTg5ZWU3OTBhMjI5MjFmZTZlMWM2NjJhIiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6IjNjQ3pWMTJDRUJDRWxkR0JyOWRka0E9PSIsInZhbHVlIjoiS3AyRDZpUjBxNnNNM2tBUFZFMjQ2ajdBVmY1cnUralJ4aVhXRkVuSVozVjE3WTVmQVNiZ1NvVXRDT2s5dDE0cGZDb2pQUWxqR2w0d3o5TUVyOUsrVERDN09uelRHcE9yQ0lPWmJPc0ZtcXZ3QkkvYzh0enZQVEwrWW1nUTVRSTQiLCJtYWMiOiJkNzM2ZTM2YjQ3MDg3OTViOTZlNTU4YWJlZmJiZmVhNzllNzdkODY1MmE3ODc3ZDI3MGRhOGRmYjVjZmFhODNkIiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/sucursals\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-inertia\":\"true\",\"accept\":\"text\\/html, application\\/xhtml+xml\",\"x-inertia-version\":\"c8bdfce04e03ced50b63f0f87a38dbf0\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6Ik1hTnI0ZGZ3L285aEFjL2JBbzVLQkE9PSIsInZhbHVlIjoiVXFiQSticXVHV2RwQkdQdnFZSmVTejFQVXM4TUJhekZHRGRoODJ2bGdBOURWck1pU0gvSTVNUStocFJXR1d6OCtWc3N6cHVNblg3UWt1OEdCWjNCeXRWMzU5NnZBTzRHQndEWmtpQUlnUnZ1TjR5Snd5UW1LYkkrc0JZTGgxUFEiLCJtYWMiOiJkYTQ0N2MyYTU3NDVmZmNiOWY1MGQzZWMyYjc0ZmIzM2EwYjFjODg4MTg5ZWU3OTBhMjI5MjFmZTZlMWM2NjJhIiwidGFnIjoiIn0=\"},\"payload\":[],\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"x-inertia\":\"true\",\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:16:40 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6IlhlWWRGWGRvVldiTUdQeDF6OWtyWWc9PSIsInZhbHVlIjoiOGpIelRhMU9HY215UGhyNHlFQ01VY3BlUXkvNUl3WjdWSEhIbGRBeERsVDFKcHllYnJqVkJHRTNMVzBCNW9MZjJDS1FFRUlzVnZmVjJDcGJYY3I0T0RDYjJoOGErL2pSY09VVk1rM2tGWE5qSmJnZDg0dkpWSTVKWHBpdFBFRGEiLCJtYWMiOiJkMjQ1MWQ4NTkzOThmYTgyMTdmM2E5ZWQ3MDM2MTNjNDI4MzkwZTNhNjM3YzFlNzlmMTdjN2M1ZTQ3Y2U0Yzc1IiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:16:40 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6IjdMOVIzaEx5aVk3U0ZIblBqRUM2RWc9PSIsInZhbHVlIjoidEhHdWNRZXlCYjFNbzNyRDJYYkdRTklDUDFDd3Z5cVBKRFNyQ0NMWUdBeUVjVVpoaHQ5emI3OUlpdGN1bm5TVzRGK3c0cTY4OTdBMy9vNS9OS0k5N3V5REozZEtxTUNPZndQTXlpUFR0UUNCTElPbFU1bytjZkdGaFE3T254NUoiLCJtYWMiOiJhODQyYjM3NDUwNTRlYTcwYTJjNmZmZjJhNjc5YWFmOWJkMmU0YTUyNzZiZjQ1M2VhYzJmM2VjNWMyYWNhZDkyIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:16:40 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"component\":\"Admin\\/Proveedors\\/Index\",\"props\":{\"errors\":[],\"auth\":{\"user\":{\"id\":1,\"usuario\":\"admin\",\"codigo\":\"admin\",\"nombre\":\"admin\",\"paterno\":\"admin\",\"materno\":\"\",\"ci\":\"0\",\"ci_exp\":\"\",\"fono\":null,\"correo\":\"\",\"foto\":null,\"tipo\":\"ADMINISTRACI\\u00d3N\",\"role_id\":1,\"sucursal_todos\":1,\"fecha_registro\":\"2026-11-10\",\"acceso\":1,\"status\":1,\"created_at\":\"2026-11-10T15:14:24.000000Z\",\"updated_at\":\"2026-11-10T15:14:24.000000Z\",\"url_foto\":\"http:\\/\\/imparablev2.test\\/imgs\\/users\\/default.png\",\"full_name\":\"admin admin\",\"full_ci\":\"0 \",\"fecha_registro_t\":\"10\\/11\\/2026\",\"usuario_abrev\":\"admin\",\"permisos\":\"*\",\"user_sucursals\":[],\"role\":{\"id\":1,\"nombre\":\"SUPER USUARIO\",\"permisos\":1,\"usuarios\":0,\"status\":1,\"created_at\":\"2026-11-10T15:14:24.000000Z\",\"updated_at\":\"2026-11-10T15:14:24.000000Z\"}}},\"flash\":{\"bien\":null,\"error\":null},\"url_app\":\"http:\\/\\/imparablev2.test\",\"url_blank\":null},\"url\":\"\\/admin\\/proveedors\",\"version\":\"c8bdfce04e03ced50b63f0f87a38dbf0\",\"clearHistory\":false,\"encryptHistory\":false},\"duration\":186,\"memory\":28,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:40'),
(13934, 'a3374ec4-a932-4c7c-a7d5-7ab26e7bfbdd', 'a3374ec4-b3e5-4a18-83b5-9622f973efd6', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.28\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:16:40'),
(13935, 'a3374ec4-aa5b-4309-b001-7ad1728fd207', 'a3374ec4-b3e5-4a18-83b5-9622f973efd6', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:16:40'),
(13936, 'a3374ec4-ac85-484d-8e5d-605dacb4032d', 'a3374ec4-b3e5-4a18-83b5-9622f973efd6', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.67\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:40'),
(13937, 'a3374ec4-ad28-49ac-8daa-aec15c0b63dc', 'a3374ec4-b3e5-4a18-83b5-9622f973efd6', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.28\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:40'),
(13938, 'a3374ec4-ad43-4ea2-9ac2-9bdb7a352e3d', 'a3374ec4-b3e5-4a18-83b5-9622f973efd6', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:40'),
(13939, 'a3374ec4-b072-4e57-8e5c-b30318423f14', 'a3374ec4-b3e5-4a18-83b5-9622f973efd6', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `proveedors`\",\"time\":\"1.30\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Services\\\\ProveedorService.php\",\"line\":72,\"hash\":\"93d93e552acd2d868fd6838241b29f4f\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:40'),
(13940, 'a3374ec4-b0b0-4f0f-b507-9fdfea6f48b2', 'a3374ec4-b3e5-4a18-83b5-9622f973efd6', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select `proveedors`.* from `proveedors` order by `id` desc limit 5 offset 0\",\"time\":\"0.24\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Services\\\\ProveedorService.php\",\"line\":72,\"hash\":\"b7a7c43c7fb0f0662ef9972a6f3bf1aa\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:40'),
(13941, 'a3374ec4-b0cc-4760-8e5a-81fb589974ef', 'a3374ec4-b3e5-4a18-83b5-9622f973efd6', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Proveedor\",\"count\":2,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:40'),
(13942, 'a3374ec4-b310-4c94-bce9-02b33551702e', 'a3374ec4-b3e5-4a18-83b5-9622f973efd6', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/proveedors\\/paginado?currentPage=1&orderAsc=desc&orderBy=id&page=1&perPage=5&search=\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\ProveedorController@paginado\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6IlhlWWRGWGRvVldiTUdQeDF6OWtyWWc9PSIsInZhbHVlIjoiOGpIelRhMU9HY215UGhyNHlFQ01VY3BlUXkvNUl3WjdWSEhIbGRBeERsVDFKcHllYnJqVkJHRTNMVzBCNW9MZjJDS1FFRUlzVnZmVjJDcGJYY3I0T0RDYjJoOGErL2pSY09VVk1rM2tGWE5qSmJnZDg0dkpWSTVKWHBpdFBFRGEiLCJtYWMiOiJkMjQ1MWQ4NTkzOThmYTgyMTdmM2E5ZWQ3MDM2MTNjNDI4MzkwZTNhNjM3YzFlNzlmMTdjN2M1ZTQ3Y2U0Yzc1IiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6IjdMOVIzaEx5aVk3U0ZIblBqRUM2RWc9PSIsInZhbHVlIjoidEhHdWNRZXlCYjFNbzNyRDJYYkdRTklDUDFDd3Z5cVBKRFNyQ0NMWUdBeUVjVVpoaHQ5emI3OUlpdGN1bm5TVzRGK3c0cTY4OTdBMy9vNS9OS0k5N3V5REozZEtxTUNPZndQTXlpUFR0UUNCTElPbFU1bytjZkdGaFE3T254NUoiLCJtYWMiOiJhODQyYjM3NDUwNTRlYTcwYTJjNmZmZjJhNjc5YWFmOWJkMmU0YTUyNzZiZjQ1M2VhYzJmM2VjNWMyYWNhZDkyIiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/proveedors\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6IlhlWWRGWGRvVldiTUdQeDF6OWtyWWc9PSIsInZhbHVlIjoiOGpIelRhMU9HY215UGhyNHlFQ01VY3BlUXkvNUl3WjdWSEhIbGRBeERsVDFKcHllYnJqVkJHRTNMVzBCNW9MZjJDS1FFRUlzVnZmVjJDcGJYY3I0T0RDYjJoOGErL2pSY09VVk1rM2tGWE5qSmJnZDg0dkpWSTVKWHBpdFBFRGEiLCJtYWMiOiJkMjQ1MWQ4NTkzOThmYTgyMTdmM2E5ZWQ3MDM2MTNjNDI4MzkwZTNhNjM3YzFlNzlmMTdjN2M1ZTQ3Y2U0Yzc1IiwidGFnIjoiIn0=\"},\"payload\":{\"page\":\"1\",\"currentPage\":\"1\",\"perPage\":\"5\",\"search\":null,\"orderBy\":\"id\",\"orderAsc\":\"desc\"},\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:16:40 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6ImpDUWdUOVpqajIzYUQ3MWtnTEw4a1E9PSIsInZhbHVlIjoiNlc4TVptaUJOOVNXRzhBb1ZldXFCandIenA0Uk1xa0M4VnlhOHpyaUtUb1pBVFhaR3NGeVdZVmtEUnMyREhHZ0tOSXIvcGFXUGRZb29EUWU1ZHlNVkMrNlhaNFlGNk1qR2dZQjZ5Ulp0N1Z2TUo1N1gzSzh2UWdYRjRNNFAvVUciLCJtYWMiOiI0YTc5YWY2Y2I0OTQxMTU2YmIzYWJiOWY1Zjc3MjBmZDg3NDJmY2I0OGFlZmJjYjkwNDljNDY2ZTZiZjY2ZWNiIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:16:40 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6ImtOY3Nhbi82SEVqTE5TSTlnbG1hVmc9PSIsInZhbHVlIjoia0JqM3IzNkZhOXppRXF5a1paTFc1SEhVWUFhQTAxUE15UG1uZXFmN1R0QUN3Z2hZZlV1b2Rac2xNTXFQazZPYVBQZWVoMSt6UU5VM0wyV3NoeHVvTTJyTDBNdHFYb0JlN0UvdEhCQ1NQeEhwcWwxeUplOFd0dWpxdHQrMWo3dDciLCJtYWMiOiIyYTFjZjBkOTE5ZmFmYTllMWVmZjYxOTllODljODhiZGRjYWRhYzUyZDU3ZDQ1ODdmYmFmOWM1M2ViZTgxN2Y4IiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:16:40 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"data\":[{\"id\":2,\"nombre\":\"PROVEEDOR 2\",\"contacto\":null,\"created_at\":\"2026-11-11T22:00:01.000000Z\",\"updated_at\":\"2026-11-11T22:00:01.000000Z\"},{\"id\":1,\"nombre\":\"PROVEEDOR 1\",\"contacto\":null,\"created_at\":\"2026-11-11T21:59:54.000000Z\",\"updated_at\":\"2026-11-11T21:59:54.000000Z\"}],\"total\":2,\"lastPage\":1},\"duration\":186,\"memory\":28,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:40'),
(13943, 'a3374ec7-d181-4c44-bbed-ea2c06a31237', 'a3374ec7-e0e1-4cf0-a56a-dd2e9fac05bc', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.39\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:16:42'),
(13944, 'a3374ec7-d291-4ab7-9916-a49574708d37', 'a3374ec7-e0e1-4cf0-a56a-dd2e9fac05bc', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:16:42'),
(13945, 'a3374ec7-d477-4314-ae51-635c7b59a12c', 'a3374ec7-e0e1-4cf0-a56a-dd2e9fac05bc', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.58\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:42'),
(13946, 'a3374ec7-d521-47e2-80d0-2a599ed57152', 'a3374ec7-e0e1-4cf0-a56a-dd2e9fac05bc', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.26\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:42'),
(13947, 'a3374ec7-d53c-4e0f-9b32-d5b68ced5c63', 'a3374ec7-e0e1-4cf0-a56a-dd2e9fac05bc', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:42'),
(13948, 'a3374ec7-de59-420f-87ee-8aa2da181c48', 'a3374ec7-e0e1-4cf0-a56a-dd2e9fac05bc', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"permisos_cache_version\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:42'),
(13949, 'a3374ec7-de95-4f87-be48-d965286aeff5', 'a3374ec7-e0e1-4cf0-a56a-dd2e9fac05bc', NULL, 1, 'cache', '{\"type\":\"hit\",\"key\":\"permisos_role_v1_1\",\"value\":\"*\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:42'),
(13950, 'a3374ec7-e01b-4f03-9be1-e24a1960c322', 'a3374ec7-e0e1-4cf0-a56a-dd2e9fac05bc', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/clientes\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\ClienteController@index\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6InprcHM1Y1A2bTFQRTQ4anZBSmE4N2c9PSIsInZhbHVlIjoiVU5XRExhZm4vcG5DUWtzZGlTMnhFOEJ4cDdXSzRwV0YrSW03blVicjRtcnM1NzdkR0RGdnNiNlo2WHRiRUFNdGtJVFRuVG5BeExwVXBvc290cTBhYjFxVUowUno3Z0ZIbGE4SFhLVk5RTCs5TXFTWTJnSzFBeTNRdldrZHdYSHEiLCJtYWMiOiJmMjRlYjc1ODM5OTAzNDNmNWU5MDJlMDQ4MGI1ZGRlZjdhMjdiZTg3YzE1OTlkZWU2NDM1ZjliYmZhZGU2ZjQ2IiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6Ijl1UW81YmZ0MTlIUDUyS2prRDdBaUE9PSIsInZhbHVlIjoiVkZFblg2SkxnZUJ6NmpkdDZpS29WUnA1REVBem0vTUY1SmxYVFlIOWtEbDVLaUhSWktWYVY0V3h3Smxha0ZzQmZFY1BRR3Q4NUhOelBqb3BQTXVYeXN2MnRMMmpwZmYydkJqSzZCdyt6S0k0bDBlMHY1aTl3NFB0RGQ0M1FzQnciLCJtYWMiOiI5YzI0YTEwODMwNjFhZWQwMmRiYTM5NmZjYTNkZTliZTA1MDFhM2ZmZmU3NDk4M2JiMDQ5YmY3ODNiYzJhMmQyIiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/proveedors\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-inertia\":\"true\",\"accept\":\"text\\/html, application\\/xhtml+xml\",\"x-inertia-version\":\"c8bdfce04e03ced50b63f0f87a38dbf0\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6InprcHM1Y1A2bTFQRTQ4anZBSmE4N2c9PSIsInZhbHVlIjoiVU5XRExhZm4vcG5DUWtzZGlTMnhFOEJ4cDdXSzRwV0YrSW03blVicjRtcnM1NzdkR0RGdnNiNlo2WHRiRUFNdGtJVFRuVG5BeExwVXBvc290cTBhYjFxVUowUno3Z0ZIbGE4SFhLVk5RTCs5TXFTWTJnSzFBeTNRdldrZHdYSHEiLCJtYWMiOiJmMjRlYjc1ODM5OTAzNDNmNWU5MDJlMDQ4MGI1ZGRlZjdhMjdiZTg3YzE1OTlkZWU2NDM1ZjliYmZhZGU2ZjQ2IiwidGFnIjoiIn0=\"},\"payload\":[],\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"x-inertia\":\"true\",\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:16:42 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6IkVtemU3aVZpTlQrWmY0VG9XVTUyL3c9PSIsInZhbHVlIjoiZXd3ZURtdXhhZS9sQUJwK0pjd0ljNGJLMXIzYzBHU20xczkvaGZpVktXbVlIT2o5SmU0b29WZ2V2SnN0NWxqVnFjUHB2c1oxc2lSY1VUaEhVcFdmaTUwTmQxMmxka2hhV0lHWGRTYlYyME51b2VTc3VhMXdYVTE3dkoyUWRDcEwiLCJtYWMiOiIxYzc0MjljYjA1Njg3MzVkZmU0YjFmNDA0ODBkYTAxMDI5OWRjMjA5MzA2ZWI4ZGQwNDdjZmZjYzY2MjA5MzZlIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:16:42 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6InJtL2l1aUkvMGNFWDJoWkM1S1JtbEE9PSIsInZhbHVlIjoiUDI4VkF0TENReFpmbkswSk9BOHlWUk83UHhWM201WWp1SVZsRXZrRStRb0RSaG9jZUlScmY1MkJSekdDREttMGs5WWVGSDFqY3dadXFtejJsLzk2Tkk3TGtjdmR5VEpFRC8yUEJzUUFoSk5JeW9yVjY5QnRGSWZtNlhsNlBJUzEiLCJtYWMiOiI1ZmFkNDUxNWIwNjVlNTQxOWQ1MTFlMmIwMTQxNzY2ZjU4MzNjMTMwNjhjNDMyMmU3ZDlhNDYwNzlkNDVhMTVlIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:16:42 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"component\":\"Admin\\/Clientes\\/Index\",\"props\":{\"errors\":[],\"auth\":{\"user\":{\"id\":1,\"usuario\":\"admin\",\"codigo\":\"admin\",\"nombre\":\"admin\",\"paterno\":\"admin\",\"materno\":\"\",\"ci\":\"0\",\"ci_exp\":\"\",\"fono\":null,\"correo\":\"\",\"foto\":null,\"tipo\":\"ADMINISTRACI\\u00d3N\",\"role_id\":1,\"sucursal_todos\":1,\"fecha_registro\":\"2026-11-10\",\"acceso\":1,\"status\":1,\"created_at\":\"2026-11-10T15:14:24.000000Z\",\"updated_at\":\"2026-11-10T15:14:24.000000Z\",\"url_foto\":\"http:\\/\\/imparablev2.test\\/imgs\\/users\\/default.png\",\"full_name\":\"admin admin\",\"full_ci\":\"0 \",\"fecha_registro_t\":\"10\\/11\\/2026\",\"usuario_abrev\":\"admin\",\"permisos\":\"*\",\"user_sucursals\":[],\"role\":{\"id\":1,\"nombre\":\"SUPER USUARIO\",\"permisos\":1,\"usuarios\":0,\"status\":1,\"created_at\":\"2026-11-10T15:14:24.000000Z\",\"updated_at\":\"2026-11-10T15:14:24.000000Z\"}}},\"flash\":{\"bien\":null,\"error\":null},\"url_app\":\"http:\\/\\/imparablev2.test\",\"url_blank\":null},\"url\":\"\\/admin\\/clientes\",\"version\":\"c8bdfce04e03ced50b63f0f87a38dbf0\",\"clearHistory\":false,\"encryptHistory\":false},\"duration\":190,\"memory\":28,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:42'),
(13951, 'a3374ec8-26e4-40da-bf7d-2481c10a942c', 'a3374ec8-2f07-445e-9e2a-e7cf4162adc3', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.46\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:16:42'),
(13952, 'a3374ec8-286d-4ed8-8aa1-5fe4d75e9b19', 'a3374ec8-2f07-445e-9e2a-e7cf4162adc3', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:16:42'),
(13953, 'a3374ec8-29ec-4051-8d3a-0d10e1d73d55', 'a3374ec8-2f07-445e-9e2a-e7cf4162adc3', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.37\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:42'),
(13954, 'a3374ec8-2a70-4a00-95a7-8e83f5c4d227', 'a3374ec8-2f07-445e-9e2a-e7cf4162adc3', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.21\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:42'),
(13955, 'a3374ec8-2a87-4ddb-9c83-47e444328560', 'a3374ec8-2f07-445e-9e2a-e7cf4162adc3', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:42'),
(13956, 'a3374ec8-2cdd-4624-a920-066c26e04b91', 'a3374ec8-2f07-445e-9e2a-e7cf4162adc3', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `clientes` where `status` = 1\",\"time\":\"0.57\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Services\\\\ClienteService.php\",\"line\":80,\"hash\":\"867e6ebac7a292e7511cfe08cb5d9bcc\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:42'),
(13957, 'a3374ec8-2e69-4cf7-accb-6bbe452458be', 'a3374ec8-2f07-445e-9e2a-e7cf4162adc3', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/clientes\\/paginado?currentPage=1&orderAsc=desc&orderBy=id&page=1&perPage=5&search=\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\ClienteController@paginado\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6IkVtemU3aVZpTlQrWmY0VG9XVTUyL3c9PSIsInZhbHVlIjoiZXd3ZURtdXhhZS9sQUJwK0pjd0ljNGJLMXIzYzBHU20xczkvaGZpVktXbVlIT2o5SmU0b29WZ2V2SnN0NWxqVnFjUHB2c1oxc2lSY1VUaEhVcFdmaTUwTmQxMmxka2hhV0lHWGRTYlYyME51b2VTc3VhMXdYVTE3dkoyUWRDcEwiLCJtYWMiOiIxYzc0MjljYjA1Njg3MzVkZmU0YjFmNDA0ODBkYTAxMDI5OWRjMjA5MzA2ZWI4ZGQwNDdjZmZjYzY2MjA5MzZlIiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6InJtL2l1aUkvMGNFWDJoWkM1S1JtbEE9PSIsInZhbHVlIjoiUDI4VkF0TENReFpmbkswSk9BOHlWUk83UHhWM201WWp1SVZsRXZrRStRb0RSaG9jZUlScmY1MkJSekdDREttMGs5WWVGSDFqY3dadXFtejJsLzk2Tkk3TGtjdmR5VEpFRC8yUEJzUUFoSk5JeW9yVjY5QnRGSWZtNlhsNlBJUzEiLCJtYWMiOiI1ZmFkNDUxNWIwNjVlNTQxOWQ1MTFlMmIwMTQxNzY2ZjU4MzNjMTMwNjhjNDMyMmU3ZDlhNDYwNzlkNDVhMTVlIiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/clientes\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6IkVtemU3aVZpTlQrWmY0VG9XVTUyL3c9PSIsInZhbHVlIjoiZXd3ZURtdXhhZS9sQUJwK0pjd0ljNGJLMXIzYzBHU20xczkvaGZpVktXbVlIT2o5SmU0b29WZ2V2SnN0NWxqVnFjUHB2c1oxc2lSY1VUaEhVcFdmaTUwTmQxMmxka2hhV0lHWGRTYlYyME51b2VTc3VhMXdYVTE3dkoyUWRDcEwiLCJtYWMiOiIxYzc0MjljYjA1Njg3MzVkZmU0YjFmNDA0ODBkYTAxMDI5OWRjMjA5MzA2ZWI4ZGQwNDdjZmZjYzY2MjA5MzZlIiwidGFnIjoiIn0=\"},\"payload\":{\"page\":\"1\",\"currentPage\":\"1\",\"perPage\":\"5\",\"search\":null,\"orderBy\":\"id\",\"orderAsc\":\"desc\"},\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:16:42 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6ImtWOGU5dXJ2SXl3V25IZ092ZmdpVUE9PSIsInZhbHVlIjoiZmVKL2hGN2xycTVsaTRiVHM2RHBhQTNsQ2ttQkRqV3JmdFVMdUxOSHFxcWM2YkRGTTZxREZBVDhEZFY1S2YzNHM2SDhhVmlxNnJPUXRtc2h6Mmk2WHg5cTZqTWFtWElsQzkwamw0NWRRMjd2NTBtVWwzTlBIcm9rS2tKcnBCck4iLCJtYWMiOiI5NTAxN2M4NTdmNjAwMTRmYWVlMmU4ZTdiYTlmZmQ2ZWNlZmYxMjEyZWMyZGNjNzk4YjExMjNhZDZlNDMxMDU5IiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:16:42 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6IkRYYm1hWmFoZm1BM1NmanpyQzc2Q1E9PSIsInZhbHVlIjoiSEFxTEtYZllCNm9vR2l1d1AzNWNTQ3dhNjIxMXdkdStHUytrdFJ0WHFHSUlBL0Zlbi9KQnhCRUlqNjYralZPOW94SGowOG5BY2RIM1d1VVh0TnhPOHdRdm83RlhaWmd4M1RkUXllQkNWYTVSQ0ROcVdiSnczcExRd3VlNTdhVy8iLCJtYWMiOiI1MzQxOGQ4ODE3OGYxOWVhNzdkNmEwOWU2YWExYjAzMjI5MDdhMmU1Y2YxZWRiNmEwZDVhMTU4YWFiZDJlNDY1IiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:16:42 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"data\":[],\"total\":0,\"lastPage\":1},\"duration\":172,\"memory\":28,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:42');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(13958, 'a3374ecc-f0f2-40d9-af3f-240cb0e925f0', 'a3374ed4-71b3-4555-81b7-132539510442', '3128343b29e45f32ffbb9e7bbb0124fd', 0, 'exception', '{\"class\":\"ErrorException\",\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\composer\\\\ClassLoader.php\",\"line\":571,\"message\":\"include(C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\composer\\/..\\/..\\/app\\/Services\\/AlmacenService.php): Failed to open stream: No such file or directory\",\"context\":{\"userId\":1},\"trace\":[{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Bootstrap\\\\HandleExceptions.php\",\"line\":258},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\composer\\\\ClassLoader.php\",\"line\":571},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\composer\\\\ClassLoader.php\",\"line\":571},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\composer\\\\ClassLoader.php\",\"line\":428},[],{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":1000},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":986},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":926},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Application.php\",\"line\":1078},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":864},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Application.php\",\"line\":1058},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":1336},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":1237},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":1162},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":933},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Application.php\",\"line\":1078},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":864},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Application.php\",\"line\":1058},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Route.php\",\"line\":286},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Route.php\",\"line\":266},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Route.php\",\"line\":211},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Router.php\",\"line\":822},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\PermisoUsuarioMiddleware.php\",\"line\":30},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Http\\\\Middleware\\\\AddLinkHeadersForPreloadedAssets.php\",\"line\":32},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\inertiajs\\\\inertia-laravel\\\\src\\\\Middleware.php\",\"line\":122},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Middleware\\\\SubstituteBindings.php\",\"line\":50},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Auth\\\\Middleware\\\\Authenticate.php\",\"line\":63},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\VerifyCsrfToken.php\",\"line\":87},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\View\\\\Middleware\\\\ShareErrorsFromSession.php\",\"line\":48},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Session\\\\Middleware\\\\StartSession.php\",\"line\":120},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Session\\\\Middleware\\\\StartSession.php\",\"line\":63},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Cookie\\\\Middleware\\\\AddQueuedCookiesToResponse.php\",\"line\":36},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Cookie\\\\Middleware\\\\EncryptCookies.php\",\"line\":74},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":137},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Router.php\",\"line\":821},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Router.php\",\"line\":800},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Router.php\",\"line\":764},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Router.php\",\"line\":753},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Kernel.php\",\"line\":200},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\TransformsRequest.php\",\"line\":21},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\TransformsRequest.php\",\"line\":21},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\TrimStrings.php\",\"line\":51},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Http\\\\Middleware\\\\ValidatePostSize.php\",\"line\":27},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\PreventRequestsDuringMaintenance.php\",\"line\":109},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Http\\\\Middleware\\\\HandleCors.php\",\"line\":61},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Http\\\\Middleware\\\\TrustProxies.php\",\"line\":58},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\InvokeDeferredCallbacks.php\",\"line\":22},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Http\\\\Middleware\\\\ValidatePathEncoding.php\",\"line\":26},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":137},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Kernel.php\",\"line\":175},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Kernel.php\",\"line\":144},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Application.php\",\"line\":1220},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20}],\"line_preview\":{\"562\":\" *\",\"563\":\" * Prevents access to $this\\/self from included files.\",\"564\":\" *\",\"565\":\" * @param  string $file\",\"566\":\" * @return void\",\"567\":\" * @private\",\"568\":\" *\\/\",\"569\":\"function includeFile($file)\",\"570\":\"{\",\"571\":\"    include $file;\",\"572\":\"}\",\"573\":\"\"},\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null},\"occurrences\":1}', '2026-11-13 10:16:45'),
(13959, 'a3374ecc-cf2a-4e96-a6bb-79aa04a4de59', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"0.98\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:16:45'),
(13960, 'a3374ecc-d02f-4d31-a730-0c586c1dcde6', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:16:45'),
(13961, 'a3374ecc-d16d-4d0b-9816-03ecd26d28d2', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.24\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:45'),
(13962, 'a3374ecc-d1e8-47a4-ae0d-4fba7429bdec', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.20\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:45'),
(13963, 'a3374ecc-d1fd-46aa-9e79-13ac8b070838', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:45'),
(13964, 'a3374ecd-ef24-4868-a38f-1c34e8c38600', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::markdown\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/markdown.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:46'),
(13965, 'a3374ece-88d9-45c5-8d05-b435ea9040c9', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::show\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/show.blade.php\",\"data\":[\"exception\",\"exceptionAsMarkdown\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:46'),
(13966, 'a3374ecf-fbcd-48ff-b14d-5e3303be96ef', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.topbar\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/topbar.blade.php\",\"data\":[\"title\",\"markdown\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:47'),
(13967, 'a3374ed0-2967-4df8-b386-b3ce099716ab', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.copy\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/copy.blade.php\",\"data\":[\"class\",\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:47'),
(13968, 'a3374ed0-2d48-4202-957a-ba97759c5b20', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.check\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/check.blade.php\",\"data\":[\"class\",\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:47'),
(13969, 'a3374ed0-313d-49e6-8828-404f8a306399', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.section-container\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/section-container.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:47'),
(13970, 'a3374ed0-3709-426d-b316-dbaf9420872c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.separator\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/separator.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:47'),
(13971, 'a3374ed0-3cf0-483b-8e0b-2d00acec8525', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.header\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/header.blade.php\",\"data\":[\"exception\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:47'),
(13972, 'a3374ed0-9bc8-4490-b28e-82c90b70ecb2', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13973, 'a3374ed0-a551-4bca-bad7-24468be0689a', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.alert\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/alert.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13974, 'a3374ed0-aa46-41b3-ac09-1a298edec81b', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.badge\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/badge.blade.php\",\"data\":[\"type\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13975, 'a3374ed0-b34e-4a93-b551-bfcedcda3b47', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.badge\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/badge.blade.php\",\"data\":[\"type\",\"variant\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13976, 'a3374ed0-b3b6-492d-aa78-99ba60f41495', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.request-url\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/request-url.blade.php\",\"data\":[\"exception\",\"request\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13977, 'a3374ed1-1665-4695-9054-1e1537f20eea', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.alert\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/alert.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13978, 'a3374ed1-16ac-430a-91ec-5defc40332c4', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.badge\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/badge.blade.php\",\"data\":[\"type\",\"variant\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13979, 'a3374ed1-16e0-47a7-95c5-cf63c7f0a301', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.http-method\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/http-method.blade.php\",\"data\":[\"method\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13980, 'a3374ed1-4490-4b10-8bd7-bb8f317b7012', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.globe\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/globe.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13981, 'a3374ed1-4927-4438-b79c-857d505d377e', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.badge\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/badge.blade.php\",\"data\":[\"type\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13982, 'a3374ed1-4980-4732-9614-4067c87487dd', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.copy\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/copy.blade.php\",\"data\":[\"class\",\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13983, 'a3374ed1-49a1-40b4-b4ea-9852780c9f2f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.check\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/check.blade.php\",\"data\":[\"class\",\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13984, 'a3374ed1-49c0-4cfa-9944-cf1ff63e8c2d', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.section-container\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/section-container.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13985, 'a3374ed1-49e0-4025-9607-82e41c879e2c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.separator\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/separator.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13986, 'a3374ed1-4a07-44d9-9c1b-2789ae838d5a', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.trace\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/trace.blade.php\",\"data\":[\"exception\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13987, 'a3374ed1-891e-4bf0-9f85-92e06f0cda1a', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.alert\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/alert.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13988, 'a3374ed1-896f-4b40-8957-d8cc9919cc77', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frames\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frames.blade.php\",\"data\":[\"frames\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:48'),
(13989, 'a3374ed1-e986-4992-9d7c-e4936e955a64', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.folder\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/folder.blade.php\",\"data\":[\"class\",\"xShow\",\"xCloak\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(13990, 'a3374ed1-ede4-4696-93ef-813fadde11f0', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.folder-open\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/folder-open.blade.php\",\"data\":[\"class\",\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(13991, 'a3374ed1-f32b-4189-964c-d5f8f40e6435', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-down-up\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-down-up.blade.php\",\"data\":[\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(13992, 'a3374ed1-f77c-4823-a44d-dcd6d87ace42', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-up-down\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-up-down.blade.php\",\"data\":[\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(13993, 'a3374ed1-fb67-4c94-bd06-958d15471114', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(13994, 'a3374ed2-2497-41dc-bb27-940dd33f4b69', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(13995, 'a3374ed2-3cbb-4f7c-b344-f9c5673c2cdb', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(13996, 'a3374ed2-4ab3-4da4-96b2-579b5afc59d0', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(13997, 'a3374ed2-4b04-48c2-9351-1f3a5ac77d18', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(13998, 'a3374ed2-4b37-46db-9486-85b7d97387fa', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(13999, 'a3374ed2-4b6a-469c-9b25-b960f6428778', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14000, 'a3374ed2-4b92-42ef-a5b8-b070d1dd7146', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14001, 'a3374ed2-4bc5-46c5-87a9-4bd2df91ff24', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14002, 'a3374ed2-4be9-4456-97ce-d2859d8d2332', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14003, 'a3374ed2-4c12-401d-9a5a-2a4e68e52bec', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14004, 'a3374ed2-4c48-4837-bb39-02e5230ebb7e', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14005, 'a3374ed2-4c9a-487b-80aa-c3902883c5b1', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14006, 'a3374ed2-4cbe-4fc1-bd83-d58fa23f4b6c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14007, 'a3374ed2-4ce0-48c2-9d6c-6a0478418c70', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14008, 'a3374ed2-4d03-46de-bfe8-2519d27cdd1a', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14009, 'a3374ed2-4d42-4e67-9e17-af3a996e4e53', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14010, 'a3374ed2-4d67-45e6-acd8-885b37a90b0c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14011, 'a3374ed2-4d91-42f1-b9ee-e5d10531a99f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14012, 'a3374ed2-4db7-4c83-b6ee-603f304c85c8', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14013, 'a3374ed2-4ded-4c12-a00a-6282d6c5be8f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14014, 'a3374ed2-4e10-47b4-93bb-0860b3df0d13', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14015, 'a3374ed2-4e32-4ae9-a444-f756cc9359d6', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14016, 'a3374ed2-4e56-41e7-b4b2-053a7b80847d', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14017, 'a3374ed2-4e96-4595-9689-0c8c09055f33', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14018, 'a3374ed2-4eba-44d8-9cfc-08225d9e9bb8', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14019, 'a3374ed2-4edc-4004-ab79-311a5e8fe13d', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14020, 'a3374ed2-4f0a-447f-96dc-39843a609811', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14021, 'a3374ed2-4f42-4c56-a91a-c4d797601472', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14022, 'a3374ed2-4f66-4d89-b831-f72a9ec8a9ca', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14023, 'a3374ed2-4f8a-42aa-a883-2ad0a06b0df5', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14024, 'a3374ed2-4faf-4948-bc64-c4a10d5d7589', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14025, 'a3374ed2-5005-4ca8-a9f2-f34b9829fa81', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14026, 'a3374ed2-5047-418e-b142-c292b384360b', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14027, 'a3374ed2-5075-4a27-9014-a8b183217723', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14028, 'a3374ed2-50ac-4b72-b517-8c48bf54edb1', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14029, 'a3374ed2-5104-46bc-9e45-b8af33aee8e6', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14030, 'a3374ed2-5145-47ed-a80a-6ba4005aeae3', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(14031, 'a3374ed2-516f-4e1f-950c-e79258545302', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14032, 'a3374ed2-5196-4165-9829-71459cf22c04', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14033, 'a3374ed2-51d7-44a8-8441-045a875f98b7', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14034, 'a3374ed2-51fd-4df8-8b36-a15bbee4c5ff', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14035, 'a3374ed2-5224-4e9c-bb6c-6d0f2e29f3b4', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14036, 'a3374ed2-524c-48bf-a76c-a864196c7e6a', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14037, 'a3374ed2-528a-4cd9-81fb-3b4c0f3eea1d', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14038, 'a3374ed2-52af-4df6-b549-0f58ff74ee9f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14039, 'a3374ed2-52d3-4995-bce1-12266a159671', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14040, 'a3374ed2-52f5-4458-854f-2e50572529d5', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14041, 'a3374ed2-5324-4471-8ee5-8bdaf1e9a29c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14042, 'a3374ed2-534e-4ea9-a289-faab8ab2d988', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14043, 'a3374ed2-5372-49ea-a833-f9c645787978', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14044, 'a3374ed2-5396-4040-a7e0-e8dc81167bdb', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14045, 'a3374ed2-53cc-4cc4-ace7-edcf78f38b72', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14046, 'a3374ed2-53f1-4dcb-93ab-00f40d65c003', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14047, 'a3374ed2-5416-42ea-b092-82f7daeefd34', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14048, 'a3374ed2-5443-40cb-8d2f-32cac0c80d41', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14049, 'a3374ed2-547b-4ddf-9e15-9f17d30fc97d', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14050, 'a3374ed2-549e-45db-8bd8-18a6db6e9495', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14051, 'a3374ed2-54c3-4172-a934-e644fe061388', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14052, 'a3374ed2-54e7-49fe-9a18-bf10c103ebe1', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14053, 'a3374ed2-551f-4f5f-b26d-a4388422988f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14054, 'a3374ed2-5546-4dae-97f7-e583c245c008', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14055, 'a3374ed2-556a-4cc8-aa6f-dc5db596e93c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14056, 'a3374ed2-558e-44c2-b51e-7b1e4c8cbd6c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14057, 'a3374ed2-55c1-4601-81d3-f7e18b65ab6b', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14058, 'a3374ed2-55e5-45cc-a439-8907f55abc56', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14059, 'a3374ed2-560b-4d1b-a0a1-d1c5f964617b', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14060, 'a3374ed2-5632-4f82-a25b-dac74b36715f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14061, 'a3374ed2-5669-45ab-988b-7770633d90f5', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14062, 'a3374ed2-568e-4606-9e8e-55cdf7b7d328', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14063, 'a3374ed2-56b1-489b-89ff-f570d4104c44', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14064, 'a3374ed2-56d9-4158-9395-4d55b92dda82', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14065, 'a3374ed2-5716-4f06-bc2c-6b53f58eef5c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14066, 'a3374ed2-573d-436b-8056-62e1b05fdda8', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14067, 'a3374ed2-5765-4fd4-a156-380dec29033b', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14068, 'a3374ed2-5790-47ae-890e-062a6e1bba89', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14069, 'a3374ed2-57ce-435c-9652-e3fbae11d525', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14070, 'a3374ed2-57f8-46c5-9b60-8032fa8b87c9', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14071, 'a3374ed2-581f-4a55-8eb2-47960ad7edf5', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14072, 'a3374ed2-5846-4255-ad81-8bf01cbb543a', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14073, 'a3374ed2-5887-4d97-8ab9-0b3fd4147e9b', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14074, 'a3374ed2-58bd-4c8d-bcfb-2d2921029fe1', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14075, 'a3374ed2-58e2-4a6c-97ee-4439a3553d24', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14076, 'a3374ed2-5905-409d-8eaf-df020fea7740', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14077, 'a3374ed2-5938-4183-b83d-15eae20b37f9', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14078, 'a3374ed2-b589-4db9-9eaa-685201d306e9', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14079, 'a3374ed2-b5bc-4f25-9e26-dfeb590d7065', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14080, 'a3374ed2-b5e2-4617-bd20-371895d427ff', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"direction\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14081, 'a3374ed2-b60f-4cb6-87de-0fd15d8a5d6f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-down-up\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-down-up.blade.php\",\"data\":[\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14082, 'a3374ed2-b62b-4152-9c84-edd87d4a1148', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-up-down\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-up-down.blade.php\",\"data\":[\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14083, 'a3374ed2-b664-4b30-a2c0-e164dc862604', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.frame-code\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/frame-code.blade.php\",\"data\":[\"code\",\"highlightedLine\",\"xShow\",\"xCloak\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14084, 'a3374ed2-cce3-41b9-9718-e6c62f9a7107', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"editor\",\"startingLine\",\"highlightedLine\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14085, 'a3374ed2-cd3d-46b6-bdec-d5c7a98a6cda', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frames\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frames.blade.php\",\"data\":[\"frames\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14086, 'a3374ed2-cd72-42de-86e1-62bf49469dd8', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.folder\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/folder.blade.php\",\"data\":[\"class\",\"xShow\",\"xCloak\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14087, 'a3374ed2-cd92-4758-8655-b5e2f8c9d29f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.folder-open\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/folder-open.blade.php\",\"data\":[\"class\",\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14088, 'a3374ed2-cdb2-4d08-85a0-ecca72cc811f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-down-up\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-down-up.blade.php\",\"data\":[\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14089, 'a3374ed2-cdd0-4300-a9f3-46cdbf990895', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-up-down\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-up-down.blade.php\",\"data\":[\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14090, 'a3374ed2-cdee-4490-9bdd-0deadddae3c4', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14091, 'a3374ed2-ce14-43d7-87c0-9b0c46ae7c73', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14092, 'a3374ed2-ce3b-471c-8555-9d13fe6bd134', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14093, 'a3374ed2-ce64-41a9-9022-fbfc38289b09', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14094, 'a3374ed2-ce9b-45bd-a740-a3b20f8cd92a', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14095, 'a3374ed2-cec0-4076-a2bc-34f6de0a0746', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14096, 'a3374ed2-cee4-45f9-a0e3-2719117727f3', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14097, 'a3374ed2-cf0a-4490-81b4-a6ea7247d61c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14098, 'a3374ed2-cf42-4877-bb36-546ebc3f1d21', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14099, 'a3374ed2-cf65-4771-a051-4e394f5a91ee', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14100, 'a3374ed2-cf88-4cd0-9354-10ab14d7a15b', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14101, 'a3374ed2-cfac-4a89-a5bd-3d03d204e0c0', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14102, 'a3374ed2-cfda-4dbc-9929-572130716238', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14103, 'a3374ed2-cffc-4718-851f-e9e0af60e9fb', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14104, 'a3374ed2-d020-436c-85ba-85f7626c7d16', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14105, 'a3374ed2-d044-4c01-b374-595be3e2fef8', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14106, 'a3374ed2-d073-4a17-a8df-4ba4fc8e63e0', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14107, 'a3374ed2-d098-43a4-9e4c-c626f6c7581f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14108, 'a3374ed2-d0bf-4809-b2b3-4c5dfa28340c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14109, 'a3374ed2-d0e4-430b-8c58-47a0fd7607bd', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14110, 'a3374ed2-d114-4312-a020-1c51fccab760', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14111, 'a3374ed2-d138-4717-90ec-f804e4024b6b', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14112, 'a3374ed2-d15b-4cdb-adb1-ca425b41721a', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14113, 'a3374ed2-d17f-4a57-a56e-f1b5932b001d', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14114, 'a3374ed2-d1ae-4dbd-8bd0-4ed419edb5d5', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14115, 'a3374ed2-d1d1-44c4-9c93-1cbb5c144fed', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14116, 'a3374ed2-d1f5-430e-be1b-ce56a9caeca4', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14117, 'a3374ed2-d21a-4ef9-abb1-23af73db0992', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14118, 'a3374ed2-d247-4c16-b2ee-a6896835c6c0', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14119, 'a3374ed2-d26b-409a-882a-8f5a3f3d192f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14120, 'a3374ed2-d28d-485e-9c84-e83e034574ef', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14121, 'a3374ed2-d2b6-4f57-9765-d212f04baafb', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(14122, 'a3374ed2-d2ec-4866-9857-d64878fa08c2', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14123, 'a3374ed2-d315-4e4a-b2c6-77e347eafb45', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14124, 'a3374ed2-d33e-42e2-8f84-8645e870369d', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14125, 'a3374ed2-d364-49d2-9a19-1b1c47e2c6e5', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14126, 'a3374ed2-d394-4847-95ab-dc891ab93361', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14127, 'a3374ed2-d3b8-4c8c-bfa4-a5118892cf84', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14128, 'a3374ed2-d3dc-44e7-93a3-5456b8232fc3', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14129, 'a3374ed2-d401-4a27-a299-f69e2eb19e4a', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14130, 'a3374ed2-d432-4492-9897-9bdcc005f5cc', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14131, 'a3374ed2-d455-456b-9f27-21a72e9c8e87', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14132, 'a3374ed2-d479-4c54-a3d8-b688e9c41ed0', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14133, 'a3374ed2-d4a0-433a-bba4-91ca11453387', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14134, 'a3374ed2-d4cf-4cc5-9532-ee6b7efcc297', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14135, 'a3374ed2-d4fa-487f-a867-31498c060712', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14136, 'a3374ed2-d523-461e-a831-d9f0f7c4689b', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14137, 'a3374ed2-d549-4890-a65a-196575ee7c93', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14138, 'a3374ed2-d578-45a4-85a2-f4226331dd42', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14139, 'a3374ed2-d59c-44e1-b0fc-e8559fc0bb72', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14140, 'a3374ed2-d5be-4557-87c0-fd8534bf0037', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14141, 'a3374ed2-d5e4-4902-9cdd-b2fe017a042f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14142, 'a3374ed2-d612-4ae1-8025-67a33121f4ad', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14143, 'a3374ed2-d635-49f4-a42b-f54fa3c9d49b', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14144, 'a3374ed2-d65a-4504-a030-45b811e3b786', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14145, 'a3374ed2-d682-4f98-a607-03233278e465', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14146, 'a3374ed2-d6b9-499b-a444-66ac04f3ac8b', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14147, 'a3374ed2-d6dd-49fe-b60f-530cb6d33b05', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14148, 'a3374ed2-d700-4294-8e46-ddc0bc1f0900', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14149, 'a3374ed2-d724-4bab-90d8-ee12fbee3c80', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14150, 'a3374ed2-d752-43aa-9cf8-5ea13e77e2c7', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14151, 'a3374ed2-d775-446c-af97-23dc3d9d00aa', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14152, 'a3374ed2-d798-46d2-8ef9-4ecef4a7f3df', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14153, 'a3374ed2-d7bf-4885-94af-c1f65b122997', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14154, 'a3374ed2-d7ed-4ddf-944d-e2de974c7482', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14155, 'a3374ed2-d810-4ca2-ab8e-6dd1cca6bccf', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14156, 'a3374ed2-d833-46bb-9c37-f47a81f5c35f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14157, 'a3374ed2-d857-4b0d-bc57-e0d1cdcc0531', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14158, 'a3374ed2-d885-40a1-82eb-019bf8698b5d', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14159, 'a3374ed2-d8a7-4d48-a06a-5c1e5b224425', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14160, 'a3374ed2-d8cb-4dff-aacc-a782ddcf1d49', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14161, 'a3374ed2-d8f1-459d-8239-2cdacb0009cf', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14162, 'a3374ed2-d922-4add-ba5b-bbb32d7771d2', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14163, 'a3374ed2-d94b-4cb8-9d1d-51e2d74a623e', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14164, 'a3374ed2-d972-4ed7-8461-a1d447fe070e', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14165, 'a3374ed2-d99d-40b1-b6a0-5b4bda21ebcf', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14166, 'a3374ed2-d9d2-40e8-b0de-13607014e5c8', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14167, 'a3374ed2-d9f6-4fd8-b002-4fee19a959dd', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14168, 'a3374ed2-da1a-4177-abde-94bfd1d5124f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14169, 'a3374ed2-da40-418c-83a0-4bad307c7404', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14170, 'a3374ed2-da6f-448d-b5c2-e9f35d76fe33', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14171, 'a3374ed2-da93-42e1-9e72-40612566d221', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14172, 'a3374ed2-dab6-46e7-808a-c2153e9a85a6', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14173, 'a3374ed2-dadc-4e2a-9cbb-ad75fc7a7753', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14174, 'a3374ed2-db0c-403c-831b-6cdc5a0e2d4a', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14175, 'a3374ed2-db31-4059-89a2-a0fa204198ca', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14176, 'a3374ed2-db55-490f-a3b3-096e31a7abd4', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14177, 'a3374ed2-db7a-4adc-a422-ecd4e7e11af3', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14178, 'a3374ed2-dbb8-498b-b8fe-4efd66bb0fab', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14179, 'a3374ed2-dbdc-4656-8b27-468495a00435', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14180, 'a3374ed2-dbff-4966-8f4b-7a88453594fa', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14181, 'a3374ed2-dc23-46d0-bcd1-7627c2a161db', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14182, 'a3374ed2-dc58-4ee1-86e0-eac23434b201', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14183, 'a3374ed2-dc7a-4d0f-a11f-95864ef756a8', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14184, 'a3374ed2-dc9d-454e-ae15-ca5ac05b6bb0', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14185, 'a3374ed2-dcc8-48df-a765-035ce978392d', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14186, 'a3374ed2-dcfd-4cb0-a4b6-30c9ec64a6b9', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14187, 'a3374ed2-dd21-4bb5-9446-3e289c845a3a', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14188, 'a3374ed2-dd44-46a4-8b0e-39993ccf2735', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14189, 'a3374ed2-dd68-46da-b41c-dea09a678fa3', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14190, 'a3374ed2-dd9b-4da8-b964-81e6472f3700', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14191, 'a3374ed2-ddc0-41f5-a7a0-777b6db781ef', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14192, 'a3374ed2-dde5-4906-ad8c-e1c7806fc189', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14193, 'a3374ed2-de0b-4363-98d7-19b6696c5902', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14194, 'a3374ed2-de3d-4661-9fce-ed2946509266', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14195, 'a3374ed2-de63-45a8-b171-f99df6204075', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14196, 'a3374ed2-de86-4dd5-8de9-c4f2456ac561', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14197, 'a3374ed2-deab-4061-89d8-51aff38d86b8', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14198, 'a3374ed2-ded9-4ab5-99bd-1564a3fcd73f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14199, 'a3374ed2-defd-455f-bc5c-ea46780b887e', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14200, 'a3374ed2-df1f-457a-b29e-358a401f4707', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14201, 'a3374ed2-df43-455c-a203-b61273430f56', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14202, 'a3374ed2-df71-4aab-9717-4636e8ef88d6', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14203, 'a3374ed2-df96-405f-9136-4ebcd51ca4c7', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14204, 'a3374ed2-dfc0-49d1-adb8-03953c85a559', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14205, 'a3374ed2-dfe9-4ad0-89dd-ec93ff5dff7f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14206, 'a3374ed2-e026-43f3-b640-494cbb467c51', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14207, 'a3374ed2-e04f-4d99-8a15-6a66e0d5ed6a', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14208, 'a3374ed2-e075-4b86-b44a-2ab03df07de2', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14209, 'a3374ed2-e09a-4d66-975a-1b78d5bc745c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14210, 'a3374ed2-e0ca-40e9-a07a-18ee76c9a4a4', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14211, 'a3374ed2-e0ee-4b4f-82d0-ab37af72a73f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14212, 'a3374ed2-e114-45dc-baba-1583aa8757ec', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(14213, 'a3374ed2-e138-4f1f-8bc2-5fb00a86259c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14214, 'a3374ed2-e167-49f6-b532-223868d08915', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14215, 'a3374ed2-e18f-49f0-8365-85ec1057f8e9', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14216, 'a3374ed2-e1b3-4c47-84f1-278e3f2073e4', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14217, 'a3374ed2-e1d8-4518-a079-d59d68abc7b5', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14218, 'a3374ed2-e20c-4d42-816f-e537dd3b5d2f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14219, 'a3374ed2-e232-45d3-b49f-b9ac8f5ca2d5', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14220, 'a3374ed2-e25b-47de-9b94-eae8905a56d0', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14221, 'a3374ed2-e280-4bfe-9d8e-5319e7291135', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14222, 'a3374ed2-e2b2-4e7b-85dd-391f24771e96', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14223, 'a3374ed2-e2d7-4708-99ad-7ad151189ed1', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14224, 'a3374ed2-e2fc-4e79-a761-912a7526a177', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14225, 'a3374ed2-e322-4854-af5b-920888f78c31', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14226, 'a3374ed2-e353-4d42-8a81-942ed2626890', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14227, 'a3374ed2-e377-449f-a6bf-96430224bf12', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14228, 'a3374ed2-e39b-422a-b920-41549a88b97c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14229, 'a3374ed2-e3be-4d5e-acd0-e1a63078dfa2', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14230, 'a3374ed2-e3ed-4806-9404-cd8d4bd57bbb', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14231, 'a3374ed2-e410-4a7c-a275-50b3bbc01818', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14232, 'a3374ed2-e433-4387-acf0-77034691f44c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14233, 'a3374ed2-e456-43cd-b733-621db5366464', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14234, 'a3374ed2-e488-4289-a65b-a61ffa3d459f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14235, 'a3374ed2-e4ac-4d5c-923d-e2895bd3c4e9', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14236, 'a3374ed2-e4d0-468c-845f-0584caeb3bd6', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14237, 'a3374ed2-e4f3-40ee-b3d9-54d892c75f4d', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14238, 'a3374ed2-e523-4f69-88c8-ebab05cc6d62', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14239, 'a3374ed2-e547-4e64-80c5-c95caced90c6', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14240, 'a3374ed2-e56a-448b-ab2f-598d0d1f1f4f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14241, 'a3374ed2-e58e-4b1f-a148-c9159b496c00', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14242, 'a3374ed2-e5bd-47c0-a7e2-c1ad01612b7b', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14243, 'a3374ed2-e5e0-48ed-8577-9d0160c699b9', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14244, 'a3374ed2-e602-4618-8a51-321edb6b397a', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14245, 'a3374ed2-e629-4e11-819c-2ba6c2eaf30d', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14246, 'a3374ed2-e661-4762-a855-4b304fe3105a', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14247, 'a3374ed2-e689-4d23-b53e-b8403f05770d', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14248, 'a3374ed2-e6b0-43da-9512-4ec05408c261', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14249, 'a3374ed2-e6d5-402e-adc9-f0b9edeb28d5', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14250, 'a3374ed2-e70c-48fa-95d4-9fddfb4df8e1', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14251, 'a3374ed2-e730-4198-86eb-6ecef754be77', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14252, 'a3374ed2-e754-4856-a34d-1e6660d248f2', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14253, 'a3374ed2-e778-4f20-811d-84347d14b1a4', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14254, 'a3374ed2-e7a7-44a0-8674-53511d051aa3', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14255, 'a3374ed2-e7cb-49cd-aaee-160c06457dff', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14256, 'a3374ed2-e7ee-400a-94d3-61e131faab95', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14257, 'a3374ed2-e812-468b-bc21-41919ec392da', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14258, 'a3374ed2-e843-4841-b7e7-74feeeb6809c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14259, 'a3374ed2-e867-43df-8f93-7426e4b3eff9', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14260, 'a3374ed2-e88c-4c07-8863-5b4014bc246b', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14261, 'a3374ed2-e8b7-47f5-8198-0cf91222ad92', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14262, 'a3374ed2-e8e9-4b5e-a85a-1b8ebd0bab57', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14263, 'a3374ed2-e90f-4484-91a1-1f58785f1156', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14264, 'a3374ed2-e935-4189-aaec-54fcabd70537', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14265, 'a3374ed2-e95d-4f93-ac93-decff88cf619', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14266, 'a3374ed2-e98e-45a4-993c-d1ee93ed18d0', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14267, 'a3374ed2-e9b3-48aa-8805-e942c69e25e9', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14268, 'a3374ed2-e9d8-42eb-8164-5827e0307eb0', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14269, 'a3374ed2-e9fd-422c-835c-767620c07a93', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14270, 'a3374ed2-ea2d-4a51-8aef-97cf76d24594', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14271, 'a3374ed2-ea50-4b67-ba8f-ad7937102c2d', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14272, 'a3374ed2-ea72-409c-a365-5b42d2903153', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14273, 'a3374ed2-ea95-4fcd-9db0-50a593cc8101', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14274, 'a3374ed2-eac3-4083-895c-79a30e685b2d', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14275, 'a3374ed2-eae5-4ab8-8fb7-f0c509f96407', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14276, 'a3374ed2-eb07-46e3-a4bf-46b6483107e7', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14277, 'a3374ed2-eb2a-43f1-a206-8b553d69e3ef', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14278, 'a3374ed2-eb5b-4760-877d-1fc9674b409b', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14279, 'a3374ed2-eb7d-45a2-82e1-5ab1253375a8', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14280, 'a3374ed2-eba0-4e51-b272-856c41e01eea', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14281, 'a3374ed2-ebc4-4391-a875-0c24f0d439a8', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14282, 'a3374ed2-ebf5-4d55-8f97-1b51ff0deea1', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14283, 'a3374ed2-ec19-4103-88f9-ff6c059af0d8', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14284, 'a3374ed2-ec3c-4462-a119-f6f72cb30c9b', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14285, 'a3374ed2-ec66-4ebe-8483-81ea43f87ff4', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14286, 'a3374ed2-eca9-4e59-9153-62b40711e406', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14287, 'a3374ed2-ecfe-46c0-8c32-4d08ad7e39ff', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14288, 'a3374ed2-ed31-44c3-a7fd-89291b36f387', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14289, 'a3374ed2-ed60-4dbc-a91d-d3b26e053451', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"direction\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14290, 'a3374ed2-ed93-4fc9-a7c5-9ae93958a81c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-down-up\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-down-up.blade.php\",\"data\":[\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14291, 'a3374ed2-edb2-4286-9ced-cfe546fc1cfb', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-up-down\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-up-down.blade.php\",\"data\":[\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14292, 'a3374ed2-edf5-4f51-b5c0-70918234224b', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.frame-code\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/frame-code.blade.php\",\"data\":[\"code\",\"highlightedLine\",\"xShow\",\"xCloak\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14293, 'a3374ed2-ee1c-4506-ac87-c46361d1219a', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"editor\",\"startingLine\",\"highlightedLine\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14294, 'a3374ed2-ee58-4d1a-86ba-32b23c8a57c7', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.query\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/query.blade.php\",\"data\":[\"queries\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:49'),
(14295, 'a3374ed3-8d5a-440f-b6a5-3aa489dd2cc2', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.database\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/database.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14296, 'a3374ed3-91ee-4a75-bbea-b7cc9d9f639c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.database\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/database.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14297, 'a3374ed3-923c-4611-a529-d7589af691af', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14298, 'a3374ed3-927a-42cf-8085-9825a5914618', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.database\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/database.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14299, 'a3374ed3-929a-44a0-b046-3351ea7e4e93', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14300, 'a3374ed3-92c1-4329-809d-8feb75f9b9cc', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.database\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/database.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14301, 'a3374ed3-92e0-4e73-83c5-5436d28342bf', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14302, 'a3374ed3-930f-49ee-ab38-0ad5eefa201d', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-left\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-left.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14303, 'a3374ed3-976e-4dc0-9c86-f9d5e20fdb54', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevron-left\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevron-left.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(14304, 'a3374ed3-9b78-4d4c-a96e-f7ef9dac9915', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevron-right\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevron-right.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14305, 'a3374ed3-9fa8-43e7-a8ad-ead63873b447', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-right\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-right.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14306, 'a3374ed3-a3e2-4051-9f10-ba3fca9ad1d5', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.section-container\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/section-container.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14307, 'a3374ed3-a427-4fe9-86e2-9f198cfed85a', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.separator\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/separator.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14308, 'a3374ed3-a452-4817-a887-b5e73a6328de', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.request-header\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/request-header.blade.php\",\"data\":[\"headers\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14309, 'a3374ed3-ae55-4c14-b6bd-a9c3158556bf', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.request-body\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/request-body.blade.php\",\"data\":[\"body\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14310, 'a3374ed3-d651-4e64-832c-2ba94632dc4f', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.empty-state\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/empty-state.blade.php\",\"data\":[\"message\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14311, 'a3374ed3-dd84-4881-a3b8-97b6c36e6355', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.routing\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/routing.blade.php\",\"data\":[\"routing\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14312, 'a3374ed3-f899-497f-a18a-7841f0d97d20', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.routing-parameter\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/routing-parameter.blade.php\",\"data\":[\"routeParameters\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14313, 'a3374ed4-2068-4c15-8b4e-d72cebd0c5ba', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.empty-state\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/empty-state.blade.php\",\"data\":[\"message\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14314, 'a3374ed4-20b1-4f71-91da-749f184ae6d1', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.section-container\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/section-container.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14315, 'a3374ed4-20d8-4213-ace3-54ae78a10914', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.separator\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/separator.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14316, 'a3374ed4-2103-4fa6-8dce-d14a38f3134c', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.laravel-ascii-spotlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/laravel-ascii-spotlight.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14317, 'a3374ed4-460b-447b-8867-ec8520497fee', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.laravel-ascii\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/laravel-ascii.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14318, 'a3374ed4-4e3d-4aad-a6b7-36bf19dfdaf3', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.laravel-ascii\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/laravel-ascii.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14319, 'a3374ed4-4e83-47c0-bac3-95a1e3cf98e9', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.section-container\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/section-container.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14320, 'a3374ed4-4eb6-4e3f-83fd-1b8136ccb5c3', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.layout\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/layout.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14321, 'a3374ed4-700a-4441-8a59-885817b387b2', 'a3374ed4-71b3-4555-81b7-132539510442', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/producto_sucursals\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\ProductoSucursalController@index\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6ImZ2aVNISHg2K2kyWmw0NzVxRU5vSkE9PSIsInZhbHVlIjoib0JhbExzeVg0UHg4cDlOT0hEWE5FRTg1MXBqNG5RSmdTL0hUWGNob216S29NL2IvcDlYeVpoT0dLcysyM3BiaVVtcnZOYXFhNHg3RmNaMTB2Mms5T0daWTUxbG9HT2Z5Tkx6TTlvWDFhbmY5R0orSytnK2FYR2JKbW5BOUlWMUgiLCJtYWMiOiIyZjU2MGJkZDlmZDI4ODA3MjU5ZmVmZTEwNzVmNTlkNTc4ZjAxNzJhMjllMThiMjc0NTI3YzZmY2U2ZWU2NDE2IiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6Im5xQTh6QWM0QkdQMGFEMmdVQjlxc1E9PSIsInZhbHVlIjoiRlNqY2N0bzBYT3BERjY3bFE5RzM2R013ZlJ3d0M0Mjg2RCtzSnU2bEVYU0pTUFB5Q090dWRXWG9VME5CdUk0RFhnUmhaZXl1QVJYeENYK0xUVGllbjd4RmtvWDlGVnYxYk1PdzR4NnhJZGFucmlsOHFFZm5JMjhqejJ1Y0wyTHUiLCJtYWMiOiJkYmM3YjFmOTM1OTA2ZDAwNWMzMWExZDY4NGRjMzc4NWY3Zjc4NWYxNGZlNzNiZTQwMTVkNWI2ZWJkZmQ2ZmU1IiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/clientes\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-inertia\":\"true\",\"accept\":\"text\\/html, application\\/xhtml+xml\",\"x-inertia-version\":\"c8bdfce04e03ced50b63f0f87a38dbf0\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6ImZ2aVNISHg2K2kyWmw0NzVxRU5vSkE9PSIsInZhbHVlIjoib0JhbExzeVg0UHg4cDlOT0hEWE5FRTg1MXBqNG5RSmdTL0hUWGNob216S29NL2IvcDlYeVpoT0dLcysyM3BiaVVtcnZOYXFhNHg3RmNaMTB2Mms5T0daWTUxbG9HT2Z5Tkx6TTlvWDFhbmY5R0orSytnK2FYR2JKbW5BOUlWMUgiLCJtYWMiOiIyZjU2MGJkZDlmZDI4ODA3MjU5ZmVmZTEwNzVmNTlkNTc4ZjAxNzJhMjllMThiMjc0NTI3YzZmY2U2ZWU2NDE2IiwidGFnIjoiIn0=\"},\"payload\":[],\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:16:50 GMT\",\"content-type\":\"text\\/html; charset=utf-8\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6IkI2di90ZnFNdDJuUWtRcUx2VXdBS3c9PSIsInZhbHVlIjoiNTdER0NmV29lc3N3S2NaRktEWUlCSVBRalJ0c3pMZ283ZmJ6d2orL3BFeC9ENXNrVjFWaXBDeEtiRkxibUNTM2kwazgzMUtDU2E0Y3NkNkJSRHU0d1J1QkxCYSsrZHVEbmd3S1drZzVta3dWaklxZmZMbW5WYUdKWWo5ZGR6dG0iLCJtYWMiOiIwYTgwZmJjMDc1NmYxMjdhM2I5MmViNTE1N2UzNDEyOGJhMjllOGMwNGU0YWQyZjY0ZTIzYTc1Yjk2M2I4M2Y5IiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:16:50 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6ImRPeTNnQjdLbFdSK0RSTFVYMnV1Y0E9PSIsInZhbHVlIjoiZjRlZ2d0ZEhiLzQxbHVOb1VkQVdMUWdLeXM3MldIekZ2OWRmT3c3QWpDV3dKT0dvNmxVcHM4ckM2OVNETUp1WkxZM3ZrckhOZjJvZ3JDRkJDMnBQcHNNVWdJZzF1eUdxa3lKbWhKeWtlR2xwUk56cURkVlFNaGV4ZzNvZ2lGcG8iLCJtYWMiOiIzYjkyNDVlYmVkODdlYzkzMjBkZGViMmU2MzViMWFhMGZiNmZkNTAwMDIwNjNmYzc2ODg3OTMwMTcyNmNiY2JhIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:16:50 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":500,\"response\":\"HTML Response\",\"duration\":5143,\"memory\":36,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:16:50'),
(14322, 'a3374f18-3dbb-47c6-b2e8-9b01d4bb5a1b', 'a3374f18-4554-4cd8-b3a0-155fa89b81e7', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.46\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:17:35'),
(14323, 'a3374f18-3f02-41cb-a56b-a3f9c43d3859', 'a3374f18-4554-4cd8-b3a0-155fa89b81e7', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:17:35'),
(14324, 'a3374f18-40f1-4ca3-9871-4ae5adb147c6', 'a3374f18-4554-4cd8-b3a0-155fa89b81e7', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.44\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:17:35'),
(14325, 'a3374f18-41d0-4650-a83a-dbee5ab6ad6d', 'a3374f18-4554-4cd8-b3a0-155fa89b81e7', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.41\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:17:35'),
(14326, 'a3374f18-41f0-4164-9fde-2b0e8092df54', 'a3374f18-4554-4cd8-b3a0-155fa89b81e7', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:17:35'),
(14327, 'a3374f18-42ea-4bc6-ad9f-d3a6f641516a', 'a3374f18-4554-4cd8-b3a0-155fa89b81e7', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `notificacion_users` where `user_id` = 1 and `visto` = 0 order by `created_at` desc\",\"time\":\"0.45\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Controllers\\\\NotificacionUserController.php\",\"line\":72,\"hash\":\"45a6c7bee3b64d176bbcb758f499e0ef\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:17:35'),
(14328, 'a3374f18-44a4-44b4-aba5-924bda8d8bb3', 'a3374f18-4554-4cd8-b3a0-155fa89b81e7', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/notificacion_users\\/getNotificacions\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\NotificacionUserController@getNotificacions\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6IkI2di90ZnFNdDJuUWtRcUx2VXdBS3c9PSIsInZhbHVlIjoiNTdER0NmV29lc3N3S2NaRktEWUlCSVBRalJ0c3pMZ283ZmJ6d2orL3BFeC9ENXNrVjFWaXBDeEtiRkxibUNTM2kwazgzMUtDU2E0Y3NkNkJSRHU0d1J1QkxCYSsrZHVEbmd3S1drZzVta3dWaklxZmZMbW5WYUdKWWo5ZGR6dG0iLCJtYWMiOiIwYTgwZmJjMDc1NmYxMjdhM2I5MmViNTE1N2UzNDEyOGJhMjllOGMwNGU0YWQyZjY0ZTIzYTc1Yjk2M2I4M2Y5IiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6ImRPeTNnQjdLbFdSK0RSTFVYMnV1Y0E9PSIsInZhbHVlIjoiZjRlZ2d0ZEhiLzQxbHVOb1VkQVdMUWdLeXM3MldIekZ2OWRmT3c3QWpDV3dKT0dvNmxVcHM4ckM2OVNETUp1WkxZM3ZrckhOZjJvZ3JDRkJDMnBQcHNNVWdJZzF1eUdxa3lKbWhKeWtlR2xwUk56cURkVlFNaGV4ZzNvZ2lGcG8iLCJtYWMiOiIzYjkyNDVlYmVkODdlYzkzMjBkZGViMmU2MzViMWFhMGZiNmZkNTAwMDIwNjNmYzc2ODg3OTMwMTcyNmNiY2JhIiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/clientes\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6IkI2di90ZnFNdDJuUWtRcUx2VXdBS3c9PSIsInZhbHVlIjoiNTdER0NmV29lc3N3S2NaRktEWUlCSVBRalJ0c3pMZ283ZmJ6d2orL3BFeC9ENXNrVjFWaXBDeEtiRkxibUNTM2kwazgzMUtDU2E0Y3NkNkJSRHU0d1J1QkxCYSsrZHVEbmd3S1drZzVta3dWaklxZmZMbW5WYUdKWWo5ZGR6dG0iLCJtYWMiOiIwYTgwZmJjMDc1NmYxMjdhM2I5MmViNTE1N2UzNDEyOGJhMjllOGMwNGU0YWQyZjY0ZTIzYTc1Yjk2M2I4M2Y5IiwidGFnIjoiIn0=\"},\"payload\":[],\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:17:35 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6IkZIU0YxRkE5VEpaMWhOaWJEaDd5aGc9PSIsInZhbHVlIjoiaUhMM0g5SUJIQ3hzVlAvL2lDZXJKRFpRS29SMGxMUVFzOUZ3N0szUmovZlJQTlNZRFJ0a1JDUlJWYjBNOWN1YUphT3ZkTzVDSkdEdENWdGRaUEVkSnYwVVFUcW9OMnlXb1VwK0lVY3BMRG4ySUtHZGRnaGd6S2JWRlZCWDZqTkQiLCJtYWMiOiJkYWI2ZGEzMWRjNjQyMGU1MTRlNDJhYTY0NTlmMmYwNDRkZDYzOGQxY2RkMjRkMTY3MzRiMDdjMzQ3YzJhYjVjIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:17:35 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6Ii9uWjZpa3JvTFFUdjJwT1FpbnpJTlE9PSIsInZhbHVlIjoiMU9VTitra2FicW45NnJTMmVmVVZCS3lOTHF3SVlIRk8xaUdDd3dIMFp4aU9OYVphMGZ1ZEI0NmFlbkVuaHlQOVJVZ1VBbW5qSEVXOGFYYTIwRkg3WlVuNHozRDZ3QzVhN3dON3kydHE3U2N0RG56eDZTVnBMTWZ2ZWhneStvdm4iLCJtYWMiOiI4M2IwM2EzYWI0YmY2NWU0NDczMjQ0ZGI0YTA0NjdkOWIzMjFlNGJlYzc2Njk4Yzg5NWJmNzVmY2I0NmI1Y2ZkIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:17:35 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"notificacion_users\":[]},\"duration\":200,\"memory\":30,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:17:35'),
(14329, 'a3374f3e-d49c-4ad2-9474-4bec8292dc73', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', '3128343b29e45f32ffbb9e7bbb0124fd', 1, 'exception', '{\"class\":\"ErrorException\",\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\composer\\\\ClassLoader.php\",\"line\":571,\"message\":\"include(C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\composer\\/..\\/..\\/app\\/Services\\/AlmacenService.php): Failed to open stream: No such file or directory\",\"context\":{\"userId\":1},\"trace\":[{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Bootstrap\\\\HandleExceptions.php\",\"line\":258},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\composer\\\\ClassLoader.php\",\"line\":571},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\composer\\\\ClassLoader.php\",\"line\":571},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\composer\\\\ClassLoader.php\",\"line\":428},[],{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":1000},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":986},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":926},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Application.php\",\"line\":1078},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":864},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Application.php\",\"line\":1058},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":1336},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":1237},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":1162},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":933},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Application.php\",\"line\":1078},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Container\\\\Container.php\",\"line\":864},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Application.php\",\"line\":1058},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Route.php\",\"line\":286},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Route.php\",\"line\":266},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Route.php\",\"line\":211},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Router.php\",\"line\":822},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\PermisoUsuarioMiddleware.php\",\"line\":30},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Http\\\\Middleware\\\\AddLinkHeadersForPreloadedAssets.php\",\"line\":32},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\inertiajs\\\\inertia-laravel\\\\src\\\\Middleware.php\",\"line\":122},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Middleware\\\\SubstituteBindings.php\",\"line\":50},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Auth\\\\Middleware\\\\Authenticate.php\",\"line\":63},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\VerifyCsrfToken.php\",\"line\":87},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\View\\\\Middleware\\\\ShareErrorsFromSession.php\",\"line\":48},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Session\\\\Middleware\\\\StartSession.php\",\"line\":120},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Session\\\\Middleware\\\\StartSession.php\",\"line\":63},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Cookie\\\\Middleware\\\\AddQueuedCookiesToResponse.php\",\"line\":36},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Cookie\\\\Middleware\\\\EncryptCookies.php\",\"line\":74},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":137},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Router.php\",\"line\":821},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Router.php\",\"line\":800},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Router.php\",\"line\":764},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Routing\\\\Router.php\",\"line\":753},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Kernel.php\",\"line\":200},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":180},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\TransformsRequest.php\",\"line\":21},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\ConvertEmptyStringsToNull.php\",\"line\":31},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\TransformsRequest.php\",\"line\":21},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\TrimStrings.php\",\"line\":51},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Http\\\\Middleware\\\\ValidatePostSize.php\",\"line\":27},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\PreventRequestsDuringMaintenance.php\",\"line\":109},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Http\\\\Middleware\\\\HandleCors.php\",\"line\":61},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Http\\\\Middleware\\\\TrustProxies.php\",\"line\":58},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Middleware\\\\InvokeDeferredCallbacks.php\",\"line\":22},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Http\\\\Middleware\\\\ValidatePathEncoding.php\",\"line\":26},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":219},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Pipeline\\\\Pipeline.php\",\"line\":137},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Kernel.php\",\"line\":175},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Http\\\\Kernel.php\",\"line\":144},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Application.php\",\"line\":1220},{\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20}],\"line_preview\":{\"562\":\" *\",\"563\":\" * Prevents access to $this\\/self from included files.\",\"564\":\" *\",\"565\":\" * @param  string $file\",\"566\":\" * @return void\",\"567\":\" * @private\",\"568\":\" *\\/\",\"569\":\"function includeFile($file)\",\"570\":\"{\",\"571\":\"    include $file;\",\"572\":\"}\",\"573\":\"\"},\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null},\"occurrences\":2}', '2026-11-13 10:18:00'),
(14330, 'a3374f3e-c2de-4e97-8421-8ccf609421d7', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.55\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:00'),
(14331, 'a3374f3e-c4b7-40df-b5ef-5822c962e19f', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:00'),
(14332, 'a3374f3e-c6fa-4c32-9b1a-963aeec40d27', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.55\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14333, 'a3374f3e-c7f6-4e55-abbf-9ef3125ee6b2', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.54\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14334, 'a3374f3e-c830-4e8f-9d19-90765ff51035', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14335, 'a3374f3f-0735-4249-95a7-0c43e412ff43', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::markdown\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/markdown.blade.php\",\"data\":[\"exception\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14336, 'a3374f3f-7e05-4816-887b-19e0fd8432c2', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::show\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/show.blade.php\",\"data\":[\"exception\",\"exceptionAsMarkdown\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14337, 'a3374f3f-7f09-4bb6-bf04-21837b111e46', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.topbar\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/topbar.blade.php\",\"data\":[\"title\",\"markdown\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14338, 'a3374f3f-7f6b-482c-ae0f-6e0309dfcc2a', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.copy\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/copy.blade.php\",\"data\":[\"class\",\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14339, 'a3374f3f-7faa-49b5-b4e0-0085c606496a', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.check\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/check.blade.php\",\"data\":[\"class\",\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14340, 'a3374f3f-7fe6-4dde-a303-1440dbcd3c32', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.section-container\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/section-container.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14341, 'a3374f3f-801e-49a3-9192-96b6a2ae2108', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.separator\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/separator.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14342, 'a3374f3f-8055-453c-9f0c-d361be262adb', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.header\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/header.blade.php\",\"data\":[\"exception\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14343, 'a3374f3f-809f-40a0-91b8-4229c0265826', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14344, 'a3374f3f-80ec-40de-ab99-325a9b94acb8', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.alert\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/alert.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14345, 'a3374f3f-8115-44af-8ad7-ecc1533fa2ac', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.badge\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/badge.blade.php\",\"data\":[\"type\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14346, 'a3374f3f-8145-491a-8f06-80337878f2f4', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.badge\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/badge.blade.php\",\"data\":[\"type\",\"variant\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14347, 'a3374f3f-817d-497b-b0d2-0575fda9e635', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.request-url\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/request-url.blade.php\",\"data\":[\"exception\",\"request\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14348, 'a3374f3f-81d6-426d-b762-2c8c9fd8c8dc', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.alert\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/alert.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14349, 'a3374f3f-81fd-4d75-aa8c-68945cec0d87', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.badge\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/badge.blade.php\",\"data\":[\"type\",\"variant\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14350, 'a3374f3f-822e-491c-9f25-16a4a3652ff8', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.http-method\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/http-method.blade.php\",\"data\":[\"method\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14351, 'a3374f3f-8269-4023-876d-f4961cac3628', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.globe\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/globe.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14352, 'a3374f3f-8291-4fa6-9523-7b9c7ee6e47c', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.badge\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/badge.blade.php\",\"data\":[\"type\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14353, 'a3374f3f-82bd-46e6-a651-167b138000b0', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.copy\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/copy.blade.php\",\"data\":[\"class\",\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14354, 'a3374f3f-82de-428b-83f2-bb9cde58ed3d', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.check\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/check.blade.php\",\"data\":[\"class\",\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14355, 'a3374f3f-82fe-49df-89d4-cf5baf423f6f', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.section-container\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/section-container.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14356, 'a3374f3f-831d-4117-b11d-6d9858736745', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.separator\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/separator.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14357, 'a3374f3f-8344-4e07-a633-0def472d68e5', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.trace\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/trace.blade.php\",\"data\":[\"exception\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14358, 'a3374f3f-8379-424e-906a-cd08bdbfe739', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.alert\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/alert.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14359, 'a3374f3f-83a6-4c7d-b676-6f1d4be0b2d2', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frames\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frames.blade.php\",\"data\":[\"frames\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14360, 'a3374f3f-83e4-4125-ba82-931618285e99', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.folder\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/folder.blade.php\",\"data\":[\"class\",\"xShow\",\"xCloak\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14361, 'a3374f3f-8411-4666-9d0d-c6c63a9a7024', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.folder-open\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/folder-open.blade.php\",\"data\":[\"class\",\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14362, 'a3374f3f-844e-4e02-adf1-b06ad7759cef', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-down-up\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-down-up.blade.php\",\"data\":[\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14363, 'a3374f3f-847f-4a9b-8865-9213837d4f83', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-up-down\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-up-down.blade.php\",\"data\":[\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14364, 'a3374f3f-84b6-4216-a38c-8f9a39513188', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14365, 'a3374f3f-84fd-43b1-970e-12af36a0c6d8', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14366, 'a3374f3f-8539-41d6-a5b6-73d2644562e1', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(14367, 'a3374f3f-856f-4d16-aa0b-3b86b8dd0ccf', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14368, 'a3374f3f-85a9-4f41-a830-6783f50af1f7', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14369, 'a3374f3f-85d0-44e8-a229-e83db46c6bdd', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14370, 'a3374f3f-8612-49c5-9b74-eea464c87a25', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14371, 'a3374f3f-863b-44a7-8e18-5994e829a37d', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14372, 'a3374f3f-8679-4603-9f18-14e829babba7', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14373, 'a3374f3f-86a1-4947-9034-65b1c925885b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14374, 'a3374f3f-86e7-4fd6-8b93-320ab965a29a', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14375, 'a3374f3f-870f-4507-82db-18f5a84af73d', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14376, 'a3374f3f-8753-4582-be2c-b4375e5056f9', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14377, 'a3374f3f-877d-4041-96a0-d26ed46818ca', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14378, 'a3374f3f-87a1-479c-8d56-2b4f4cbf2164', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14379, 'a3374f3f-87c4-4c1b-9f4f-593ed8c80766', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14380, 'a3374f3f-87fa-42e3-945e-1d43e20c0941', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14381, 'a3374f3f-881f-44d1-9abf-ac3b4087738f', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14382, 'a3374f3f-8843-4c6b-8d65-1d75d9630a3f', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14383, 'a3374f3f-8868-47b6-b739-4ba3d3412162', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14384, 'a3374f3f-88a0-4499-9e41-9301a5d354ec', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14385, 'a3374f3f-88c4-471f-afa2-c8219296aeba', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14386, 'a3374f3f-88e6-496a-8ec7-d3dbea8a8d5f', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14387, 'a3374f3f-890b-483b-9235-2ab7e1f1ea6d', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14388, 'a3374f3f-8942-4fb1-ba08-b2f8e11fc9d1', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14389, 'a3374f3f-8967-484c-8941-3a1b0e4b9d5a', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14390, 'a3374f3f-898a-419b-bfef-703d374111c6', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14391, 'a3374f3f-89ae-4864-88aa-017fc45c42b6', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14392, 'a3374f3f-89e5-414e-91d5-1e6122f1dde6', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14393, 'a3374f3f-8a09-4d85-9132-841cd9011787', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14394, 'a3374f3f-8a2b-48ba-8d6d-c94f4d3a4b56', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14395, 'a3374f3f-8a4e-4644-b4d7-4f399e7a8d5c', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14396, 'a3374f3f-8a82-4139-b76c-50c99959babc', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14397, 'a3374f3f-8aa5-4c64-8de8-e5cf7ee99769', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14398, 'a3374f3f-8ad1-49b2-8d25-4a6c2d4cc49e', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14399, 'a3374f3f-8af9-4f54-bc16-720afab606c5', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14400, 'a3374f3f-8b39-426a-abf2-46d7869ed287', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14401, 'a3374f3f-8b5e-454a-9f5a-6dd15cf0a9d6', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14402, 'a3374f3f-8b82-4290-9a71-6bdef55c8d75', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14403, 'a3374f3f-8ba7-4206-be88-9b75efdc1ee4', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14404, 'a3374f3f-8bde-436e-8f51-c176997065e8', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14405, 'a3374f3f-8c0e-48c5-af7c-359ad6859473', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14406, 'a3374f3f-8c33-4c5e-b707-c08abda2822f', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14407, 'a3374f3f-8c58-45b1-9c82-0dccb835ab6f', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14408, 'a3374f3f-8c8e-443f-a5ae-56684b7b8c78', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14409, 'a3374f3f-8cb1-4176-b7f2-d11cd3c98262', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14410, 'a3374f3f-8cd5-45dc-ae09-08ca7e8c3e5c', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14411, 'a3374f3f-8cfa-4c9b-9ede-74ed526677f2', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14412, 'a3374f3f-8d32-48a1-b8ec-e7b56e9647b3', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14413, 'a3374f3f-8d57-42c1-b309-f07e5cb03424', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14414, 'a3374f3f-8d7b-49d1-b310-c61eb20bb2fb', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14415, 'a3374f3f-8da0-429a-ad39-04c569a24ff3', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14416, 'a3374f3f-8dd6-46b8-ae38-5800e7bb1c97', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14417, 'a3374f3f-8dfa-4a89-9d50-040f53cc44ed', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14418, 'a3374f3f-8e1d-4102-9d62-f1bde9307491', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14419, 'a3374f3f-8e42-49f2-90cc-e5799a97a3ea', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14420, 'a3374f3f-8e76-4f3e-b609-db59b7cdc0c2', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14421, 'a3374f3f-8e9a-4609-9320-2975851b2685', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14422, 'a3374f3f-8ebf-4ff1-88c5-204e1ac65bcb', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14423, 'a3374f3f-8ee2-4b4a-9ea4-36a535830ee8', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14424, 'a3374f3f-8f1d-44fa-8ab8-2930c36af085', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14425, 'a3374f3f-8f41-4204-aa10-dd056b70dc58', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14426, 'a3374f3f-8f6c-47c3-8748-f3fb4c0f80d9', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14427, 'a3374f3f-8f91-4abc-b9d9-017a5ba7e8ee', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14428, 'a3374f3f-8fc7-4664-b506-6dfd53c45db7', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14429, 'a3374f3f-8fea-4dd1-8faa-3c091c6f0a36', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14430, 'a3374f3f-900e-4192-9bc1-410a163bd832', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14431, 'a3374f3f-9031-4a72-bdb0-0ac013445562', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14432, 'a3374f3f-9065-493c-87fb-e0bc1be20386', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14433, 'a3374f3f-9088-48c7-8a7f-5ffd6fe89ddb', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14434, 'a3374f3f-90aa-4e5f-a656-35a5a1faf7ed', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14435, 'a3374f3f-90ce-4aa1-bdc1-06979241257e', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14436, 'a3374f3f-9101-4c98-8555-ea3338653619', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14437, 'a3374f3f-9124-4304-93fd-5debc6f9b540', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14438, 'a3374f3f-914f-4b61-94f0-d2df4dd3315e', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14439, 'a3374f3f-917c-4f21-aeb1-b0ceed62e781', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14440, 'a3374f3f-91ca-4cb3-820d-991f4890db97', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14441, 'a3374f3f-91f7-44ed-b595-829fd6f80faf', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14442, 'a3374f3f-9222-44d2-b627-459c3daf8fb0', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14443, 'a3374f3f-9248-4862-89b3-9cec07161c66', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14444, 'a3374f3f-9281-424e-9d47-3b69a9f5da99', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14445, 'a3374f3f-92a5-44df-89bf-e97a9ef04534', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14446, 'a3374f3f-92c9-4263-b8c9-bfa2a223e7b1', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14447, 'a3374f3f-92ed-40e0-b388-370138a7dcb5', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14448, 'a3374f3f-9329-4cde-984e-3fd7ecbcd7a4', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14449, 'a3374f3f-9380-4796-a862-76c5e0d513e1', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14450, 'a3374f3f-93a6-4892-b257-6dad37716b6b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14451, 'a3374f3f-93cc-4ebe-9251-0c2c85a0c292', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"direction\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14452, 'a3374f3f-93fd-4858-a27e-8739a411e8c0', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-down-up\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-down-up.blade.php\",\"data\":[\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14453, 'a3374f3f-941d-49de-96ac-60028c937276', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-up-down\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-up-down.blade.php\",\"data\":[\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14454, 'a3374f3f-946b-4cd3-8f0d-d30cf52210d2', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.frame-code\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/frame-code.blade.php\",\"data\":[\"code\",\"highlightedLine\",\"xShow\",\"xCloak\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14455, 'a3374f3f-949e-4e6f-a9f3-a3540b54b2a1', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"editor\",\"startingLine\",\"highlightedLine\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14456, 'a3374f3f-94c9-415a-a630-99f08dee2729', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frames\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frames.blade.php\",\"data\":[\"frames\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14457, 'a3374f3f-94f7-416a-b6b0-fd2e1a2774e3', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.folder\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/folder.blade.php\",\"data\":[\"class\",\"xShow\",\"xCloak\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(14458, 'a3374f3f-951a-4cb7-b3d7-fd603344b239', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.folder-open\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/folder-open.blade.php\",\"data\":[\"class\",\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14459, 'a3374f3f-953a-44fb-adc5-3be65ae236c7', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-down-up\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-down-up.blade.php\",\"data\":[\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14460, 'a3374f3f-9557-411c-ac00-60d5db590ca4', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-up-down\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-up-down.blade.php\",\"data\":[\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14461, 'a3374f3f-9574-4dbc-a4d3-8c468918c4e2', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14462, 'a3374f3f-9599-4f73-bc13-9cde9b0b512d', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14463, 'a3374f3f-95bf-4bf4-ba7f-25b52192aea8', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14464, 'a3374f3f-95e6-4b34-9e38-6646c7386435', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14465, 'a3374f3f-961f-4252-80be-8968a2fb41f2', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14466, 'a3374f3f-9646-4f25-a5ad-88098301bef1', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14467, 'a3374f3f-966a-42b8-926e-4affb6bb951b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14468, 'a3374f3f-968f-4443-9e87-e7d0430c6576', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14469, 'a3374f3f-96be-4970-9c25-51f3e2a89f75', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14470, 'a3374f3f-96e3-440d-a265-590cc237fb93', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14471, 'a3374f3f-9705-476f-a2d4-4692a293a595', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14472, 'a3374f3f-9729-4512-b3c0-8b770c0333da', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14473, 'a3374f3f-9757-40f1-9af2-1c34fd14de2b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14474, 'a3374f3f-9779-46c1-830e-53f5f815771d', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14475, 'a3374f3f-979b-47e5-b268-6c212b462a99', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14476, 'a3374f3f-97c7-42e0-9893-48e98487b64b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14477, 'a3374f3f-9801-428e-9b87-ed6d264bf245', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14478, 'a3374f3f-9828-48b8-885c-5bad33b21678', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14479, 'a3374f3f-9855-4805-b17f-338012aa05d1', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14480, 'a3374f3f-9884-487b-8533-5bc4a1c72e0b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14481, 'a3374f3f-98b8-4be6-9d1e-62b33da83c06', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14482, 'a3374f3f-98dd-48cb-a84f-7442fd7a67c5', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14483, 'a3374f3f-9901-45b4-9fd6-08d5de57a0da', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14484, 'a3374f3f-992d-417c-8eac-e995351b7d48', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14485, 'a3374f3f-995f-4fe2-8fdb-93ea40b22f0d', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14486, 'a3374f3f-9983-4973-b0cb-bb7055e364d7', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14487, 'a3374f3f-99a6-49ef-8e5e-cdf4342ec61d', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14488, 'a3374f3f-99cb-46a4-b4c5-2ea6321f6c71', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14489, 'a3374f3f-99fc-4066-9729-04dddf4f0ebe', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14490, 'a3374f3f-9a20-41b9-a39e-729666a4e93b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14491, 'a3374f3f-9a44-4ebe-86a8-ab31b8828003', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14492, 'a3374f3f-9a69-480c-83b6-3a5e678d48cc', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14493, 'a3374f3f-9a9a-4c7b-86d3-e24817dbc041', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14494, 'a3374f3f-9abe-46c4-9b30-8f777061e5ee', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14495, 'a3374f3f-9ae1-415e-b3ef-cbab62aac747', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14496, 'a3374f3f-9b06-4370-be73-4808cc20383b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14497, 'a3374f3f-9b39-4156-991a-47bea181c17b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14498, 'a3374f3f-9b5b-40d9-9c38-9e42a7491056', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14499, 'a3374f3f-9b7f-4b40-b85e-de8ce518b38e', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14500, 'a3374f3f-9ba3-4402-b036-2a55d3540599', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14501, 'a3374f3f-9bd4-4ec1-968f-b1a14368af42', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14502, 'a3374f3f-9bf7-468a-86b4-5ef27338049a', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14503, 'a3374f3f-9c1c-4602-865d-a19686a99c11', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14504, 'a3374f3f-9c40-474f-9bb3-ac774684c3f7', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14505, 'a3374f3f-9c70-4c54-bae8-a0ab8ef86f35', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14506, 'a3374f3f-9c93-4b62-96c8-d4fcc20db5ff', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14507, 'a3374f3f-9cb6-42a1-9098-5804220dbba4', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14508, 'a3374f3f-9cda-4160-85a9-75c97f0cd1f3', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14509, 'a3374f3f-9d09-4c15-8c72-9c3119bfca0b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14510, 'a3374f3f-9d2b-4dda-866d-66b6a49ba4cc', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14511, 'a3374f3f-9d4d-40c6-92a7-050e666a3e11', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14512, 'a3374f3f-9d71-4935-a1ca-3019a66d39ad', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14513, 'a3374f3f-9da4-48d2-9c31-d96543868d84', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14514, 'a3374f3f-9dc6-4420-8765-ec42b35b51c6', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14515, 'a3374f3f-9de8-4058-879e-d0872c21c52a', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14516, 'a3374f3f-9e0d-469e-a12d-53cc6cfe96eb', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14517, 'a3374f3f-9e3f-4f54-8e4c-34fdfef463c1', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14518, 'a3374f3f-9e76-437b-97d3-50cee91c6eea', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14519, 'a3374f3f-9ea2-4ba2-9524-be7205450915', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14520, 'a3374f3f-9edb-493c-ba3b-23cc9109c9b4', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14521, 'a3374f3f-9f11-4feb-ba88-b34bab5fb742', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14522, 'a3374f3f-9f35-4228-817a-23644cf2132f', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14523, 'a3374f3f-9f5b-4b2a-83e7-11a2af8ad1be', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14524, 'a3374f3f-9f84-480f-9770-f69b30b3830c', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14525, 'a3374f3f-9fbe-4784-b89a-c406c5d7b38b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14526, 'a3374f3f-9fea-4569-8b3a-fcb978a91475', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14527, 'a3374f3f-a013-4ef4-907a-850f2b664a53', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14528, 'a3374f3f-a03b-4bad-89c6-05c22934f4dc', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14529, 'a3374f3f-a06d-4914-bc54-2e98f52836a8', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14530, 'a3374f3f-a093-4244-9cfb-bb15bac7dbb7', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14531, 'a3374f3f-a0b8-4ea9-a536-2664a15d33ea', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14532, 'a3374f3f-a0e2-459d-8d95-453b3a24c3af', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14533, 'a3374f3f-a11a-42e6-bd4b-387a91697964', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14534, 'a3374f3f-a13e-495c-8d01-0562648caefb', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14535, 'a3374f3f-a16c-4f5f-b469-89a0e3716789', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14536, 'a3374f3f-a196-4e24-833e-9f122441c1c0', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14537, 'a3374f3f-a1c9-4f2c-962a-7cf224b34c83', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14538, 'a3374f3f-a1ed-4d54-9572-b59850a113ac', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14539, 'a3374f3f-a210-4235-b5a6-044da99b7b2c', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14540, 'a3374f3f-a236-4d4c-8d88-258c4913a315', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14541, 'a3374f3f-a26f-4abb-8353-2607ffa354b8', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14542, 'a3374f3f-a297-49a9-b4b9-a874db74396e', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14543, 'a3374f3f-a2bd-49d7-9216-c80eeaa04fb7', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14544, 'a3374f3f-a2e1-451d-8011-a59d2c3a2bfb', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14545, 'a3374f3f-a30c-406a-8658-0e31901fcaa4', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14546, 'a3374f3f-a331-4110-be85-4e8fe2aec297', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14547, 'a3374f3f-a356-4444-bf38-f5c3003d1469', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14548, 'a3374f3f-a37b-44f4-b6de-a670023d7893', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(14549, 'a3374f3f-a3b6-404c-b14f-a2d566585059', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14550, 'a3374f3f-a3da-4f22-80b6-663173db6640', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14551, 'a3374f3f-a3fd-4f8a-874b-34f5bc2aa908', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14552, 'a3374f3f-a420-43dc-a41e-f0729aa6b68f', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14553, 'a3374f3f-a454-4212-9835-115b94a9af7b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14554, 'a3374f3f-a477-45bd-856a-5a2e1bdf2afc', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14555, 'a3374f3f-a49a-4510-8869-f1e7583c3692', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14556, 'a3374f3f-a4c3-4e6a-8602-7faf4b85064a', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14557, 'a3374f3f-a4ff-4764-b67c-eb6757b64b5e', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14558, 'a3374f3f-a523-4c9f-b5bc-ff85789f3d4a', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14559, 'a3374f3f-a548-4fa0-9952-fa5451a0f644', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14560, 'a3374f3f-a56c-4e96-9d37-a5d6dace8dc9', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:00'),
(14561, 'a3374f3f-a5a2-45d1-8d47-6171d3ef6fcf', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14562, 'a3374f3f-a5c5-4ae5-ab3c-7cead44cdec5', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14563, 'a3374f3f-a5e8-4158-8261-8f24f3d824c9', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14564, 'a3374f3f-a60c-404e-8da1-e291c40ddb80', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14565, 'a3374f3f-a63d-411f-9734-7a2b5a6f0dda', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14566, 'a3374f3f-a660-45dd-a17a-4b848f18143d', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14567, 'a3374f3f-a685-465e-bfc5-880f371f21dd', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14568, 'a3374f3f-a6a8-4702-822c-1690fd9698b4', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14569, 'a3374f3f-a6d9-4e23-b8db-f3505dd09659', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14570, 'a3374f3f-a6fb-4f9c-95bd-b93ff6f9b6a4', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14571, 'a3374f3f-a71e-4cdb-bea5-7efdce03fece', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14572, 'a3374f3f-a743-4416-b13a-87edfc60329b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14573, 'a3374f3f-a777-4ccc-83c5-a068a4e5f68e', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14574, 'a3374f3f-a79d-4429-ade8-9cbac3055ac5', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14575, 'a3374f3f-a7c1-437a-87fe-56a57bac72b6', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14576, 'a3374f3f-a7e7-4860-9888-82d4f0238e96', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14577, 'a3374f3f-a81d-491e-986d-2580377b0458', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14578, 'a3374f3f-a841-4f93-8658-304737871e5e', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14579, 'a3374f3f-a868-410e-8722-a5ee6a39dbc0', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14580, 'a3374f3f-a893-4846-afeb-cc459733ab11', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14581, 'a3374f3f-a8c5-48e1-8d70-879b7ff6eb41', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14582, 'a3374f3f-a8e9-45d3-8dbe-1c9990cc5d60', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14583, 'a3374f3f-a90c-40f7-95b7-afcc7cc7c020', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14584, 'a3374f3f-a933-4140-8b72-53608dad5515', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14585, 'a3374f3f-a964-4a66-9791-6db04728dc16', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14586, 'a3374f3f-a987-4146-bc60-1b6ebb7b7887', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14587, 'a3374f3f-a9ab-4ce0-9a39-badfcc755d96', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14588, 'a3374f3f-a9cf-4cd8-9031-d300f73a5f3f', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14589, 'a3374f3f-a9ff-46a5-9dd7-e11bf4ab5183', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14590, 'a3374f3f-aa22-45b9-a1e9-cb0b57e79e10', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14591, 'a3374f3f-aa45-430c-ab86-f9b84e9d4abd', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14592, 'a3374f3f-aa71-4099-8aeb-958574d94fd5', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14593, 'a3374f3f-aaa4-467e-a850-ef4061f643eb', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14594, 'a3374f3f-aac7-4beb-b58e-066ad8bfcbe7', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14595, 'a3374f3f-aae9-4777-9b13-291c3a4f2bb9', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14596, 'a3374f3f-ab0c-447a-8c4a-463401997bf9', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14597, 'a3374f3f-ab3e-47b0-bb77-0038eb1ce45a', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14598, 'a3374f3f-ab65-472d-b139-9a9dca99a11f', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14599, 'a3374f3f-ab8e-4337-b505-ec2c86ef463c', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14600, 'a3374f3f-abba-47ce-9358-3c7499714fd2', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14601, 'a3374f3f-abf3-47e3-9e6c-48c6e2472809', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14602, 'a3374f3f-ac1a-43ac-9425-f30d6c583ae0', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14603, 'a3374f3f-ac3e-4bef-b2eb-fedcbf0b2853', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14604, 'a3374f3f-ac63-4ecf-b603-d5bf7c6bd4f6', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14605, 'a3374f3f-ac95-4c37-b252-a2d0d181beba', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14606, 'a3374f3f-acba-4494-a94a-9eca47937873', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14607, 'a3374f3f-acdd-4d36-9618-3b2c00cbd6c2', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14608, 'a3374f3f-ad02-43e8-8427-ad214dd7f439', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14609, 'a3374f3f-ad32-4965-a299-a79087796816', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14610, 'a3374f3f-ad55-44b5-ba58-f91270c3e155', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14611, 'a3374f3f-ad78-407f-a968-2ff446996033', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14612, 'a3374f3f-ad9c-48c8-a850-950d2f2ed190', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14613, 'a3374f3f-adcb-4b91-85d0-001d739367dc', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14614, 'a3374f3f-adf5-40a2-8943-0b5469c654c3', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14615, 'a3374f3f-ae19-4516-87a6-15c0a46ba6e1', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14616, 'a3374f3f-ae3e-4594-a767-e76d5a2965dc', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14617, 'a3374f3f-ae6f-4812-b9e0-51a803abc392', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14618, 'a3374f3f-ae98-4800-bece-269f15dc07fb', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14619, 'a3374f3f-aec7-44c5-9e8a-5882e8e6fbf2', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14620, 'a3374f3f-aeee-497c-83a6-1e22356ec88a', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14621, 'a3374f3f-af1e-4f39-a3ad-459556d8a25b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14622, 'a3374f3f-af42-47e7-a6c3-2af441932ac0', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14623, 'a3374f3f-af66-4526-b038-6cc09f091039', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14624, 'a3374f3f-af8c-4467-80cd-88898409f9f1', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14625, 'a3374f3f-afbb-4399-a12b-4e63d16b7222', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14626, 'a3374f3f-afde-4898-9471-524b4d9677ea', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14627, 'a3374f3f-b001-4f79-ab98-462aee02e3ca', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14628, 'a3374f3f-b026-4dfc-958b-5ff642cf2b66', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14629, 'a3374f3f-b055-4521-9fb9-e190b365a61b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14630, 'a3374f3f-b078-4396-875d-4e9c18545892', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14631, 'a3374f3f-b09e-4516-b4f5-b59e89736d78', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14632, 'a3374f3f-b0c3-4cb8-b621-d2f0e3f8d9fd', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14633, 'a3374f3f-b0f4-429e-bd64-82e65ad2d3e1', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14634, 'a3374f3f-b116-4507-8a67-cb313ee323c6', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14635, 'a3374f3f-b139-4ed4-b672-55bad91138ca', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14636, 'a3374f3f-b15f-4c7d-a212-e386a3f9f14f', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14637, 'a3374f3f-b191-4030-9585-d948c6663e74', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14638, 'a3374f3f-b1b8-4dcf-9e47-e33e10eb799d', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14639, 'a3374f3f-b1e7-4b3a-a584-2ef430b2d94a', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(14640, 'a3374f3f-b211-479d-b6c1-3cda1d60cb6e', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14641, 'a3374f3f-b246-446a-9e54-b60ed448ffea', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14642, 'a3374f3f-b26d-48c0-950d-92633d80e236', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14643, 'a3374f3f-b295-43dc-933f-1e6b936abdc7', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14644, 'a3374f3f-b2bb-494b-889b-94505afdb993', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14645, 'a3374f3f-b2eb-4470-9570-42ee65c95c4c', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14646, 'a3374f3f-b30f-4d12-a6d5-148cc9792604', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14647, 'a3374f3f-b332-46ce-be44-df9df2ac164f', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14648, 'a3374f3f-b357-4a95-84aa-10ac96d75ea1', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14649, 'a3374f3f-b38a-4d19-806d-b9b87a09204d', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14650, 'a3374f3f-b3ad-4367-9f4c-a7c6ebbfc522', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14651, 'a3374f3f-b3d0-449a-a120-53a2d4e849f5', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14652, 'a3374f3f-b3f7-4ff5-ad84-d88ad0c38184', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14653, 'a3374f3f-b42b-41b5-bc0a-de479452c3cc', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.vendor-frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/vendor-frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14654, 'a3374f3f-b450-4508-a796-eab4927343af', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"className\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14655, 'a3374f3f-b479-4efa-a3ee-d94e49f3136b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14656, 'a3374f3f-b4a8-4322-a0f1-47d8dc60353f', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14657, 'a3374f3f-b4f5-4777-a685-cc7d01759b3b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.frame\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/frame.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14658, 'a3374f3f-b533-493d-89cc-1a4c5cd31484', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.formatted-source\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/formatted-source.blade.php\",\"data\":[\"frame\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14659, 'a3374f3f-b557-48b4-a0c6-035285f67edd', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14660, 'a3374f3f-b57c-4b07-bc27-e73bf841fa88', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.file-with-line\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/file-with-line.blade.php\",\"data\":[\"frame\",\"direction\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14661, 'a3374f3f-b5aa-4e04-9e29-e1226f98f6e3', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-down-up\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-down-up.blade.php\",\"data\":[\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14662, 'a3374f3f-b5c8-4c56-967f-992f112e5061', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-up-down\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-up-down.blade.php\",\"data\":[\"xShow\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14663, 'a3374f3f-b605-487a-9dcb-baab14ad7b0c', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.frame-code\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/frame-code.blade.php\",\"data\":[\"code\",\"highlightedLine\",\"xShow\",\"xCloak\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14664, 'a3374f3f-b629-4564-91d1-788202c1b8f1', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"editor\",\"startingLine\",\"highlightedLine\",\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14665, 'a3374f3f-b669-4588-afca-d1ffc4e2d1f4', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.query\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/query.blade.php\",\"data\":[\"queries\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14666, 'a3374f3f-b6b5-447a-add6-8e60b8983361', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.database\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/database.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14667, 'a3374f3f-b6de-4bc7-9b52-d6c7f51ee73a', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.database\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/database.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14668, 'a3374f3f-b6f9-4a3b-a66a-2fddb9d6bdff', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14669, 'a3374f3f-b71c-4036-aa27-aa723fc9f202', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.database\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/database.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14670, 'a3374f3f-b73a-437b-a927-d236daf67cd6', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14671, 'a3374f3f-b75d-47b9-9b29-58ea0162b5dd', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.database\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/database.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14672, 'a3374f3f-b779-4135-9044-fc8df08a0c14', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.syntax-highlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/syntax-highlight.blade.php\",\"data\":[\"code\",\"language\",\"truncate\",\"class\",\"dataTippyContent\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14673, 'a3374f3f-b7a1-40ce-8e0a-45be3abb4354', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-left\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-left.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14674, 'a3374f3f-b7d2-4899-84dd-bdc0ef85ae47', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevron-left\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevron-left.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14675, 'a3374f3f-b800-4e32-b880-f8d63b146157', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevron-right\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevron-right.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14676, 'a3374f3f-b82b-49a3-b419-49029fa0be9e', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.chevrons-right\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/chevrons-right.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14677, 'a3374f3f-b864-4981-8442-293ad673b1fa', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.section-container\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/section-container.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14678, 'a3374f3f-b890-4ee5-ad8f-bb8dedcc0d67', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.separator\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/separator.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14679, 'a3374f3f-b8bb-4503-83e2-4d7bee60dc2f', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.request-header\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/request-header.blade.php\",\"data\":[\"headers\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14680, 'a3374f3f-b901-494b-9f2f-ee1f128fbc4d', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.request-body\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/request-body.blade.php\",\"data\":[\"body\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14681, 'a3374f3f-b938-4b6c-b897-a8927be6d045', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.empty-state\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/empty-state.blade.php\",\"data\":[\"message\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14682, 'a3374f3f-b969-4ef1-be38-550b1aa94d3e', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.routing\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/routing.blade.php\",\"data\":[\"routing\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14683, 'a3374f3f-b99e-4f39-8a3f-67337ff20509', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.routing-parameter\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/routing-parameter.blade.php\",\"data\":[\"routeParameters\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14684, 'a3374f3f-b9cc-4c07-9724-b921b985703e', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.empty-state\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/empty-state.blade.php\",\"data\":[\"message\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14685, 'a3374f3f-b9ec-457c-9cc8-d88464f10076', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.section-container\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/section-container.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14686, 'a3374f3f-ba0c-4449-833c-17c4e979a91b', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.separator\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/separator.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14687, 'a3374f3f-ba33-4f33-ae98-401bf48660c0', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.laravel-ascii-spotlight\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/laravel-ascii-spotlight.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14688, 'a3374f3f-ba63-4978-b0df-a6d4599c6d61', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.laravel-ascii\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/laravel-ascii.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14689, 'a3374f3f-ba90-4170-83b4-52ce3205deb6', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.icons.laravel-ascii\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/icons\\/laravel-ascii.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14690, 'a3374f3f-baab-4e64-9060-1b5ce3b1a943', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.section-container\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/section-container.blade.php\",\"data\":[\"class\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14691, 'a3374f3f-bad0-4dc7-8fad-d897d15ff74e', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'view', '{\"name\":\"laravel-exceptions-renderer::components.layout\",\"path\":\"\\\\vendor\\\\laravel\\\\framework\\\\src\\\\Illuminate\\\\Foundation\\\\Providers\\/..\\/resources\\/exceptions\\/renderer\\/components\\/layout.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14692, 'a3374f3f-bd52-4266-8d2b-14879ac837f5', 'a3374f3f-beec-434e-9778-4e1e1432a6f6', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/movimiento_cajas\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\MovimientoCajaController@index\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6IkZIU0YxRkE5VEpaMWhOaWJEaDd5aGc9PSIsInZhbHVlIjoiaUhMM0g5SUJIQ3hzVlAvL2lDZXJKRFpRS29SMGxMUVFzOUZ3N0szUmovZlJQTlNZRFJ0a1JDUlJWYjBNOWN1YUphT3ZkTzVDSkdEdENWdGRaUEVkSnYwVVFUcW9OMnlXb1VwK0lVY3BMRG4ySUtHZGRnaGd6S2JWRlZCWDZqTkQiLCJtYWMiOiJkYWI2ZGEzMWRjNjQyMGU1MTRlNDJhYTY0NTlmMmYwNDRkZDYzOGQxY2RkMjRkMTY3MzRiMDdjMzQ3YzJhYjVjIiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6Ii9uWjZpa3JvTFFUdjJwT1FpbnpJTlE9PSIsInZhbHVlIjoiMU9VTitra2FicW45NnJTMmVmVVZCS3lOTHF3SVlIRk8xaUdDd3dIMFp4aU9OYVphMGZ1ZEI0NmFlbkVuaHlQOVJVZ1VBbW5qSEVXOGFYYTIwRkg3WlVuNHozRDZ3QzVhN3dON3kydHE3U2N0RG56eDZTVnBMTWZ2ZWhneStvdm4iLCJtYWMiOiI4M2IwM2EzYWI0YmY2NWU0NDczMjQ0ZGI0YTA0NjdkOWIzMjFlNGJlYzc2Njk4Yzg5NWJmNzVmY2I0NmI1Y2ZkIiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/clientes\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-inertia\":\"true\",\"accept\":\"text\\/html, application\\/xhtml+xml\",\"x-inertia-version\":\"c8bdfce04e03ced50b63f0f87a38dbf0\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6IkZIU0YxRkE5VEpaMWhOaWJEaDd5aGc9PSIsInZhbHVlIjoiaUhMM0g5SUJIQ3hzVlAvL2lDZXJKRFpRS29SMGxMUVFzOUZ3N0szUmovZlJQTlNZRFJ0a1JDUlJWYjBNOWN1YUphT3ZkTzVDSkdEdENWdGRaUEVkSnYwVVFUcW9OMnlXb1VwK0lVY3BMRG4ySUtHZGRnaGd6S2JWRlZCWDZqTkQiLCJtYWMiOiJkYWI2ZGEzMWRjNjQyMGU1MTRlNDJhYTY0NTlmMmYwNDRkZDYzOGQxY2RkMjRkMTY3MzRiMDdjMzQ3YzJhYjVjIiwidGFnIjoiIn0=\"},\"payload\":[],\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:18:01 GMT\",\"content-type\":\"text\\/html; charset=utf-8\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6Ikpwb283M1pUWmVaejZNTE1zd0dSSVE9PSIsInZhbHVlIjoiVzh0c0VwNURwSUdvdm1PakQxTk9zMHRjNFlrZnEvdDdYMStQU1B3TWVHYm1FS1BxK3dHOERENnVobWtSUDJkVjZXT3RuTzFZaGdNTC9KeXRua2Z5dWM5SWgrVDE1cFE3NzhWTmU0VVJBbE1YUEM2TUluUjNnQzlFQTZLRDJSV2wiLCJtYWMiOiI1NWQ4ZjY2MDE3YWZiMGEwZjBkYWQ0OTRiOWEyZTliNDBjZmQ2Yzc4M2ZjYzM0NDczYjVhMTk4ZWQxNTYwNTUzIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:01 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6IkpUMjgzd0dyWUtlU3ZZR0l4VGVoL3c9PSIsInZhbHVlIjoiMkFQUXpuRHltR1pSUGtlSE4wV1c3RWlsRzc3WUF4NXZ5dEZRSzZuOFZuSHhxdFF6S0dXeDdibFhiY3c3QzZVMTR0MVh2bmRrT2hLR0kwZWFVa3Y4ejR3cVpEOE5sQ0t2TFV3dUNGb215YmY2ZU8xNysxVVBSS3YxeE5GL0ZmdEMiLCJtYWMiOiI5OTc1ZDBmMDE2MjdmZmRlM2JhZWJjMWRkYzlkNTE2NWRhNDQ0ZGEwMjcxOWU4YzNkZTk5N2NlMGNiZDU0NTllIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:01 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":500,\"response\":\"HTML Response\",\"duration\":849,\"memory\":36,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:01'),
(14693, 'a3374f73-d366-42a2-a38a-0e80b743c145', 'a3374f73-dfec-4e2a-a756-945755f7a5d4', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.68\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:35'),
(14694, 'a3374f73-d547-4001-816c-367c4840d5d4', 'a3374f73-dfec-4e2a-a756-945755f7a5d4', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:35'),
(14695, 'a3374f73-d762-43d7-8b05-a2b7592db6f4', 'a3374f73-dfec-4e2a-a756-945755f7a5d4', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.48\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:35'),
(14696, 'a3374f73-d818-4740-a8fc-a6b5ffe33a6c', 'a3374f73-dfec-4e2a-a756-945755f7a5d4', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.26\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:35'),
(14697, 'a3374f73-d831-45d7-b2a1-52d4ba3b43af', 'a3374f73-dfec-4e2a-a756-945755f7a5d4', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:35'),
(14698, 'a3374f73-dcdc-4462-b40e-8e2e03a95f10', 'a3374f73-dfec-4e2a-a756-945755f7a5d4', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"permisos_cache_version\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:35'),
(14699, 'a3374f73-dd31-4c5f-804c-835991bc7d26', 'a3374f73-dfec-4e2a-a756-945755f7a5d4', NULL, 1, 'cache', '{\"type\":\"hit\",\"key\":\"permisos_role_v1_1\",\"value\":\"*\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:35'),
(14700, 'a3374f73-df00-4951-acfd-a9f2d3a8f1fa', 'a3374f73-dfec-4e2a-a756-945755f7a5d4', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/productos\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\ProductoController@index\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6Ikpwb283M1pUWmVaejZNTE1zd0dSSVE9PSIsInZhbHVlIjoiVzh0c0VwNURwSUdvdm1PakQxTk9zMHRjNFlrZnEvdDdYMStQU1B3TWVHYm1FS1BxK3dHOERENnVobWtSUDJkVjZXT3RuTzFZaGdNTC9KeXRua2Z5dWM5SWgrVDE1cFE3NzhWTmU0VVJBbE1YUEM2TUluUjNnQzlFQTZLRDJSV2wiLCJtYWMiOiI1NWQ4ZjY2MDE3YWZiMGEwZjBkYWQ0OTRiOWEyZTliNDBjZmQ2Yzc4M2ZjYzM0NDczYjVhMTk4ZWQxNTYwNTUzIiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6IkpUMjgzd0dyWUtlU3ZZR0l4VGVoL3c9PSIsInZhbHVlIjoiMkFQUXpuRHltR1pSUGtlSE4wV1c3RWlsRzc3WUF4NXZ5dEZRSzZuOFZuSHhxdFF6S0dXeDdibFhiY3c3QzZVMTR0MVh2bmRrT2hLR0kwZWFVa3Y4ejR3cVpEOE5sQ0t2TFV3dUNGb215YmY2ZU8xNysxVVBSS3YxeE5GL0ZmdEMiLCJtYWMiOiI5OTc1ZDBmMDE2MjdmZmRlM2JhZWJjMWRkYzlkNTE2NWRhNDQ0ZGEwMjcxOWU4YzNkZTk5N2NlMGNiZDU0NTllIiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/clientes\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-inertia\":\"true\",\"accept\":\"text\\/html, application\\/xhtml+xml\",\"x-inertia-version\":\"c8bdfce04e03ced50b63f0f87a38dbf0\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6Ikpwb283M1pUWmVaejZNTE1zd0dSSVE9PSIsInZhbHVlIjoiVzh0c0VwNURwSUdvdm1PakQxTk9zMHRjNFlrZnEvdDdYMStQU1B3TWVHYm1FS1BxK3dHOERENnVobWtSUDJkVjZXT3RuTzFZaGdNTC9KeXRua2Z5dWM5SWgrVDE1cFE3NzhWTmU0VVJBbE1YUEM2TUluUjNnQzlFQTZLRDJSV2wiLCJtYWMiOiI1NWQ4ZjY2MDE3YWZiMGEwZjBkYWQ0OTRiOWEyZTliNDBjZmQ2Yzc4M2ZjYzM0NDczYjVhMTk4ZWQxNTYwNTUzIiwidGFnIjoiIn0=\"},\"payload\":[],\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"x-inertia\":\"true\",\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:18:35 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6InZUYjRmWjhNd3BLR0lENGdCTHdXOUE9PSIsInZhbHVlIjoiek1DcmFTYnFCNWdwa2JERFJuRGJMR0tydlA1NWVLRTdEUUlWVC9HZjA5UXdCNjB6NnRjblZQWXNJZFBmRDRGK2FjL2ZpVG45TkF4RGJIQlpWZjFtU0l5cW9QTk9vYjYyaW53TkliZnEycWYyTTBLRVFUTGRDR1EwNEpBMTNNdlkiLCJtYWMiOiIzYTQyYTFlNWI0Yjk0YzIzNWFjMjdjZDk3YTdlNGM5YThmYzNkZDRlZWIwYzFiZTA2OGNkNTk1MDg1NTZjZDgwIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:35 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6Ik83MVhySUhZRkFCUGFkakk3YVh6U3c9PSIsInZhbHVlIjoid0xoSVBTMFB4c2x5MjJCZTdUZjJWc1RCaWlDaTR5bXhVc1RybTlXclBKSzc0Ti8xSmRLR1Y0M05YUHdIVW9yQXZqelFzOHNzWk9rY3VaZFM5V25xR3RHclNpTC9LK1YvNTJRSXhnL2NrMm8rZjhmeEtaSmx3WXUySG1JNzBVWnkiLCJtYWMiOiI4MTRlYjU0MjVmYjk4N2Y4ZTM3ZTEwMmQyY2ExNDVhNTBmMmMzYzgxZjRkYjYwZjMxY2EwNmU4YTZhNDJkNDJmIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:35 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"component\":\"Admin\\/Productos\\/Index\",\"props\":{\"errors\":[],\"auth\":{\"user\":{\"id\":1,\"usuario\":\"admin\",\"codigo\":\"admin\",\"nombre\":\"admin\",\"paterno\":\"admin\",\"materno\":\"\",\"ci\":\"0\",\"ci_exp\":\"\",\"fono\":null,\"correo\":\"\",\"foto\":null,\"tipo\":\"ADMINISTRACI\\u00d3N\",\"role_id\":1,\"sucursal_todos\":1,\"fecha_registro\":\"2026-11-10\",\"acceso\":1,\"status\":1,\"created_at\":\"2026-11-10T15:14:24.000000Z\",\"updated_at\":\"2026-11-10T15:14:24.000000Z\",\"url_foto\":\"http:\\/\\/imparablev2.test\\/imgs\\/users\\/default.png\",\"full_name\":\"admin admin\",\"full_ci\":\"0 \",\"fecha_registro_t\":\"10\\/11\\/2026\",\"usuario_abrev\":\"admin\",\"permisos\":\"*\",\"user_sucursals\":[],\"role\":{\"id\":1,\"nombre\":\"SUPER USUARIO\",\"permisos\":1,\"usuarios\":0,\"status\":1,\"created_at\":\"2026-11-10T15:14:24.000000Z\",\"updated_at\":\"2026-11-10T15:14:24.000000Z\"}}},\"flash\":{\"bien\":null,\"error\":null},\"url_app\":\"http:\\/\\/imparablev2.test\",\"url_blank\":null},\"url\":\"\\/admin\\/productos\",\"version\":\"c8bdfce04e03ced50b63f0f87a38dbf0\",\"clearHistory\":false,\"encryptHistory\":false},\"duration\":243,\"memory\":30,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:35'),
(14701, 'a3374f74-2b6e-44ac-ac77-ee57d7d16b62', 'a3374f74-33b0-4f6f-bb13-46be838014e5', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.69\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:35'),
(14702, 'a3374f74-2cb1-4d74-b3b8-ec38ea782a30', 'a3374f74-33b0-4f6f-bb13-46be838014e5', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:35'),
(14703, 'a3374f74-2e24-4258-8db3-bbd938f63f82', 'a3374f74-33b0-4f6f-bb13-46be838014e5', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.38\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:35'),
(14704, 'a3374f74-2eae-4c5f-8fa3-10c934ecf414', 'a3374f74-33b0-4f6f-bb13-46be838014e5', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.22\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:35'),
(14705, 'a3374f74-2ec5-4e44-a86e-7257b225063d', 'a3374f74-33b0-4f6f-bb13-46be838014e5', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:35'),
(14706, 'a3374f74-311d-423a-8142-aea002b2c69c', 'a3374f74-33b0-4f6f-bb13-46be838014e5', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `productos`\",\"time\":\"0.46\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Services\\\\ProductoService.php\",\"line\":92,\"hash\":\"c986667351a4266708c77fc241ee3dd9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:35'),
(14707, 'a3374f74-3311-4315-be1a-a4f943a4f21d', 'a3374f74-33b0-4f6f-bb13-46be838014e5', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/productos\\/paginado?currentPage=1&orderAsc=desc&orderBy=id&page=1&perPage=5&search=\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\ProductoController@paginado\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6InZUYjRmWjhNd3BLR0lENGdCTHdXOUE9PSIsInZhbHVlIjoiek1DcmFTYnFCNWdwa2JERFJuRGJMR0tydlA1NWVLRTdEUUlWVC9HZjA5UXdCNjB6NnRjblZQWXNJZFBmRDRGK2FjL2ZpVG45TkF4RGJIQlpWZjFtU0l5cW9QTk9vYjYyaW53TkliZnEycWYyTTBLRVFUTGRDR1EwNEpBMTNNdlkiLCJtYWMiOiIzYTQyYTFlNWI0Yjk0YzIzNWFjMjdjZDk3YTdlNGM5YThmYzNkZDRlZWIwYzFiZTA2OGNkNTk1MDg1NTZjZDgwIiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6Ik83MVhySUhZRkFCUGFkakk3YVh6U3c9PSIsInZhbHVlIjoid0xoSVBTMFB4c2x5MjJCZTdUZjJWc1RCaWlDaTR5bXhVc1RybTlXclBKSzc0Ti8xSmRLR1Y0M05YUHdIVW9yQXZqelFzOHNzWk9rY3VaZFM5V25xR3RHclNpTC9LK1YvNTJRSXhnL2NrMm8rZjhmeEtaSmx3WXUySG1JNzBVWnkiLCJtYWMiOiI4MTRlYjU0MjVmYjk4N2Y4ZTM3ZTEwMmQyY2ExNDVhNTBmMmMzYzgxZjRkYjYwZjMxY2EwNmU4YTZhNDJkNDJmIiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/productos\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6InZUYjRmWjhNd3BLR0lENGdCTHdXOUE9PSIsInZhbHVlIjoiek1DcmFTYnFCNWdwa2JERFJuRGJMR0tydlA1NWVLRTdEUUlWVC9HZjA5UXdCNjB6NnRjblZQWXNJZFBmRDRGK2FjL2ZpVG45TkF4RGJIQlpWZjFtU0l5cW9QTk9vYjYyaW53TkliZnEycWYyTTBLRVFUTGRDR1EwNEpBMTNNdlkiLCJtYWMiOiIzYTQyYTFlNWI0Yjk0YzIzNWFjMjdjZDk3YTdlNGM5YThmYzNkZDRlZWIwYzFiZTA2OGNkNTk1MDg1NTZjZDgwIiwidGFnIjoiIn0=\"},\"payload\":{\"page\":\"1\",\"currentPage\":\"1\",\"perPage\":\"5\",\"search\":null,\"orderBy\":\"id\",\"orderAsc\":\"desc\"},\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:18:35 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6ImloYmplV3FhMlBUbTJKcGRocCtCb3c9PSIsInZhbHVlIjoiOHEvVHlzSDk3bGN3ZWtUYllCQU1UMnZRVGF3WFAwZEpNSHlvNVVTMXF1aTd2KzZFV0lyRzUwbENIeUVqcTJHU3BTWFJuMnA3YWtkVjRhbks2Mk1UckxwN24xSnhOMFBwOCszTi91Snkrdjgyb2ZlTkpiTVBCa1FLNWlwOWZqR1QiLCJtYWMiOiJhZDBlNTM0Zjg4YzU5YmU3MWEyMDIyMjA3YzFkNzlhZjA3ODhmNjAyYzYwMDYyOTI4ZWZjMzBiMmE0Y2RmOTE4IiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:35 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6Im4vTXV1RkhxUjFuZm9uSjZQV1ZJR2c9PSIsInZhbHVlIjoiM2lMU1hEKzRKL0hQTFBIK3VYNVRCV1ZrZWZOTGtPakVHQThNYmUxNCtUT3I5S3VoSVN6WjhyUHRZY3oxdk5vamdjcmt5OTQwSGxydXlWYVhTR0szdFZSeTZCbXEzVys5Tmg5bEtSRDJKOFZhYWMwdURDT0gyZ2xMMVo4eWZ0ZC8iLCJtYWMiOiJjYTAxZDVmOGY3NjgxNGJmYmFjMThiNjA4OTUxZWU4ODRiMDZmZThiNDQyYWZhYTNiZTQyMGVjMzlmNDRiM2IzIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:35 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"data\":[],\"total\":0,\"lastPage\":1},\"duration\":176,\"memory\":28,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:35'),
(14708, 'a3374f76-e8e6-47f6-9512-c72450f60c6f', 'a3374f76-fa92-4a8d-b995-735cb4161521', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.36\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:37'),
(14709, 'a3374f76-ea53-4dda-bfce-06db5ec6f6bc', 'a3374f76-fa92-4a8d-b995-735cb4161521', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:37'),
(14710, 'a3374f76-ec12-4595-ab2f-c5e266a704ab', 'a3374f76-fa92-4a8d-b995-735cb4161521', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:37'),
(14711, 'a3374f76-ecb9-476f-9a68-279c55e11fc8', 'a3374f76-fa92-4a8d-b995-735cb4161521', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.25\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:37'),
(14712, 'a3374f76-ecd3-4aad-944c-46547af0fcc7', 'a3374f76-fa92-4a8d-b995-735cb4161521', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:37'),
(14713, 'a3374f76-f7f4-4b34-834b-64ba5be5dc64', 'a3374f76-fa92-4a8d-b995-735cb4161521', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"permisos_cache_version\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:37'),
(14714, 'a3374f76-f83c-4ea2-ba7f-088ad6eb88d6', 'a3374f76-fa92-4a8d-b995-735cb4161521', NULL, 1, 'cache', '{\"type\":\"hit\",\"key\":\"permisos_role_v1_1\",\"value\":\"*\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:37');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(14715, 'a3374f76-f9df-45c6-b6da-4e0adc144458', 'a3374f76-fa92-4a8d-b995-735cb4161521', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/categorias\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\CategoriaController@index\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6ImloYmplV3FhMlBUbTJKcGRocCtCb3c9PSIsInZhbHVlIjoiOHEvVHlzSDk3bGN3ZWtUYllCQU1UMnZRVGF3WFAwZEpNSHlvNVVTMXF1aTd2KzZFV0lyRzUwbENIeUVqcTJHU3BTWFJuMnA3YWtkVjRhbks2Mk1UckxwN24xSnhOMFBwOCszTi91Snkrdjgyb2ZlTkpiTVBCa1FLNWlwOWZqR1QiLCJtYWMiOiJhZDBlNTM0Zjg4YzU5YmU3MWEyMDIyMjA3YzFkNzlhZjA3ODhmNjAyYzYwMDYyOTI4ZWZjMzBiMmE0Y2RmOTE4IiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6Im4vTXV1RkhxUjFuZm9uSjZQV1ZJR2c9PSIsInZhbHVlIjoiM2lMU1hEKzRKL0hQTFBIK3VYNVRCV1ZrZWZOTGtPakVHQThNYmUxNCtUT3I5S3VoSVN6WjhyUHRZY3oxdk5vamdjcmt5OTQwSGxydXlWYVhTR0szdFZSeTZCbXEzVys5Tmg5bEtSRDJKOFZhYWMwdURDT0gyZ2xMMVo4eWZ0ZC8iLCJtYWMiOiJjYTAxZDVmOGY3NjgxNGJmYmFjMThiNjA4OTUxZWU4ODRiMDZmZThiNDQyYWZhYTNiZTQyMGVjMzlmNDRiM2IzIiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/productos\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-inertia\":\"true\",\"accept\":\"text\\/html, application\\/xhtml+xml\",\"x-inertia-version\":\"c8bdfce04e03ced50b63f0f87a38dbf0\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6ImloYmplV3FhMlBUbTJKcGRocCtCb3c9PSIsInZhbHVlIjoiOHEvVHlzSDk3bGN3ZWtUYllCQU1UMnZRVGF3WFAwZEpNSHlvNVVTMXF1aTd2KzZFV0lyRzUwbENIeUVqcTJHU3BTWFJuMnA3YWtkVjRhbks2Mk1UckxwN24xSnhOMFBwOCszTi91Snkrdjgyb2ZlTkpiTVBCa1FLNWlwOWZqR1QiLCJtYWMiOiJhZDBlNTM0Zjg4YzU5YmU3MWEyMDIyMjA3YzFkNzlhZjA3ODhmNjAyYzYwMDYyOTI4ZWZjMzBiMmE0Y2RmOTE4IiwidGFnIjoiIn0=\"},\"payload\":[],\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"x-inertia\":\"true\",\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:18:37 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6IkJGTUJlOVZSUXRaWWg5L2hrajlwa1E9PSIsInZhbHVlIjoiVXZUUytKSXVSYnNxQUptNjRaZDcwVWNtNEdhYTB3N3lLQmNOL0R4dUxxc3VWRGdnR3dTNWRvR21WN3FuQSt1NWgxcEdjcDJFR1N3Vk9WajBZWm5ERzFGK1FKUWRuZ1c3SlRsRmxUcVViempnM2xLbCtTYlJLeWRSMGNGMVlCTU4iLCJtYWMiOiJkMjQyNjFhOTdmM2E3YjRhOGFhYTY0NWY0ZDUyYjYxOTQ1MmY1OGNhMGZjMzQ2MDljNGE5ZDU2YTAyNDc5MjY4IiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:37 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6IlJFSlgvQWpDc2M2a1o4amswWUZDa0E9PSIsInZhbHVlIjoiUFdDYlhFWWllWk4vK3orUHMxRlAyVmR5c25FWW0rNXlPUkNDbUlTeGx6cDN3MWVMZEVvajF2SWdRcm9TTWg1MWFPMHpYUkxFclNUWTk1NUluVEIxMzJIckp4bGk1bytjcXVoZEczWmFvUHJGZVhpWHFScGdzaEQybUtJT0dIeG0iLCJtYWMiOiI3ZDNkY2Y1ZmJmZjgwZTkwZTQyNjU2MTc4M2ZmNzNlY2E0YWNlNGQyZDMzNjRlYWMwMGM3M2E0Mjg3MzNiYjA1IiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:37 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"component\":\"Admin\\/Categorias\\/Index\",\"props\":{\"errors\":[],\"auth\":{\"user\":{\"id\":1,\"usuario\":\"admin\",\"codigo\":\"admin\",\"nombre\":\"admin\",\"paterno\":\"admin\",\"materno\":\"\",\"ci\":\"0\",\"ci_exp\":\"\",\"fono\":null,\"correo\":\"\",\"foto\":null,\"tipo\":\"ADMINISTRACI\\u00d3N\",\"role_id\":1,\"sucursal_todos\":1,\"fecha_registro\":\"2026-11-10\",\"acceso\":1,\"status\":1,\"created_at\":\"2026-11-10T15:14:24.000000Z\",\"updated_at\":\"2026-11-10T15:14:24.000000Z\",\"url_foto\":\"http:\\/\\/imparablev2.test\\/imgs\\/users\\/default.png\",\"full_name\":\"admin admin\",\"full_ci\":\"0 \",\"fecha_registro_t\":\"10\\/11\\/2026\",\"usuario_abrev\":\"admin\",\"permisos\":\"*\",\"user_sucursals\":[],\"role\":{\"id\":1,\"nombre\":\"SUPER USUARIO\",\"permisos\":1,\"usuarios\":0,\"status\":1,\"created_at\":\"2026-11-10T15:14:24.000000Z\",\"updated_at\":\"2026-11-10T15:14:24.000000Z\"}}},\"flash\":{\"bien\":null,\"error\":null},\"url_app\":\"http:\\/\\/imparablev2.test\",\"url_blank\":null},\"url\":\"\\/admin\\/categorias\",\"version\":\"c8bdfce04e03ced50b63f0f87a38dbf0\",\"clearHistory\":false,\"encryptHistory\":false},\"duration\":198,\"memory\":28,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:37'),
(14716, 'a3374f77-3ee2-4d32-8a5b-fc662840a846', 'a3374f77-47f3-4b02-a8b5-a029e27faaff', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.52\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:37'),
(14717, 'a3374f77-4009-436a-af38-df8aa20483fb', 'a3374f77-47f3-4b02-a8b5-a029e27faaff', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:37'),
(14718, 'a3374f77-41a6-4074-8f91-3431882e7258', 'a3374f77-47f3-4b02-a8b5-a029e27faaff', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.36\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:37'),
(14719, 'a3374f77-4226-4ca8-a1ac-a8dce7a087e4', 'a3374f77-47f3-4b02-a8b5-a029e27faaff', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.21\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:37'),
(14720, 'a3374f77-423c-4a56-b776-1295c859df11', 'a3374f77-47f3-4b02-a8b5-a029e27faaff', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:37'),
(14721, 'a3374f77-44ef-4655-bd73-77a9619002c7', 'a3374f77-47f3-4b02-a8b5-a029e27faaff', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `categorias`\",\"time\":\"1.16\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Services\\\\CategoriaService.php\",\"line\":72,\"hash\":\"183bc8f66bc1f5b3cb81665d7f9dc3c4\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:37'),
(14722, 'a3374f77-4535-4f5c-9994-ccb056c9ee30', 'a3374f77-47f3-4b02-a8b5-a029e27faaff', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select `categorias`.* from `categorias` order by `id` desc limit 5 offset 0\",\"time\":\"0.21\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Services\\\\CategoriaService.php\",\"line\":72,\"hash\":\"61d790d08bc7e613aad37a7499d6fd68\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:37'),
(14723, 'a3374f77-454d-427f-8d5c-861a96357a1c', 'a3374f77-47f3-4b02-a8b5-a029e27faaff', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Categoria\",\"count\":2,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:37'),
(14724, 'a3374f77-4767-40c8-9e1c-5427a06979a1', 'a3374f77-47f3-4b02-a8b5-a029e27faaff', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/categorias\\/paginado?currentPage=1&orderAsc=desc&orderBy=id&page=1&perPage=5&search=\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\CategoriaController@paginado\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6IkJGTUJlOVZSUXRaWWg5L2hrajlwa1E9PSIsInZhbHVlIjoiVXZUUytKSXVSYnNxQUptNjRaZDcwVWNtNEdhYTB3N3lLQmNOL0R4dUxxc3VWRGdnR3dTNWRvR21WN3FuQSt1NWgxcEdjcDJFR1N3Vk9WajBZWm5ERzFGK1FKUWRuZ1c3SlRsRmxUcVViempnM2xLbCtTYlJLeWRSMGNGMVlCTU4iLCJtYWMiOiJkMjQyNjFhOTdmM2E3YjRhOGFhYTY0NWY0ZDUyYjYxOTQ1MmY1OGNhMGZjMzQ2MDljNGE5ZDU2YTAyNDc5MjY4IiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6IlJFSlgvQWpDc2M2a1o4amswWUZDa0E9PSIsInZhbHVlIjoiUFdDYlhFWWllWk4vK3orUHMxRlAyVmR5c25FWW0rNXlPUkNDbUlTeGx6cDN3MWVMZEVvajF2SWdRcm9TTWg1MWFPMHpYUkxFclNUWTk1NUluVEIxMzJIckp4bGk1bytjcXVoZEczWmFvUHJGZVhpWHFScGdzaEQybUtJT0dIeG0iLCJtYWMiOiI3ZDNkY2Y1ZmJmZjgwZTkwZTQyNjU2MTc4M2ZmNzNlY2E0YWNlNGQyZDMzNjRlYWMwMGM3M2E0Mjg3MzNiYjA1IiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/categorias\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6IkJGTUJlOVZSUXRaWWg5L2hrajlwa1E9PSIsInZhbHVlIjoiVXZUUytKSXVSYnNxQUptNjRaZDcwVWNtNEdhYTB3N3lLQmNOL0R4dUxxc3VWRGdnR3dTNWRvR21WN3FuQSt1NWgxcEdjcDJFR1N3Vk9WajBZWm5ERzFGK1FKUWRuZ1c3SlRsRmxUcVViempnM2xLbCtTYlJLeWRSMGNGMVlCTU4iLCJtYWMiOiJkMjQyNjFhOTdmM2E3YjRhOGFhYTY0NWY0ZDUyYjYxOTQ1MmY1OGNhMGZjMzQ2MDljNGE5ZDU2YTAyNDc5MjY4IiwidGFnIjoiIn0=\"},\"payload\":{\"page\":\"1\",\"currentPage\":\"1\",\"perPage\":\"5\",\"search\":null,\"orderBy\":\"id\",\"orderAsc\":\"desc\"},\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:18:37 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6ImdqNEJSWVlETno4RHZPWDR1R2twdWc9PSIsInZhbHVlIjoiaDdQU25laWk4MHBLMlIrbnl0MmNFYmQxTnFLMWtQT3VWbDhoRUFtMUUxa0l5TGtPUlQ1VTZwSjlDUmkxWk54N21WMUU4KzZtcyt4RmNnYUJ4bnZ2Zjh6OGR0ZWZZV1BmNUxtN1EvUlZyUkx6aFp3U2tPUFdyN1hxdWkvVmtDZXkiLCJtYWMiOiIxOWE1OTM5OGU0NDM2YzMxY2NhMDE3NTUzMTE4NTgyMWUzYjAyYTg2ZjJiZjZmYjhkZDUwOTA5ZDAyMjlhYTYxIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:37 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6IlBjUFU3MHppZTVtOXMwRVVlY2Iyd1E9PSIsInZhbHVlIjoiNTVYZjNVYVR5amtQMGN4eVpEMnkrTUJlYjA5WWhzUEVicEs3STJmbEtLaHR1ZWpUbWJ6MkVnUkdEcjNYY3U3OWgzcnBBRU5iTmNnYWp4OE4waDNndCtuS0lsSE5DZWk2Ry9WbGpOcWFNMTA0OVZQS2FScy82UmVWOE9PSkgwcngiLCJtYWMiOiJjNDkyMzVhOTFlYjYyYTU1ZjhjYzNhZjczZTExNjQ1NzNhNzQwNWM2YmFiNTZkM2EwYjYxOGFhZTQ0NGU1NGY2IiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:37 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"data\":[{\"id\":2,\"nombre\":\"CATEGORIA 2\",\"created_at\":\"2026-11-11T23:06:01.000000Z\",\"updated_at\":\"2026-11-11T23:06:01.000000Z\"},{\"id\":1,\"nombre\":\"CATEGORIA 1\",\"created_at\":\"2026-11-11T23:05:56.000000Z\",\"updated_at\":\"2026-11-11T23:05:56.000000Z\"}],\"total\":2,\"lastPage\":1},\"duration\":172,\"memory\":28,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:37'),
(14725, 'a3374f78-1b2e-4f65-84b9-b4781e8fd374', 'a3374f78-24ad-4202-ae99-23927cf60d4c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.38\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:38'),
(14726, 'a3374f78-1c7e-4bca-9acb-0e81dde53ea2', 'a3374f78-24ad-4202-ae99-23927cf60d4c', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:38'),
(14727, 'a3374f78-1e33-4f58-8382-a48b1c92c6d6', 'a3374f78-24ad-4202-ae99-23927cf60d4c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.46\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14728, 'a3374f78-1ee4-453e-b2e2-0a636067674c', 'a3374f78-24ad-4202-ae99-23927cf60d4c', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.21\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14729, 'a3374f78-1ef9-499b-8ab3-e56085bb4dd8', 'a3374f78-24ad-4202-ae99-23927cf60d4c', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14730, 'a3374f78-228d-4bf8-a563-5ff43b1002ef', 'a3374f78-24ad-4202-ae99-23927cf60d4c', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"permisos_cache_version\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14731, 'a3374f78-22cc-49d5-a1a4-92f144c3f095', 'a3374f78-24ad-4202-ae99-23927cf60d4c', NULL, 1, 'cache', '{\"type\":\"hit\",\"key\":\"permisos_role_v1_1\",\"value\":\"*\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14732, 'a3374f78-2416-4feb-864a-edc8c81cb436', 'a3374f78-24ad-4202-ae99-23927cf60d4c', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/productos\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\ProductoController@index\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6ImdqNEJSWVlETno4RHZPWDR1R2twdWc9PSIsInZhbHVlIjoiaDdQU25laWk4MHBLMlIrbnl0MmNFYmQxTnFLMWtQT3VWbDhoRUFtMUUxa0l5TGtPUlQ1VTZwSjlDUmkxWk54N21WMUU4KzZtcyt4RmNnYUJ4bnZ2Zjh6OGR0ZWZZV1BmNUxtN1EvUlZyUkx6aFp3U2tPUFdyN1hxdWkvVmtDZXkiLCJtYWMiOiIxOWE1OTM5OGU0NDM2YzMxY2NhMDE3NTUzMTE4NTgyMWUzYjAyYTg2ZjJiZjZmYjhkZDUwOTA5ZDAyMjlhYTYxIiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6IlBjUFU3MHppZTVtOXMwRVVlY2Iyd1E9PSIsInZhbHVlIjoiNTVYZjNVYVR5amtQMGN4eVpEMnkrTUJlYjA5WWhzUEVicEs3STJmbEtLaHR1ZWpUbWJ6MkVnUkdEcjNYY3U3OWgzcnBBRU5iTmNnYWp4OE4waDNndCtuS0lsSE5DZWk2Ry9WbGpOcWFNMTA0OVZQS2FScy82UmVWOE9PSkgwcngiLCJtYWMiOiJjNDkyMzVhOTFlYjYyYTU1ZjhjYzNhZjczZTExNjQ1NzNhNzQwNWM2YmFiNTZkM2EwYjYxOGFhZTQ0NGU1NGY2IiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/categorias\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-inertia\":\"true\",\"accept\":\"text\\/html, application\\/xhtml+xml\",\"x-inertia-version\":\"c8bdfce04e03ced50b63f0f87a38dbf0\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6ImdqNEJSWVlETno4RHZPWDR1R2twdWc9PSIsInZhbHVlIjoiaDdQU25laWk4MHBLMlIrbnl0MmNFYmQxTnFLMWtQT3VWbDhoRUFtMUUxa0l5TGtPUlQ1VTZwSjlDUmkxWk54N21WMUU4KzZtcyt4RmNnYUJ4bnZ2Zjh6OGR0ZWZZV1BmNUxtN1EvUlZyUkx6aFp3U2tPUFdyN1hxdWkvVmtDZXkiLCJtYWMiOiIxOWE1OTM5OGU0NDM2YzMxY2NhMDE3NTUzMTE4NTgyMWUzYjAyYTg2ZjJiZjZmYjhkZDUwOTA5ZDAyMjlhYTYxIiwidGFnIjoiIn0=\"},\"payload\":[],\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"x-inertia\":\"true\",\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:18:38 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6InNLZ3l3ZDAxZXRYb2lvUVhEUkZsdnc9PSIsInZhbHVlIjoib09HYnBVMmhEN1VkaU5Dd2FoOEZBVHVDUVFIdEtwUGV4SDNmRG9aaStOTUFVMjJEWEt1dmEwVUE5Z0FDVHpDYnNjMjJGcFUzL282NWJrb3U4eWdUeHNuQThSRnU5U2YyNGwzOGJCeGhRZFBXREp4VGd4UnR4OEd1TENHcVZuL00iLCJtYWMiOiIzZmI1ODMyMjE4MTVjZDhjYmMzMDM0N2YxYTlhNjQ1ZmRjMTMzOGVlZjRhMTE4YTI1OTJkN2U5MDUwYzMzZmFhIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:38 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6ImdETTNTM1kvVGZscExmZzhsV1ZqRUE9PSIsInZhbHVlIjoib2FXaEgzd3Qydmx6NzVzeEZZWHd6cUY5QWQ0YnhwSU9BQmIwZWdZdFowMXBjclJzc0lyVXVrNGlDcFNIN3F6WkRaYnBOUFUzb1lwM1ZVbnpGNlJHc01BaVQwNVA4MURNQUVlQjcrWHR3QlBsdlNYQlVyMnBuTFNCRC9qR3c5TFUiLCJtYWMiOiJhZmRjZTJhYzc0MDE2OTk0NjVmMzAwYjJmNjk2ZTRmYWE0ZWRmNWJjNDljMDQwM2ExNmE3MWM0ZWZjMWQ5NmUwIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:38 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"component\":\"Admin\\/Productos\\/Index\",\"props\":{\"errors\":[],\"auth\":{\"user\":{\"id\":1,\"usuario\":\"admin\",\"codigo\":\"admin\",\"nombre\":\"admin\",\"paterno\":\"admin\",\"materno\":\"\",\"ci\":\"0\",\"ci_exp\":\"\",\"fono\":null,\"correo\":\"\",\"foto\":null,\"tipo\":\"ADMINISTRACI\\u00d3N\",\"role_id\":1,\"sucursal_todos\":1,\"fecha_registro\":\"2026-11-10\",\"acceso\":1,\"status\":1,\"created_at\":\"2026-11-10T15:14:24.000000Z\",\"updated_at\":\"2026-11-10T15:14:24.000000Z\",\"url_foto\":\"http:\\/\\/imparablev2.test\\/imgs\\/users\\/default.png\",\"full_name\":\"admin admin\",\"full_ci\":\"0 \",\"fecha_registro_t\":\"10\\/11\\/2026\",\"usuario_abrev\":\"admin\",\"permisos\":\"*\",\"user_sucursals\":[],\"role\":{\"id\":1,\"nombre\":\"SUPER USUARIO\",\"permisos\":1,\"usuarios\":0,\"status\":1,\"created_at\":\"2026-11-10T15:14:24.000000Z\",\"updated_at\":\"2026-11-10T15:14:24.000000Z\"}}},\"flash\":{\"bien\":null,\"error\":null},\"url_app\":\"http:\\/\\/imparablev2.test\",\"url_blank\":null},\"url\":\"\\/admin\\/productos\",\"version\":\"c8bdfce04e03ced50b63f0f87a38dbf0\",\"clearHistory\":false,\"encryptHistory\":false},\"duration\":170,\"memory\":28,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14733, 'a3374f78-6832-4d62-9a6a-9340b5d737a2', 'a3374f78-705e-43d7-83ae-707a38b7ad96', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.15\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:38'),
(14734, 'a3374f78-6981-4d13-953c-2ca0a01e19d6', 'a3374f78-705e-43d7-83ae-707a38b7ad96', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:38'),
(14735, 'a3374f78-6ae6-44a5-9e81-4f8a632340ed', 'a3374f78-705e-43d7-83ae-707a38b7ad96', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.37\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14736, 'a3374f78-6b71-4f80-8baa-f6e4863d5f68', 'a3374f78-705e-43d7-83ae-707a38b7ad96', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.22\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14737, 'a3374f78-6b89-4a98-b3c4-0a0a1b20192c', 'a3374f78-705e-43d7-83ae-707a38b7ad96', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14738, 'a3374f78-6db5-47cd-9308-91a9c144eef6', 'a3374f78-705e-43d7-83ae-707a38b7ad96', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `productos`\",\"time\":\"0.28\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Services\\\\ProductoService.php\",\"line\":92,\"hash\":\"c986667351a4266708c77fc241ee3dd9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14739, 'a3374f78-6fc2-4f30-95fc-60478a3a9f18', 'a3374f78-705e-43d7-83ae-707a38b7ad96', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/productos\\/paginado?currentPage=1&orderAsc=desc&orderBy=id&page=1&perPage=5&search=\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\ProductoController@paginado\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6InNLZ3l3ZDAxZXRYb2lvUVhEUkZsdnc9PSIsInZhbHVlIjoib09HYnBVMmhEN1VkaU5Dd2FoOEZBVHVDUVFIdEtwUGV4SDNmRG9aaStOTUFVMjJEWEt1dmEwVUE5Z0FDVHpDYnNjMjJGcFUzL282NWJrb3U4eWdUeHNuQThSRnU5U2YyNGwzOGJCeGhRZFBXREp4VGd4UnR4OEd1TENHcVZuL00iLCJtYWMiOiIzZmI1ODMyMjE4MTVjZDhjYmMzMDM0N2YxYTlhNjQ1ZmRjMTMzOGVlZjRhMTE4YTI1OTJkN2U5MDUwYzMzZmFhIiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6ImdETTNTM1kvVGZscExmZzhsV1ZqRUE9PSIsInZhbHVlIjoib2FXaEgzd3Qydmx6NzVzeEZZWHd6cUY5QWQ0YnhwSU9BQmIwZWdZdFowMXBjclJzc0lyVXVrNGlDcFNIN3F6WkRaYnBOUFUzb1lwM1ZVbnpGNlJHc01BaVQwNVA4MURNQUVlQjcrWHR3QlBsdlNYQlVyMnBuTFNCRC9qR3c5TFUiLCJtYWMiOiJhZmRjZTJhYzc0MDE2OTk0NjVmMzAwYjJmNjk2ZTRmYWE0ZWRmNWJjNDljMDQwM2ExNmE3MWM0ZWZjMWQ5NmUwIiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/productos\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6InNLZ3l3ZDAxZXRYb2lvUVhEUkZsdnc9PSIsInZhbHVlIjoib09HYnBVMmhEN1VkaU5Dd2FoOEZBVHVDUVFIdEtwUGV4SDNmRG9aaStOTUFVMjJEWEt1dmEwVUE5Z0FDVHpDYnNjMjJGcFUzL282NWJrb3U4eWdUeHNuQThSRnU5U2YyNGwzOGJCeGhRZFBXREp4VGd4UnR4OEd1TENHcVZuL00iLCJtYWMiOiIzZmI1ODMyMjE4MTVjZDhjYmMzMDM0N2YxYTlhNjQ1ZmRjMTMzOGVlZjRhMTE4YTI1OTJkN2U5MDUwYzMzZmFhIiwidGFnIjoiIn0=\"},\"payload\":{\"page\":\"1\",\"currentPage\":\"1\",\"perPage\":\"5\",\"search\":null,\"orderBy\":\"id\",\"orderAsc\":\"desc\"},\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:18:38 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6Ijk1NGwyMFRJUHJQaTkrQ3RIRHlNaFE9PSIsInZhbHVlIjoiVTFONjhIUUFKckpPZnRwM3ZvblVFajZ6V1FBU1VNSkMvRHhrN0ppRzh0U3ZlSlY0bUlhOS93c1ZSOUJvNGo1OEJtR0x2cTN2TjlSd2F2ZkVEc29NVCt3MVlrMjdNNDEzSjN6aVhSUlNsWHlGRmJpNE50Mk1sMXoyRDFhazFPTmwiLCJtYWMiOiJmNmUxM2ZmYjQ1NDY1YmUxZGVjMDI5ZjI3ZTIwNzc4ZWQ3NmFiMzI4ZDNiNWEyMDk2NjMxMGVhODJkMzA1NGRkIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:38 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6IlYzcHZBT0F1RnBkTEFIVlM3OVRVTnc9PSIsInZhbHVlIjoiOFNlOXM3YUNxK2N4S3FaYjlrQkZKMThDcURydlJaYklYOHQ4ZGpJNXJVYXc1d0pTeFhZQk8vTTZIWnYvcUkvbE9CQmFoR1B6OTdFWE1GamF6REd1clI3dnFYQlFSblo0TS9EOHVLM1pXTC91eU9yYXphdkZ1dW5GNnhQOElIY2YiLCJtYWMiOiJlY2U5MWZhNDQxZmFjYTgxNmZlNjM2ZjE1OWJjNDVkN2UwMjlhYTE5OGNhMGRhZjNlODAyODllODNlZDM4N2I1IiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:38 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"data\":[],\"total\":0,\"lastPage\":1},\"duration\":165,\"memory\":28,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14740, 'a3374f79-4a61-482e-9ba8-1bb7497ec09b', 'a3374f79-541b-41b4-b46f-b0a0b9ee4552', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.14\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:38'),
(14741, 'a3374f79-4bac-49ee-9361-48a193326bbf', 'a3374f79-541b-41b4-b46f-b0a0b9ee4552', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:38'),
(14742, 'a3374f79-4d94-4f93-8f87-ee59754d6662', 'a3374f79-541b-41b4-b46f-b0a0b9ee4552', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.37\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14743, 'a3374f79-4e61-411c-a66b-4326a9c03835', 'a3374f79-541b-41b4-b46f-b0a0b9ee4552', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.19\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14744, 'a3374f79-4e8a-4b1d-869b-417f4d4decb5', 'a3374f79-541b-41b4-b46f-b0a0b9ee4552', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14745, 'a3374f79-5100-4972-88c9-22898fee9856', 'a3374f79-541b-41b4-b46f-b0a0b9ee4552', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select `categorias`.* from `categorias`\",\"time\":\"0.29\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Services\\\\CategoriaService.php\",\"line\":24,\"hash\":\"90bbb516046ee1f5408ef1f66b4bcf4c\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14746, 'a3374f79-511f-45af-bbe1-789029c5df13', 'a3374f79-541b-41b4-b46f-b0a0b9ee4552', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Categoria\",\"count\":2,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14747, 'a3374f79-5368-4232-9f1e-ed2973533500', 'a3374f79-541b-41b4-b46f-b0a0b9ee4552', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/categorias\\/listado\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\CategoriaController@listado\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6Ijk1NGwyMFRJUHJQaTkrQ3RIRHlNaFE9PSIsInZhbHVlIjoiVTFONjhIUUFKckpPZnRwM3ZvblVFajZ6V1FBU1VNSkMvRHhrN0ppRzh0U3ZlSlY0bUlhOS93c1ZSOUJvNGo1OEJtR0x2cTN2TjlSd2F2ZkVEc29NVCt3MVlrMjdNNDEzSjN6aVhSUlNsWHlGRmJpNE50Mk1sMXoyRDFhazFPTmwiLCJtYWMiOiJmNmUxM2ZmYjQ1NDY1YmUxZGVjMDI5ZjI3ZTIwNzc4ZWQ3NmFiMzI4ZDNiNWEyMDk2NjMxMGVhODJkMzA1NGRkIiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6IlYzcHZBT0F1RnBkTEFIVlM3OVRVTnc9PSIsInZhbHVlIjoiOFNlOXM3YUNxK2N4S3FaYjlrQkZKMThDcURydlJaYklYOHQ4ZGpJNXJVYXc1d0pTeFhZQk8vTTZIWnYvcUkvbE9CQmFoR1B6OTdFWE1GamF6REd1clI3dnFYQlFSblo0TS9EOHVLM1pXTC91eU9yYXphdkZ1dW5GNnhQOElIY2YiLCJtYWMiOiJlY2U5MWZhNDQxZmFjYTgxNmZlNjM2ZjE1OWJjNDVkN2UwMjlhYTE5OGNhMGRhZjNlODAyODllODNlZDM4N2I1IiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/productos\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6Ijk1NGwyMFRJUHJQaTkrQ3RIRHlNaFE9PSIsInZhbHVlIjoiVTFONjhIUUFKckpPZnRwM3ZvblVFajZ6V1FBU1VNSkMvRHhrN0ppRzh0U3ZlSlY0bUlhOS93c1ZSOUJvNGo1OEJtR0x2cTN2TjlSd2F2ZkVEc29NVCt3MVlrMjdNNDEzSjN6aVhSUlNsWHlGRmJpNE50Mk1sMXoyRDFhazFPTmwiLCJtYWMiOiJmNmUxM2ZmYjQ1NDY1YmUxZGVjMDI5ZjI3ZTIwNzc4ZWQ3NmFiMzI4ZDNiNWEyMDk2NjMxMGVhODJkMzA1NGRkIiwidGFnIjoiIn0=\"},\"payload\":[],\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:18:38 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6Incwa1R3b08xR1l2UzR2THZWWFBZcXc9PSIsInZhbHVlIjoiam5NZzNkbVo3ek1rbkI0bGl3SFlld0hRQkhzeGxWQ0NqTlJCbGlYbjVuc2FkbDZCT2ZCdTRxZTV2UXlvdnNMbE1zUG5NQ1ZleDlLZGpEZjNiRVlkZ2dmQTNha09IbDRPVUJKTzc0RWt6TEpHV1hCbU02K1VHV0QzNkMvekpZVTYiLCJtYWMiOiJmMzFlYTc4ZGNkZjA4MmM3MWZjODE1OGRmMDYyMzZiOGVkYjljNGNkYzM4NGVhMjNmMjRiODE4ZGQ1Yzk3NTUzIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:38 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6IkhwQzNOR0V6ZDc2Q3o0aElUK1JpS1E9PSIsInZhbHVlIjoiVjBXUytXVFZkSkZRbFFYV1Iya1BXYTJ4bkJObWNzV2daTllSYXAwOC9LN1FRRFVUVmx6UGJMbm1WeXFPMjNkV2lJNzVHcTJFMnpERnNGY0tLNGhjb2R3eE83QndmWlJxbVF4bjBtd0p4K0puQ2UrTGRnbDQzcnR5dmFjOWYzeTUiLCJtYWMiOiI2NGZjMjdkOGNmYzMxOGMxYWUzMDNkMTJlZWE3YTU3ODYwM2I3NDRlYTU0NGM0NWUxNTYwMmNlMzhjYzY0ZDNlIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:38 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"categorias\":[{\"id\":1,\"nombre\":\"CATEGORIA 1\",\"created_at\":\"2026-11-11T23:05:56.000000Z\",\"updated_at\":\"2026-11-11T23:05:56.000000Z\"},{\"id\":2,\"nombre\":\"CATEGORIA 2\",\"created_at\":\"2026-11-11T23:06:01.000000Z\",\"updated_at\":\"2026-11-11T23:06:01.000000Z\"}]},\"duration\":183,\"memory\":28,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14748, 'a3374f79-4a3e-4ef9-a648-ee398ec48203', 'a3374f79-5b4e-4bff-8966-2dd675e1dd3d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.10\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:38'),
(14749, 'a3374f79-4b8a-4e77-b42b-da1470d65a3a', 'a3374f79-5b4e-4bff-8966-2dd675e1dd3d', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:38'),
(14750, 'a3374f79-4d91-4ebb-b46b-083bb10cf498', 'a3374f79-5b4e-4bff-8966-2dd675e1dd3d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.38\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14751, 'a3374f79-4e49-4c92-be6c-43009e269fd7', 'a3374f79-5b4e-4bff-8966-2dd675e1dd3d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.25\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14752, 'a3374f79-4e64-42ec-b0b0-ee4e992e4ec7', 'a3374f79-5b4e-4bff-8966-2dd675e1dd3d', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14753, 'a3374f79-5846-4075-8ccc-ba954fb8d4de', 'a3374f79-5b4e-4bff-8966-2dd675e1dd3d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select `marcas`.* from `marcas`\",\"time\":\"0.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Services\\\\MarcaService.php\",\"line\":24,\"hash\":\"2e282ea8ffc86e49ffa73fa58231bf17\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14754, 'a3374f79-586d-4b6a-b1a5-3c506ae41d5f', 'a3374f79-5b4e-4bff-8966-2dd675e1dd3d', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Marca\",\"count\":2,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14755, 'a3374f79-5a91-4f9c-9c92-c21e43bdd7c2', 'a3374f79-5b4e-4bff-8966-2dd675e1dd3d', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/marcas\\/listado\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\MarcaController@listado\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6Ijk1NGwyMFRJUHJQaTkrQ3RIRHlNaFE9PSIsInZhbHVlIjoiVTFONjhIUUFKckpPZnRwM3ZvblVFajZ6V1FBU1VNSkMvRHhrN0ppRzh0U3ZlSlY0bUlhOS93c1ZSOUJvNGo1OEJtR0x2cTN2TjlSd2F2ZkVEc29NVCt3MVlrMjdNNDEzSjN6aVhSUlNsWHlGRmJpNE50Mk1sMXoyRDFhazFPTmwiLCJtYWMiOiJmNmUxM2ZmYjQ1NDY1YmUxZGVjMDI5ZjI3ZTIwNzc4ZWQ3NmFiMzI4ZDNiNWEyMDk2NjMxMGVhODJkMzA1NGRkIiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6IlYzcHZBT0F1RnBkTEFIVlM3OVRVTnc9PSIsInZhbHVlIjoiOFNlOXM3YUNxK2N4S3FaYjlrQkZKMThDcURydlJaYklYOHQ4ZGpJNXJVYXc1d0pTeFhZQk8vTTZIWnYvcUkvbE9CQmFoR1B6OTdFWE1GamF6REd1clI3dnFYQlFSblo0TS9EOHVLM1pXTC91eU9yYXphdkZ1dW5GNnhQOElIY2YiLCJtYWMiOiJlY2U5MWZhNDQxZmFjYTgxNmZlNjM2ZjE1OWJjNDVkN2UwMjlhYTE5OGNhMGRhZjNlODAyODllODNlZDM4N2I1IiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/productos\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6Ijk1NGwyMFRJUHJQaTkrQ3RIRHlNaFE9PSIsInZhbHVlIjoiVTFONjhIUUFKckpPZnRwM3ZvblVFajZ6V1FBU1VNSkMvRHhrN0ppRzh0U3ZlSlY0bUlhOS93c1ZSOUJvNGo1OEJtR0x2cTN2TjlSd2F2ZkVEc29NVCt3MVlrMjdNNDEzSjN6aVhSUlNsWHlGRmJpNE50Mk1sMXoyRDFhazFPTmwiLCJtYWMiOiJmNmUxM2ZmYjQ1NDY1YmUxZGVjMDI5ZjI3ZTIwNzc4ZWQ3NmFiMzI4ZDNiNWEyMDk2NjMxMGVhODJkMzA1NGRkIiwidGFnIjoiIn0=\"},\"payload\":[],\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:18:38 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6ImN3eVhJY0hhT3pidGN2Y3hFYkxaS1E9PSIsInZhbHVlIjoibnZiUFNZeHNNWFhoQTQ0Uk1mS3c3eW4zSldIV0FwcEtrMFU0TUl1T0JiblFRQlhUcHpWaFMxcHNNbHlrODJCUERJbFVnMGI2cUpTUUlZdjl6b0dnUlVHSDcxaUErTUpmcnlrRXhvZzFwL3p2ZFdJRlRkSk9SWHYxSytkVG90RUoiLCJtYWMiOiJkZmQ2MDAyMjFiOWVmZGQ1NzJlZDIyMjZjYWUyOGRlM2YzYjA4OGJkODk0ODZmMTA4M2M3ZWQ0MGY2YjM0MGIwIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:38 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6ImZ5VHYvMUszT1hYRUpacTdMbXc5b3c9PSIsInZhbHVlIjoiRnR4c29GVDlBOW82QzArcUNyallOZDdNanlhQUd6K3BVNXdweFdFUnd6ckJqMTIvTm05eThJeGxlS2RFQlljRDhFaE1rd3YxMWd3VEFkT1lPYWRYdkIvRnlhMW9Bbjd0SGQ4a0U0cFJpM0NJajdCMkJPVzY2KytreTNpZjRZeW4iLCJtYWMiOiJkYjY5ZmVhYTE1ZDg2YTVjNWI1MjJhNWRjNDdhOWQ3OTEyOGZjM2Y3NGIxNDk4NjgwMTk2NWE0ODQ0ZTRhZGY1IiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:38 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"marcas\":[{\"id\":1,\"nombre\":\"MARCA 1\",\"created_at\":\"2026-11-11T23:05:47.000000Z\",\"updated_at\":\"2026-11-11T23:05:47.000000Z\"},{\"id\":2,\"nombre\":\"MARCA 2\",\"created_at\":\"2026-11-11T23:05:52.000000Z\",\"updated_at\":\"2026-11-11T23:05:52.000000Z\"}]},\"duration\":201,\"memory\":28,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14756, 'a3374f79-4a2d-4f6b-a44f-870efc3e44c1', 'a3374f79-5b4f-4801-a5ad-6bcd6399d20d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.19\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:38'),
(14757, 'a3374f79-4b8c-489d-b11b-b845866a6be9', 'a3374f79-5b4f-4801-a5ad-6bcd6399d20d', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:18:38'),
(14758, 'a3374f79-4d94-413a-bfb4-f643222de6bf', 'a3374f79-5b4f-4801-a5ad-6bcd6399d20d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.31\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14759, 'a3374f79-4e66-450a-91e7-9617b14bb26b', 'a3374f79-5b4f-4801-a5ad-6bcd6399d20d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.26\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14760, 'a3374f79-4e87-4bf5-920d-b61634496a60', 'a3374f79-5b4f-4801-a5ad-6bcd6399d20d', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14761, 'a3374f79-5846-4243-83f4-ccbb3b8f7624', 'a3374f79-5b4f-4801-a5ad-6bcd6399d20d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select `unidad_medidas`.* from `unidad_medidas`\",\"time\":\"0.51\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Services\\\\UnidadMedidaService.php\",\"line\":24,\"hash\":\"d503395f22eafe11e53c4758c927f06e\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14762, 'a3374f79-586d-4c0d-ac85-11eb17dadb70', 'a3374f79-5b4f-4801-a5ad-6bcd6399d20d', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\UnidadMedida\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14763, 'a3374f79-5a92-4416-a6a4-2f393741e11a', 'a3374f79-5b4f-4801-a5ad-6bcd6399d20d', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/unidad_medidas\\/listado\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\UnidadMedidaController@listado\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6Ijk1NGwyMFRJUHJQaTkrQ3RIRHlNaFE9PSIsInZhbHVlIjoiVTFONjhIUUFKckpPZnRwM3ZvblVFajZ6V1FBU1VNSkMvRHhrN0ppRzh0U3ZlSlY0bUlhOS93c1ZSOUJvNGo1OEJtR0x2cTN2TjlSd2F2ZkVEc29NVCt3MVlrMjdNNDEzSjN6aVhSUlNsWHlGRmJpNE50Mk1sMXoyRDFhazFPTmwiLCJtYWMiOiJmNmUxM2ZmYjQ1NDY1YmUxZGVjMDI5ZjI3ZTIwNzc4ZWQ3NmFiMzI4ZDNiNWEyMDk2NjMxMGVhODJkMzA1NGRkIiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6IlYzcHZBT0F1RnBkTEFIVlM3OVRVTnc9PSIsInZhbHVlIjoiOFNlOXM3YUNxK2N4S3FaYjlrQkZKMThDcURydlJaYklYOHQ4ZGpJNXJVYXc1d0pTeFhZQk8vTTZIWnYvcUkvbE9CQmFoR1B6OTdFWE1GamF6REd1clI3dnFYQlFSblo0TS9EOHVLM1pXTC91eU9yYXphdkZ1dW5GNnhQOElIY2YiLCJtYWMiOiJlY2U5MWZhNDQxZmFjYTgxNmZlNjM2ZjE1OWJjNDVkN2UwMjlhYTE5OGNhMGRhZjNlODAyODllODNlZDM4N2I1IiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/productos\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6Ijk1NGwyMFRJUHJQaTkrQ3RIRHlNaFE9PSIsInZhbHVlIjoiVTFONjhIUUFKckpPZnRwM3ZvblVFajZ6V1FBU1VNSkMvRHhrN0ppRzh0U3ZlSlY0bUlhOS93c1ZSOUJvNGo1OEJtR0x2cTN2TjlSd2F2ZkVEc29NVCt3MVlrMjdNNDEzSjN6aVhSUlNsWHlGRmJpNE50Mk1sMXoyRDFhazFPTmwiLCJtYWMiOiJmNmUxM2ZmYjQ1NDY1YmUxZGVjMDI5ZjI3ZTIwNzc4ZWQ3NmFiMzI4ZDNiNWEyMDk2NjMxMGVhODJkMzA1NGRkIiwidGFnIjoiIn0=\"},\"payload\":[],\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:18:38 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6ImpyRmtTVCtpQy85QXc5bW1NS3lVRUE9PSIsInZhbHVlIjoiK3hNR2JpV2UrQlVKU1NsWmNES05vMXRJNDJtZE1UQnJBM1dXRjB5RzJ5TnAwS3Zib3ZoRW1hbmRsbURjWW1QaFAwRHJoN3pNNnRUZkJnQ25Sam43QjFyMyt4WUlZdnNvUGNURTN2MmlMMW0zeTRDdVdHdTJYMWlyRUZZOG5rN08iLCJtYWMiOiJiOWMxOWFkYzQyOWViYzU1YjlmZGE1OTAwNWY5MDRlNTkzNDY3ZDFiMzlhMmQzNmI4OWU3MmRlODFiMzJhYzYwIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:38 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6Ik5kbUVmMzBLVVNvUVlsTmN2ak1VdHc9PSIsInZhbHVlIjoiWm1wVElQN2dxY3lCNjZzSEJ6ZVcwMzZzM3REdU1MbERLSlRlUzFRWCtHT25SM09BUWtkR3VxZXdEMjA1NnVHUFhud0xES0tLSFVaNWRlU2lndFdOMzRER2dqbytiU2ovQ3JNT1VxRUJLK2N1SkhzbHl0Mit5VTMxa3VjYzdnMzciLCJtYWMiOiI4YTY1ZWI4OTM3ZTMzMmNiYzMyMjFlMzE5NjM5M2MwZWEyYjc0ZGY4MjYxMGVhMjIwZTM3YWFlNDJhZTAxODBlIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:18:38 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"unidad_medidas\":[{\"id\":1,\"nombre\":\"UNIDAD\",\"created_at\":\"2026-11-11T23:05:41.000000Z\",\"updated_at\":\"2026-11-11T23:05:41.000000Z\"}]},\"duration\":201,\"memory\":32,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:18:38'),
(14764, 'a3374fd0-7ab9-4c13-a96a-1cdbee663947', 'a3374fd0-83b5-4e0e-ba69-496766336e53', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `id` = 1 limit 1\",\"time\":\"1.67\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\public\\\\index.php\",\"line\":20,\"hash\":\"082e27d9c4fc4a40315cae2c646c0509\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:19:35'),
(14765, 'a3374fd0-7cd3-497b-9f7b-120e42218f16', 'a3374fd0-83b5-4e0e-ba69-496766336e53', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\User\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-13 10:19:35'),
(14766, 'a3374fd0-7ec2-48e0-a8d6-23517b8d48a0', 'a3374fd0-83b5-4e0e-ba69-496766336e53', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `user_sucursals` where `user_sucursals`.`user_id` in (1)\",\"time\":\"0.60\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"3de725ed9a54e83dc4b45fb09b671d23\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:19:35'),
(14767, 'a3374fd0-7f93-41c5-827b-909d1779f821', 'a3374fd0-83b5-4e0e-ba69-496766336e53', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `roles`.`id` in (1)\",\"time\":\"0.29\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Middleware\\\\HandleInertiaRequests.php\",\"line\":35,\"hash\":\"b3f8b4044886bea1e3a43637c51979c9\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:19:35'),
(14768, 'a3374fd0-7fb0-4ee9-be86-b43038db80bf', 'a3374fd0-83b5-4e0e-ba69-496766336e53', NULL, 1, 'model', '{\"action\":\"retrieved\",\"model\":\"App\\\\Models\\\\Role\",\"count\":1,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:19:35'),
(14769, 'a3374fd0-811a-4c3e-b2f5-5c1a6026458b', 'a3374fd0-83b5-4e0e-ba69-496766336e53', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `notificacion_users` where `user_id` = 1 and `visto` = 0 order by `created_at` desc\",\"time\":\"0.39\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\app\\\\Http\\\\Controllers\\\\NotificacionUserController.php\",\"line\":72,\"hash\":\"45a6c7bee3b64d176bbcb758f499e0ef\",\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:19:35');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(14770, 'a3374fd0-82e9-4177-94fc-367fdacadae5', 'a3374fd0-83b5-4e0e-ba69-496766336e53', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/admin\\/notificacion_users\\/getNotificacions\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\NotificacionUserController@getNotificacions\",\"middleware\":[\"web\",\"auth\",\"permisoUsuario\"],\"headers\":{\"cookie\":\"XSRF-TOKEN=eyJpdiI6ImN3eVhJY0hhT3pidGN2Y3hFYkxaS1E9PSIsInZhbHVlIjoibnZiUFNZeHNNWFhoQTQ0Uk1mS3c3eW4zSldIV0FwcEtrMFU0TUl1T0JiblFRQlhUcHpWaFMxcHNNbHlrODJCUERJbFVnMGI2cUpTUUlZdjl6b0dnUlVHSDcxaUErTUpmcnlrRXhvZzFwL3p2ZFdJRlRkSk9SWHYxSytkVG90RUoiLCJtYWMiOiJkZmQ2MDAyMjFiOWVmZGQ1NzJlZDIyMjZjYWUyOGRlM2YzYjA4OGJkODk0ODZmMTA4M2M3ZWQ0MGY2YjM0MGIwIiwidGFnIjoiIn0%3D; imparablev2-session=eyJpdiI6ImZ5VHYvMUszT1hYRUpacTdMbXc5b3c9PSIsInZhbHVlIjoiRnR4c29GVDlBOW82QzArcUNyallOZDdNanlhQUd6K3BVNXdweFdFUnd6ckJqMTIvTm05eThJeGxlS2RFQlljRDhFaE1rd3YxMWd3VEFkT1lPYWRYdkIvRnlhMW9Bbjd0SGQ4a0U0cFJpM0NJajdCMkJPVzY2KytreTNpZjRZeW4iLCJtYWMiOiJkYjY5ZmVhYTE1ZDg2YTVjNWI1MjJhNWRjNDdhOWQ3OTEyOGZjM2Y3NGIxNDk4NjgwMTk2NWE0ODQ0ZTRhZGY1IiwidGFnIjoiIn0%3D\",\"accept-language\":\"es-419,es-US;q=0.9,es;q=0.8,en-US;q=0.7,en;q=0.6,gl;q=0.5,es-MX;q=0.4,ru;q=0.3\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/imparablev2.test\\/admin\\/productos\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/157.0.0.0 Safari\\/537.36\",\"x-requested-with\":\"XMLHttpRequest\",\"connection\":\"close\",\"host\":\"imparablev2.test\",\"x-xsrf-token\":\"eyJpdiI6ImN3eVhJY0hhT3pidGN2Y3hFYkxaS1E9PSIsInZhbHVlIjoibnZiUFNZeHNNWFhoQTQ0Uk1mS3c3eW4zSldIV0FwcEtrMFU0TUl1T0JiblFRQlhUcHpWaFMxcHNNbHlrODJCUERJbFVnMGI2cUpTUUlZdjl6b0dnUlVHSDcxaUErTUpmcnlrRXhvZzFwL3p2ZFdJRlRkSk9SWHYxSytkVG90RUoiLCJtYWMiOiJkZmQ2MDAyMjFiOWVmZGQ1NzJlZDIyMjZjYWUyOGRlM2YzYjA4OGJkODk0ODZmMTA4M2M3ZWQ0MGY2YjM0MGIwIiwidGFnIjoiIn0=\"},\"payload\":[],\"session\":{\"_token\":\"NtJqrnbZwWKB8S5cUGwbmRDS3jI9cEmkDOK0Eyrp\",\"_previous\":{\"url\":\"http:\\/\\/imparablev2.test\\/telescope\\/requests\",\"route\":\"telescope\"},\"_flash\":{\"old\":[],\"new\":[]},\"login_web_59ba36addc2b2f9401580f014c7f58ea4e30989d\":1},\"response_headers\":{\"cache-control\":\"no-cache, private\",\"date\":\"Fri, 13 Nov 2026 14:19:35 GMT\",\"content-type\":\"application\\/json\",\"vary\":\"X-Inertia\",\"set-cookie\":\"XSRF-TOKEN=eyJpdiI6IlNZcmtlOUYrSnJQTktzUmc4TGdiZGc9PSIsInZhbHVlIjoidE9ZV25aZUFsK0l4U0IwKzNTelIrZ2xna3NEN3lzenNtL3Nma214OWI1b2tMMWpqRjRoTVNsT25RaktKYVpmR0l6a3lLSERITCtNRlZSa0J1N1JURXlUOXdPbEJEUW1JaWZhRlN4TE5ZVVh6U2RiVE5veHhlaVZucUNXQWFtbXMiLCJtYWMiOiI4MDliNWZiM2Y2NzlmZTA5ODdkN2IyZjlmOGQ0MjMxMWE0ZWIyYWRhMDcyZThmODlkZjY2NDA4MjMxZjc4NDg5IiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:19:35 GMT; Max-Age=7200; path=\\/; samesite=lax, imparablev2-session=eyJpdiI6Imo4VVV5NUlXS1MxSkRlbWhDbE9CaWc9PSIsInZhbHVlIjoiUExvZ2J5SmV6N0dubFo4bEpPV0ZwTmVFRnhyOHAwdHI2RzZnNlIyNGtGMUJnaHVHbDNtUlFuSDlNbElUcTBkbkk0TE9EVTZjOUdWaHl2bisyTWtzOTdIL09mdUthN3YyMyt0bkxmcFhwa2VHSFNpRW5YUDBLRmc5akZ0U2FCUmoiLCJtYWMiOiIyN2IwODhiZGZlODRhOTVkMTRiYTY0NzgzODg5OTYzN2E3YjRjNjdjZTY0ODlkZTM2ZjYzOGM1YTFkOTg4MjhiIiwidGFnIjoiIn0%3D; expires=Fri, 13 Nov 2026 16:19:35 GMT; Max-Age=7200; path=\\/; httponly; samesite=lax\"},\"response_status\":200,\"response\":{\"notificacion_users\":[]},\"duration\":235,\"memory\":28,\"hostname\":\"DESKTOP-M0TID9S\",\"user\":{\"id\":1,\"name\":null,\"email\":null}}', '2026-11-13 10:19:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `telescope_entries_tags`
--

INSERT INTO `telescope_entries_tags` (`entry_uuid`, `tag`) VALUES
('a3374f77-454d-427f-8d5c-861a96357a1c', 'App\\Models\\Categoria'),
('a3374f79-511f-45af-bbe1-789029c5df13', 'App\\Models\\Categoria'),
('a3374f79-586d-4b6a-b1a5-3c506ae41d5f', 'App\\Models\\Marca'),
('a3374ec4-b0cc-4760-8e5a-81fb589974ef', 'App\\Models\\Proveedor'),
('a3374ec2-efb8-4920-80f3-b85ee899fb79', 'App\\Models\\Role'),
('a3374ec3-5895-49d9-a0e5-a945f42c8b7b', 'App\\Models\\Role'),
('a3374ec4-5234-42f5-b593-911713a8016d', 'App\\Models\\Role'),
('a3374ec4-ad43-4ea2-9ac2-9bdb7a352e3d', 'App\\Models\\Role'),
('a3374ec7-d53c-4e0f-9b32-d5b68ced5c63', 'App\\Models\\Role'),
('a3374ec8-2a87-4ddb-9c83-47e444328560', 'App\\Models\\Role'),
('a3374ecc-d1fd-46aa-9e79-13ac8b070838', 'App\\Models\\Role'),
('a3374f18-41f0-4164-9fde-2b0e8092df54', 'App\\Models\\Role'),
('a3374f3e-c830-4e8f-9d19-90765ff51035', 'App\\Models\\Role'),
('a3374f73-d831-45d7-b2a1-52d4ba3b43af', 'App\\Models\\Role'),
('a3374f74-2ec5-4e44-a86e-7257b225063d', 'App\\Models\\Role'),
('a3374f76-ecd3-4aad-944c-46547af0fcc7', 'App\\Models\\Role'),
('a3374f77-423c-4a56-b776-1295c859df11', 'App\\Models\\Role'),
('a3374f78-1ef9-499b-8ab3-e56085bb4dd8', 'App\\Models\\Role'),
('a3374f78-6b89-4a98-b3c4-0a0a1b20192c', 'App\\Models\\Role'),
('a3374f79-4e64-42ec-b0b0-ee4e992e4ec7', 'App\\Models\\Role'),
('a3374f79-4e87-4bf5-920d-b61634496a60', 'App\\Models\\Role'),
('a3374f79-4e8a-4b1d-869b-417f4d4decb5', 'App\\Models\\Role'),
('a3374fd0-7fb0-4ee9-be86-b43038db80bf', 'App\\Models\\Role'),
('a3374ec3-5c10-42fc-8128-0510c76b0629', 'App\\Models\\Sucursal'),
('a3374f79-586d-4c0d-ac85-11eb17dadb70', 'App\\Models\\UnidadMedida'),
('a3374ec2-ec79-418e-b190-b473a6313f11', 'App\\Models\\User'),
('a3374ec3-55fa-49a0-82be-a94f8b2cae87', 'App\\Models\\User'),
('a3374ec4-4fd4-4173-96a0-47540416ff2b', 'App\\Models\\User'),
('a3374ec4-aa5b-4309-b001-7ad1728fd207', 'App\\Models\\User'),
('a3374ec7-d291-4ab7-9916-a49574708d37', 'App\\Models\\User'),
('a3374ec8-286d-4ed8-8aa1-5fe4d75e9b19', 'App\\Models\\User'),
('a3374ecc-d02f-4d31-a730-0c586c1dcde6', 'App\\Models\\User'),
('a3374f18-3f02-41cb-a56b-a3f9c43d3859', 'App\\Models\\User'),
('a3374f3e-c4b7-40df-b5ef-5822c962e19f', 'App\\Models\\User'),
('a3374f73-d547-4001-816c-367c4840d5d4', 'App\\Models\\User'),
('a3374f74-2cb1-4d74-b3b8-ec38ea782a30', 'App\\Models\\User'),
('a3374f76-ea53-4dda-bfce-06db5ec6f6bc', 'App\\Models\\User'),
('a3374f77-4009-436a-af38-df8aa20483fb', 'App\\Models\\User'),
('a3374f78-1c7e-4bca-9acb-0e81dde53ea2', 'App\\Models\\User'),
('a3374f78-6981-4d13-953c-2ca0a01e19d6', 'App\\Models\\User'),
('a3374f79-4b8a-4e77-b42b-da1470d65a3a', 'App\\Models\\User'),
('a3374f79-4b8c-489d-b11b-b845866a6be9', 'App\\Models\\User'),
('a3374f79-4bac-49ee-9361-48a193326bbf', 'App\\Models\\User'),
('a3374fd0-7cd3-497b-9f7b-120e42218f16', 'App\\Models\\User'),
('a3374ec2-eea6-4470-b4a9-529c2a6f41be', 'Auth:1'),
('a3374ec2-ef96-4ccf-bebc-9fe859481bdd', 'Auth:1'),
('a3374ec2-efb8-4920-80f3-b85ee899fb79', 'Auth:1'),
('a3374ec2-fbf0-4bd6-99d3-c18917c37aa5', 'Auth:1'),
('a3374ec2-fc48-447d-a463-c308d4a69ab8', 'Auth:1'),
('a3374ec2-fe25-48e2-8e7d-0d9c6beb5929', 'Auth:1'),
('a3374ec3-57e9-4559-8a94-fafdf8f1f41a', 'Auth:1'),
('a3374ec3-587a-4dba-8915-2f572a98ce7d', 'Auth:1'),
('a3374ec3-5895-49d9-a0e5-a945f42c8b7b', 'Auth:1'),
('a3374ec3-5b82-447a-bc51-d3cbf4a1234f', 'Auth:1'),
('a3374ec3-5bea-4821-b19e-98545785f784', 'Auth:1'),
('a3374ec3-5c10-42fc-8128-0510c76b0629', 'Auth:1'),
('a3374ec3-6e4c-46ac-98f1-04406e7e1936', 'Auth:1'),
('a3374ec4-516d-4e22-b09f-d919f48cd5e4', 'Auth:1'),
('a3374ec4-5219-4cfb-b713-b33676724761', 'Auth:1'),
('a3374ec4-5234-42f5-b593-911713a8016d', 'Auth:1'),
('a3374ec4-5b8f-490f-9549-8d996e39dbc8', 'Auth:1'),
('a3374ec4-5bda-4488-b7d1-d3adfd00d24c', 'Auth:1'),
('a3374ec4-5d7e-48ab-97ee-6f68d68058c8', 'Auth:1'),
('a3374ec4-ac85-484d-8e5d-605dacb4032d', 'Auth:1'),
('a3374ec4-ad28-49ac-8daa-aec15c0b63dc', 'Auth:1'),
('a3374ec4-ad43-4ea2-9ac2-9bdb7a352e3d', 'Auth:1'),
('a3374ec4-b072-4e57-8e5c-b30318423f14', 'Auth:1'),
('a3374ec4-b0b0-4f0f-b507-9fdfea6f48b2', 'Auth:1'),
('a3374ec4-b0cc-4760-8e5a-81fb589974ef', 'Auth:1'),
('a3374ec4-b310-4c94-bce9-02b33551702e', 'Auth:1'),
('a3374ec7-d477-4314-ae51-635c7b59a12c', 'Auth:1'),
('a3374ec7-d521-47e2-80d0-2a599ed57152', 'Auth:1'),
('a3374ec7-d53c-4e0f-9b32-d5b68ced5c63', 'Auth:1'),
('a3374ec7-de59-420f-87ee-8aa2da181c48', 'Auth:1'),
('a3374ec7-de95-4f87-be48-d965286aeff5', 'Auth:1'),
('a3374ec7-e01b-4f03-9be1-e24a1960c322', 'Auth:1'),
('a3374ec8-29ec-4051-8d3a-0d10e1d73d55', 'Auth:1'),
('a3374ec8-2a70-4a00-95a7-8e83f5c4d227', 'Auth:1'),
('a3374ec8-2a87-4ddb-9c83-47e444328560', 'Auth:1'),
('a3374ec8-2cdd-4624-a920-066c26e04b91', 'Auth:1'),
('a3374ec8-2e69-4cf7-accb-6bbe452458be', 'Auth:1'),
('a3374ecc-d16d-4d0b-9816-03ecd26d28d2', 'Auth:1'),
('a3374ecc-d1e8-47a4-ae0d-4fba7429bdec', 'Auth:1'),
('a3374ecc-d1fd-46aa-9e79-13ac8b070838', 'Auth:1'),
('a3374ecc-f0f2-40d9-af3f-240cb0e925f0', 'Auth:1'),
('a3374ecd-ef24-4868-a38f-1c34e8c38600', 'Auth:1'),
('a3374ece-88d9-45c5-8d05-b435ea9040c9', 'Auth:1'),
('a3374ecf-fbcd-48ff-b14d-5e3303be96ef', 'Auth:1'),
('a3374ed0-2967-4df8-b386-b3ce099716ab', 'Auth:1'),
('a3374ed0-2d48-4202-957a-ba97759c5b20', 'Auth:1'),
('a3374ed0-313d-49e6-8828-404f8a306399', 'Auth:1'),
('a3374ed0-3709-426d-b316-dbaf9420872c', 'Auth:1'),
('a3374ed0-3cf0-483b-8e0b-2d00acec8525', 'Auth:1'),
('a3374ed0-9bc8-4490-b28e-82c90b70ecb2', 'Auth:1'),
('a3374ed0-a551-4bca-bad7-24468be0689a', 'Auth:1'),
('a3374ed0-aa46-41b3-ac09-1a298edec81b', 'Auth:1'),
('a3374ed0-b34e-4a93-b551-bfcedcda3b47', 'Auth:1'),
('a3374ed0-b3b6-492d-aa78-99ba60f41495', 'Auth:1'),
('a3374ed1-1665-4695-9054-1e1537f20eea', 'Auth:1'),
('a3374ed1-16ac-430a-91ec-5defc40332c4', 'Auth:1'),
('a3374ed1-16e0-47a7-95c5-cf63c7f0a301', 'Auth:1'),
('a3374ed1-4490-4b10-8bd7-bb8f317b7012', 'Auth:1'),
('a3374ed1-4927-4438-b79c-857d505d377e', 'Auth:1'),
('a3374ed1-4980-4732-9614-4067c87487dd', 'Auth:1'),
('a3374ed1-49a1-40b4-b4ea-9852780c9f2f', 'Auth:1'),
('a3374ed1-49c0-4cfa-9944-cf1ff63e8c2d', 'Auth:1'),
('a3374ed1-49e0-4025-9607-82e41c879e2c', 'Auth:1'),
('a3374ed1-4a07-44d9-9c1b-2789ae838d5a', 'Auth:1'),
('a3374ed1-891e-4bf0-9f85-92e06f0cda1a', 'Auth:1'),
('a3374ed1-896f-4b40-8957-d8cc9919cc77', 'Auth:1'),
('a3374ed1-e986-4992-9d7c-e4936e955a64', 'Auth:1'),
('a3374ed1-ede4-4696-93ef-813fadde11f0', 'Auth:1'),
('a3374ed1-f32b-4189-964c-d5f8f40e6435', 'Auth:1'),
('a3374ed1-f77c-4823-a44d-dcd6d87ace42', 'Auth:1'),
('a3374ed1-fb67-4c94-bd06-958d15471114', 'Auth:1'),
('a3374ed2-2497-41dc-bb27-940dd33f4b69', 'Auth:1'),
('a3374ed2-3cbb-4f7c-b344-f9c5673c2cdb', 'Auth:1'),
('a3374ed2-4ab3-4da4-96b2-579b5afc59d0', 'Auth:1'),
('a3374ed2-4b04-48c2-9351-1f3a5ac77d18', 'Auth:1'),
('a3374ed2-4b37-46db-9486-85b7d97387fa', 'Auth:1'),
('a3374ed2-4b6a-469c-9b25-b960f6428778', 'Auth:1'),
('a3374ed2-4b92-42ef-a5b8-b070d1dd7146', 'Auth:1'),
('a3374ed2-4bc5-46c5-87a9-4bd2df91ff24', 'Auth:1'),
('a3374ed2-4be9-4456-97ce-d2859d8d2332', 'Auth:1'),
('a3374ed2-4c12-401d-9a5a-2a4e68e52bec', 'Auth:1'),
('a3374ed2-4c48-4837-bb39-02e5230ebb7e', 'Auth:1'),
('a3374ed2-4c9a-487b-80aa-c3902883c5b1', 'Auth:1'),
('a3374ed2-4cbe-4fc1-bd83-d58fa23f4b6c', 'Auth:1'),
('a3374ed2-4ce0-48c2-9d6c-6a0478418c70', 'Auth:1'),
('a3374ed2-4d03-46de-bfe8-2519d27cdd1a', 'Auth:1'),
('a3374ed2-4d42-4e67-9e17-af3a996e4e53', 'Auth:1'),
('a3374ed2-4d67-45e6-acd8-885b37a90b0c', 'Auth:1'),
('a3374ed2-4d91-42f1-b9ee-e5d10531a99f', 'Auth:1'),
('a3374ed2-4db7-4c83-b6ee-603f304c85c8', 'Auth:1'),
('a3374ed2-4ded-4c12-a00a-6282d6c5be8f', 'Auth:1'),
('a3374ed2-4e10-47b4-93bb-0860b3df0d13', 'Auth:1'),
('a3374ed2-4e32-4ae9-a444-f756cc9359d6', 'Auth:1'),
('a3374ed2-4e56-41e7-b4b2-053a7b80847d', 'Auth:1'),
('a3374ed2-4e96-4595-9689-0c8c09055f33', 'Auth:1'),
('a3374ed2-4eba-44d8-9cfc-08225d9e9bb8', 'Auth:1'),
('a3374ed2-4edc-4004-ab79-311a5e8fe13d', 'Auth:1'),
('a3374ed2-4f0a-447f-96dc-39843a609811', 'Auth:1'),
('a3374ed2-4f42-4c56-a91a-c4d797601472', 'Auth:1'),
('a3374ed2-4f66-4d89-b831-f72a9ec8a9ca', 'Auth:1'),
('a3374ed2-4f8a-42aa-a883-2ad0a06b0df5', 'Auth:1'),
('a3374ed2-4faf-4948-bc64-c4a10d5d7589', 'Auth:1'),
('a3374ed2-5005-4ca8-a9f2-f34b9829fa81', 'Auth:1'),
('a3374ed2-5047-418e-b142-c292b384360b', 'Auth:1'),
('a3374ed2-5075-4a27-9014-a8b183217723', 'Auth:1'),
('a3374ed2-50ac-4b72-b517-8c48bf54edb1', 'Auth:1'),
('a3374ed2-5104-46bc-9e45-b8af33aee8e6', 'Auth:1'),
('a3374ed2-5145-47ed-a80a-6ba4005aeae3', 'Auth:1'),
('a3374ed2-516f-4e1f-950c-e79258545302', 'Auth:1'),
('a3374ed2-5196-4165-9829-71459cf22c04', 'Auth:1'),
('a3374ed2-51d7-44a8-8441-045a875f98b7', 'Auth:1'),
('a3374ed2-51fd-4df8-8b36-a15bbee4c5ff', 'Auth:1'),
('a3374ed2-5224-4e9c-bb6c-6d0f2e29f3b4', 'Auth:1'),
('a3374ed2-524c-48bf-a76c-a864196c7e6a', 'Auth:1'),
('a3374ed2-528a-4cd9-81fb-3b4c0f3eea1d', 'Auth:1'),
('a3374ed2-52af-4df6-b549-0f58ff74ee9f', 'Auth:1'),
('a3374ed2-52d3-4995-bce1-12266a159671', 'Auth:1'),
('a3374ed2-52f5-4458-854f-2e50572529d5', 'Auth:1'),
('a3374ed2-5324-4471-8ee5-8bdaf1e9a29c', 'Auth:1'),
('a3374ed2-534e-4ea9-a289-faab8ab2d988', 'Auth:1'),
('a3374ed2-5372-49ea-a833-f9c645787978', 'Auth:1'),
('a3374ed2-5396-4040-a7e0-e8dc81167bdb', 'Auth:1'),
('a3374ed2-53cc-4cc4-ace7-edcf78f38b72', 'Auth:1'),
('a3374ed2-53f1-4dcb-93ab-00f40d65c003', 'Auth:1'),
('a3374ed2-5416-42ea-b092-82f7daeefd34', 'Auth:1'),
('a3374ed2-5443-40cb-8d2f-32cac0c80d41', 'Auth:1'),
('a3374ed2-547b-4ddf-9e15-9f17d30fc97d', 'Auth:1'),
('a3374ed2-549e-45db-8bd8-18a6db6e9495', 'Auth:1'),
('a3374ed2-54c3-4172-a934-e644fe061388', 'Auth:1'),
('a3374ed2-54e7-49fe-9a18-bf10c103ebe1', 'Auth:1'),
('a3374ed2-551f-4f5f-b26d-a4388422988f', 'Auth:1'),
('a3374ed2-5546-4dae-97f7-e583c245c008', 'Auth:1'),
('a3374ed2-556a-4cc8-aa6f-dc5db596e93c', 'Auth:1'),
('a3374ed2-558e-44c2-b51e-7b1e4c8cbd6c', 'Auth:1'),
('a3374ed2-55c1-4601-81d3-f7e18b65ab6b', 'Auth:1'),
('a3374ed2-55e5-45cc-a439-8907f55abc56', 'Auth:1'),
('a3374ed2-560b-4d1b-a0a1-d1c5f964617b', 'Auth:1'),
('a3374ed2-5632-4f82-a25b-dac74b36715f', 'Auth:1'),
('a3374ed2-5669-45ab-988b-7770633d90f5', 'Auth:1'),
('a3374ed2-568e-4606-9e8e-55cdf7b7d328', 'Auth:1'),
('a3374ed2-56b1-489b-89ff-f570d4104c44', 'Auth:1'),
('a3374ed2-56d9-4158-9395-4d55b92dda82', 'Auth:1'),
('a3374ed2-5716-4f06-bc2c-6b53f58eef5c', 'Auth:1'),
('a3374ed2-573d-436b-8056-62e1b05fdda8', 'Auth:1'),
('a3374ed2-5765-4fd4-a156-380dec29033b', 'Auth:1'),
('a3374ed2-5790-47ae-890e-062a6e1bba89', 'Auth:1'),
('a3374ed2-57ce-435c-9652-e3fbae11d525', 'Auth:1'),
('a3374ed2-57f8-46c5-9b60-8032fa8b87c9', 'Auth:1'),
('a3374ed2-581f-4a55-8eb2-47960ad7edf5', 'Auth:1'),
('a3374ed2-5846-4255-ad81-8bf01cbb543a', 'Auth:1'),
('a3374ed2-5887-4d97-8ab9-0b3fd4147e9b', 'Auth:1'),
('a3374ed2-58bd-4c8d-bcfb-2d2921029fe1', 'Auth:1'),
('a3374ed2-58e2-4a6c-97ee-4439a3553d24', 'Auth:1'),
('a3374ed2-5905-409d-8eaf-df020fea7740', 'Auth:1'),
('a3374ed2-5938-4183-b83d-15eae20b37f9', 'Auth:1'),
('a3374ed2-b589-4db9-9eaa-685201d306e9', 'Auth:1'),
('a3374ed2-b5bc-4f25-9e26-dfeb590d7065', 'Auth:1'),
('a3374ed2-b5e2-4617-bd20-371895d427ff', 'Auth:1'),
('a3374ed2-b60f-4cb6-87de-0fd15d8a5d6f', 'Auth:1'),
('a3374ed2-b62b-4152-9c84-edd87d4a1148', 'Auth:1'),
('a3374ed2-b664-4b30-a2c0-e164dc862604', 'Auth:1'),
('a3374ed2-cce3-41b9-9718-e6c62f9a7107', 'Auth:1'),
('a3374ed2-cd3d-46b6-bdec-d5c7a98a6cda', 'Auth:1'),
('a3374ed2-cd72-42de-86e1-62bf49469dd8', 'Auth:1'),
('a3374ed2-cd92-4758-8655-b5e2f8c9d29f', 'Auth:1'),
('a3374ed2-cdb2-4d08-85a0-ecca72cc811f', 'Auth:1'),
('a3374ed2-cdd0-4300-a9f3-46cdbf990895', 'Auth:1'),
('a3374ed2-cdee-4490-9bdd-0deadddae3c4', 'Auth:1'),
('a3374ed2-ce14-43d7-87c0-9b0c46ae7c73', 'Auth:1'),
('a3374ed2-ce3b-471c-8555-9d13fe6bd134', 'Auth:1'),
('a3374ed2-ce64-41a9-9022-fbfc38289b09', 'Auth:1'),
('a3374ed2-ce9b-45bd-a740-a3b20f8cd92a', 'Auth:1'),
('a3374ed2-cec0-4076-a2bc-34f6de0a0746', 'Auth:1'),
('a3374ed2-cee4-45f9-a0e3-2719117727f3', 'Auth:1'),
('a3374ed2-cf0a-4490-81b4-a6ea7247d61c', 'Auth:1'),
('a3374ed2-cf42-4877-bb36-546ebc3f1d21', 'Auth:1'),
('a3374ed2-cf65-4771-a051-4e394f5a91ee', 'Auth:1'),
('a3374ed2-cf88-4cd0-9354-10ab14d7a15b', 'Auth:1'),
('a3374ed2-cfac-4a89-a5bd-3d03d204e0c0', 'Auth:1'),
('a3374ed2-cfda-4dbc-9929-572130716238', 'Auth:1'),
('a3374ed2-cffc-4718-851f-e9e0af60e9fb', 'Auth:1'),
('a3374ed2-d020-436c-85ba-85f7626c7d16', 'Auth:1'),
('a3374ed2-d044-4c01-b374-595be3e2fef8', 'Auth:1'),
('a3374ed2-d073-4a17-a8df-4ba4fc8e63e0', 'Auth:1'),
('a3374ed2-d098-43a4-9e4c-c626f6c7581f', 'Auth:1'),
('a3374ed2-d0bf-4809-b2b3-4c5dfa28340c', 'Auth:1'),
('a3374ed2-d0e4-430b-8c58-47a0fd7607bd', 'Auth:1'),
('a3374ed2-d114-4312-a020-1c51fccab760', 'Auth:1'),
('a3374ed2-d138-4717-90ec-f804e4024b6b', 'Auth:1'),
('a3374ed2-d15b-4cdb-adb1-ca425b41721a', 'Auth:1'),
('a3374ed2-d17f-4a57-a56e-f1b5932b001d', 'Auth:1'),
('a3374ed2-d1ae-4dbd-8bd0-4ed419edb5d5', 'Auth:1'),
('a3374ed2-d1d1-44c4-9c93-1cbb5c144fed', 'Auth:1'),
('a3374ed2-d1f5-430e-be1b-ce56a9caeca4', 'Auth:1'),
('a3374ed2-d21a-4ef9-abb1-23af73db0992', 'Auth:1'),
('a3374ed2-d247-4c16-b2ee-a6896835c6c0', 'Auth:1'),
('a3374ed2-d26b-409a-882a-8f5a3f3d192f', 'Auth:1'),
('a3374ed2-d28d-485e-9c84-e83e034574ef', 'Auth:1'),
('a3374ed2-d2b6-4f57-9765-d212f04baafb', 'Auth:1'),
('a3374ed2-d2ec-4866-9857-d64878fa08c2', 'Auth:1'),
('a3374ed2-d315-4e4a-b2c6-77e347eafb45', 'Auth:1'),
('a3374ed2-d33e-42e2-8f84-8645e870369d', 'Auth:1'),
('a3374ed2-d364-49d2-9a19-1b1c47e2c6e5', 'Auth:1'),
('a3374ed2-d394-4847-95ab-dc891ab93361', 'Auth:1'),
('a3374ed2-d3b8-4c8c-bfa4-a5118892cf84', 'Auth:1'),
('a3374ed2-d3dc-44e7-93a3-5456b8232fc3', 'Auth:1'),
('a3374ed2-d401-4a27-a299-f69e2eb19e4a', 'Auth:1'),
('a3374ed2-d432-4492-9897-9bdcc005f5cc', 'Auth:1'),
('a3374ed2-d455-456b-9f27-21a72e9c8e87', 'Auth:1'),
('a3374ed2-d479-4c54-a3d8-b688e9c41ed0', 'Auth:1'),
('a3374ed2-d4a0-433a-bba4-91ca11453387', 'Auth:1'),
('a3374ed2-d4cf-4cc5-9532-ee6b7efcc297', 'Auth:1'),
('a3374ed2-d4fa-487f-a867-31498c060712', 'Auth:1'),
('a3374ed2-d523-461e-a831-d9f0f7c4689b', 'Auth:1'),
('a3374ed2-d549-4890-a65a-196575ee7c93', 'Auth:1'),
('a3374ed2-d578-45a4-85a2-f4226331dd42', 'Auth:1'),
('a3374ed2-d59c-44e1-b0fc-e8559fc0bb72', 'Auth:1'),
('a3374ed2-d5be-4557-87c0-fd8534bf0037', 'Auth:1'),
('a3374ed2-d5e4-4902-9cdd-b2fe017a042f', 'Auth:1'),
('a3374ed2-d612-4ae1-8025-67a33121f4ad', 'Auth:1'),
('a3374ed2-d635-49f4-a42b-f54fa3c9d49b', 'Auth:1'),
('a3374ed2-d65a-4504-a030-45b811e3b786', 'Auth:1'),
('a3374ed2-d682-4f98-a607-03233278e465', 'Auth:1'),
('a3374ed2-d6b9-499b-a444-66ac04f3ac8b', 'Auth:1'),
('a3374ed2-d6dd-49fe-b60f-530cb6d33b05', 'Auth:1'),
('a3374ed2-d700-4294-8e46-ddc0bc1f0900', 'Auth:1'),
('a3374ed2-d724-4bab-90d8-ee12fbee3c80', 'Auth:1'),
('a3374ed2-d752-43aa-9cf8-5ea13e77e2c7', 'Auth:1'),
('a3374ed2-d775-446c-af97-23dc3d9d00aa', 'Auth:1'),
('a3374ed2-d798-46d2-8ef9-4ecef4a7f3df', 'Auth:1'),
('a3374ed2-d7bf-4885-94af-c1f65b122997', 'Auth:1'),
('a3374ed2-d7ed-4ddf-944d-e2de974c7482', 'Auth:1'),
('a3374ed2-d810-4ca2-ab8e-6dd1cca6bccf', 'Auth:1'),
('a3374ed2-d833-46bb-9c37-f47a81f5c35f', 'Auth:1'),
('a3374ed2-d857-4b0d-bc57-e0d1cdcc0531', 'Auth:1'),
('a3374ed2-d885-40a1-82eb-019bf8698b5d', 'Auth:1'),
('a3374ed2-d8a7-4d48-a06a-5c1e5b224425', 'Auth:1'),
('a3374ed2-d8cb-4dff-aacc-a782ddcf1d49', 'Auth:1'),
('a3374ed2-d8f1-459d-8239-2cdacb0009cf', 'Auth:1'),
('a3374ed2-d922-4add-ba5b-bbb32d7771d2', 'Auth:1'),
('a3374ed2-d94b-4cb8-9d1d-51e2d74a623e', 'Auth:1'),
('a3374ed2-d972-4ed7-8461-a1d447fe070e', 'Auth:1'),
('a3374ed2-d99d-40b1-b6a0-5b4bda21ebcf', 'Auth:1'),
('a3374ed2-d9d2-40e8-b0de-13607014e5c8', 'Auth:1'),
('a3374ed2-d9f6-4fd8-b002-4fee19a959dd', 'Auth:1'),
('a3374ed2-da1a-4177-abde-94bfd1d5124f', 'Auth:1'),
('a3374ed2-da40-418c-83a0-4bad307c7404', 'Auth:1'),
('a3374ed2-da6f-448d-b5c2-e9f35d76fe33', 'Auth:1'),
('a3374ed2-da93-42e1-9e72-40612566d221', 'Auth:1'),
('a3374ed2-dab6-46e7-808a-c2153e9a85a6', 'Auth:1'),
('a3374ed2-dadc-4e2a-9cbb-ad75fc7a7753', 'Auth:1'),
('a3374ed2-db0c-403c-831b-6cdc5a0e2d4a', 'Auth:1'),
('a3374ed2-db31-4059-89a2-a0fa204198ca', 'Auth:1'),
('a3374ed2-db55-490f-a3b3-096e31a7abd4', 'Auth:1'),
('a3374ed2-db7a-4adc-a422-ecd4e7e11af3', 'Auth:1'),
('a3374ed2-dbb8-498b-b8fe-4efd66bb0fab', 'Auth:1'),
('a3374ed2-dbdc-4656-8b27-468495a00435', 'Auth:1'),
('a3374ed2-dbff-4966-8f4b-7a88453594fa', 'Auth:1'),
('a3374ed2-dc23-46d0-bcd1-7627c2a161db', 'Auth:1'),
('a3374ed2-dc58-4ee1-86e0-eac23434b201', 'Auth:1'),
('a3374ed2-dc7a-4d0f-a11f-95864ef756a8', 'Auth:1'),
('a3374ed2-dc9d-454e-ae15-ca5ac05b6bb0', 'Auth:1'),
('a3374ed2-dcc8-48df-a765-035ce978392d', 'Auth:1'),
('a3374ed2-dcfd-4cb0-a4b6-30c9ec64a6b9', 'Auth:1'),
('a3374ed2-dd21-4bb5-9446-3e289c845a3a', 'Auth:1'),
('a3374ed2-dd44-46a4-8b0e-39993ccf2735', 'Auth:1'),
('a3374ed2-dd68-46da-b41c-dea09a678fa3', 'Auth:1'),
('a3374ed2-dd9b-4da8-b964-81e6472f3700', 'Auth:1'),
('a3374ed2-ddc0-41f5-a7a0-777b6db781ef', 'Auth:1'),
('a3374ed2-dde5-4906-ad8c-e1c7806fc189', 'Auth:1'),
('a3374ed2-de0b-4363-98d7-19b6696c5902', 'Auth:1'),
('a3374ed2-de3d-4661-9fce-ed2946509266', 'Auth:1'),
('a3374ed2-de63-45a8-b171-f99df6204075', 'Auth:1'),
('a3374ed2-de86-4dd5-8de9-c4f2456ac561', 'Auth:1'),
('a3374ed2-deab-4061-89d8-51aff38d86b8', 'Auth:1'),
('a3374ed2-ded9-4ab5-99bd-1564a3fcd73f', 'Auth:1'),
('a3374ed2-defd-455f-bc5c-ea46780b887e', 'Auth:1'),
('a3374ed2-df1f-457a-b29e-358a401f4707', 'Auth:1'),
('a3374ed2-df43-455c-a203-b61273430f56', 'Auth:1'),
('a3374ed2-df71-4aab-9717-4636e8ef88d6', 'Auth:1'),
('a3374ed2-df96-405f-9136-4ebcd51ca4c7', 'Auth:1'),
('a3374ed2-dfc0-49d1-adb8-03953c85a559', 'Auth:1'),
('a3374ed2-dfe9-4ad0-89dd-ec93ff5dff7f', 'Auth:1'),
('a3374ed2-e026-43f3-b640-494cbb467c51', 'Auth:1'),
('a3374ed2-e04f-4d99-8a15-6a66e0d5ed6a', 'Auth:1'),
('a3374ed2-e075-4b86-b44a-2ab03df07de2', 'Auth:1'),
('a3374ed2-e09a-4d66-975a-1b78d5bc745c', 'Auth:1'),
('a3374ed2-e0ca-40e9-a07a-18ee76c9a4a4', 'Auth:1'),
('a3374ed2-e0ee-4b4f-82d0-ab37af72a73f', 'Auth:1'),
('a3374ed2-e114-45dc-baba-1583aa8757ec', 'Auth:1'),
('a3374ed2-e138-4f1f-8bc2-5fb00a86259c', 'Auth:1'),
('a3374ed2-e167-49f6-b532-223868d08915', 'Auth:1'),
('a3374ed2-e18f-49f0-8365-85ec1057f8e9', 'Auth:1'),
('a3374ed2-e1b3-4c47-84f1-278e3f2073e4', 'Auth:1'),
('a3374ed2-e1d8-4518-a079-d59d68abc7b5', 'Auth:1'),
('a3374ed2-e20c-4d42-816f-e537dd3b5d2f', 'Auth:1'),
('a3374ed2-e232-45d3-b49f-b9ac8f5ca2d5', 'Auth:1'),
('a3374ed2-e25b-47de-9b94-eae8905a56d0', 'Auth:1'),
('a3374ed2-e280-4bfe-9d8e-5319e7291135', 'Auth:1'),
('a3374ed2-e2b2-4e7b-85dd-391f24771e96', 'Auth:1'),
('a3374ed2-e2d7-4708-99ad-7ad151189ed1', 'Auth:1'),
('a3374ed2-e2fc-4e79-a761-912a7526a177', 'Auth:1'),
('a3374ed2-e322-4854-af5b-920888f78c31', 'Auth:1'),
('a3374ed2-e353-4d42-8a81-942ed2626890', 'Auth:1'),
('a3374ed2-e377-449f-a6bf-96430224bf12', 'Auth:1'),
('a3374ed2-e39b-422a-b920-41549a88b97c', 'Auth:1'),
('a3374ed2-e3be-4d5e-acd0-e1a63078dfa2', 'Auth:1'),
('a3374ed2-e3ed-4806-9404-cd8d4bd57bbb', 'Auth:1'),
('a3374ed2-e410-4a7c-a275-50b3bbc01818', 'Auth:1'),
('a3374ed2-e433-4387-acf0-77034691f44c', 'Auth:1'),
('a3374ed2-e456-43cd-b733-621db5366464', 'Auth:1'),
('a3374ed2-e488-4289-a65b-a61ffa3d459f', 'Auth:1'),
('a3374ed2-e4ac-4d5c-923d-e2895bd3c4e9', 'Auth:1'),
('a3374ed2-e4d0-468c-845f-0584caeb3bd6', 'Auth:1'),
('a3374ed2-e4f3-40ee-b3d9-54d892c75f4d', 'Auth:1'),
('a3374ed2-e523-4f69-88c8-ebab05cc6d62', 'Auth:1'),
('a3374ed2-e547-4e64-80c5-c95caced90c6', 'Auth:1'),
('a3374ed2-e56a-448b-ab2f-598d0d1f1f4f', 'Auth:1'),
('a3374ed2-e58e-4b1f-a148-c9159b496c00', 'Auth:1'),
('a3374ed2-e5bd-47c0-a7e2-c1ad01612b7b', 'Auth:1'),
('a3374ed2-e5e0-48ed-8577-9d0160c699b9', 'Auth:1'),
('a3374ed2-e602-4618-8a51-321edb6b397a', 'Auth:1'),
('a3374ed2-e629-4e11-819c-2ba6c2eaf30d', 'Auth:1'),
('a3374ed2-e661-4762-a855-4b304fe3105a', 'Auth:1'),
('a3374ed2-e689-4d23-b53e-b8403f05770d', 'Auth:1'),
('a3374ed2-e6b0-43da-9512-4ec05408c261', 'Auth:1'),
('a3374ed2-e6d5-402e-adc9-f0b9edeb28d5', 'Auth:1'),
('a3374ed2-e70c-48fa-95d4-9fddfb4df8e1', 'Auth:1'),
('a3374ed2-e730-4198-86eb-6ecef754be77', 'Auth:1'),
('a3374ed2-e754-4856-a34d-1e6660d248f2', 'Auth:1'),
('a3374ed2-e778-4f20-811d-84347d14b1a4', 'Auth:1'),
('a3374ed2-e7a7-44a0-8674-53511d051aa3', 'Auth:1'),
('a3374ed2-e7cb-49cd-aaee-160c06457dff', 'Auth:1'),
('a3374ed2-e7ee-400a-94d3-61e131faab95', 'Auth:1'),
('a3374ed2-e812-468b-bc21-41919ec392da', 'Auth:1'),
('a3374ed2-e843-4841-b7e7-74feeeb6809c', 'Auth:1'),
('a3374ed2-e867-43df-8f93-7426e4b3eff9', 'Auth:1'),
('a3374ed2-e88c-4c07-8863-5b4014bc246b', 'Auth:1'),
('a3374ed2-e8b7-47f5-8198-0cf91222ad92', 'Auth:1'),
('a3374ed2-e8e9-4b5e-a85a-1b8ebd0bab57', 'Auth:1'),
('a3374ed2-e90f-4484-91a1-1f58785f1156', 'Auth:1'),
('a3374ed2-e935-4189-aaec-54fcabd70537', 'Auth:1'),
('a3374ed2-e95d-4f93-ac93-decff88cf619', 'Auth:1'),
('a3374ed2-e98e-45a4-993c-d1ee93ed18d0', 'Auth:1'),
('a3374ed2-e9b3-48aa-8805-e942c69e25e9', 'Auth:1'),
('a3374ed2-e9d8-42eb-8164-5827e0307eb0', 'Auth:1'),
('a3374ed2-e9fd-422c-835c-767620c07a93', 'Auth:1'),
('a3374ed2-ea2d-4a51-8aef-97cf76d24594', 'Auth:1'),
('a3374ed2-ea50-4b67-ba8f-ad7937102c2d', 'Auth:1'),
('a3374ed2-ea72-409c-a365-5b42d2903153', 'Auth:1'),
('a3374ed2-ea95-4fcd-9db0-50a593cc8101', 'Auth:1'),
('a3374ed2-eac3-4083-895c-79a30e685b2d', 'Auth:1'),
('a3374ed2-eae5-4ab8-8fb7-f0c509f96407', 'Auth:1'),
('a3374ed2-eb07-46e3-a4bf-46b6483107e7', 'Auth:1'),
('a3374ed2-eb2a-43f1-a206-8b553d69e3ef', 'Auth:1'),
('a3374ed2-eb5b-4760-877d-1fc9674b409b', 'Auth:1'),
('a3374ed2-eb7d-45a2-82e1-5ab1253375a8', 'Auth:1'),
('a3374ed2-eba0-4e51-b272-856c41e01eea', 'Auth:1'),
('a3374ed2-ebc4-4391-a875-0c24f0d439a8', 'Auth:1'),
('a3374ed2-ebf5-4d55-8f97-1b51ff0deea1', 'Auth:1'),
('a3374ed2-ec19-4103-88f9-ff6c059af0d8', 'Auth:1'),
('a3374ed2-ec3c-4462-a119-f6f72cb30c9b', 'Auth:1'),
('a3374ed2-ec66-4ebe-8483-81ea43f87ff4', 'Auth:1'),
('a3374ed2-eca9-4e59-9153-62b40711e406', 'Auth:1'),
('a3374ed2-ecfe-46c0-8c32-4d08ad7e39ff', 'Auth:1'),
('a3374ed2-ed31-44c3-a7fd-89291b36f387', 'Auth:1'),
('a3374ed2-ed60-4dbc-a91d-d3b26e053451', 'Auth:1'),
('a3374ed2-ed93-4fc9-a7c5-9ae93958a81c', 'Auth:1'),
('a3374ed2-edb2-4286-9ced-cfe546fc1cfb', 'Auth:1'),
('a3374ed2-edf5-4f51-b5c0-70918234224b', 'Auth:1'),
('a3374ed2-ee1c-4506-ac87-c46361d1219a', 'Auth:1'),
('a3374ed2-ee58-4d1a-86ba-32b23c8a57c7', 'Auth:1'),
('a3374ed3-8d5a-440f-b6a5-3aa489dd2cc2', 'Auth:1'),
('a3374ed3-91ee-4a75-bbea-b7cc9d9f639c', 'Auth:1'),
('a3374ed3-923c-4611-a529-d7589af691af', 'Auth:1'),
('a3374ed3-927a-42cf-8085-9825a5914618', 'Auth:1'),
('a3374ed3-929a-44a0-b046-3351ea7e4e93', 'Auth:1'),
('a3374ed3-92c1-4329-809d-8feb75f9b9cc', 'Auth:1'),
('a3374ed3-92e0-4e73-83c5-5436d28342bf', 'Auth:1'),
('a3374ed3-930f-49ee-ab38-0ad5eefa201d', 'Auth:1'),
('a3374ed3-976e-4dc0-9c86-f9d5e20fdb54', 'Auth:1'),
('a3374ed3-9b78-4d4c-a96e-f7ef9dac9915', 'Auth:1'),
('a3374ed3-9fa8-43e7-a8ad-ead63873b447', 'Auth:1'),
('a3374ed3-a3e2-4051-9f10-ba3fca9ad1d5', 'Auth:1'),
('a3374ed3-a427-4fe9-86e2-9f198cfed85a', 'Auth:1'),
('a3374ed3-a452-4817-a887-b5e73a6328de', 'Auth:1'),
('a3374ed3-ae55-4c14-b6bd-a9c3158556bf', 'Auth:1'),
('a3374ed3-d651-4e64-832c-2ba94632dc4f', 'Auth:1'),
('a3374ed3-dd84-4881-a3b8-97b6c36e6355', 'Auth:1'),
('a3374ed3-f899-497f-a18a-7841f0d97d20', 'Auth:1'),
('a3374ed4-2068-4c15-8b4e-d72cebd0c5ba', 'Auth:1'),
('a3374ed4-20b1-4f71-91da-749f184ae6d1', 'Auth:1'),
('a3374ed4-20d8-4213-ace3-54ae78a10914', 'Auth:1'),
('a3374ed4-2103-4fa6-8dce-d14a38f3134c', 'Auth:1'),
('a3374ed4-460b-447b-8867-ec8520497fee', 'Auth:1'),
('a3374ed4-4e3d-4aad-a6b7-36bf19dfdaf3', 'Auth:1'),
('a3374ed4-4e83-47c0-bac3-95a1e3cf98e9', 'Auth:1'),
('a3374ed4-4eb6-4e3f-83fd-1b8136ccb5c3', 'Auth:1'),
('a3374ed4-700a-4441-8a59-885817b387b2', 'Auth:1'),
('a3374f18-40f1-4ca3-9871-4ae5adb147c6', 'Auth:1'),
('a3374f18-41d0-4650-a83a-dbee5ab6ad6d', 'Auth:1'),
('a3374f18-41f0-4164-9fde-2b0e8092df54', 'Auth:1'),
('a3374f18-42ea-4bc6-ad9f-d3a6f641516a', 'Auth:1'),
('a3374f18-44a4-44b4-aba5-924bda8d8bb3', 'Auth:1'),
('a3374f3e-c6fa-4c32-9b1a-963aeec40d27', 'Auth:1'),
('a3374f3e-c7f6-4e55-abbf-9ef3125ee6b2', 'Auth:1'),
('a3374f3e-c830-4e8f-9d19-90765ff51035', 'Auth:1'),
('a3374f3e-d49c-4ad2-9474-4bec8292dc73', 'Auth:1'),
('a3374f3f-0735-4249-95a7-0c43e412ff43', 'Auth:1'),
('a3374f3f-7e05-4816-887b-19e0fd8432c2', 'Auth:1'),
('a3374f3f-7f09-4bb6-bf04-21837b111e46', 'Auth:1'),
('a3374f3f-7f6b-482c-ae0f-6e0309dfcc2a', 'Auth:1'),
('a3374f3f-7faa-49b5-b4e0-0085c606496a', 'Auth:1'),
('a3374f3f-7fe6-4dde-a303-1440dbcd3c32', 'Auth:1'),
('a3374f3f-801e-49a3-9192-96b6a2ae2108', 'Auth:1'),
('a3374f3f-8055-453c-9f0c-d361be262adb', 'Auth:1'),
('a3374f3f-809f-40a0-91b8-4229c0265826', 'Auth:1'),
('a3374f3f-80ec-40de-ab99-325a9b94acb8', 'Auth:1'),
('a3374f3f-8115-44af-8ad7-ecc1533fa2ac', 'Auth:1'),
('a3374f3f-8145-491a-8f06-80337878f2f4', 'Auth:1'),
('a3374f3f-817d-497b-b0d2-0575fda9e635', 'Auth:1'),
('a3374f3f-81d6-426d-b762-2c8c9fd8c8dc', 'Auth:1'),
('a3374f3f-81fd-4d75-aa8c-68945cec0d87', 'Auth:1'),
('a3374f3f-822e-491c-9f25-16a4a3652ff8', 'Auth:1'),
('a3374f3f-8269-4023-876d-f4961cac3628', 'Auth:1'),
('a3374f3f-8291-4fa6-9523-7b9c7ee6e47c', 'Auth:1'),
('a3374f3f-82bd-46e6-a651-167b138000b0', 'Auth:1'),
('a3374f3f-82de-428b-83f2-bb9cde58ed3d', 'Auth:1'),
('a3374f3f-82fe-49df-89d4-cf5baf423f6f', 'Auth:1'),
('a3374f3f-831d-4117-b11d-6d9858736745', 'Auth:1'),
('a3374f3f-8344-4e07-a633-0def472d68e5', 'Auth:1'),
('a3374f3f-8379-424e-906a-cd08bdbfe739', 'Auth:1'),
('a3374f3f-83a6-4c7d-b676-6f1d4be0b2d2', 'Auth:1'),
('a3374f3f-83e4-4125-ba82-931618285e99', 'Auth:1'),
('a3374f3f-8411-4666-9d0d-c6c63a9a7024', 'Auth:1'),
('a3374f3f-844e-4e02-adf1-b06ad7759cef', 'Auth:1'),
('a3374f3f-847f-4a9b-8865-9213837d4f83', 'Auth:1'),
('a3374f3f-84b6-4216-a38c-8f9a39513188', 'Auth:1'),
('a3374f3f-84fd-43b1-970e-12af36a0c6d8', 'Auth:1'),
('a3374f3f-8539-41d6-a5b6-73d2644562e1', 'Auth:1'),
('a3374f3f-856f-4d16-aa0b-3b86b8dd0ccf', 'Auth:1'),
('a3374f3f-85a9-4f41-a830-6783f50af1f7', 'Auth:1'),
('a3374f3f-85d0-44e8-a229-e83db46c6bdd', 'Auth:1'),
('a3374f3f-8612-49c5-9b74-eea464c87a25', 'Auth:1'),
('a3374f3f-863b-44a7-8e18-5994e829a37d', 'Auth:1'),
('a3374f3f-8679-4603-9f18-14e829babba7', 'Auth:1'),
('a3374f3f-86a1-4947-9034-65b1c925885b', 'Auth:1'),
('a3374f3f-86e7-4fd6-8b93-320ab965a29a', 'Auth:1'),
('a3374f3f-870f-4507-82db-18f5a84af73d', 'Auth:1'),
('a3374f3f-8753-4582-be2c-b4375e5056f9', 'Auth:1'),
('a3374f3f-877d-4041-96a0-d26ed46818ca', 'Auth:1'),
('a3374f3f-87a1-479c-8d56-2b4f4cbf2164', 'Auth:1'),
('a3374f3f-87c4-4c1b-9f4f-593ed8c80766', 'Auth:1'),
('a3374f3f-87fa-42e3-945e-1d43e20c0941', 'Auth:1'),
('a3374f3f-881f-44d1-9abf-ac3b4087738f', 'Auth:1'),
('a3374f3f-8843-4c6b-8d65-1d75d9630a3f', 'Auth:1'),
('a3374f3f-8868-47b6-b739-4ba3d3412162', 'Auth:1'),
('a3374f3f-88a0-4499-9e41-9301a5d354ec', 'Auth:1'),
('a3374f3f-88c4-471f-afa2-c8219296aeba', 'Auth:1'),
('a3374f3f-88e6-496a-8ec7-d3dbea8a8d5f', 'Auth:1'),
('a3374f3f-890b-483b-9235-2ab7e1f1ea6d', 'Auth:1'),
('a3374f3f-8942-4fb1-ba08-b2f8e11fc9d1', 'Auth:1'),
('a3374f3f-8967-484c-8941-3a1b0e4b9d5a', 'Auth:1'),
('a3374f3f-898a-419b-bfef-703d374111c6', 'Auth:1'),
('a3374f3f-89ae-4864-88aa-017fc45c42b6', 'Auth:1'),
('a3374f3f-89e5-414e-91d5-1e6122f1dde6', 'Auth:1'),
('a3374f3f-8a09-4d85-9132-841cd9011787', 'Auth:1'),
('a3374f3f-8a2b-48ba-8d6d-c94f4d3a4b56', 'Auth:1'),
('a3374f3f-8a4e-4644-b4d7-4f399e7a8d5c', 'Auth:1'),
('a3374f3f-8a82-4139-b76c-50c99959babc', 'Auth:1'),
('a3374f3f-8aa5-4c64-8de8-e5cf7ee99769', 'Auth:1'),
('a3374f3f-8ad1-49b2-8d25-4a6c2d4cc49e', 'Auth:1'),
('a3374f3f-8af9-4f54-bc16-720afab606c5', 'Auth:1'),
('a3374f3f-8b39-426a-abf2-46d7869ed287', 'Auth:1'),
('a3374f3f-8b5e-454a-9f5a-6dd15cf0a9d6', 'Auth:1'),
('a3374f3f-8b82-4290-9a71-6bdef55c8d75', 'Auth:1'),
('a3374f3f-8ba7-4206-be88-9b75efdc1ee4', 'Auth:1'),
('a3374f3f-8bde-436e-8f51-c176997065e8', 'Auth:1'),
('a3374f3f-8c0e-48c5-af7c-359ad6859473', 'Auth:1'),
('a3374f3f-8c33-4c5e-b707-c08abda2822f', 'Auth:1'),
('a3374f3f-8c58-45b1-9c82-0dccb835ab6f', 'Auth:1'),
('a3374f3f-8c8e-443f-a5ae-56684b7b8c78', 'Auth:1'),
('a3374f3f-8cb1-4176-b7f2-d11cd3c98262', 'Auth:1'),
('a3374f3f-8cd5-45dc-ae09-08ca7e8c3e5c', 'Auth:1'),
('a3374f3f-8cfa-4c9b-9ede-74ed526677f2', 'Auth:1'),
('a3374f3f-8d32-48a1-b8ec-e7b56e9647b3', 'Auth:1'),
('a3374f3f-8d57-42c1-b309-f07e5cb03424', 'Auth:1'),
('a3374f3f-8d7b-49d1-b310-c61eb20bb2fb', 'Auth:1'),
('a3374f3f-8da0-429a-ad39-04c569a24ff3', 'Auth:1'),
('a3374f3f-8dd6-46b8-ae38-5800e7bb1c97', 'Auth:1'),
('a3374f3f-8dfa-4a89-9d50-040f53cc44ed', 'Auth:1'),
('a3374f3f-8e1d-4102-9d62-f1bde9307491', 'Auth:1'),
('a3374f3f-8e42-49f2-90cc-e5799a97a3ea', 'Auth:1'),
('a3374f3f-8e76-4f3e-b609-db59b7cdc0c2', 'Auth:1'),
('a3374f3f-8e9a-4609-9320-2975851b2685', 'Auth:1'),
('a3374f3f-8ebf-4ff1-88c5-204e1ac65bcb', 'Auth:1'),
('a3374f3f-8ee2-4b4a-9ea4-36a535830ee8', 'Auth:1'),
('a3374f3f-8f1d-44fa-8ab8-2930c36af085', 'Auth:1'),
('a3374f3f-8f41-4204-aa10-dd056b70dc58', 'Auth:1'),
('a3374f3f-8f6c-47c3-8748-f3fb4c0f80d9', 'Auth:1'),
('a3374f3f-8f91-4abc-b9d9-017a5ba7e8ee', 'Auth:1'),
('a3374f3f-8fc7-4664-b506-6dfd53c45db7', 'Auth:1'),
('a3374f3f-8fea-4dd1-8faa-3c091c6f0a36', 'Auth:1'),
('a3374f3f-900e-4192-9bc1-410a163bd832', 'Auth:1'),
('a3374f3f-9031-4a72-bdb0-0ac013445562', 'Auth:1'),
('a3374f3f-9065-493c-87fb-e0bc1be20386', 'Auth:1'),
('a3374f3f-9088-48c7-8a7f-5ffd6fe89ddb', 'Auth:1'),
('a3374f3f-90aa-4e5f-a656-35a5a1faf7ed', 'Auth:1'),
('a3374f3f-90ce-4aa1-bdc1-06979241257e', 'Auth:1'),
('a3374f3f-9101-4c98-8555-ea3338653619', 'Auth:1'),
('a3374f3f-9124-4304-93fd-5debc6f9b540', 'Auth:1'),
('a3374f3f-914f-4b61-94f0-d2df4dd3315e', 'Auth:1'),
('a3374f3f-917c-4f21-aeb1-b0ceed62e781', 'Auth:1'),
('a3374f3f-91ca-4cb3-820d-991f4890db97', 'Auth:1'),
('a3374f3f-91f7-44ed-b595-829fd6f80faf', 'Auth:1'),
('a3374f3f-9222-44d2-b627-459c3daf8fb0', 'Auth:1'),
('a3374f3f-9248-4862-89b3-9cec07161c66', 'Auth:1'),
('a3374f3f-9281-424e-9d47-3b69a9f5da99', 'Auth:1'),
('a3374f3f-92a5-44df-89bf-e97a9ef04534', 'Auth:1'),
('a3374f3f-92c9-4263-b8c9-bfa2a223e7b1', 'Auth:1'),
('a3374f3f-92ed-40e0-b388-370138a7dcb5', 'Auth:1'),
('a3374f3f-9329-4cde-984e-3fd7ecbcd7a4', 'Auth:1'),
('a3374f3f-9380-4796-a862-76c5e0d513e1', 'Auth:1'),
('a3374f3f-93a6-4892-b257-6dad37716b6b', 'Auth:1'),
('a3374f3f-93cc-4ebe-9251-0c2c85a0c292', 'Auth:1'),
('a3374f3f-93fd-4858-a27e-8739a411e8c0', 'Auth:1'),
('a3374f3f-941d-49de-96ac-60028c937276', 'Auth:1'),
('a3374f3f-946b-4cd3-8f0d-d30cf52210d2', 'Auth:1'),
('a3374f3f-949e-4e6f-a9f3-a3540b54b2a1', 'Auth:1'),
('a3374f3f-94c9-415a-a630-99f08dee2729', 'Auth:1'),
('a3374f3f-94f7-416a-b6b0-fd2e1a2774e3', 'Auth:1'),
('a3374f3f-951a-4cb7-b3d7-fd603344b239', 'Auth:1'),
('a3374f3f-953a-44fb-adc5-3be65ae236c7', 'Auth:1'),
('a3374f3f-9557-411c-ac00-60d5db590ca4', 'Auth:1'),
('a3374f3f-9574-4dbc-a4d3-8c468918c4e2', 'Auth:1'),
('a3374f3f-9599-4f73-bc13-9cde9b0b512d', 'Auth:1'),
('a3374f3f-95bf-4bf4-ba7f-25b52192aea8', 'Auth:1'),
('a3374f3f-95e6-4b34-9e38-6646c7386435', 'Auth:1'),
('a3374f3f-961f-4252-80be-8968a2fb41f2', 'Auth:1'),
('a3374f3f-9646-4f25-a5ad-88098301bef1', 'Auth:1'),
('a3374f3f-966a-42b8-926e-4affb6bb951b', 'Auth:1'),
('a3374f3f-968f-4443-9e87-e7d0430c6576', 'Auth:1'),
('a3374f3f-96be-4970-9c25-51f3e2a89f75', 'Auth:1'),
('a3374f3f-96e3-440d-a265-590cc237fb93', 'Auth:1'),
('a3374f3f-9705-476f-a2d4-4692a293a595', 'Auth:1'),
('a3374f3f-9729-4512-b3c0-8b770c0333da', 'Auth:1'),
('a3374f3f-9757-40f1-9af2-1c34fd14de2b', 'Auth:1'),
('a3374f3f-9779-46c1-830e-53f5f815771d', 'Auth:1'),
('a3374f3f-979b-47e5-b268-6c212b462a99', 'Auth:1'),
('a3374f3f-97c7-42e0-9893-48e98487b64b', 'Auth:1'),
('a3374f3f-9801-428e-9b87-ed6d264bf245', 'Auth:1'),
('a3374f3f-9828-48b8-885c-5bad33b21678', 'Auth:1'),
('a3374f3f-9855-4805-b17f-338012aa05d1', 'Auth:1'),
('a3374f3f-9884-487b-8533-5bc4a1c72e0b', 'Auth:1'),
('a3374f3f-98b8-4be6-9d1e-62b33da83c06', 'Auth:1'),
('a3374f3f-98dd-48cb-a84f-7442fd7a67c5', 'Auth:1'),
('a3374f3f-9901-45b4-9fd6-08d5de57a0da', 'Auth:1'),
('a3374f3f-992d-417c-8eac-e995351b7d48', 'Auth:1'),
('a3374f3f-995f-4fe2-8fdb-93ea40b22f0d', 'Auth:1'),
('a3374f3f-9983-4973-b0cb-bb7055e364d7', 'Auth:1'),
('a3374f3f-99a6-49ef-8e5e-cdf4342ec61d', 'Auth:1'),
('a3374f3f-99cb-46a4-b4c5-2ea6321f6c71', 'Auth:1'),
('a3374f3f-99fc-4066-9729-04dddf4f0ebe', 'Auth:1'),
('a3374f3f-9a20-41b9-a39e-729666a4e93b', 'Auth:1'),
('a3374f3f-9a44-4ebe-86a8-ab31b8828003', 'Auth:1'),
('a3374f3f-9a69-480c-83b6-3a5e678d48cc', 'Auth:1'),
('a3374f3f-9a9a-4c7b-86d3-e24817dbc041', 'Auth:1'),
('a3374f3f-9abe-46c4-9b30-8f777061e5ee', 'Auth:1'),
('a3374f3f-9ae1-415e-b3ef-cbab62aac747', 'Auth:1'),
('a3374f3f-9b06-4370-be73-4808cc20383b', 'Auth:1'),
('a3374f3f-9b39-4156-991a-47bea181c17b', 'Auth:1'),
('a3374f3f-9b5b-40d9-9c38-9e42a7491056', 'Auth:1'),
('a3374f3f-9b7f-4b40-b85e-de8ce518b38e', 'Auth:1'),
('a3374f3f-9ba3-4402-b036-2a55d3540599', 'Auth:1'),
('a3374f3f-9bd4-4ec1-968f-b1a14368af42', 'Auth:1'),
('a3374f3f-9bf7-468a-86b4-5ef27338049a', 'Auth:1'),
('a3374f3f-9c1c-4602-865d-a19686a99c11', 'Auth:1'),
('a3374f3f-9c40-474f-9bb3-ac774684c3f7', 'Auth:1'),
('a3374f3f-9c70-4c54-bae8-a0ab8ef86f35', 'Auth:1'),
('a3374f3f-9c93-4b62-96c8-d4fcc20db5ff', 'Auth:1'),
('a3374f3f-9cb6-42a1-9098-5804220dbba4', 'Auth:1'),
('a3374f3f-9cda-4160-85a9-75c97f0cd1f3', 'Auth:1'),
('a3374f3f-9d09-4c15-8c72-9c3119bfca0b', 'Auth:1'),
('a3374f3f-9d2b-4dda-866d-66b6a49ba4cc', 'Auth:1'),
('a3374f3f-9d4d-40c6-92a7-050e666a3e11', 'Auth:1'),
('a3374f3f-9d71-4935-a1ca-3019a66d39ad', 'Auth:1'),
('a3374f3f-9da4-48d2-9c31-d96543868d84', 'Auth:1'),
('a3374f3f-9dc6-4420-8765-ec42b35b51c6', 'Auth:1'),
('a3374f3f-9de8-4058-879e-d0872c21c52a', 'Auth:1'),
('a3374f3f-9e0d-469e-a12d-53cc6cfe96eb', 'Auth:1'),
('a3374f3f-9e3f-4f54-8e4c-34fdfef463c1', 'Auth:1'),
('a3374f3f-9e76-437b-97d3-50cee91c6eea', 'Auth:1'),
('a3374f3f-9ea2-4ba2-9524-be7205450915', 'Auth:1'),
('a3374f3f-9edb-493c-ba3b-23cc9109c9b4', 'Auth:1'),
('a3374f3f-9f11-4feb-ba88-b34bab5fb742', 'Auth:1'),
('a3374f3f-9f35-4228-817a-23644cf2132f', 'Auth:1'),
('a3374f3f-9f5b-4b2a-83e7-11a2af8ad1be', 'Auth:1'),
('a3374f3f-9f84-480f-9770-f69b30b3830c', 'Auth:1'),
('a3374f3f-9fbe-4784-b89a-c406c5d7b38b', 'Auth:1'),
('a3374f3f-9fea-4569-8b3a-fcb978a91475', 'Auth:1'),
('a3374f3f-a013-4ef4-907a-850f2b664a53', 'Auth:1'),
('a3374f3f-a03b-4bad-89c6-05c22934f4dc', 'Auth:1'),
('a3374f3f-a06d-4914-bc54-2e98f52836a8', 'Auth:1'),
('a3374f3f-a093-4244-9cfb-bb15bac7dbb7', 'Auth:1'),
('a3374f3f-a0b8-4ea9-a536-2664a15d33ea', 'Auth:1'),
('a3374f3f-a0e2-459d-8d95-453b3a24c3af', 'Auth:1'),
('a3374f3f-a11a-42e6-bd4b-387a91697964', 'Auth:1'),
('a3374f3f-a13e-495c-8d01-0562648caefb', 'Auth:1'),
('a3374f3f-a16c-4f5f-b469-89a0e3716789', 'Auth:1'),
('a3374f3f-a196-4e24-833e-9f122441c1c0', 'Auth:1'),
('a3374f3f-a1c9-4f2c-962a-7cf224b34c83', 'Auth:1'),
('a3374f3f-a1ed-4d54-9572-b59850a113ac', 'Auth:1'),
('a3374f3f-a210-4235-b5a6-044da99b7b2c', 'Auth:1'),
('a3374f3f-a236-4d4c-8d88-258c4913a315', 'Auth:1'),
('a3374f3f-a26f-4abb-8353-2607ffa354b8', 'Auth:1'),
('a3374f3f-a297-49a9-b4b9-a874db74396e', 'Auth:1'),
('a3374f3f-a2bd-49d7-9216-c80eeaa04fb7', 'Auth:1'),
('a3374f3f-a2e1-451d-8011-a59d2c3a2bfb', 'Auth:1'),
('a3374f3f-a30c-406a-8658-0e31901fcaa4', 'Auth:1'),
('a3374f3f-a331-4110-be85-4e8fe2aec297', 'Auth:1'),
('a3374f3f-a356-4444-bf38-f5c3003d1469', 'Auth:1'),
('a3374f3f-a37b-44f4-b6de-a670023d7893', 'Auth:1'),
('a3374f3f-a3b6-404c-b14f-a2d566585059', 'Auth:1'),
('a3374f3f-a3da-4f22-80b6-663173db6640', 'Auth:1'),
('a3374f3f-a3fd-4f8a-874b-34f5bc2aa908', 'Auth:1'),
('a3374f3f-a420-43dc-a41e-f0729aa6b68f', 'Auth:1'),
('a3374f3f-a454-4212-9835-115b94a9af7b', 'Auth:1'),
('a3374f3f-a477-45bd-856a-5a2e1bdf2afc', 'Auth:1'),
('a3374f3f-a49a-4510-8869-f1e7583c3692', 'Auth:1'),
('a3374f3f-a4c3-4e6a-8602-7faf4b85064a', 'Auth:1'),
('a3374f3f-a4ff-4764-b67c-eb6757b64b5e', 'Auth:1'),
('a3374f3f-a523-4c9f-b5bc-ff85789f3d4a', 'Auth:1'),
('a3374f3f-a548-4fa0-9952-fa5451a0f644', 'Auth:1'),
('a3374f3f-a56c-4e96-9d37-a5d6dace8dc9', 'Auth:1'),
('a3374f3f-a5a2-45d1-8d47-6171d3ef6fcf', 'Auth:1'),
('a3374f3f-a5c5-4ae5-ab3c-7cead44cdec5', 'Auth:1'),
('a3374f3f-a5e8-4158-8261-8f24f3d824c9', 'Auth:1'),
('a3374f3f-a60c-404e-8da1-e291c40ddb80', 'Auth:1'),
('a3374f3f-a63d-411f-9734-7a2b5a6f0dda', 'Auth:1'),
('a3374f3f-a660-45dd-a17a-4b848f18143d', 'Auth:1'),
('a3374f3f-a685-465e-bfc5-880f371f21dd', 'Auth:1'),
('a3374f3f-a6a8-4702-822c-1690fd9698b4', 'Auth:1'),
('a3374f3f-a6d9-4e23-b8db-f3505dd09659', 'Auth:1'),
('a3374f3f-a6fb-4f9c-95bd-b93ff6f9b6a4', 'Auth:1'),
('a3374f3f-a71e-4cdb-bea5-7efdce03fece', 'Auth:1'),
('a3374f3f-a743-4416-b13a-87edfc60329b', 'Auth:1'),
('a3374f3f-a777-4ccc-83c5-a068a4e5f68e', 'Auth:1'),
('a3374f3f-a79d-4429-ade8-9cbac3055ac5', 'Auth:1'),
('a3374f3f-a7c1-437a-87fe-56a57bac72b6', 'Auth:1'),
('a3374f3f-a7e7-4860-9888-82d4f0238e96', 'Auth:1'),
('a3374f3f-a81d-491e-986d-2580377b0458', 'Auth:1'),
('a3374f3f-a841-4f93-8658-304737871e5e', 'Auth:1'),
('a3374f3f-a868-410e-8722-a5ee6a39dbc0', 'Auth:1'),
('a3374f3f-a893-4846-afeb-cc459733ab11', 'Auth:1'),
('a3374f3f-a8c5-48e1-8d70-879b7ff6eb41', 'Auth:1'),
('a3374f3f-a8e9-45d3-8dbe-1c9990cc5d60', 'Auth:1'),
('a3374f3f-a90c-40f7-95b7-afcc7cc7c020', 'Auth:1'),
('a3374f3f-a933-4140-8b72-53608dad5515', 'Auth:1'),
('a3374f3f-a964-4a66-9791-6db04728dc16', 'Auth:1'),
('a3374f3f-a987-4146-bc60-1b6ebb7b7887', 'Auth:1'),
('a3374f3f-a9ab-4ce0-9a39-badfcc755d96', 'Auth:1'),
('a3374f3f-a9cf-4cd8-9031-d300f73a5f3f', 'Auth:1'),
('a3374f3f-a9ff-46a5-9dd7-e11bf4ab5183', 'Auth:1'),
('a3374f3f-aa22-45b9-a1e9-cb0b57e79e10', 'Auth:1'),
('a3374f3f-aa45-430c-ab86-f9b84e9d4abd', 'Auth:1'),
('a3374f3f-aa71-4099-8aeb-958574d94fd5', 'Auth:1'),
('a3374f3f-aaa4-467e-a850-ef4061f643eb', 'Auth:1'),
('a3374f3f-aac7-4beb-b58e-066ad8bfcbe7', 'Auth:1'),
('a3374f3f-aae9-4777-9b13-291c3a4f2bb9', 'Auth:1'),
('a3374f3f-ab0c-447a-8c4a-463401997bf9', 'Auth:1'),
('a3374f3f-ab3e-47b0-bb77-0038eb1ce45a', 'Auth:1'),
('a3374f3f-ab65-472d-b139-9a9dca99a11f', 'Auth:1'),
('a3374f3f-ab8e-4337-b505-ec2c86ef463c', 'Auth:1'),
('a3374f3f-abba-47ce-9358-3c7499714fd2', 'Auth:1'),
('a3374f3f-abf3-47e3-9e6c-48c6e2472809', 'Auth:1'),
('a3374f3f-ac1a-43ac-9425-f30d6c583ae0', 'Auth:1'),
('a3374f3f-ac3e-4bef-b2eb-fedcbf0b2853', 'Auth:1'),
('a3374f3f-ac63-4ecf-b603-d5bf7c6bd4f6', 'Auth:1'),
('a3374f3f-ac95-4c37-b252-a2d0d181beba', 'Auth:1'),
('a3374f3f-acba-4494-a94a-9eca47937873', 'Auth:1'),
('a3374f3f-acdd-4d36-9618-3b2c00cbd6c2', 'Auth:1'),
('a3374f3f-ad02-43e8-8427-ad214dd7f439', 'Auth:1'),
('a3374f3f-ad32-4965-a299-a79087796816', 'Auth:1'),
('a3374f3f-ad55-44b5-ba58-f91270c3e155', 'Auth:1'),
('a3374f3f-ad78-407f-a968-2ff446996033', 'Auth:1'),
('a3374f3f-ad9c-48c8-a850-950d2f2ed190', 'Auth:1'),
('a3374f3f-adcb-4b91-85d0-001d739367dc', 'Auth:1'),
('a3374f3f-adf5-40a2-8943-0b5469c654c3', 'Auth:1'),
('a3374f3f-ae19-4516-87a6-15c0a46ba6e1', 'Auth:1'),
('a3374f3f-ae3e-4594-a767-e76d5a2965dc', 'Auth:1'),
('a3374f3f-ae6f-4812-b9e0-51a803abc392', 'Auth:1'),
('a3374f3f-ae98-4800-bece-269f15dc07fb', 'Auth:1'),
('a3374f3f-aec7-44c5-9e8a-5882e8e6fbf2', 'Auth:1'),
('a3374f3f-aeee-497c-83a6-1e22356ec88a', 'Auth:1'),
('a3374f3f-af1e-4f39-a3ad-459556d8a25b', 'Auth:1'),
('a3374f3f-af42-47e7-a6c3-2af441932ac0', 'Auth:1'),
('a3374f3f-af66-4526-b038-6cc09f091039', 'Auth:1'),
('a3374f3f-af8c-4467-80cd-88898409f9f1', 'Auth:1'),
('a3374f3f-afbb-4399-a12b-4e63d16b7222', 'Auth:1'),
('a3374f3f-afde-4898-9471-524b4d9677ea', 'Auth:1'),
('a3374f3f-b001-4f79-ab98-462aee02e3ca', 'Auth:1'),
('a3374f3f-b026-4dfc-958b-5ff642cf2b66', 'Auth:1'),
('a3374f3f-b055-4521-9fb9-e190b365a61b', 'Auth:1'),
('a3374f3f-b078-4396-875d-4e9c18545892', 'Auth:1'),
('a3374f3f-b09e-4516-b4f5-b59e89736d78', 'Auth:1'),
('a3374f3f-b0c3-4cb8-b621-d2f0e3f8d9fd', 'Auth:1'),
('a3374f3f-b0f4-429e-bd64-82e65ad2d3e1', 'Auth:1'),
('a3374f3f-b116-4507-8a67-cb313ee323c6', 'Auth:1'),
('a3374f3f-b139-4ed4-b672-55bad91138ca', 'Auth:1'),
('a3374f3f-b15f-4c7d-a212-e386a3f9f14f', 'Auth:1'),
('a3374f3f-b191-4030-9585-d948c6663e74', 'Auth:1'),
('a3374f3f-b1b8-4dcf-9e47-e33e10eb799d', 'Auth:1'),
('a3374f3f-b1e7-4b3a-a584-2ef430b2d94a', 'Auth:1'),
('a3374f3f-b211-479d-b6c1-3cda1d60cb6e', 'Auth:1'),
('a3374f3f-b246-446a-9e54-b60ed448ffea', 'Auth:1'),
('a3374f3f-b26d-48c0-950d-92633d80e236', 'Auth:1'),
('a3374f3f-b295-43dc-933f-1e6b936abdc7', 'Auth:1'),
('a3374f3f-b2bb-494b-889b-94505afdb993', 'Auth:1'),
('a3374f3f-b2eb-4470-9570-42ee65c95c4c', 'Auth:1'),
('a3374f3f-b30f-4d12-a6d5-148cc9792604', 'Auth:1'),
('a3374f3f-b332-46ce-be44-df9df2ac164f', 'Auth:1'),
('a3374f3f-b357-4a95-84aa-10ac96d75ea1', 'Auth:1'),
('a3374f3f-b38a-4d19-806d-b9b87a09204d', 'Auth:1'),
('a3374f3f-b3ad-4367-9f4c-a7c6ebbfc522', 'Auth:1'),
('a3374f3f-b3d0-449a-a120-53a2d4e849f5', 'Auth:1'),
('a3374f3f-b3f7-4ff5-ad84-d88ad0c38184', 'Auth:1'),
('a3374f3f-b42b-41b5-bc0a-de479452c3cc', 'Auth:1'),
('a3374f3f-b450-4508-a796-eab4927343af', 'Auth:1'),
('a3374f3f-b479-4efa-a3ee-d94e49f3136b', 'Auth:1'),
('a3374f3f-b4a8-4322-a0f1-47d8dc60353f', 'Auth:1'),
('a3374f3f-b4f5-4777-a685-cc7d01759b3b', 'Auth:1'),
('a3374f3f-b533-493d-89cc-1a4c5cd31484', 'Auth:1'),
('a3374f3f-b557-48b4-a0c6-035285f67edd', 'Auth:1'),
('a3374f3f-b57c-4b07-bc27-e73bf841fa88', 'Auth:1'),
('a3374f3f-b5aa-4e04-9e29-e1226f98f6e3', 'Auth:1'),
('a3374f3f-b5c8-4c56-967f-992f112e5061', 'Auth:1'),
('a3374f3f-b605-487a-9dcb-baab14ad7b0c', 'Auth:1'),
('a3374f3f-b629-4564-91d1-788202c1b8f1', 'Auth:1'),
('a3374f3f-b669-4588-afca-d1ffc4e2d1f4', 'Auth:1'),
('a3374f3f-b6b5-447a-add6-8e60b8983361', 'Auth:1'),
('a3374f3f-b6de-4bc7-9b52-d6c7f51ee73a', 'Auth:1'),
('a3374f3f-b6f9-4a3b-a66a-2fddb9d6bdff', 'Auth:1'),
('a3374f3f-b71c-4036-aa27-aa723fc9f202', 'Auth:1'),
('a3374f3f-b73a-437b-a927-d236daf67cd6', 'Auth:1'),
('a3374f3f-b75d-47b9-9b29-58ea0162b5dd', 'Auth:1'),
('a3374f3f-b779-4135-9044-fc8df08a0c14', 'Auth:1'),
('a3374f3f-b7a1-40ce-8e0a-45be3abb4354', 'Auth:1'),
('a3374f3f-b7d2-4899-84dd-bdc0ef85ae47', 'Auth:1'),
('a3374f3f-b800-4e32-b880-f8d63b146157', 'Auth:1'),
('a3374f3f-b82b-49a3-b419-49029fa0be9e', 'Auth:1'),
('a3374f3f-b864-4981-8442-293ad673b1fa', 'Auth:1'),
('a3374f3f-b890-4ee5-ad8f-bb8dedcc0d67', 'Auth:1'),
('a3374f3f-b8bb-4503-83e2-4d7bee60dc2f', 'Auth:1'),
('a3374f3f-b901-494b-9f2f-ee1f128fbc4d', 'Auth:1'),
('a3374f3f-b938-4b6c-b897-a8927be6d045', 'Auth:1'),
('a3374f3f-b969-4ef1-be38-550b1aa94d3e', 'Auth:1'),
('a3374f3f-b99e-4f39-8a3f-67337ff20509', 'Auth:1'),
('a3374f3f-b9cc-4c07-9724-b921b985703e', 'Auth:1'),
('a3374f3f-b9ec-457c-9cc8-d88464f10076', 'Auth:1'),
('a3374f3f-ba0c-4449-833c-17c4e979a91b', 'Auth:1'),
('a3374f3f-ba33-4f33-ae98-401bf48660c0', 'Auth:1'),
('a3374f3f-ba63-4978-b0df-a6d4599c6d61', 'Auth:1'),
('a3374f3f-ba90-4170-83b4-52ce3205deb6', 'Auth:1'),
('a3374f3f-baab-4e64-9060-1b5ce3b1a943', 'Auth:1'),
('a3374f3f-bad0-4dc7-8fad-d897d15ff74e', 'Auth:1'),
('a3374f3f-bd52-4266-8d2b-14879ac837f5', 'Auth:1'),
('a3374f73-d762-43d7-8b05-a2b7592db6f4', 'Auth:1'),
('a3374f73-d818-4740-a8fc-a6b5ffe33a6c', 'Auth:1'),
('a3374f73-d831-45d7-b2a1-52d4ba3b43af', 'Auth:1'),
('a3374f73-dcdc-4462-b40e-8e2e03a95f10', 'Auth:1'),
('a3374f73-dd31-4c5f-804c-835991bc7d26', 'Auth:1'),
('a3374f73-df00-4951-acfd-a9f2d3a8f1fa', 'Auth:1'),
('a3374f74-2e24-4258-8db3-bbd938f63f82', 'Auth:1'),
('a3374f74-2eae-4c5f-8fa3-10c934ecf414', 'Auth:1'),
('a3374f74-2ec5-4e44-a86e-7257b225063d', 'Auth:1'),
('a3374f74-311d-423a-8142-aea002b2c69c', 'Auth:1'),
('a3374f74-3311-4315-be1a-a4f943a4f21d', 'Auth:1'),
('a3374f76-ec12-4595-ab2f-c5e266a704ab', 'Auth:1'),
('a3374f76-ecb9-476f-9a68-279c55e11fc8', 'Auth:1'),
('a3374f76-ecd3-4aad-944c-46547af0fcc7', 'Auth:1'),
('a3374f76-f7f4-4b34-834b-64ba5be5dc64', 'Auth:1'),
('a3374f76-f83c-4ea2-ba7f-088ad6eb88d6', 'Auth:1'),
('a3374f76-f9df-45c6-b6da-4e0adc144458', 'Auth:1'),
('a3374f77-41a6-4074-8f91-3431882e7258', 'Auth:1'),
('a3374f77-4226-4ca8-a1ac-a8dce7a087e4', 'Auth:1'),
('a3374f77-423c-4a56-b776-1295c859df11', 'Auth:1'),
('a3374f77-44ef-4655-bd73-77a9619002c7', 'Auth:1'),
('a3374f77-4535-4f5c-9994-ccb056c9ee30', 'Auth:1'),
('a3374f77-454d-427f-8d5c-861a96357a1c', 'Auth:1'),
('a3374f77-4767-40c8-9e1c-5427a06979a1', 'Auth:1'),
('a3374f78-1e33-4f58-8382-a48b1c92c6d6', 'Auth:1'),
('a3374f78-1ee4-453e-b2e2-0a636067674c', 'Auth:1'),
('a3374f78-1ef9-499b-8ab3-e56085bb4dd8', 'Auth:1'),
('a3374f78-228d-4bf8-a563-5ff43b1002ef', 'Auth:1'),
('a3374f78-22cc-49d5-a1a4-92f144c3f095', 'Auth:1'),
('a3374f78-2416-4feb-864a-edc8c81cb436', 'Auth:1'),
('a3374f78-6ae6-44a5-9e81-4f8a632340ed', 'Auth:1'),
('a3374f78-6b71-4f80-8baa-f6e4863d5f68', 'Auth:1'),
('a3374f78-6b89-4a98-b3c4-0a0a1b20192c', 'Auth:1'),
('a3374f78-6db5-47cd-9308-91a9c144eef6', 'Auth:1'),
('a3374f78-6fc2-4f30-95fc-60478a3a9f18', 'Auth:1'),
('a3374f79-4d91-4ebb-b46b-083bb10cf498', 'Auth:1'),
('a3374f79-4d94-413a-bfb4-f643222de6bf', 'Auth:1'),
('a3374f79-4d94-4f93-8f87-ee59754d6662', 'Auth:1'),
('a3374f79-4e49-4c92-be6c-43009e269fd7', 'Auth:1'),
('a3374f79-4e61-411c-a66b-4326a9c03835', 'Auth:1'),
('a3374f79-4e64-42ec-b0b0-ee4e992e4ec7', 'Auth:1'),
('a3374f79-4e66-450a-91e7-9617b14bb26b', 'Auth:1'),
('a3374f79-4e87-4bf5-920d-b61634496a60', 'Auth:1'),
('a3374f79-4e8a-4b1d-869b-417f4d4decb5', 'Auth:1'),
('a3374f79-5100-4972-88c9-22898fee9856', 'Auth:1'),
('a3374f79-511f-45af-bbe1-789029c5df13', 'Auth:1'),
('a3374f79-5368-4232-9f1e-ed2973533500', 'Auth:1'),
('a3374f79-5846-4075-8ccc-ba954fb8d4de', 'Auth:1'),
('a3374f79-5846-4243-83f4-ccbb3b8f7624', 'Auth:1'),
('a3374f79-586d-4b6a-b1a5-3c506ae41d5f', 'Auth:1'),
('a3374f79-586d-4c0d-ac85-11eb17dadb70', 'Auth:1'),
('a3374f79-5a91-4f9c-9c92-c21e43bdd7c2', 'Auth:1'),
('a3374f79-5a92-4416-a6a4-2f393741e11a', 'Auth:1'),
('a3374fd0-7ec2-48e0-a8d6-23517b8d48a0', 'Auth:1'),
('a3374fd0-7f93-41c5-827b-909d1779f821', 'Auth:1'),
('a3374fd0-7fb0-4ee9-be86-b43038db80bf', 'Auth:1'),
('a3374fd0-811a-4c3e-b2f5-5c1a6026458b', 'Auth:1'),
('a3374fd0-82e9-4177-94fc-367fdacadae5', 'Auth:1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_ingresos`
--

CREATE TABLE `tipo_ingresos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_ingresos`
--

INSERT INTO `tipo_ingresos` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'POR COMPRAS', '', '2026-11-11 21:35:30', '2026-11-11 21:35:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_salidas`
--

CREATE TABLE `tipo_salidas` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_salidas`
--

INSERT INTO `tipo_salidas` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'POR PERDIDA', '', '2026-11-11 21:35:44', '2026-11-11 21:35:44'),
(2, 'VENCIMIENTO', '', '2026-11-11 21:35:51', '2026-11-11 21:35:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traspasos`
--

CREATE TABLE `traspasos` (
  `id` bigint UNSIGNED NOT NULL,
  `sucursal_origen_id` bigint UNSIGNED NOT NULL,
  `sucursal_destino_id` bigint UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `descripcion` varchar(900) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traspaso_detalles`
--

CREATE TABLE `traspaso_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `traspaso_id` bigint UNSIGNED NOT NULL,
  `ingreso_detalle_id` bigint UNSIGNED DEFAULT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `observacion` varchar(900) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medidas`
--

CREATE TABLE `unidad_medidas` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unidad_medidas`
--

INSERT INTO `unidad_medidas` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'UNIDAD', '2026-11-11 23:05:41', '2026-11-11 23:05:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_exp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `sucursal_todos` int NOT NULL DEFAULT '0',
  `fecha_registro` date NOT NULL,
  `acceso` int NOT NULL DEFAULT '1',
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `codigo`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `password`, `fono`, `correo`, `foto`, `tipo`, `role_id`, `sucursal_todos`, `fecha_registro`, `acceso`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', '', '0', '', '$2y$12$P9DGwH7ILCCr0uEGMfcfruOEg4XNs0TGuNcbyB4V6wtcxz04LdiQe', NULL, '', NULL, 'ADMINISTRACIÓN', 1, 1, '2026-11-10', 1, 1, '2026-11-10 15:14:24', '2026-11-10 15:14:24'),
(2, 'JPERES1', NULL, 'JUAN', 'PERES', 'MAMANI', '123456', 'LP', '$2y$12$7P.LW3ydVj2KN1vPOlg7wucMe5/20TbMrLyVyAb89bYOYKdnlZLsy', '67676767', 'juan@gmail.com', '2_3a1abb60-83ed-4641-b2df-e190ed816c23.jpg', 'EMPLEADO', 3, 0, '2026-11-11', 1, 1, '2026-11-11 22:50:13', '2026-11-11 23:02:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_sucursals`
--

CREATE TABLE `user_sucursals` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `sucursal_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_sucursals`
--

INSERT INTO `user_sucursals` (`id`, `user_id`, `sucursal_id`, `created_at`, `updated_at`) VALUES
(9, 2, 1, '2026-11-11 23:02:54', '2026-11-11 23:02:54'),
(10, 2, 2, '2026-11-11 23:02:54', '2026-11-11 23:02:54'),
(11, 2, 3, '2026-11-11 23:02:54', '2026-11-11 23:02:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo_venta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sucursal_id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `nit_ci` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_venta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metodo_pago_id` bigint UNSIGNED NOT NULL,
  `subtotal` decimal(24,2) NOT NULL,
  `descuento` decimal(24,2) NOT NULL,
  `porcentaje_descuento` double NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `saldo` decimal(24,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_cobros`
--

CREATE TABLE `venta_cobros` (
  `id` bigint UNSIGNED NOT NULL,
  `sucursal_id` bigint UNSIGNED NOT NULL,
  `venta_id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `monto` decimal(24,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalles`
--

CREATE TABLE `venta_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `venta_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `precio` decimal(24,2) NOT NULL,
  `descuento_uni` decimal(24,2) NOT NULL,
  `porcen_du` double NOT NULL,
  `descuento_total` decimal(24,2) NOT NULL,
  `porcen_dt` double NOT NULL,
  `precio_final` decimal(24,2) NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `total_uni` decimal(24,2) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_lotes`
--

CREATE TABLE `venta_lotes` (
  `id` bigint UNSIGNED NOT NULL,
  `venta_id` bigint UNSIGNED NOT NULL,
  `venta_detalle_id` bigint UNSIGNED NOT NULL,
  `ingreso_detalle_id` bigint UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_metodos`
--

CREATE TABLE `venta_metodos` (
  `id` bigint UNSIGNED NOT NULL,
  `venta_id` bigint UNSIGNED NOT NULL,
  `metodo_pago_id` bigint UNSIGNED NOT NULL,
  `monto` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorias_nombre_unique` (`nombre`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clientes_ci_ci_exp_unique` (`ci`,`ci_exp`),
  ADD KEY `clientes_user_id_foreign` (`user_id`),
  ADD KEY `clientes_status_ci_index` (`status`,`ci`),
  ADD KEY `clientes_status_paterno_index` (`status`,`paterno`),
  ADD KEY `clientes_status_fecha_registro_index` (`status`,`fecha_registro`);

--
-- Indices de la tabla `cobro_metodos`
--
ALTER TABLE `cobro_metodos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cobro_metodos_venta_cobro_id_foreign` (`venta_cobro_id`),
  ADD KEY `cobro_metodos_metodo_pago_id_foreign` (`metodo_pago_id`);

--
-- Indices de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `disciplina_plans`
--
ALTER TABLE `disciplina_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disciplina_plans_disciplina_id_foreign` (`disciplina_id`),
  ADD KEY `disciplina_plans_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_accions_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `ingreso_detalles`
--
ALTER TABLE `ingreso_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingreso_detalles_ingreso_producto_id_foreign` (`ingreso_producto_id`),
  ADD KEY `ingreso_detalles_tipo_ingreso_id_foreign` (`tipo_ingreso_id`),
  ADD KEY `ingreso_detalles_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `ingreso_faltantes`
--
ALTER TABLE `ingreso_faltantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingreso_faltantes_ingreso_producto_id_foreign` (`ingreso_producto_id`),
  ADD KEY `ingreso_faltantes_ingreso_detalle_id_foreign` (`ingreso_detalle_id`),
  ADD KEY `ingreso_faltantes_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `ingreso_metodos`
--
ALTER TABLE `ingreso_metodos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingreso_metodos_ingreso_producto_id_foreign` (`ingreso_producto_id`),
  ADD KEY `ingreso_metodos_metodo_pago_id_foreign` (`metodo_pago_id`);

--
-- Indices de la tabla `ingreso_pagos`
--
ALTER TABLE `ingreso_pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingreso_pagos_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `ingreso_pagos_ingreso_producto_id_foreign` (`ingreso_producto_id`),
  ADD KEY `ingreso_pagos_proveedor_id_foreign` (`proveedor_id`),
  ADD KEY `ingreso_pagos_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `ingreso_productos`
--
ALTER TABLE `ingreso_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingreso_productos_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `ingreso_productos_tipo_ingreso_id_foreign` (`tipo_ingreso_id`),
  ADD KEY `ingreso_productos_proveedor_id_foreign` (`proveedor_id`);

--
-- Indices de la tabla `ingreso_recepcions`
--
ALTER TABLE `ingreso_recepcions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingreso_recepcions_ingreso_producto_id_foreign` (`ingreso_producto_id`),
  ADD KEY `ingreso_recepcions_ingreso_detalle_id_foreign` (`ingreso_detalle_id`),
  ADD KEY `ingreso_recepcions_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `ingreso_recepcions_producto_id_foreign` (`producto_id`),
  ADD KEY `ingreso_recepcions_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `inscripcions`
--
ALTER TABLE `inscripcions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inscripcions_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `inscripcions_user_cliente_id_foreign` (`user_cliente_id`),
  ADD KEY `inscripcions_cliente_id_foreign` (`cliente_id`),
  ADD KEY `inscripcions_producto_id_foreign` (`producto_id`),
  ADD KEY `inscripcions_venta_detalle_id_foreign` (`venta_detalle_id`),
  ADD KEY `inscripcions_user_id_foreign` (`user_id`),
  ADD KEY `inscripcions_user_pausa_id_foreign` (`user_pausa_id`);

--
-- Indices de la tabla `kardex_productos`
--
ALTER TABLE `kardex_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kardex_productos_producto_id_foreign` (`producto_id`),
  ADD KEY `kardex_productos_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `kardex_productos_ingreso_detalle_id_foreign` (`ingreso_detalle_id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marcas_nombre_unique` (`nombre`);

--
-- Indices de la tabla `metodo_pagos`
--
ALTER TABLE `metodo_pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimiento_cajas`
--
ALTER TABLE `movimiento_cajas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movimiento_cajas_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `movimiento_cajas_metodo_pago_id_foreign` (`metodo_pago_id`),
  ADD KEY `movimiento_cajas_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `movimiento_metodos`
--
ALTER TABLE `movimiento_metodos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movimiento_metodos_movimiento_caja_id_foreign` (`movimiento_caja_id`),
  ADD KEY `movimiento_metodos_metodo_pago_id_foreign` (`metodo_pago_id`);

--
-- Indices de la tabla `notificacions`
--
ALTER TABLE `notificacions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificacion_users`
--
ALTER TABLE `notificacion_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notificacion_users_notificacion_id_foreign` (`notificacion_id`),
  ADD KEY `notificacion_users_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permisos_role_id_foreign` (`role_id`),
  ADD KEY `permisos_modulo_id_foreign` (`modulo_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `productos_codigo_unique` (`codigo`),
  ADD UNIQUE KEY `productos_nombre_unique` (`nombre`),
  ADD KEY `productos_categoria_id_foreign` (`categoria_id`),
  ADD KEY `productos_marca_id_foreign` (`marca_id`),
  ADD KEY `productos_unidad_medida_id_foreign` (`unidad_medida_id`);

--
-- Indices de la tabla `producto_promocions`
--
ALTER TABLE `producto_promocions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_promocions_producto_id_foreign` (`producto_id`),
  ADD KEY `producto_promocions_promocion_id_foreign` (`promocion_id`),
  ADD KEY `producto_promocions_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `producto_sucursals`
--
ALTER TABLE `producto_sucursals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_sucursals_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `producto_sucursals_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `proformas`
--
ALTER TABLE `proformas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proformas_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `proformas_cliente_id_foreign` (`cliente_id`),
  ADD KEY `proformas_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `proforma_detalles`
--
ALTER TABLE `proforma_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proforma_detalles_proforma_id_foreign` (`proforma_id`),
  ADD KEY `proforma_detalles_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `promocions`
--
ALTER TABLE `promocions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promocions_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salida_detalles`
--
ALTER TABLE `salida_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salida_detalles_salida_producto_id_foreign` (`salida_producto_id`),
  ADD KEY `salida_detalles_tipo_salida_id_foreign` (`tipo_salida_id`),
  ADD KEY `salida_detalles_ingreso_detalle_id_foreign` (`ingreso_detalle_id`),
  ADD KEY `salida_detalles_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `salida_productos`
--
ALTER TABLE `salida_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salida_productos_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `salida_productos_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `sucursals`
--
ALTER TABLE `sucursals`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`),
  ADD KEY `telescope_entries_created_at_index` (`created_at`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`);

--
-- Indices de la tabla `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD PRIMARY KEY (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- Indices de la tabla `telescope_monitoring`
--
ALTER TABLE `telescope_monitoring`
  ADD PRIMARY KEY (`tag`);

--
-- Indices de la tabla `tipo_ingresos`
--
ALTER TABLE `tipo_ingresos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_salidas`
--
ALTER TABLE `tipo_salidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `traspasos`
--
ALTER TABLE `traspasos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `traspasos_sucursal_origen_id_foreign` (`sucursal_origen_id`),
  ADD KEY `traspasos_sucursal_destino_id_foreign` (`sucursal_destino_id`),
  ADD KEY `traspasos_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `traspaso_detalles`
--
ALTER TABLE `traspaso_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `traspaso_detalles_traspaso_id_foreign` (`traspaso_id`),
  ADD KEY `traspaso_detalles_ingreso_detalle_id_foreign` (`ingreso_detalle_id`),
  ADD KEY `traspaso_detalles_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `unidad_medidas`
--
ALTER TABLE `unidad_medidas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unidad_medidas_nombre_unique` (`nombre`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ci_ci_exp_unique` (`ci`,`ci_exp`),
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`),
  ADD UNIQUE KEY `users_codigo_unique` (`codigo`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `user_sucursals`
--
ALTER TABLE `user_sucursals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_sucursals_user_id_foreign` (`user_id`),
  ADD KEY `user_sucursals_sucursal_id_foreign` (`sucursal_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `ventas_cliente_id_foreign` (`cliente_id`),
  ADD KEY `ventas_metodo_pago_id_foreign` (`metodo_pago_id`),
  ADD KEY `ventas_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `venta_cobros`
--
ALTER TABLE `venta_cobros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venta_cobros_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `venta_cobros_venta_id_foreign` (`venta_id`),
  ADD KEY `venta_cobros_cliente_id_foreign` (`cliente_id`),
  ADD KEY `venta_cobros_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `venta_detalles`
--
ALTER TABLE `venta_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venta_detalles_venta_id_foreign` (`venta_id`),
  ADD KEY `venta_detalles_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `venta_lotes`
--
ALTER TABLE `venta_lotes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta_metodos`
--
ALTER TABLE `venta_metodos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venta_metodos_venta_id_foreign` (`venta_id`),
  ADD KEY `venta_metodos_metodo_pago_id_foreign` (`metodo_pago_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cobro_metodos`
--
ALTER TABLE `cobro_metodos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `disciplina_plans`
--
ALTER TABLE `disciplina_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `ingreso_detalles`
--
ALTER TABLE `ingreso_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingreso_faltantes`
--
ALTER TABLE `ingreso_faltantes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingreso_metodos`
--
ALTER TABLE `ingreso_metodos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingreso_pagos`
--
ALTER TABLE `ingreso_pagos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingreso_productos`
--
ALTER TABLE `ingreso_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingreso_recepcions`
--
ALTER TABLE `ingreso_recepcions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripcions`
--
ALTER TABLE `inscripcions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `kardex_productos`
--
ALTER TABLE `kardex_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `metodo_pagos`
--
ALTER TABLE `metodo_pagos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimiento_cajas`
--
ALTER TABLE `movimiento_cajas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimiento_metodos`
--
ALTER TABLE `movimiento_metodos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificacions`
--
ALTER TABLE `notificacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificacion_users`
--
ALTER TABLE `notificacion_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto_promocions`
--
ALTER TABLE `producto_promocions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto_sucursals`
--
ALTER TABLE `producto_sucursals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proformas`
--
ALTER TABLE `proformas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proforma_detalles`
--
ALTER TABLE `proforma_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `promocions`
--
ALTER TABLE `promocions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `salida_detalles`
--
ALTER TABLE `salida_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salida_productos`
--
ALTER TABLE `salida_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucursals`
--
ALTER TABLE `sucursals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14771;

--
-- AUTO_INCREMENT de la tabla `tipo_ingresos`
--
ALTER TABLE `tipo_ingresos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_salidas`
--
ALTER TABLE `tipo_salidas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `traspasos`
--
ALTER TABLE `traspasos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `traspaso_detalles`
--
ALTER TABLE `traspaso_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidad_medidas`
--
ALTER TABLE `unidad_medidas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user_sucursals`
--
ALTER TABLE `user_sucursals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_cobros`
--
ALTER TABLE `venta_cobros`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_detalles`
--
ALTER TABLE `venta_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_lotes`
--
ALTER TABLE `venta_lotes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_metodos`
--
ALTER TABLE `venta_metodos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `cobro_metodos`
--
ALTER TABLE `cobro_metodos`
  ADD CONSTRAINT `cobro_metodos_metodo_pago_id_foreign` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodo_pagos` (`id`),
  ADD CONSTRAINT `cobro_metodos_venta_cobro_id_foreign` FOREIGN KEY (`venta_cobro_id`) REFERENCES `venta_cobros` (`id`);

--
-- Filtros para la tabla `disciplina_plans`
--
ALTER TABLE `disciplina_plans`
  ADD CONSTRAINT `disciplina_plans_disciplina_id_foreign` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplinas` (`id`),
  ADD CONSTRAINT `disciplina_plans_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD CONSTRAINT `historial_accions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `ingreso_detalles`
--
ALTER TABLE `ingreso_detalles`
  ADD CONSTRAINT `ingreso_detalles_ingreso_producto_id_foreign` FOREIGN KEY (`ingreso_producto_id`) REFERENCES `ingreso_productos` (`id`),
  ADD CONSTRAINT `ingreso_detalles_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `ingreso_detalles_tipo_ingreso_id_foreign` FOREIGN KEY (`tipo_ingreso_id`) REFERENCES `tipo_ingresos` (`id`);

--
-- Filtros para la tabla `ingreso_faltantes`
--
ALTER TABLE `ingreso_faltantes`
  ADD CONSTRAINT `ingreso_faltantes_ingreso_detalle_id_foreign` FOREIGN KEY (`ingreso_detalle_id`) REFERENCES `ingreso_detalles` (`id`),
  ADD CONSTRAINT `ingreso_faltantes_ingreso_producto_id_foreign` FOREIGN KEY (`ingreso_producto_id`) REFERENCES `ingreso_productos` (`id`),
  ADD CONSTRAINT `ingreso_faltantes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `ingreso_metodos`
--
ALTER TABLE `ingreso_metodos`
  ADD CONSTRAINT `ingreso_metodos_ingreso_producto_id_foreign` FOREIGN KEY (`ingreso_producto_id`) REFERENCES `ingreso_productos` (`id`),
  ADD CONSTRAINT `ingreso_metodos_metodo_pago_id_foreign` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodo_pagos` (`id`);

--
-- Filtros para la tabla `ingreso_pagos`
--
ALTER TABLE `ingreso_pagos`
  ADD CONSTRAINT `ingreso_pagos_ingreso_producto_id_foreign` FOREIGN KEY (`ingreso_producto_id`) REFERENCES `ingreso_productos` (`id`),
  ADD CONSTRAINT `ingreso_pagos_proveedor_id_foreign` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedors` (`id`),
  ADD CONSTRAINT `ingreso_pagos_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`),
  ADD CONSTRAINT `ingreso_pagos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `ingreso_productos`
--
ALTER TABLE `ingreso_productos`
  ADD CONSTRAINT `ingreso_productos_proveedor_id_foreign` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedors` (`id`),
  ADD CONSTRAINT `ingreso_productos_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`),
  ADD CONSTRAINT `ingreso_productos_tipo_ingreso_id_foreign` FOREIGN KEY (`tipo_ingreso_id`) REFERENCES `tipo_ingresos` (`id`);

--
-- Filtros para la tabla `ingreso_recepcions`
--
ALTER TABLE `ingreso_recepcions`
  ADD CONSTRAINT `ingreso_recepcions_ingreso_detalle_id_foreign` FOREIGN KEY (`ingreso_detalle_id`) REFERENCES `ingreso_detalles` (`id`),
  ADD CONSTRAINT `ingreso_recepcions_ingreso_producto_id_foreign` FOREIGN KEY (`ingreso_producto_id`) REFERENCES `ingreso_productos` (`id`),
  ADD CONSTRAINT `ingreso_recepcions_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `ingreso_recepcions_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`),
  ADD CONSTRAINT `ingreso_recepcions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `inscripcions`
--
ALTER TABLE `inscripcions`
  ADD CONSTRAINT `inscripcions_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `inscripcions_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `inscripcions_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`),
  ADD CONSTRAINT `inscripcions_user_cliente_id_foreign` FOREIGN KEY (`user_cliente_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `inscripcions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `inscripcions_user_pausa_id_foreign` FOREIGN KEY (`user_pausa_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `inscripcions_venta_detalle_id_foreign` FOREIGN KEY (`venta_detalle_id`) REFERENCES `venta_detalles` (`id`);

--
-- Filtros para la tabla `kardex_productos`
--
ALTER TABLE `kardex_productos`
  ADD CONSTRAINT `kardex_productos_ingreso_detalle_id_foreign` FOREIGN KEY (`ingreso_detalle_id`) REFERENCES `ingreso_detalles` (`id`),
  ADD CONSTRAINT `kardex_productos_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `kardex_productos_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`);

--
-- Filtros para la tabla `movimiento_cajas`
--
ALTER TABLE `movimiento_cajas`
  ADD CONSTRAINT `movimiento_cajas_metodo_pago_id_foreign` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodo_pagos` (`id`),
  ADD CONSTRAINT `movimiento_cajas_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`),
  ADD CONSTRAINT `movimiento_cajas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `movimiento_metodos`
--
ALTER TABLE `movimiento_metodos`
  ADD CONSTRAINT `movimiento_metodos_metodo_pago_id_foreign` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodo_pagos` (`id`),
  ADD CONSTRAINT `movimiento_metodos_movimiento_caja_id_foreign` FOREIGN KEY (`movimiento_caja_id`) REFERENCES `movimiento_cajas` (`id`);

--
-- Filtros para la tabla `notificacion_users`
--
ALTER TABLE `notificacion_users`
  ADD CONSTRAINT `notificacion_users_notificacion_id_foreign` FOREIGN KEY (`notificacion_id`) REFERENCES `notificacions` (`id`),
  ADD CONSTRAINT `notificacion_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_modulo_id_foreign` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`id`),
  ADD CONSTRAINT `permisos_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `productos_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`),
  ADD CONSTRAINT `productos_unidad_medida_id_foreign` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medidas` (`id`);

--
-- Filtros para la tabla `producto_promocions`
--
ALTER TABLE `producto_promocions`
  ADD CONSTRAINT `producto_promocions_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `producto_promocions_promocion_id_foreign` FOREIGN KEY (`promocion_id`) REFERENCES `promocions` (`id`),
  ADD CONSTRAINT `producto_promocions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `producto_sucursals`
--
ALTER TABLE `producto_sucursals`
  ADD CONSTRAINT `producto_sucursals_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `producto_sucursals_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`);

--
-- Filtros para la tabla `proformas`
--
ALTER TABLE `proformas`
  ADD CONSTRAINT `proformas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `proformas_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`),
  ADD CONSTRAINT `proformas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `proforma_detalles`
--
ALTER TABLE `proforma_detalles`
  ADD CONSTRAINT `proforma_detalles_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `proforma_detalles_proforma_id_foreign` FOREIGN KEY (`proforma_id`) REFERENCES `proformas` (`id`);

--
-- Filtros para la tabla `promocions`
--
ALTER TABLE `promocions`
  ADD CONSTRAINT `promocions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `salida_detalles`
--
ALTER TABLE `salida_detalles`
  ADD CONSTRAINT `salida_detalles_ingreso_detalle_id_foreign` FOREIGN KEY (`ingreso_detalle_id`) REFERENCES `ingreso_detalles` (`id`),
  ADD CONSTRAINT `salida_detalles_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `salida_detalles_salida_producto_id_foreign` FOREIGN KEY (`salida_producto_id`) REFERENCES `salida_productos` (`id`),
  ADD CONSTRAINT `salida_detalles_tipo_salida_id_foreign` FOREIGN KEY (`tipo_salida_id`) REFERENCES `tipo_salidas` (`id`);

--
-- Filtros para la tabla `salida_productos`
--
ALTER TABLE `salida_productos`
  ADD CONSTRAINT `salida_productos_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`),
  ADD CONSTRAINT `salida_productos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;

--
-- Filtros para la tabla `traspasos`
--
ALTER TABLE `traspasos`
  ADD CONSTRAINT `traspasos_sucursal_destino_id_foreign` FOREIGN KEY (`sucursal_destino_id`) REFERENCES `sucursals` (`id`),
  ADD CONSTRAINT `traspasos_sucursal_origen_id_foreign` FOREIGN KEY (`sucursal_origen_id`) REFERENCES `sucursals` (`id`),
  ADD CONSTRAINT `traspasos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `traspaso_detalles`
--
ALTER TABLE `traspaso_detalles`
  ADD CONSTRAINT `traspaso_detalles_ingreso_detalle_id_foreign` FOREIGN KEY (`ingreso_detalle_id`) REFERENCES `ingreso_detalles` (`id`),
  ADD CONSTRAINT `traspaso_detalles_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `traspaso_detalles_traspaso_id_foreign` FOREIGN KEY (`traspaso_id`) REFERENCES `traspasos` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `user_sucursals`
--
ALTER TABLE `user_sucursals`
  ADD CONSTRAINT `user_sucursals_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`),
  ADD CONSTRAINT `user_sucursals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ventas_metodo_pago_id_foreign` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodo_pagos` (`id`),
  ADD CONSTRAINT `ventas_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`),
  ADD CONSTRAINT `ventas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `venta_cobros`
--
ALTER TABLE `venta_cobros`
  ADD CONSTRAINT `venta_cobros_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `venta_cobros_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`),
  ADD CONSTRAINT `venta_cobros_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `venta_cobros_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `venta_detalles`
--
ALTER TABLE `venta_detalles`
  ADD CONSTRAINT `venta_detalles_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `venta_detalles_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `venta_metodos`
--
ALTER TABLE `venta_metodos`
  ADD CONSTRAINT `venta_metodos_metodo_pago_id_foreign` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodo_pagos` (`id`),
  ADD CONSTRAINT `venta_metodos_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
