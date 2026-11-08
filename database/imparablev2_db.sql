-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 08-11-2026 a las 21:12:55
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
(1, 'IMPARABLE V2', 'IMPARABLE', 'IMPARABLE S.A.', '11111111111', 'LA PAZ - BOLIVIA', 'LOS PEDREGALES #223', '2323232 - 7776666', NULL, 'ACTIVIDAD EMPRESA', 'imparable@gmail.com', 'logo.jpg', '2026-11-08 21:04:49', '2026-11-08 21:04:49');

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
  `cliente_id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint UNSIGNED NOT NULL,
  `promocion_id` bigint UNSIGNED DEFAULT NULL,
  `total` decimal(24,2) NOT NULL,
  `descuento` decimal(24,2) DEFAULT NULL,
  `porcentaje_descuento` double DEFAULT NULL,
  `cancelado` decimal(24,2) NOT NULL,
  `saldo` decimal(24,2) NOT NULL,
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
-- Estructura de tabla para la tabla `inscripcion_pagos`
--

CREATE TABLE `inscripcion_pagos` (
  `id` bigint UNSIGNED NOT NULL,
  `inscripcion_id` bigint UNSIGNED NOT NULL,
  `metodo_pago_id` bigint UNSIGNED NOT NULL,
  `monto` decimal(24,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
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
(39, '2026_11_08_163157_create_plans_table', 1),
(40, '2026_11_08_163202_create_promocions_table', 1),
(41, '2026_11_08_163219_create_sucursal_plans_table', 1),
(42, '2026_11_08_163230_create_plan_promocions_table', 1),
(43, '2026_11_08_163235_create_inscripcions_table', 1),
(44, '2026_11_08_163239_create_inscripcion_pagos_table', 1),
(45, '2026_11_08_163240_create_movimiento_cajas_table', 1),
(46, '2026_11_08_163241_create_movimiento_metodos_table', 1),
(47, '2026_11_08_164916_create_plan_disciplinas_table', 1),
(48, '2026_11_08_171238_create_telescope_entries_table', 2);

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
-- Estructura de tabla para la tabla `plans`
--

CREATE TABLE `plans` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` double NOT NULL,
  `dias` int NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `turno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_disciplinas`
--

CREATE TABLE `plan_disciplinas` (
  `id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint UNSIGNED NOT NULL,
  `disciplina_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_promocions`
--

CREATE TABLE `plan_promocions` (
  `id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint UNSIGNED NOT NULL,
  `promocion_id` bigint UNSIGNED NOT NULL,
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
  `categoria_id` bigint UNSIGNED NOT NULL,
  `marca_id` bigint UNSIGNED NOT NULL,
  `unidad_medida_id` bigint UNSIGNED NOT NULL,
  `caracteristicas` text COLLATE utf8mb4_unicode_ci,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(24,2) NOT NULL,
  `precio_compra` decimal(24,2) NOT NULL,
  `stock_min` double NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_registro` date NOT NULL,
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
(1, 'SUPER USUARIO', 1, 0, 1, '2026-11-08 21:04:49', '2026-11-08 21:04:49');

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
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sucursals`
--

INSERT INTO `sucursals` (`id`, `nombre`, `fono`, `dir`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'SUCURSAL 1', 'SUCURSAL 1', 'ZONA LOS PEDREGALES', '2026-11-08', '2026-11-08 21:04:49', '2026-11-08 21:04:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal_plans`
--

CREATE TABLE `sucursal_plans` (
  `id` bigint UNSIGNED NOT NULL,
  `sucursal_id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'a32dd4a0-421c-406d-b80f-0c5b5a0e8042', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select exists (select 1 from information_schema.tables where table_schema = schema() and table_name = \'migrations\' and table_type in (\'BASE TABLE\', \'SYSTEM VERSIONED\')) as `exists`\",\"time\":\"4.29\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"472343cbf78736393ab995dc1735b75f\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(2, 'a32dd4a0-4558-484c-b6cb-1fd835edb6e5', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select exists (select 1 from information_schema.tables where table_schema = schema() and table_name = \'migrations\' and table_type in (\'BASE TABLE\', \'SYSTEM VERSIONED\')) as `exists`\",\"time\":\"1.33\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"472343cbf78736393ab995dc1735b75f\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(3, 'a32dd4a0-4722-4b71-aa25-2a6dacb24e48', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"0.73\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"ed08a59c7f0b8851f0fd2291ca94d5c7\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(4, 'a32dd4a0-4802-431a-89bd-52e1d14808f4', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"0.32\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"ed08a59c7f0b8851f0fd2291ca94d5c7\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(5, 'a32dd4a0-4874-472c-b960-1dc675206cec', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`batch`) as aggregate from `migrations`\",\"time\":\"0.37\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"06e60d7b3d1a0c2de504de4e6f27735e\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(6, 'a32dd4a0-5107-48d4-b633-7b78642c1b16', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries` (`sequence` bigint unsigned not null auto_increment primary key, `uuid` char(36) not null, `batch_id` char(36) not null, `family_hash` varchar(255) null, `should_display_on_index` tinyint(1) not null default \'1\', `type` varchar(20) not null, `content` longtext not null, `created_at` datetime null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"9.79\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":24,\"hash\":\"d9429550f8856c1af1c89f24a6440cb5\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(7, 'a32dd4a0-54f2-4bc7-a2c5-7eaac8a0d18b', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add unique `telescope_entries_uuid_unique`(`uuid`)\",\"time\":\"9.44\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":24,\"hash\":\"9fb859ae1faff74c6b9e0b70dfd8eea9\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(8, 'a32dd4a0-5777-4a76-8f52-b921a19be3d6', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_batch_id_index`(`batch_id`)\",\"time\":\"5.95\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":24,\"hash\":\"2b075509a9242d6e3f622536c5ccca07\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(9, 'a32dd4a0-5a1e-417b-9548-c48f61060759', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_family_hash_index`(`family_hash`)\",\"time\":\"6.29\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":24,\"hash\":\"3d25a2a244bd2028dfa0326d3dbf7f4c\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(10, 'a32dd4a0-5cce-43a5-82d5-cf48cfa4549d', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_created_at_index`(`created_at`)\",\"time\":\"6.43\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":24,\"hash\":\"7352e7f84460fb7ffc450e7ea4de9dc7\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(11, 'a32dd4a0-5fd1-456d-ad3b-1b56fa62933c', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_type_should_display_on_index_index`(`type`, `should_display_on_index`)\",\"time\":\"7.22\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":24,\"hash\":\"7317a4cad2dfa1a5167548a6acd0b6a5\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(12, 'a32dd4a0-6329-4f4d-a4a5-fefe3b37a4a6', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries_tags` (`entry_uuid` char(36) not null, `tag` varchar(255) not null, primary key (`entry_uuid`, `tag`)) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.28\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":41,\"hash\":\"f8c7e1e3c3d557b70e7a918609f839f2\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(13, 'a32dd4a0-69fd-4736-ab54-81e97bcbef3b', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add index `telescope_entries_tags_tag_index`(`tag`)\",\"time\":\"16.88\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":41,\"hash\":\"0bdb35d17e876d6225a7774a2c17647d\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(14, 'a32dd4a0-757e-4222-b827-95289c581750', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add constraint `telescope_entries_tags_entry_uuid_foreign` foreign key (`entry_uuid`) references `telescope_entries` (`uuid`) on delete cascade\",\"time\":\"28.86\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":41,\"hash\":\"662a818f80a3a9ba2570081fd7a6af2f\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(15, 'a32dd4a0-78a6-46bf-bd50-f245f344e471', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_monitoring` (`tag` varchar(255) not null, primary key (`tag`)) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.40\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":54,\"hash\":\"18d1fa09eade84a80848982d91caec5c\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(16, 'a32dd4a0-7b5c-47bd-abb0-feec5a07f2c4', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_11_08_171238_create_telescope_entries_table\', 2)\",\"time\":\"1.59\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(17, 'a32dd4a0-7bea-4a89-aa3f-4d3c93ac363c', 'a32dd4a0-7ca8-4a9f-9a57-8793cd45f22d', NULL, 1, 'command', '{\"command\":\"migrate\",\"exit_code\":0,\"arguments\":{\"command\":\"migrate\"},\"options\":{\"database\":null,\"force\":false,\"path\":[],\"realpath\":false,\"schema-path\":null,\"pretend\":false,\"seed\":false,\"seeder\":null,\"step\":false,\"graceful\":false,\"isolated\":false,\"help\":false,\"silent\":false,\"quiet\":false,\"verbose\":false,\"version\":false,\"ansi\":null,\"no-interaction\":false,\"env\":null},\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:41'),
(18, 'a32dd4a3-fba7-4fd5-b716-6944a7a06d59', 'a32dd4a3-ffff-4231-a453-8e8b0fe9a2f1', NULL, 1, 'command', '{\"command\":\"optimize\",\"exit_code\":0,\"arguments\":{\"command\":\"optimize\"},\"options\":{\"except\":null,\"help\":false,\"silent\":false,\"quiet\":false,\"verbose\":false,\"version\":false,\"ansi\":null,\"no-interaction\":false,\"env\":null},\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-08 17:12:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `sucursal_id` bigint UNSIGNED DEFAULT NULL,
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

INSERT INTO `users` (`id`, `usuario`, `codigo`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `password`, `correo`, `foto`, `tipo`, `role_id`, `sucursal_id`, `sucursal_todos`, `fecha_registro`, `acceso`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', '', '0', '', '$2y$12$yLPlcnfSvr7hXRDjQAGL3OEj0BuTT0FyA.TTjxYm/qkMIzJdhidCa', '', NULL, 'ADMINISTRACIÓN', 1, NULL, 1, '2026-11-08', 1, 1, '2026-11-08 21:04:49', '2026-11-08 21:04:49');

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
  `metodo_pago_id` bigint UNSIGNED NOT NULL,
  `monto_efectivo` decimal(24,2) NOT NULL,
  `monto_qr` decimal(24,2) NOT NULL,
  `monto_total` decimal(24,2) NOT NULL,
  `saldo` decimal(24,2) NOT NULL,
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
  ADD UNIQUE KEY `ci_ci_exp_unique` (`ci`,`ci_exp`),
  ADD KEY `clientes_user_id_foreign` (`user_id`);

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
  ADD KEY `inscripcions_cliente_id_foreign` (`cliente_id`),
  ADD KEY `inscripcions_plan_id_foreign` (`plan_id`),
  ADD KEY `inscripcions_promocion_id_foreign` (`promocion_id`),
  ADD KEY `inscripcions_user_id_foreign` (`user_id`),
  ADD KEY `inscripcions_user_pausa_id_foreign` (`user_pausa_id`);

--
-- Indices de la tabla `inscripcion_pagos`
--
ALTER TABLE `inscripcion_pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inscripcion_pagos_inscripcion_id_foreign` (`inscripcion_id`),
  ADD KEY `inscripcion_pagos_metodo_pago_id_foreign` (`metodo_pago_id`),
  ADD KEY `inscripcion_pagos_user_id_foreign` (`user_id`);

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
-- Indices de la tabla `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plans_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `plan_disciplinas`
--
ALTER TABLE `plan_disciplinas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_disciplinas_plan_id_foreign` (`plan_id`),
  ADD KEY `plan_disciplinas_disciplina_id_foreign` (`disciplina_id`);

--
-- Indices de la tabla `plan_promocions`
--
ALTER TABLE `plan_promocions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_promocions_plan_id_foreign` (`plan_id`),
  ADD KEY `plan_promocions_promocion_id_foreign` (`promocion_id`);

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
-- Indices de la tabla `sucursal_plans`
--
ALTER TABLE `sucursal_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sucursal_plans_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `sucursal_plans_plan_id_foreign` (`plan_id`);

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
  ADD KEY `users_sucursal_id_foreign` (`sucursal_id`),
  ADD KEY `users_role_id_foreign` (`role_id`);

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
  ADD KEY `venta_cobros_metodo_pago_id_foreign` (`metodo_pago_id`),
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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
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
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `inscripcion_pagos`
--
ALTER TABLE `inscripcion_pagos`
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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodo_pagos`
--
ALTER TABLE `metodo_pagos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

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
-- AUTO_INCREMENT de la tabla `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plan_disciplinas`
--
ALTER TABLE `plan_disciplinas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plan_promocions`
--
ALTER TABLE `plan_promocions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sucursal_plans`
--
ALTER TABLE `sucursal_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tipo_ingresos`
--
ALTER TABLE `tipo_ingresos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_salidas`
--
ALTER TABLE `tipo_salidas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  ADD CONSTRAINT `inscripcions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  ADD CONSTRAINT `inscripcions_promocion_id_foreign` FOREIGN KEY (`promocion_id`) REFERENCES `promocions` (`id`),
  ADD CONSTRAINT `inscripcions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `inscripcions_user_pausa_id_foreign` FOREIGN KEY (`user_pausa_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `inscripcion_pagos`
--
ALTER TABLE `inscripcion_pagos`
  ADD CONSTRAINT `inscripcion_pagos_inscripcion_id_foreign` FOREIGN KEY (`inscripcion_id`) REFERENCES `inscripcions` (`id`),
  ADD CONSTRAINT `inscripcion_pagos_metodo_pago_id_foreign` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodo_pagos` (`id`),
  ADD CONSTRAINT `inscripcion_pagos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
-- Filtros para la tabla `plans`
--
ALTER TABLE `plans`
  ADD CONSTRAINT `plans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `plan_disciplinas`
--
ALTER TABLE `plan_disciplinas`
  ADD CONSTRAINT `plan_disciplinas_disciplina_id_foreign` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplinas` (`id`),
  ADD CONSTRAINT `plan_disciplinas_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`);

--
-- Filtros para la tabla `plan_promocions`
--
ALTER TABLE `plan_promocions`
  ADD CONSTRAINT `plan_promocions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `plan_promocions_promocion_id_foreign` FOREIGN KEY (`promocion_id`) REFERENCES `promocions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `productos_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`),
  ADD CONSTRAINT `productos_unidad_medida_id_foreign` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medidas` (`id`);

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
-- Filtros para la tabla `sucursal_plans`
--
ALTER TABLE `sucursal_plans`
  ADD CONSTRAINT `sucursal_plans_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sucursal_plans_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_sucursal_id_foreign` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursals` (`id`);

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
  ADD CONSTRAINT `venta_cobros_metodo_pago_id_foreign` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodo_pagos` (`id`),
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
