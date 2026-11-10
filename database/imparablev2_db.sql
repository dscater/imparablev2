-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-11-2026 a las 15:14:31
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
(1, 'IMPARABLE V2', 'IMPARABLE', 'IMPARABLE S.A.', '11111111111', 'LA PAZ - BOLIVIA', 'LOS PEDREGALES #223', '2323232 - 7776666', NULL, 'ACTIVIDAD EMPRESA', 'imparable@gmail.com', 'logo.jpg', '2026-11-10 15:14:24', '2026-11-10 15:14:24');

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
(1, 'SUPER USUARIO', 1, 0, 1, '2026-11-10 15:14:24', '2026-11-10 15:14:24');

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
(1, 'SUCURSAL 1', 'SUCURSAL 1', 'ZONA LOS PEDREGALES', '2026-11-10', '2026-11-10 15:14:24', '2026-11-10 15:14:24');

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
(1, 'a3315a70-b589-4fde-8844-7101ff12fb75', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select exists (select 1 from information_schema.tables where table_schema = schema() and table_name = \'migrations\' and table_type in (\'BASE TABLE\', \'SYSTEM VERSIONED\')) as `exists`\",\"time\":\"4.19\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"472343cbf78736393ab995dc1735b75f\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(2, 'a3315a70-bbdb-479f-abd4-8fb632355aad', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select exists (select 1 from information_schema.tables where table_schema = schema() and table_name = \'migrations\' and table_type in (\'BASE TABLE\', \'SYSTEM VERSIONED\')) as `exists`\",\"time\":\"1.89\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"472343cbf78736393ab995dc1735b75f\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(3, 'a3315a70-c082-494e-82c1-39699e2021ae', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `migrations` (`id` int unsigned not null auto_increment primary key, `migration` varchar(255) not null, `batch` int not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"9.64\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"246242198a8fbc1beb167611385ac644\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(4, 'a3315a70-c457-49b0-95f7-b7046ea42d8f', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select exists (select 1 from information_schema.tables where table_schema = schema() and table_name = \'migrations\' and table_type in (\'BASE TABLE\', \'SYSTEM VERSIONED\')) as `exists`\",\"time\":\"1.51\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"472343cbf78736393ab995dc1735b75f\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(5, 'a3315a70-c661-4e9e-a70f-51148cb247c7', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"1.18\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"ed08a59c7f0b8851f0fd2291ca94d5c7\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(6, 'a3315a70-c73f-46fe-a2cb-3c2770f8766b', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"0.34\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"ed08a59c7f0b8851f0fd2291ca94d5c7\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(7, 'a3315a70-ca9e-47d2-a925-9b94c202c921', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`batch`) as aggregate from `migrations`\",\"time\":\"0.41\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"06e60d7b3d1a0c2de504de4e6f27735e\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(8, 'a3315a70-cf30-47a2-9a9a-ae08a9d89b97', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `sucursals` (`id` bigint unsigned not null auto_increment primary key, `nombre` varchar(255) not null, `fono` varchar(255) null, `dir` varchar(800) null, `fecha_registro` date not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"8.58\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2014_10_12_000001_create_sucursals_table.php\",\"line\":16,\"hash\":\"b4b0696ff349f65a2de8ccd188d75b11\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(9, 'a3315a70-d1ee-41bc-8a51-dc94403f990f', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2014_10_12_000001_create_sucursals_table\', 1)\",\"time\":\"1.62\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(10, 'a3315a70-d530-45ba-88ef-7dfc421c70fb', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `roles` (`id` bigint unsigned not null auto_increment primary key, `nombre` varchar(255) not null, `permisos` int not null default \'0\', `usuarios` int not null default \'1\', `status` int not null default \'1\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.09\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2024_11_02_153309_create_roles_table.php\",\"line\":14,\"hash\":\"694fd44e068c15d504abb57328134539\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(11, 'a3315a70-d87b-4bb4-8fb5-536c43eba003', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2024_11_02_153309_create_roles_table\', 1)\",\"time\":\"1.66\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(12, 'a3315a70-dc0d-4b29-9f63-ab458dc45c4e', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `modulos` (`id` bigint unsigned not null auto_increment primary key, `modulo` varchar(255) not null, `nombre` varchar(255) not null, `accion` varchar(255) not null, `descripcion` varchar(300) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.94\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2024_11_02_153315_create_modulos_table.php\",\"line\":14,\"hash\":\"e597f0d6015674dc345bcb035e531636\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(13, 'a3315a70-df3d-4fb8-a482-f19d210131c9', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2024_11_02_153315_create_modulos_table\', 1)\",\"time\":\"1.64\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(14, 'a3315a70-e2b7-4ba9-ba36-c88ea81bb6c2', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `permisos` (`id` bigint unsigned not null auto_increment primary key, `role_id` bigint unsigned not null, `modulo_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.57\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2024_11_02_153316_create_permisos_table.php\",\"line\":14,\"hash\":\"2c9d89bf603d939ce6b7a7660a756d27\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(15, 'a3315a70-ed11-4479-ae2a-c1c1474c42fc', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `permisos` add constraint `permisos_role_id_foreign` foreign key (`role_id`) references `roles` (`id`)\",\"time\":\"25.96\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2024_11_02_153316_create_permisos_table.php\",\"line\":14,\"hash\":\"1869db9817b662b44ac0dc0e5b6b0bc2\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(16, 'a3315a70-f82b-4ae3-85a1-2d999c96945e', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `permisos` add constraint `permisos_modulo_id_foreign` foreign key (`modulo_id`) references `modulos` (`id`)\",\"time\":\"27.84\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2024_11_02_153316_create_permisos_table.php\",\"line\":14,\"hash\":\"c1d5e9b578dbd10efeb6b06ab9fae372\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(17, 'a3315a70-faff-4c3a-83c3-0c3346710b13', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2024_11_02_153316_create_permisos_table\', 1)\",\"time\":\"1.63\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(18, 'a3315a70-feec-4c8d-b295-e9e0b61c6112', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `users` (`id` bigint unsigned not null auto_increment primary key, `usuario` varchar(255) not null, `codigo` varchar(255) null, `nombre` varchar(255) not null, `paterno` varchar(255) not null, `materno` varchar(255) null, `ci` varchar(255) not null, `ci_exp` varchar(255) not null, `password` varchar(255) not null, `correo` varchar(255) null, `foto` varchar(255) null, `tipo` varchar(255) not null, `role_id` bigint unsigned null, `sucursal_todos` int not null default \'0\', `fecha_registro` date not null, `acceso` int not null default \'1\', `status` int not null default \'1\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"8.51\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2024_11_13_000002_create_users_table.php\",\"line\":16,\"hash\":\"c8bd564c91db3897a0c60648153a7dad\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(19, 'a3315a71-0a77-4029-80d4-63a65562737e', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add constraint `users_role_id_foreign` foreign key (`role_id`) references `roles` (`id`)\",\"time\":\"29.07\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2024_11_13_000002_create_users_table.php\",\"line\":16,\"hash\":\"dd5fcfdd8297905e43adfb37fb76bcfe\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(20, 'a3315a71-0ebc-484f-8e7a-cb3e94a333e7', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add unique `ci_ci_exp_unique`(`ci`, `ci_exp`)\",\"time\":\"10.52\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2024_11_13_000002_create_users_table.php\",\"line\":16,\"hash\":\"6e304cdb570433614bb7d2b6c45f5ca5\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(21, 'a3315a71-11fc-431a-beff-5ddeaca66e82', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add unique `users_usuario_unique`(`usuario`)\",\"time\":\"7.72\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2024_11_13_000002_create_users_table.php\",\"line\":16,\"hash\":\"f281ffef8df0f1ab73ec6ca044672146\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(22, 'a3315a71-153a-4986-932e-4b65a4bccfc0', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add unique `users_codigo_unique`(`codigo`)\",\"time\":\"7.88\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2024_11_13_000002_create_users_table.php\",\"line\":16,\"hash\":\"6b7aa5c56051602a70f2f7ff1a1249b6\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(23, 'a3315a71-18f4-43fa-b0ce-04175f643cfa', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2024_11_13_000002_create_users_table\', 1)\",\"time\":\"1.73\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(24, 'a3315a71-1d44-4bbf-b154-b0b785b55c57', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `historial_accions` (`id` bigint unsigned not null auto_increment primary key, `user_id` bigint unsigned not null, `accion` varchar(155) not null, `descripcion` text not null, `datos_original` json null, `datos_nuevo` json null, `modulo` varchar(155) not null, `fecha` date not null, `hora` time not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"9.65\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2024_11_13_000003_create_historial_accions_table.php\",\"line\":14,\"hash\":\"fa5d947cc628787b97d84341262053df\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(25, 'a3315a71-26f0-4c40-af35-032b3a668acf', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `historial_accions` add constraint `historial_accions_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"24.11\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2024_11_13_000003_create_historial_accions_table.php\",\"line\":14,\"hash\":\"f5f1082f5bcdc9e00ce901ff4837afa0\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(26, 'a3315a71-2a66-4d93-a31b-00ab1f0445cf', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2024_11_13_000003_create_historial_accions_table\', 1)\",\"time\":\"1.63\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(27, 'a3315a71-2e63-4bb4-9db0-f43a2fcf3c17', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `clientes` (`id` bigint unsigned not null auto_increment primary key, `nombre` varchar(255) not null, `paterno` varchar(255) not null, `materno` varchar(255) null, `ci` varchar(255) not null, `ci_exp` varchar(255) not null, `fecha_nac` date not null, `dir` varchar(255) null, `fono` varchar(155) null, `fono_ref` varchar(155) null, `correo` varchar(255) null, `foto` varchar(255) null, `user_id` bigint unsigned null, `fecha_registro` date null, `status` int not null default \'1\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"8.48\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_04_02_203435_create_clientes_table.php\",\"line\":14,\"hash\":\"a0b7079090409cda15ef18a67ffcfbc6\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(28, 'a3315a71-3a5b-4626-a132-223c31d7ae1b', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `clientes` add constraint `clientes_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"30.10\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_04_02_203435_create_clientes_table.php\",\"line\":14,\"hash\":\"ae84678823c2f10e7238bb53303558ea\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(29, 'a3315a71-3dbc-4655-88ab-2923de64de97', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `clientes` add unique `clientes_ci_ci_exp_unique`(`ci`, `ci_exp`)\",\"time\":\"8.24\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_04_02_203435_create_clientes_table.php\",\"line\":14,\"hash\":\"226db0caeb261d2cdb1c54e60f710492\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(30, 'a3315a71-4088-4f1e-94de-be3f50e121aa', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `clientes` add index `clientes_status_ci_index`(`status`, `ci`)\",\"time\":\"6.70\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_04_02_203435_create_clientes_table.php\",\"line\":14,\"hash\":\"818fc4633e5e534f49ea4b6c5113e9d3\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(31, 'a3315a71-435b-45e6-b31a-eb1f2156cc2c', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `clientes` add index `clientes_status_paterno_index`(`status`, `paterno`)\",\"time\":\"6.72\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_04_02_203435_create_clientes_table.php\",\"line\":14,\"hash\":\"d61c29352818ee247654fca82ee59ccf\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(32, 'a3315a71-469c-40d2-bf2e-6fd627006585', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `clientes` add index `clientes_status_fecha_registro_index`(`status`, `fecha_registro`)\",\"time\":\"7.86\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_04_02_203435_create_clientes_table.php\",\"line\":14,\"hash\":\"cfff5b63d25df81b3416338907b95634\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(33, 'a3315a71-496c-401e-a620-d980e734ac3d', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_04_02_203435_create_clientes_table\', 1)\",\"time\":\"1.53\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(34, 'a3315a71-4dab-4327-97ed-48c7b1f6c7eb', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `categorias` (`id` bigint unsigned not null auto_increment primary key, `nombre` varchar(255) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"9.39\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124903_create_categorias_table.php\",\"line\":14,\"hash\":\"2a13d00cb001700dfa671e2ed5c91e7c\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:20'),
(35, 'a3315a71-529a-4fa1-9a7e-51645c329baa', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `categorias` add unique `categorias_nombre_unique`(`nombre`)\",\"time\":\"12.03\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124903_create_categorias_table.php\",\"line\":14,\"hash\":\"02043ec82717bae6374f558ac5b69206\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(36, 'a3315a71-5570-4238-8061-d9d33dd7496a', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_124903_create_categorias_table\', 1)\",\"time\":\"1.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(37, 'a3315a71-5913-4f90-ae9b-303d1cdc5d9a', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `marcas` (`id` bigint unsigned not null auto_increment primary key, `nombre` varchar(255) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"8.10\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124904_create_marcas_table.php\",\"line\":14,\"hash\":\"58f640c70fa2b81c6efad62386cfd367\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(38, 'a3315a71-6150-4d75-93ef-5fa5ff43a77d', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `marcas` add unique `marcas_nombre_unique`(`nombre`)\",\"time\":\"20.55\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124904_create_marcas_table.php\",\"line\":14,\"hash\":\"1043f08ff7039d82dc281b40f09d1a49\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(39, 'a3315a71-652e-4c11-8311-85c699e0e91c', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_124904_create_marcas_table\', 1)\",\"time\":\"3.02\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(40, 'a3315a71-6b04-487e-ad3b-9d152700d95e', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `unidad_medidas` (`id` bigint unsigned not null auto_increment primary key, `nombre` varchar(255) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"13.90\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124904_create_unidad_medidas_table.php\",\"line\":14,\"hash\":\"b7c9dbe76a3848ed9d4d3cb2bea339a0\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(41, 'a3315a71-785c-4ab3-b295-107fa8853127', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `unidad_medidas` add unique `unidad_medidas_nombre_unique`(`nombre`)\",\"time\":\"33.79\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124904_create_unidad_medidas_table.php\",\"line\":14,\"hash\":\"47ff92f9a667fc6975ac83e0b1b77ea5\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(42, 'a3315a71-7b25-4511-8712-f03a98aae9ce', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_124904_create_unidad_medidas_table\', 1)\",\"time\":\"2.74\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(43, 'a3315a71-8070-426a-a027-2d2d38b42089', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `productos` (`id` bigint unsigned not null auto_increment primary key, `codigo` varchar(255) not null, `nombre` varchar(255) not null, `categoria_id` bigint unsigned not null, `marca_id` bigint unsigned not null, `unidad_medida_id` bigint unsigned not null, `caracteristicas` text null, `tipo` varchar(255) not null, `precio` decimal(24, 2) not null, `precio_compra` decimal(24, 2) not null, `stock_min` double not null, `imagen` varchar(255) null, `activo` tinyint(1) not null default \'1\', `fecha_registro` date not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"11.92\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124905_create_productos_table.php\",\"line\":14,\"hash\":\"120f559e3f39521add236f3c43ca3f24\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(44, 'a3315a71-8d74-444d-a848-67323f84f48f', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `productos` add constraint `productos_categoria_id_foreign` foreign key (`categoria_id`) references `categorias` (`id`)\",\"time\":\"32.88\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124905_create_productos_table.php\",\"line\":14,\"hash\":\"51ae49bc1535f42113a70fc7f545ad21\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(45, 'a3315a71-9721-46f8-803c-ef82b589fc68', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `productos` add constraint `productos_marca_id_foreign` foreign key (`marca_id`) references `marcas` (`id`)\",\"time\":\"24.34\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124905_create_productos_table.php\",\"line\":14,\"hash\":\"7162e2c2113764102be49366262aedda\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(46, 'a3315a71-ab3f-434d-8843-8ca2fc32de19', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `productos` add constraint `productos_unidad_medida_id_foreign` foreign key (`unidad_medida_id`) references `unidad_medidas` (`id`)\",\"time\":\"51.06\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124905_create_productos_table.php\",\"line\":14,\"hash\":\"262ceacc6743d7d7139bd2a0b7af0cce\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(47, 'a3315a71-aefe-4f6d-b976-4f66c0007490', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `productos` add unique `productos_codigo_unique`(`codigo`)\",\"time\":\"9.03\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124905_create_productos_table.php\",\"line\":14,\"hash\":\"9cbedb7a2e4877feee5557a69e791d7c\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(48, 'a3315a71-b24e-46d3-9385-66cfa5a50eee', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `productos` add unique `productos_nombre_unique`(`nombre`)\",\"time\":\"8.05\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124905_create_productos_table.php\",\"line\":14,\"hash\":\"4f1e202cd72f01551586699d6a4e20b8\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(49, 'a3315a71-b548-44bf-a81b-f62d549ce5cc', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_124905_create_productos_table\', 1)\",\"time\":\"1.58\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(50, 'a3315a71-b89c-41b2-9c6c-7e7522408091', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `tipo_ingresos` (`id` bigint unsigned not null auto_increment primary key, `nombre` varchar(255) not null, `descripcion` text null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.39\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124928_create_tipo_ingresos_table.php\",\"line\":14,\"hash\":\"df925e08b77a1e38dd3b129545e22af7\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(51, 'a3315a71-bb59-412f-a246-f9cf066daceb', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_124928_create_tipo_ingresos_table\', 1)\",\"time\":\"1.77\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(52, 'a3315a71-c01a-4456-95b7-a8f0127f8a31', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `tipo_salidas` (`id` bigint unsigned not null auto_increment primary key, `nombre` varchar(255) not null, `descripcion` text null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"11.29\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124932_create_tipo_salidas_table.php\",\"line\":14,\"hash\":\"0945b7e63d861396011f2f83008fc3b3\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(53, 'a3315a71-c2a9-480c-9abc-2c887290814e', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_124932_create_tipo_salidas_table\', 1)\",\"time\":\"1.49\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(54, 'a3315a71-c5e0-4280-a8af-78017f3f18a5', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `metodo_pagos` (`id` bigint unsigned not null auto_increment primary key, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.43\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124938_create_metodo_pagos_table.php\",\"line\":14,\"hash\":\"2b9290f4bfc6a6bb2ed9cdf4ad8c940a\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(55, 'a3315a71-c86c-4508-a595-6efca17e2fe3', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_124938_create_metodo_pagos_table\', 1)\",\"time\":\"1.52\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(56, 'a3315a71-cc06-48de-a1c9-a9d3c5228589', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `proveedors` (`id` bigint unsigned not null auto_increment primary key, `nombre` varchar(255) not null, `contacto` varchar(600) null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.99\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124938_create_proveedors_table.php\",\"line\":14,\"hash\":\"4cc01b45aa144243ea07ea92d93a9247\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(57, 'a3315a71-cebe-4634-afe3-9bccc19de610', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_124938_create_proveedors_table\', 1)\",\"time\":\"1.85\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(58, 'a3315a71-d2bb-48c9-802d-95ff93a31c2b', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ingreso_productos` (`id` bigint unsigned not null auto_increment primary key, `codigo` varchar(255) not null, `sucursal_id` bigint unsigned not null, `tipo_ingreso_id` bigint unsigned not null, `proveedor_id` bigint unsigned not null, `descripcion` varchar(255) not null, `total` decimal(24, 2) not null, `saldo` decimal(24, 2) not null, `tipo_compra` varchar(255) not null, `fecha_registro` date null, `user_id` bigint unsigned not null, `estado_ingreso` varchar(255) not null default \'PENDIENTE\', `estado_faltantes` varchar(255) null, `status` int not null default \'1\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"8.96\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124939_create_ingreso_productos_table.php\",\"line\":14,\"hash\":\"85fc4628a19af93cdeb96fc1120da9ad\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(59, 'a3315a71-dd17-44f3-abf5-050c289d7f1b', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_productos` add constraint `ingreso_productos_sucursal_id_foreign` foreign key (`sucursal_id`) references `sucursals` (`id`)\",\"time\":\"26.05\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124939_create_ingreso_productos_table.php\",\"line\":14,\"hash\":\"eb9cbf971764292449447d7589441eed\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(60, 'a3315a71-e882-4dd4-abe6-963045b04303', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_productos` add constraint `ingreso_productos_tipo_ingreso_id_foreign` foreign key (`tipo_ingreso_id`) references `tipo_ingresos` (`id`)\",\"time\":\"28.81\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124939_create_ingreso_productos_table.php\",\"line\":14,\"hash\":\"bd9039956a555ad59d762c37202197fb\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(61, 'a3315a71-f5ba-436d-8393-548954101bc0', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_productos` add constraint `ingreso_productos_proveedor_id_foreign` foreign key (`proveedor_id`) references `proveedors` (`id`)\",\"time\":\"33.41\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124939_create_ingreso_productos_table.php\",\"line\":14,\"hash\":\"972e8d11dd70236a1ab695d326b439b5\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(62, 'a3315a71-f868-404e-8771-a0b81b0ea5c4', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_124939_create_ingreso_productos_table\', 1)\",\"time\":\"1.63\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(63, 'a3315a71-fb99-48b7-b2a4-912fa5a32718', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ingreso_metodos` (`id` bigint unsigned not null auto_increment primary key, `ingreso_producto_id` bigint unsigned not null, `metodo_pago_id` bigint unsigned not null, `monto` decimal(24, 2) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.02\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124940_create_ingreso_metodos_table.php\",\"line\":14,\"hash\":\"7ae16ff5d591e9c684266af0fcb6aabc\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(64, 'a3315a72-0522-4feb-945b-723807bae896', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_metodos` add constraint `ingreso_metodos_ingreso_producto_id_foreign` foreign key (`ingreso_producto_id`) references `ingreso_productos` (`id`)\",\"time\":\"24.02\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124940_create_ingreso_metodos_table.php\",\"line\":14,\"hash\":\"41956fa97a99eeb766dd4e4d04e6982e\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(65, 'a3315a72-10bc-4835-8478-666e41687720', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_metodos` add constraint `ingreso_metodos_metodo_pago_id_foreign` foreign key (`metodo_pago_id`) references `metodo_pagos` (`id`)\",\"time\":\"29.33\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_124940_create_ingreso_metodos_table.php\",\"line\":14,\"hash\":\"2a8fd0a48d08605852397bc3c6cdc9c4\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(66, 'a3315a72-1310-4492-83a6-e30251b5fbeb', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_124940_create_ingreso_metodos_table\', 1)\",\"time\":\"1.67\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(67, 'a3315a72-165b-4612-a00e-083b8aeb176e', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ingreso_detalles` (`id` bigint unsigned not null auto_increment primary key, `ingreso_producto_id` bigint unsigned not null, `tipo_ingreso_id` bigint unsigned not null, `producto_id` bigint unsigned not null, `cantidad` double not null, `verificado` double not null default \'0\', `faltantes` int null, `repuesto` double not null default \'0\', `observacion` varchar(900) null, `cantidad_fisica` double null, `costo` decimal(24, 2) not null, `subtotal` decimal(24, 2) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.10\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140254_create_ingreso_detalles_table.php\",\"line\":14,\"hash\":\"395dba920dd6a8bf83703ab10626a5b0\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(68, 'a3315a72-2120-4504-a67a-2a846f2e1c90', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_detalles` add constraint `ingreso_detalles_ingreso_producto_id_foreign` foreign key (`ingreso_producto_id`) references `ingreso_productos` (`id`)\",\"time\":\"27.16\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140254_create_ingreso_detalles_table.php\",\"line\":14,\"hash\":\"a8acc949b0302e8f39a0d5581e022187\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(69, 'a3315a72-2c0b-4855-b280-6f65116e98c2', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_detalles` add constraint `ingreso_detalles_tipo_ingreso_id_foreign` foreign key (`tipo_ingreso_id`) references `tipo_ingresos` (`id`)\",\"time\":\"27.48\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140254_create_ingreso_detalles_table.php\",\"line\":14,\"hash\":\"2c4b6efd44305eb53f7fed267bf62fdf\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(70, 'a3315a72-3831-40ac-86bd-91913fd31ae7', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_detalles` add constraint `ingreso_detalles_producto_id_foreign` foreign key (`producto_id`) references `productos` (`id`)\",\"time\":\"30.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140254_create_ingreso_detalles_table.php\",\"line\":14,\"hash\":\"7634e9fd7ccb9a736ebfa605e660e0c6\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(71, 'a3315a72-3aab-4ca1-9287-bda51abdd039', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_140254_create_ingreso_detalles_table\', 1)\",\"time\":\"1.68\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(72, 'a3315a72-3e28-4049-a588-405789496ab3', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `salida_productos` (`id` bigint unsigned not null auto_increment primary key, `sucursal_id` bigint unsigned not null, `cantidad` double not null, `descripcion` varchar(800) not null, `fecha_registro` date not null, `user_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.31\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140255_create_salida_productos_table.php\",\"line\":14,\"hash\":\"2cf2a6868bbf5de3fa75e3ade9dfbbaa\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(73, 'a3315a72-4787-4691-bc62-98db96701b60', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `salida_productos` add constraint `salida_productos_sucursal_id_foreign` foreign key (`sucursal_id`) references `sucursals` (`id`)\",\"time\":\"23.59\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140255_create_salida_productos_table.php\",\"line\":14,\"hash\":\"14db93f0f4a285b45b1b54700ca926ee\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(74, 'a3315a72-5314-403e-9e7c-703e01d502d8', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `salida_productos` add constraint `salida_productos_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"29.19\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140255_create_salida_productos_table.php\",\"line\":14,\"hash\":\"a97135b0fb0152113f66f1e867da8c9b\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(75, 'a3315a72-55bc-43e8-aaf8-c9dae97d117a', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_140255_create_salida_productos_table\', 1)\",\"time\":\"1.55\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(76, 'a3315a72-591e-4c66-9c86-54cf1423fa36', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ventas` (`id` bigint unsigned not null auto_increment primary key, `codigo_venta` varchar(255) null, `sucursal_id` bigint unsigned not null, `cliente_id` bigint unsigned not null, `nit_ci` varchar(255) null, `tipo_venta` varchar(255) not null, `metodo_pago_id` bigint unsigned not null, `subtotal` decimal(24, 2) not null, `descuento` decimal(24, 2) not null, `porcentaje_descuento` double not null, `total` decimal(24, 2) not null, `saldo` decimal(24, 2) not null, `fecha` date not null, `hora` time not null, `fecha_registro` date null, `status` int not null default \'1\', `user_id` bigint unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.56\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140303_create_ventas_table.php\",\"line\":14,\"hash\":\"1e18b62fcf5a95934c7526c07d67a3cf\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(77, 'a3315a72-63e9-44c7-b8d4-ecf4c5c3bba5', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ventas` add constraint `ventas_sucursal_id_foreign` foreign key (`sucursal_id`) references `sucursals` (`id`)\",\"time\":\"27.22\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140303_create_ventas_table.php\",\"line\":14,\"hash\":\"b09e16f1a7d726c0ffba46e63d7e45cb\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(78, 'a3315a72-70e4-4e42-b43a-7ef04a62f0d4', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ventas` add constraint `ventas_cliente_id_foreign` foreign key (`cliente_id`) references `clientes` (`id`)\",\"time\":\"32.83\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140303_create_ventas_table.php\",\"line\":14,\"hash\":\"9053c8ee6227bfa98a292a02506a481e\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(79, 'a3315a72-7db0-493d-b81f-2b4253e1109b', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ventas` add constraint `ventas_metodo_pago_id_foreign` foreign key (`metodo_pago_id`) references `metodo_pagos` (`id`)\",\"time\":\"32.25\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140303_create_ventas_table.php\",\"line\":14,\"hash\":\"3084990383340a7f0d77df7f2a99917f\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(80, 'a3315a72-8b2b-4276-b04b-1b6895b456df', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ventas` add constraint `ventas_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"33.92\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140303_create_ventas_table.php\",\"line\":14,\"hash\":\"ae52b933aceb557a81037e7acd4cd6c4\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(81, 'a3315a72-8dce-4ff6-9d40-3b7a93c15eed', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_140303_create_ventas_table\', 1)\",\"time\":\"1.59\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(82, 'a3315a72-9135-4c7e-86d9-aa4b77088952', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `venta_metodos` (`id` bigint unsigned not null auto_increment primary key, `venta_id` bigint unsigned not null, `metodo_pago_id` bigint unsigned not null, `monto` decimal(24, 2) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.39\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140304_create_venta_metodos_table.php\",\"line\":14,\"hash\":\"edbf9166f7b2826543fc269f055fbbc4\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(83, 'a3315a72-9b78-443e-b418-d8f558a00e12', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `venta_metodos` add constraint `venta_metodos_venta_id_foreign` foreign key (`venta_id`) references `ventas` (`id`)\",\"time\":\"25.93\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140304_create_venta_metodos_table.php\",\"line\":14,\"hash\":\"8a51042950027154b528d166a88f409f\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(84, 'a3315a72-a799-4413-91f1-d8354b5de7fe', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `venta_metodos` add constraint `venta_metodos_metodo_pago_id_foreign` foreign key (`metodo_pago_id`) references `metodo_pagos` (`id`)\",\"time\":\"30.56\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140304_create_venta_metodos_table.php\",\"line\":14,\"hash\":\"53f16d8227b7179690da37ff97bcd94a\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(85, 'a3315a72-aa4b-4e2b-9c71-d3a0f96c34f5', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_140304_create_venta_metodos_table\', 1)\",\"time\":\"1.61\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(86, 'a3315a72-addf-477c-b92c-8d2766ea9a18', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `venta_detalles` (`id` bigint unsigned not null auto_increment primary key, `venta_id` bigint unsigned not null, `producto_id` bigint unsigned not null, `cantidad` double not null, `precio` decimal(24, 2) not null, `descuento_uni` decimal(24, 2) not null, `porcen_du` double not null, `descuento_total` decimal(24, 2) not null, `porcen_dt` double not null, `precio_final` decimal(24, 2) not null, `total` decimal(24, 2) not null, `total_uni` decimal(24, 2) not null, `status` int not null default \'1\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.57\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140306_create_venta_detalles_table.php\",\"line\":14,\"hash\":\"6a5ba7a4bf2be238f52748afe70132c1\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(87, 'a3315a72-b89f-4afe-937f-6d69ad31eb45', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `venta_detalles` add constraint `venta_detalles_venta_id_foreign` foreign key (`venta_id`) references `ventas` (`id`)\",\"time\":\"27.07\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140306_create_venta_detalles_table.php\",\"line\":14,\"hash\":\"1c2f0166dbb1f8d763ee628e67f6c63d\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(88, 'a3315a72-c51d-45f3-bb4e-40f651f94580', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `venta_detalles` add constraint `venta_detalles_producto_id_foreign` foreign key (`producto_id`) references `productos` (`id`)\",\"time\":\"31.49\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140306_create_venta_detalles_table.php\",\"line\":14,\"hash\":\"422a4e673f38211dc9a3a5944b677496\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(89, 'a3315a72-c7c2-4763-b36c-820ef92f0f1b', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_140306_create_venta_detalles_table\', 1)\",\"time\":\"1.66\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(90, 'a3315a72-cbfe-4bdb-90fa-86de07a577f8', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `kardex_productos` (`id` bigint unsigned not null auto_increment primary key, `sucursal_id` bigint unsigned not null, `ingreso_detalle_id` bigint unsigned null, `tipo_registro` varchar(255) null, `registro_id` bigint unsigned null, `modulo` varchar(255) null, `producto_id` bigint unsigned not null, `detalle` text not null, `precio` decimal(24, 2) null, `tipo_is` varchar(255) not null, `cantidad_ingreso` double null, `cantidad_salida` double null, `cantidad_saldo` double not null, `cu` decimal(24, 2) not null, `monto_ingreso` decimal(24, 2) null, `monto_salida` decimal(24, 2) null, `monto_saldo` decimal(24, 2) not null, `fecha` date not null, `status` int not null default \'1\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"9.01\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140855_create_kardex_productos_table.php\",\"line\":14,\"hash\":\"9ada67f98ae3669fd267b74a2bd9c2ba\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:21'),
(91, 'a3315a72-d659-44e5-bb5e-ebe6f9c6a61f', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `kardex_productos` add constraint `kardex_productos_producto_id_foreign` foreign key (`producto_id`) references `productos` (`id`)\",\"time\":\"25.96\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140855_create_kardex_productos_table.php\",\"line\":14,\"hash\":\"637635397a302a20543f7135e9f93d94\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(92, 'a3315a72-e35f-4dd3-8fc4-b9964548bcdc', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `kardex_productos` add constraint `kardex_productos_sucursal_id_foreign` foreign key (`sucursal_id`) references `sucursals` (`id`)\",\"time\":\"32.89\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140855_create_kardex_productos_table.php\",\"line\":14,\"hash\":\"14fb93d2c56eaf845365204b2d7a8074\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(93, 'a3315a72-f55b-456d-94ba-bcb02c5ea5cc', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `kardex_productos` add constraint `kardex_productos_ingreso_detalle_id_foreign` foreign key (`ingreso_detalle_id`) references `ingreso_detalles` (`id`)\",\"time\":\"45.38\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_140855_create_kardex_productos_table.php\",\"line\":14,\"hash\":\"b55a024a7b99654c0d41514a69ef61c8\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(94, 'a3315a72-f856-4e36-a8e1-9ae2284da078', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_140855_create_kardex_productos_table\', 1)\",\"time\":\"1.87\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(95, 'a3315a72-fb47-4d8e-a152-db18bc0c8d9b', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `producto_sucursals` (`id` bigint unsigned not null auto_increment primary key, `sucursal_id` bigint unsigned not null, `producto_id` bigint unsigned not null, `stock_actual` double not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.58\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_141426_create_producto_sucursals_table.php\",\"line\":14,\"hash\":\"7411929d6ab7c6a8c20fab5b584ecf52\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(96, 'a3315a73-0608-4727-a2e4-a2c4611bb554', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `producto_sucursals` add constraint `producto_sucursals_sucursal_id_foreign` foreign key (`sucursal_id`) references `sucursals` (`id`)\",\"time\":\"27.20\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_141426_create_producto_sucursals_table.php\",\"line\":14,\"hash\":\"91d3639755bd1c5c54905214093b82c3\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(97, 'a3315a73-0f4e-4ab9-a1be-70ea05fdf5d5', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `producto_sucursals` add constraint `producto_sucursals_producto_id_foreign` foreign key (`producto_id`) references `productos` (`id`)\",\"time\":\"23.39\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_07_11_141426_create_producto_sucursals_table.php\",\"line\":14,\"hash\":\"eca9573a11234b350da8f3a444e8085c\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(98, 'a3315a73-11f9-4ba0-a9d4-502b9fd19234', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_07_11_141426_create_producto_sucursals_table\', 1)\",\"time\":\"1.99\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(99, 'a3315a73-156c-4113-8c37-0e06312aae41', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `salida_detalles` (`id` bigint unsigned not null auto_increment primary key, `salida_producto_id` bigint unsigned not null, `tipo_salida_id` bigint unsigned not null, `ingreso_detalle_id` bigint unsigned null, `producto_id` bigint unsigned not null, `cantidad` double not null, `observacion` varchar(900) null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.82\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_08_30_111049_create_salida_detalles_table.php\",\"line\":14,\"hash\":\"b055c85a83bea4762fcdbd7a51047a9d\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(100, 'a3315a73-2001-422d-820e-2b7592dc1186', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `salida_detalles` add constraint `salida_detalles_salida_producto_id_foreign` foreign key (`salida_producto_id`) references `salida_productos` (`id`)\",\"time\":\"26.69\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_08_30_111049_create_salida_detalles_table.php\",\"line\":14,\"hash\":\"66ac177d40509fcafca656967c58cd1c\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(101, 'a3315a73-311a-426d-b9bd-9d8fe543e586', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `salida_detalles` add constraint `salida_detalles_tipo_salida_id_foreign` foreign key (`tipo_salida_id`) references `tipo_salidas` (`id`)\",\"time\":\"43.40\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_08_30_111049_create_salida_detalles_table.php\",\"line\":14,\"hash\":\"69a15a33aedde1fbd47b333277bc9f33\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(102, 'a3315a73-3cfc-4f36-a850-560a2fa7db79', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `salida_detalles` add constraint `salida_detalles_ingreso_detalle_id_foreign` foreign key (`ingreso_detalle_id`) references `ingreso_detalles` (`id`)\",\"time\":\"30.06\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_08_30_111049_create_salida_detalles_table.php\",\"line\":14,\"hash\":\"302e033ee2253e032efe4dc32abf6799\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(103, 'a3315a73-4985-4e68-9751-56cbd40a5619', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `salida_detalles` add constraint `salida_detalles_producto_id_foreign` foreign key (`producto_id`) references `productos` (`id`)\",\"time\":\"31.63\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_08_30_111049_create_salida_detalles_table.php\",\"line\":14,\"hash\":\"619b40126c1e138c699c923f46c8a322\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(104, 'a3315a73-4bfa-4754-8157-15d1311e158b', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_08_30_111049_create_salida_detalles_table\', 1)\",\"time\":\"1.67\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(105, 'a3315a73-4f5c-47f8-a51c-1c340390ced2', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `traspasos` (`id` bigint unsigned not null auto_increment primary key, `sucursal_origen_id` bigint unsigned not null, `sucursal_destino_id` bigint unsigned not null, `cantidad` double not null, `descripcion` varchar(900) not null, `fecha_registro` date not null, `user_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.94\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_04_095816_create_traspasos_table.php\",\"line\":14,\"hash\":\"a1114941e3fa7536b07f1a5aa53a0c55\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(106, 'a3315a73-5912-4510-bfb1-5268cce3772a', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `traspasos` add constraint `traspasos_sucursal_origen_id_foreign` foreign key (`sucursal_origen_id`) references `sucursals` (`id`)\",\"time\":\"24.39\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_04_095816_create_traspasos_table.php\",\"line\":14,\"hash\":\"1cfa0d75225b8ef36a3cfa530ef1273a\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(107, 'a3315a73-6584-46c2-aa0f-f618d0e99667', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `traspasos` add constraint `traspasos_sucursal_destino_id_foreign` foreign key (`sucursal_destino_id`) references `sucursals` (`id`)\",\"time\":\"31.04\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_04_095816_create_traspasos_table.php\",\"line\":14,\"hash\":\"0d73b6b03d3f310f3f39df923efc34d5\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(108, 'a3315a73-71e5-47c6-8580-2cd3c4713c62', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `traspasos` add constraint `traspasos_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"31.02\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_04_095816_create_traspasos_table.php\",\"line\":14,\"hash\":\"b953bdb3522abba846b0e9c22597e670\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(109, 'a3315a73-74dc-4b7d-adff-f4ba65712d6e', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_09_04_095816_create_traspasos_table\', 1)\",\"time\":\"1.76\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(110, 'a3315a73-787d-4342-858d-edda460b68cd', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `traspaso_detalles` (`id` bigint unsigned not null auto_increment primary key, `traspaso_id` bigint unsigned not null, `ingreso_detalle_id` bigint unsigned null, `producto_id` bigint unsigned not null, `cantidad` double not null, `observacion` varchar(900) null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.59\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_04_095819_create_traspaso_detalles_table.php\",\"line\":14,\"hash\":\"b1991147ea1f87badd287245cd58b71c\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(111, 'a3315a73-83b2-4285-8978-08b9a49e43bc', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `traspaso_detalles` add constraint `traspaso_detalles_traspaso_id_foreign` foreign key (`traspaso_id`) references `traspasos` (`id`)\",\"time\":\"28.06\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_04_095819_create_traspaso_detalles_table.php\",\"line\":14,\"hash\":\"9adfc7abac7671a33f3c12ca8e5af533\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(112, 'a3315a73-8f18-43aa-b320-c66bbc1a9877', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `traspaso_detalles` add constraint `traspaso_detalles_ingreso_detalle_id_foreign` foreign key (`ingreso_detalle_id`) references `ingreso_detalles` (`id`)\",\"time\":\"28.60\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_04_095819_create_traspaso_detalles_table.php\",\"line\":14,\"hash\":\"6dd5e457426dea8d897800885a8f5024\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(113, 'a3315a73-9a6c-4c9e-9c3c-988d91661d58', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `traspaso_detalles` add constraint `traspaso_detalles_producto_id_foreign` foreign key (`producto_id`) references `productos` (`id`)\",\"time\":\"28.46\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_04_095819_create_traspaso_detalles_table.php\",\"line\":14,\"hash\":\"b19d035cd3030c79163ff204af4e554e\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(114, 'a3315a73-9ca1-4eed-b44a-786c95a01b38', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_09_04_095819_create_traspaso_detalles_table\', 1)\",\"time\":\"1.56\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(115, 'a3315a73-a086-4e69-adfd-2332116d24c4', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ingreso_pagos` (`id` bigint unsigned not null auto_increment primary key, `sucursal_id` bigint unsigned not null, `ingreso_producto_id` bigint unsigned not null, `proveedor_id` bigint unsigned not null, `monto_efectivo` decimal(24, 2) not null, `monto_qr` decimal(24, 2) not null, `monto_total` decimal(24, 2) not null, `fecha` date not null, `hora` time not null, `user_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"8.35\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_07_112006_create_ingreso_pagos_table.php\",\"line\":14,\"hash\":\"77ebbc38b978c1044cbcc148cf5f018b\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(116, 'a3315a73-aaf1-4975-8b77-791cdd6d3d5e', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_pagos` add constraint `ingreso_pagos_sucursal_id_foreign` foreign key (`sucursal_id`) references `sucursals` (`id`)\",\"time\":\"26.08\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_07_112006_create_ingreso_pagos_table.php\",\"line\":14,\"hash\":\"04d1235502c518a5b62cfd5d3c88e93e\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(117, 'a3315a73-b4ac-4f7c-930a-21d14014692e', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_pagos` add constraint `ingreso_pagos_ingreso_producto_id_foreign` foreign key (`ingreso_producto_id`) references `ingreso_productos` (`id`)\",\"time\":\"24.56\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_07_112006_create_ingreso_pagos_table.php\",\"line\":14,\"hash\":\"0c61cf4af02f870c99b8b4e8982b41cf\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(118, 'a3315a73-c1ba-4424-bab7-7dd2b7ffb56d', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_pagos` add constraint `ingreso_pagos_proveedor_id_foreign` foreign key (`proveedor_id`) references `proveedors` (`id`)\",\"time\":\"33.05\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_07_112006_create_ingreso_pagos_table.php\",\"line\":14,\"hash\":\"65926b35852bf6d5c3db9046160dbb59\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(119, 'a3315a73-cd87-4bf8-a94c-ede6a38fae3b', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_pagos` add constraint `ingreso_pagos_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"29.86\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_07_112006_create_ingreso_pagos_table.php\",\"line\":14,\"hash\":\"aca183f3d60f70a3af61d11cfa969db6\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(120, 'a3315a73-d02d-4a8f-ae3b-aef13a3dbb1e', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_09_07_112006_create_ingreso_pagos_table\', 1)\",\"time\":\"1.70\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(121, 'a3315a73-d3bc-4870-8450-05f000619554', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `venta_cobros` (`id` bigint unsigned not null auto_increment primary key, `sucursal_id` bigint unsigned not null, `venta_id` bigint unsigned not null, `cliente_id` bigint unsigned not null, `monto` decimal(24, 2) not null, `fecha` date not null, `hora` time not null, `user_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.48\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_09_093956_create_venta_cobros_table.php\",\"line\":14,\"hash\":\"b191b556524e79af763452f8b64588de\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(122, 'a3315a73-df18-4df1-8877-46c83d566276', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `venta_cobros` add constraint `venta_cobros_sucursal_id_foreign` foreign key (`sucursal_id`) references `sucursals` (`id`)\",\"time\":\"28.52\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_09_093956_create_venta_cobros_table.php\",\"line\":14,\"hash\":\"c565059f70ee43d33ebf642c625508b1\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(123, 'a3315a73-ec86-4b12-a6bb-8593baf95380', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `venta_cobros` add constraint `venta_cobros_venta_id_foreign` foreign key (`venta_id`) references `ventas` (`id`)\",\"time\":\"33.77\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_09_093956_create_venta_cobros_table.php\",\"line\":14,\"hash\":\"cb9e504bc1d27fe3cbdf1aeceba9aafd\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(124, 'a3315a73-f6e5-4f42-94d9-0f6e0f842ad1', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `venta_cobros` add constraint `venta_cobros_cliente_id_foreign` foreign key (`cliente_id`) references `clientes` (`id`)\",\"time\":\"25.95\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_09_093956_create_venta_cobros_table.php\",\"line\":14,\"hash\":\"d4fadc556a9ab3b02c3cc84895de3ba8\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(125, 'a3315a74-02c5-4e97-94ef-e8d4b9b01165', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `venta_cobros` add constraint `venta_cobros_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"29.94\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_09_093956_create_venta_cobros_table.php\",\"line\":14,\"hash\":\"791f0f0ca94bc47834932d6b0b238c2c\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(126, 'a3315a74-0525-4b9f-a8df-299fd1ac3b57', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_09_09_093956_create_venta_cobros_table\', 1)\",\"time\":\"1.67\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(127, 'a3315a74-094d-45ce-ab71-dc279f10e62c', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `proformas` (`id` bigint unsigned not null auto_increment primary key, `codigo_proforma` varchar(255) null, `sucursal_id` bigint unsigned not null, `cliente_id` bigint unsigned not null, `nit_ci` varchar(255) null, `subtotal` decimal(24, 2) not null, `descuento` decimal(24, 2) not null, `porcentaje_descuento` double not null, `total` decimal(24, 2) not null, `cancelado` decimal(24, 2) not null, `saldo` decimal(24, 2) not null, `fecha` date not null, `hora` time not null, `fecha_registro` date null, `status` int not null default \'1\', `user_id` bigint unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"8.97\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_09_152725_create_proformas_table.php\",\"line\":14,\"hash\":\"3386cc8a597d69d8bb915c304d30c0c6\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(128, 'a3315a74-142f-494a-99a0-e6062266b62b', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `proformas` add constraint `proformas_sucursal_id_foreign` foreign key (`sucursal_id`) references `sucursals` (`id`)\",\"time\":\"27.38\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_09_152725_create_proformas_table.php\",\"line\":14,\"hash\":\"4d6639153fc39ab1839628098bbb3f78\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(129, 'a3315a74-203d-473b-88c4-e78299015cfd', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `proformas` add constraint `proformas_cliente_id_foreign` foreign key (`cliente_id`) references `clientes` (`id`)\",\"time\":\"30.38\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_09_152725_create_proformas_table.php\",\"line\":14,\"hash\":\"81b718649dad67c81fb4d79a4e9dd7df\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(130, 'a3315a74-2dfc-421c-ac8e-db93da1318ae', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `proformas` add constraint `proformas_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"34.79\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_09_152725_create_proformas_table.php\",\"line\":14,\"hash\":\"fc27491cf9a3c7f03eac5335972c8011\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(131, 'a3315a74-30b7-461c-906f-f880087d44f8', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_09_09_152725_create_proformas_table\', 1)\",\"time\":\"1.78\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(132, 'a3315a74-345c-4d87-94bd-dc2e2904343c', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `proforma_detalles` (`id` bigint unsigned not null auto_increment primary key, `proforma_id` bigint unsigned not null, `producto_id` bigint unsigned not null, `cantidad` double not null, `precio` decimal(24, 2) not null, `descuento_uni` decimal(24, 2) not null, `porcen_du` double not null, `descuento_total` decimal(24, 2) not null, `porcen_dt` double not null, `precio_final` decimal(24, 2) not null, `total` decimal(24, 2) not null, `total_uni` decimal(24, 2) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.92\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_09_152745_create_proforma_detalles_table.php\",\"line\":14,\"hash\":\"646b3171946cda5dbed6a6bac0c952e4\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(133, 'a3315a74-3e12-4535-ac86-3beaf4f799f4', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `proforma_detalles` add constraint `proforma_detalles_proforma_id_foreign` foreign key (`proforma_id`) references `proformas` (`id`)\",\"time\":\"24.44\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_09_152745_create_proforma_detalles_table.php\",\"line\":14,\"hash\":\"7636a428ac38ad4af0e3cdf923f3ac5f\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(134, 'a3315a74-4be3-4687-a49a-8b474546bd39', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `proforma_detalles` add constraint `proforma_detalles_producto_id_foreign` foreign key (`producto_id`) references `productos` (`id`)\",\"time\":\"35.01\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_09_152745_create_proforma_detalles_table.php\",\"line\":14,\"hash\":\"49edbd09b0d756a1baa36c53f419d1a3\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(135, 'a3315a74-4e2f-419b-a544-50f03c306edd', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_09_09_152745_create_proforma_detalles_table\', 1)\",\"time\":\"1.64\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(136, 'a3315a74-521c-4004-916b-7000b231fcc2', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `configuracions` (`id` bigint unsigned not null auto_increment primary key, `nombre_sistema` varchar(255) not null, `alias` varchar(255) not null, `razon_social` varchar(255) not null, `nit` varchar(255) not null, `ciudad` varchar(255) not null, `dir` varchar(255) not null, `fono` varchar(255) not null, `web` varchar(255) null, `actividad` varchar(255) not null, `correo` varchar(255) null, `logo` varchar(255) null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"9.05\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_13_132625_create_configuracions_table.php\",\"line\":16,\"hash\":\"27f344dd8ddf3e636077e305a83483fc\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(137, 'a3315a74-5486-487b-b93b-7baefdbe7cf9', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_09_13_132625_create_configuracions_table\', 1)\",\"time\":\"1.54\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(138, 'a3315a74-584c-4319-8771-f8c61f2494c2', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ingreso_faltantes` (`id` bigint unsigned not null auto_increment primary key, `ingreso_producto_id` bigint unsigned not null, `ingreso_detalle_id` bigint unsigned not null, `cantidad` double not null, `user_id` bigint unsigned not null, `fecha` date not null, `hora` time not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"8.32\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_20_145902_create_ingreso_faltantes_table.php\",\"line\":14,\"hash\":\"92335fda3103d58acf28b942b74ff9db\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:22'),
(139, 'a3315a74-62c1-47a9-8e75-281284bf8252', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_faltantes` add constraint `ingreso_faltantes_ingreso_producto_id_foreign` foreign key (`ingreso_producto_id`) references `ingreso_productos` (`id`)\",\"time\":\"26.29\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_20_145902_create_ingreso_faltantes_table.php\",\"line\":14,\"hash\":\"63b4da359f98817f291b192a1986be85\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(140, 'a3315a74-6c76-4828-a224-b2670894fd13', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_faltantes` add constraint `ingreso_faltantes_ingreso_detalle_id_foreign` foreign key (`ingreso_detalle_id`) references `ingreso_detalles` (`id`)\",\"time\":\"24.32\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_20_145902_create_ingreso_faltantes_table.php\",\"line\":14,\"hash\":\"1b3c94d44bc1662cb1dc5845cbc666c2\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(141, 'a3315a74-7a19-46f8-ab46-774b8581fac4', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_faltantes` add constraint `ingreso_faltantes_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"34.48\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_09_20_145902_create_ingreso_faltantes_table.php\",\"line\":14,\"hash\":\"75b43069ee19806bec2ec84c1f4ba642\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(142, 'a3315a74-7c7f-402d-ada1-35450a96306d', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_09_20_145902_create_ingreso_faltantes_table\', 1)\",\"time\":\"1.72\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(143, 'a3315a74-808a-4d9e-8931-7de4dfe27004', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ingreso_recepcions` (`id` bigint unsigned not null auto_increment primary key, `ingreso_producto_id` bigint unsigned not null, `ingreso_detalle_id` bigint unsigned not null, `sucursal_id` bigint unsigned not null, `producto_id` bigint unsigned not null, `cantidad` double not null, `tipo` varchar(255) not null, `fecha` date null, `hora` time null, `user_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"8.77\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_10_17_103418_create_ingreso_recepcions_table.php\",\"line\":14,\"hash\":\"91926c8d940b13da4a58c02b7331776f\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(144, 'a3315a74-8b29-42ee-bf38-33ecec348b10', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_recepcions` add constraint `ingreso_recepcions_ingreso_producto_id_foreign` foreign key (`ingreso_producto_id`) references `ingreso_productos` (`id`)\",\"time\":\"26.53\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_10_17_103418_create_ingreso_recepcions_table.php\",\"line\":14,\"hash\":\"e64186cb6738fbc9ac6f980cdf986462\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(145, 'a3315a74-9527-4a5b-b223-300073603f89', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_recepcions` add constraint `ingreso_recepcions_ingreso_detalle_id_foreign` foreign key (`ingreso_detalle_id`) references `ingreso_detalles` (`id`)\",\"time\":\"24.90\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_10_17_103418_create_ingreso_recepcions_table.php\",\"line\":14,\"hash\":\"f63805779d765832abe7e2e1a6fee5e9\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(146, 'a3315a74-9f62-4b98-84f4-ead0b0e842e1', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_recepcions` add constraint `ingreso_recepcions_sucursal_id_foreign` foreign key (`sucursal_id`) references `sucursals` (`id`)\",\"time\":\"25.77\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_10_17_103418_create_ingreso_recepcions_table.php\",\"line\":14,\"hash\":\"a552fc79c804be8f2b7e199846d1816d\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(147, 'a3315a74-b077-4752-b139-c0f65535c616', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_recepcions` add constraint `ingreso_recepcions_producto_id_foreign` foreign key (`producto_id`) references `productos` (`id`)\",\"time\":\"43.38\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_10_17_103418_create_ingreso_recepcions_table.php\",\"line\":14,\"hash\":\"1f5558418f064214219088caadacae22\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(148, 'a3315a74-bce2-4ca3-a6bd-90ca952901a6', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `ingreso_recepcions` add constraint `ingreso_recepcions_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"31.45\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_10_17_103418_create_ingreso_recepcions_table.php\",\"line\":14,\"hash\":\"efd4023b2f72963f3a225a324fd15865\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(149, 'a3315a74-bf3b-4258-85c0-2113d64a320e', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_10_17_103418_create_ingreso_recepcions_table\', 1)\",\"time\":\"1.60\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(150, 'a3315a74-c2cb-473c-88b8-d14ceb60091d', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `notificacions` (`id` bigint unsigned not null auto_increment primary key, `tipo` varchar(255) not null, `modulo` varchar(255) not null, `registro_id` bigint unsigned null, `descripcion` text not null, `fecha` date not null, `hora` time not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.78\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_10_17_103904_create_notificacions_table.php\",\"line\":14,\"hash\":\"be5c251a24b6f7bca308ab648275abe0\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(151, 'a3315a74-c51a-40f4-945b-e16367f54252', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_10_17_103904_create_notificacions_table\', 1)\",\"time\":\"1.51\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(152, 'a3315a74-c834-4e93-8d32-98483044b937', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `notificacion_users` (`id` bigint unsigned not null auto_increment primary key, `notificacion_id` bigint unsigned not null, `user_id` bigint unsigned not null, `visto` int not null default \'0\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.80\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_10_17_103913_create_notificacion_users_table.php\",\"line\":14,\"hash\":\"203187672ba9687635ffd5706de25b5a\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(153, 'a3315a74-d266-46e2-b0d6-62154ab40970', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `notificacion_users` add constraint `notificacion_users_notificacion_id_foreign` foreign key (`notificacion_id`) references `notificacions` (`id`)\",\"time\":\"25.62\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_10_17_103913_create_notificacion_users_table.php\",\"line\":14,\"hash\":\"4fae2397cd30036ff6e18ac41445e7ca\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(154, 'a3315a74-dc87-4991-87a2-cc7784495074', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `notificacion_users` add constraint `notificacion_users_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"25.51\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_10_17_103913_create_notificacion_users_table.php\",\"line\":14,\"hash\":\"1ddf99569bd7d2d229835b346f36c0c4\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(155, 'a3315a74-df11-4989-84a7-fa4f08c9e354', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_10_17_103913_create_notificacion_users_table\', 1)\",\"time\":\"1.70\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(156, 'a3315a74-e24e-4378-a800-2ca661b137cd', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `venta_lotes` (`id` bigint unsigned not null auto_increment primary key, `venta_id` bigint unsigned not null, `venta_detalle_id` bigint unsigned not null, `ingreso_detalle_id` bigint unsigned not null, `cantidad` double not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.78\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_162753_create_venta_lotes_table.php\",\"line\":14,\"hash\":\"c4da673b1d2d2fc891e98d6960878b68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23');
INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(157, 'a3315a74-e4f9-4e5b-9000-f8b83b6cc9c7', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_11_08_162753_create_venta_lotes_table\', 1)\",\"time\":\"1.57\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(158, 'a3315a74-e87a-4008-a2a6-a40fc0ec9bec', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `disciplinas` (`id` bigint unsigned not null auto_increment primary key, `nombre` varchar(255) not null, `descripcion` varchar(700) null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"8.14\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163156_create_disciplinas_table.php\",\"line\":14,\"hash\":\"87a1bc502e89cc02b36ff746af363685\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(159, 'a3315a74-eb1a-4ef1-b1ea-8d1dcb3578c4', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_11_08_163156_create_disciplinas_table\', 1)\",\"time\":\"1.50\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(160, 'a3315a74-ee58-414f-8f22-dc70f4a75d2e', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `promocions` (`id` bigint unsigned not null auto_increment primary key, `nombre` varchar(255) not null, `descripcion` text not null, `tipo` varchar(255) not null, `fecha_ini` date null, `fecha_fin` date null, `inscripciones` int null, `fecha_regitro` date not null, `user_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.32\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163202_create_promocions_table.php\",\"line\":14,\"hash\":\"b170509dfcc154cd81c22c9d5f16d169\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(161, 'a3315a74-f7bf-4c81-b09d-62cb5ae9f6fb', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `promocions` add constraint `promocions_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"23.65\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163202_create_promocions_table.php\",\"line\":14,\"hash\":\"5368d82f764d9c7c9db9299d74816c34\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(162, 'a3315a74-faa0-43f5-95f6-d22465220e37', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_11_08_163202_create_promocions_table\', 1)\",\"time\":\"1.54\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(163, 'a3315a74-fe4a-4bb3-9b2d-40af53422b73', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `inscripcions` (`id` bigint unsigned not null auto_increment primary key, `sucursal_id` bigint unsigned not null, `user_cliente_id` bigint unsigned not null, `cliente_id` bigint unsigned not null, `producto_id` bigint unsigned not null, `venta_detalle_id` bigint unsigned not null, `declaracion_jurada` varchar(255) null, `fecha_inicio` date not null, `estado` int not null default \'1\', `fecha_pausa` date null, `dias_pausa` int null, `justificacion_pausa` text null, `dias_restantes` int not null, `fecha_fin` date null, `fecha` date not null, `hora` time not null, `user_id` bigint unsigned not null, `user_pausa_id` bigint unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"8.21\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163235_create_inscripcions_table.php\",\"line\":14,\"hash\":\"c0f1b97a175e470d73ee8e724b6b0df0\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(164, 'a3315a75-08c2-4a9f-b70b-491056d5d9ba', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `inscripcions` add constraint `inscripcions_sucursal_id_foreign` foreign key (`sucursal_id`) references `sucursals` (`id`)\",\"time\":\"26.47\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163235_create_inscripcions_table.php\",\"line\":14,\"hash\":\"85ef76b6aee933c4af23e1522c45ec02\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(165, 'a3315a75-14fa-4c76-a031-8284ea79a61f', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `inscripcions` add constraint `inscripcions_user_cliente_id_foreign` foreign key (`user_cliente_id`) references `users` (`id`)\",\"time\":\"30.92\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163235_create_inscripcions_table.php\",\"line\":14,\"hash\":\"ffa256086403fd8b3e73f4a8bcbd9d54\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(166, 'a3315a75-206a-4935-8b3f-179026c2b287', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `inscripcions` add constraint `inscripcions_cliente_id_foreign` foreign key (`cliente_id`) references `clientes` (`id`)\",\"time\":\"28.74\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163235_create_inscripcions_table.php\",\"line\":14,\"hash\":\"50c8f7c3ea1f80e7ea9b2078131bcb38\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(167, 'a3315a75-2cb2-4202-92eb-eff9ae5cb26c', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `inscripcions` add constraint `inscripcions_producto_id_foreign` foreign key (`producto_id`) references `productos` (`id`)\",\"time\":\"31.07\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163235_create_inscripcions_table.php\",\"line\":14,\"hash\":\"aa689120f552c20e2d4333464d09fed4\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(168, 'a3315a75-39a6-4236-8336-1ba86f7fef93', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `inscripcions` add constraint `inscripcions_venta_detalle_id_foreign` foreign key (`venta_detalle_id`) references `venta_detalles` (`id`)\",\"time\":\"32.77\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163235_create_inscripcions_table.php\",\"line\":14,\"hash\":\"4f4dbc095acb15ce4f2897841da56184\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(169, 'a3315a75-4668-49ae-8e25-2a5e2740638d', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `inscripcions` add constraint `inscripcions_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"32.20\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163235_create_inscripcions_table.php\",\"line\":14,\"hash\":\"514c38df10cab60bbaaba05b21edbb4c\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(170, 'a3315a75-56c8-4d56-92f7-680a03daad04', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `inscripcions` add constraint `inscripcions_user_pausa_id_foreign` foreign key (`user_pausa_id`) references `users` (`id`)\",\"time\":\"41.40\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163235_create_inscripcions_table.php\",\"line\":14,\"hash\":\"54ff128a2d2ef8766827f1d1f922a67b\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(171, 'a3315a75-5935-4518-a6cf-3f99a5ebef5e', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_11_08_163235_create_inscripcions_table\', 1)\",\"time\":\"1.47\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(172, 'a3315a75-5d5d-44e7-9297-31e0e1efcc55', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `movimiento_cajas` (`id` bigint unsigned not null auto_increment primary key, `sucursal_id` bigint unsigned null, `tipo` varchar(255) null, `modulo` varchar(255) null, `registro_id` bigint unsigned null, `monto_total` decimal(24, 2) not null, `metodo_pago_id` bigint unsigned not null, `tipo_movimiento` varchar(255) not null, `descripcion` varchar(900) not null, `fecha` date not null, `hora` time not null, `user_id` bigint unsigned not null, `status` int not null default \'1\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"9.66\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163240_create_movimiento_cajas_table.php\",\"line\":14,\"hash\":\"40a21f32979464d2ce5c80dbbc026c01\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(173, 'a3315a75-6772-4c95-99b5-e6ccf334bf68', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `movimiento_cajas` add constraint `movimiento_cajas_sucursal_id_foreign` foreign key (`sucursal_id`) references `sucursals` (`id`)\",\"time\":\"25.36\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163240_create_movimiento_cajas_table.php\",\"line\":14,\"hash\":\"47ae1592200e902b670ecce2f49f90a1\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(174, 'a3315a75-720e-426c-bb92-f570969e7a50', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `movimiento_cajas` add constraint `movimiento_cajas_metodo_pago_id_foreign` foreign key (`metodo_pago_id`) references `metodo_pagos` (`id`)\",\"time\":\"26.73\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163240_create_movimiento_cajas_table.php\",\"line\":14,\"hash\":\"de94cacf74eeaceadc85bb7c23d90286\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(175, 'a3315a75-7ced-409f-b6d0-7a920a890629', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `movimiento_cajas` add constraint `movimiento_cajas_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"27.48\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163240_create_movimiento_cajas_table.php\",\"line\":14,\"hash\":\"9553fdc0b6c07508cf9b8c2dfe81b258\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(176, 'a3315a75-7f6b-41cf-be98-e798b489dd43', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_11_08_163240_create_movimiento_cajas_table\', 1)\",\"time\":\"1.64\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(177, 'a3315a75-827d-49b4-8b09-bda6ed033cac', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `movimiento_metodos` (`id` bigint unsigned not null auto_increment primary key, `movimiento_caja_id` bigint unsigned not null, `metodo_pago_id` bigint unsigned not null, `monto` decimal(24, 2) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.33\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163241_create_movimiento_metodos_table.php\",\"line\":14,\"hash\":\"585a3b9ee57a857af939959b0dca8903\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(178, 'a3315a75-8b0a-42be-8a35-54e587978e8e', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `movimiento_metodos` add constraint `movimiento_metodos_movimiento_caja_id_foreign` foreign key (`movimiento_caja_id`) references `movimiento_cajas` (`id`)\",\"time\":\"21.46\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163241_create_movimiento_metodos_table.php\",\"line\":14,\"hash\":\"5318eac08f1442a5bb679ceb1db8d29a\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(179, 'a3315a75-9478-48bc-8683-6e760958b5ac', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `movimiento_metodos` add constraint `movimiento_metodos_metodo_pago_id_foreign` foreign key (`metodo_pago_id`) references `metodo_pagos` (`id`)\",\"time\":\"23.70\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_163241_create_movimiento_metodos_table.php\",\"line\":14,\"hash\":\"8efc8428502d4c7442267f9385b699f7\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(180, 'a3315a75-971f-4529-88e4-3a71fee9778a', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_11_08_163241_create_movimiento_metodos_table\', 1)\",\"time\":\"1.39\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(181, 'a3315a75-9a66-4038-af5d-933cac040768', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries` (`sequence` bigint unsigned not null auto_increment primary key, `uuid` char(36) not null, `batch_id` char(36) not null, `family_hash` varchar(255) null, `should_display_on_index` tinyint(1) not null default \'1\', `type` varchar(20) not null, `content` longtext not null, `created_at` datetime null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.37\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":24,\"hash\":\"d9429550f8856c1af1c89f24a6440cb5\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(182, 'a3315a75-9df4-477a-811a-dd9d396d68a7', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add unique `telescope_entries_uuid_unique`(`uuid`)\",\"time\":\"8.69\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":24,\"hash\":\"9fb859ae1faff74c6b9e0b70dfd8eea9\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(183, 'a3315a75-a05e-47ab-bc19-6bfc7e699313', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_batch_id_index`(`batch_id`)\",\"time\":\"5.74\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":24,\"hash\":\"2b075509a9242d6e3f622536c5ccca07\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(184, 'a3315a75-a35c-40e4-b54a-0159a517ee81', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_family_hash_index`(`family_hash`)\",\"time\":\"7.04\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":24,\"hash\":\"3d25a2a244bd2028dfa0326d3dbf7f4c\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(185, 'a3315a75-a64e-4083-8ecf-80fd106c1629', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_created_at_index`(`created_at`)\",\"time\":\"6.96\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":24,\"hash\":\"7352e7f84460fb7ffc450e7ea4de9dc7\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(186, 'a3315a75-a994-4cbc-9b3f-bdd376cf284e', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_type_should_display_on_index_index`(`type`, `should_display_on_index`)\",\"time\":\"7.79\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":24,\"hash\":\"7317a4cad2dfa1a5167548a6acd0b6a5\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(187, 'a3315a75-acc8-476d-90cb-fea36aec3ff7', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries_tags` (`entry_uuid` char(36) not null, `tag` varchar(255) not null, primary key (`entry_uuid`, `tag`)) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.31\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":41,\"hash\":\"f8c7e1e3c3d557b70e7a918609f839f2\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(188, 'a3315a75-afa4-48b2-8512-7a6b5bffbded', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add index `telescope_entries_tags_tag_index`(`tag`)\",\"time\":\"6.79\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":41,\"hash\":\"0bdb35d17e876d6225a7774a2c17647d\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(189, 'a3315a75-b7d3-452e-b148-462d55e2d9ce', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add constraint `telescope_entries_tags_entry_uuid_foreign` foreign key (`entry_uuid`) references `telescope_entries` (`uuid`) on delete cascade\",\"time\":\"20.62\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":41,\"hash\":\"662a818f80a3a9ba2570081fd7a6af2f\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(190, 'a3315a75-ba83-4648-bf56-6b7242ae47d4', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_monitoring` (`tag` varchar(255) not null, primary key (`tag`)) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.39\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_08_171238_create_telescope_entries_table.php\",\"line\":54,\"hash\":\"18d1fa09eade84a80848982d91caec5c\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(191, 'a3315a75-bd84-431e-bb5b-aabb6bf65bb5', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_11_08_171238_create_telescope_entries_table\', 1)\",\"time\":\"1.79\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(192, 'a3315a75-c090-42fd-9803-5c96e678f3df', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `disciplina_plans` (`id` bigint unsigned not null auto_increment primary key, `disciplina_id` bigint unsigned not null, `producto_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.89\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_10_105537_create_disciplina_plans_table.php\",\"line\":14,\"hash\":\"708d1ff36cb8e877b4eccbe07ef85ca0\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(193, 'a3315a75-c9be-447a-994a-3e32a3eb9103', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `disciplina_plans` add constraint `disciplina_plans_disciplina_id_foreign` foreign key (`disciplina_id`) references `disciplinas` (`id`)\",\"time\":\"23.13\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_10_105537_create_disciplina_plans_table.php\",\"line\":14,\"hash\":\"d1e352d2cd29209ec838557b00a21b28\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(194, 'a3315a75-d377-4573-aac0-b1ff6f78ae97', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `disciplina_plans` add constraint `disciplina_plans_producto_id_foreign` foreign key (`producto_id`) references `productos` (`id`)\",\"time\":\"24.45\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_10_105537_create_disciplina_plans_table.php\",\"line\":14,\"hash\":\"17a8cc93591a482acea5816cd371ab44\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(195, 'a3315a75-d5d5-4263-ae55-494366f3361a', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_11_10_105537_create_disciplina_plans_table\', 1)\",\"time\":\"1.68\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(196, 'a3315a75-d8f3-4088-bd93-d28e1afd1932', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `producto_promocions` (`id` bigint unsigned not null auto_increment primary key, `producto_id` bigint unsigned not null, `promocion_id` bigint unsigned not null, `fecha_registro` date not null, `user_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.66\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_10_105605_create_producto_promocions_table.php\",\"line\":14,\"hash\":\"d91b7ff66727dbd23176b98426203288\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:23'),
(197, 'a3315a75-e362-4b9f-ace3-fa275727e5d7', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `producto_promocions` add constraint `producto_promocions_producto_id_foreign` foreign key (`producto_id`) references `productos` (`id`)\",\"time\":\"26.36\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_10_105605_create_producto_promocions_table.php\",\"line\":14,\"hash\":\"224c8f94e0cd5872608d776068136eea\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24'),
(198, 'a3315a75-eef1-4a46-82b7-478ea4b94be1', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `producto_promocions` add constraint `producto_promocions_promocion_id_foreign` foreign key (`promocion_id`) references `promocions` (`id`)\",\"time\":\"29.12\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_10_105605_create_producto_promocions_table.php\",\"line\":14,\"hash\":\"d7f35a08895e2efb59f0861652d408f4\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24'),
(199, 'a3315a75-f949-4a80-bb63-cf59b0094ad1', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `producto_promocions` add constraint `producto_promocions_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"26.13\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_10_105605_create_producto_promocions_table.php\",\"line\":14,\"hash\":\"525a7fe4247bd22819bec53c3dd4875e\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24'),
(200, 'a3315a75-fb70-4540-8023-cfe3bb441fbd', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_11_10_105605_create_producto_promocions_table\', 1)\",\"time\":\"1.61\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24'),
(201, 'a3315a76-00f0-41b1-a3cc-362a08b944ec', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `cobro_metodos` (`id` bigint unsigned not null auto_increment primary key, `venta_cobro_id` bigint unsigned not null, `metodo_pago_id` bigint unsigned not null, `monto` decimal(24, 2) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"12.56\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_10_110747_create_cobro_metodos_table.php\",\"line\":14,\"hash\":\"e62b66256259ab89e6d983c5682d64f0\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24'),
(202, 'a3315a76-0d26-4dc9-bc5a-3ff81fc95dca', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `cobro_metodos` add constraint `cobro_metodos_venta_cobro_id_foreign` foreign key (`venta_cobro_id`) references `venta_cobros` (`id`)\",\"time\":\"30.66\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_10_110747_create_cobro_metodos_table.php\",\"line\":14,\"hash\":\"effef27c62907999d2bb74882a030fdf\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24'),
(203, 'a3315a76-1839-45f8-9e8c-edc0b9e396a3', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `cobro_metodos` add constraint `cobro_metodos_metodo_pago_id_foreign` foreign key (`metodo_pago_id`) references `metodo_pagos` (`id`)\",\"time\":\"27.87\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_10_110747_create_cobro_metodos_table.php\",\"line\":14,\"hash\":\"17bdfcf65cea4f88f59ded096e9e66f0\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24'),
(204, 'a3315a76-1af6-4b2a-b8d4-eba654ea9166', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_11_10_110747_create_cobro_metodos_table\', 1)\",\"time\":\"1.71\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24'),
(205, 'a3315a76-1e46-4f81-8b25-e0a4d45bc5aa', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"create table `user_sucursals` (`id` bigint unsigned not null auto_increment primary key, `user_id` bigint unsigned not null, `sucursal_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.22\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_10_110855_create_user_sucursals_table.php\",\"line\":14,\"hash\":\"b6ed55ecb1aee0f3aef78a4140d57574\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24'),
(206, 'a3315a76-2736-4ec6-81f2-25d280d511eb', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `user_sucursals` add constraint `user_sucursals_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"22.54\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_10_110855_create_user_sucursals_table.php\",\"line\":14,\"hash\":\"62f0e401545d6e75a2832f98477c618a\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24'),
(207, 'a3315a76-3007-4df5-bf3c-e8599f0b5e88', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `user_sucursals` add constraint `user_sucursals_sucursal_id_foreign` foreign key (`sucursal_id`) references `sucursals` (`id`)\",\"time\":\"22.09\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\migrations\\\\2026_11_10_110855_create_user_sucursals_table.php\",\"line\":14,\"hash\":\"e92dc1b58c8b5ad4797e4188836dd7c9\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24'),
(208, 'a3315a76-32b0-4890-bfc1-3f27f97d508d', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2026_11_10_110855_create_user_sucursals_table\', 1)\",\"time\":\"1.73\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\artisan\",\"line\":16,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24'),
(209, 'a3315a76-5fcb-4a6e-8e86-db6632add5d4', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `configuracions` (`nombre_sistema`, `alias`, `razon_social`, `nit`, `ciudad`, `dir`, `fono`, `actividad`, `correo`, `logo`, `updated_at`, `created_at`) values (\'IMPARABLE V2\', \'IMPARABLE\', \'IMPARABLE S.A.\', \'11111111111\', \'LA PAZ - BOLIVIA\', \'LOS PEDREGALES #223\', \'2323232 - 7776666\', \'ACTIVIDAD EMPRESA\', \'imparable@gmail.com\', \'logo.jpg\', \'2026-11-10 11:14:24\', \'2026-11-10 11:14:24\')\",\"time\":\"3.36\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\seeders\\\\ConfiguracionTableSeeder.php\",\"line\":16,\"hash\":\"8656ac5302bd4f98c69f4c4a2c012fea\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24'),
(210, 'a3315a76-7307-49eb-b89b-d622b4a7293b', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `sucursals` (`nombre`, `fono`, `dir`, `fecha_registro`, `updated_at`, `created_at`) values (\'SUCURSAL 1\', \'SUCURSAL 1\', \'ZONA LOS PEDREGALES\', \'2026-11-10\', \'2026-11-10 11:14:24\', \'2026-11-10 11:14:24\')\",\"time\":\"2.89\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\seeders\\\\SucursalTableSeeder.php\",\"line\":16,\"hash\":\"6bce870ef8f4719fcaff4c733a6c4775\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24'),
(211, 'a3315a76-7970-4732-9dec-61a88394701f', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `roles` (`nombre`, `permisos`, `usuarios`, `status`, `updated_at`, `created_at`) values (\'SUPER USUARIO\', 1, 0, 1, \'2026-11-10 11:14:24\', \'2026-11-10 11:14:24\')\",\"time\":\"2.14\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\seeders\\\\RoleTableSeeder.php\",\"line\":16,\"hash\":\"69f93e061aea842c1758ff5551c3d3bc\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24'),
(212, 'a3315a76-d56b-4b3d-882d-bf8d9a427446', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'query', '{\"connection\":\"mysql\",\"driver\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `users` (`usuario`, `codigo`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `password`, `correo`, `tipo`, `role_id`, `sucursal_todos`, `fecha_registro`, `acceso`, `status`, `updated_at`, `created_at`) values (\'admin\', \'admin\', \'admin\', \'admin\', \'\', \'0\', \'\', \'y$P9DGwH7ILCCr0uEGMfcfruOEg4XNs0TGuNcbyB4V6wtcxz04LdiQe\', \'\', \'ADMINISTRACI\\u00d3N\', 1, 1, \'2026-11-10\', 1, 1, \'2026-11-10 11:14:24\', \'2026-11-10 11:14:24\')\",\"time\":\"3.09\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\imparablev2\\\\database\\\\seeders\\\\UserTableSeeder.php\",\"line\":16,\"hash\":\"89bc1a6927c970df0d9fb656fcc9b15c\",\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24'),
(213, 'a3315a76-d6b9-4038-86b6-94b1c0ceb68b', 'a3315a76-d77f-445c-9e25-0a679a7329bf', NULL, 1, 'command', '{\"command\":\"migrate\",\"exit_code\":0,\"arguments\":{\"command\":\"migrate\"},\"options\":{\"database\":null,\"force\":false,\"path\":[],\"realpath\":false,\"schema-path\":null,\"pretend\":false,\"seed\":true,\"seeder\":null,\"step\":false,\"graceful\":false,\"isolated\":false,\"help\":false,\"silent\":false,\"quiet\":false,\"verbose\":false,\"version\":false,\"ansi\":null,\"no-interaction\":false,\"env\":null},\"hostname\":\"DESKTOP-M0TID9S\"}', '2026-11-10 11:14:24');

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

INSERT INTO `users` (`id`, `usuario`, `codigo`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `password`, `correo`, `foto`, `tipo`, `role_id`, `sucursal_todos`, `fecha_registro`, `acceso`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', '', '0', '', '$2y$12$P9DGwH7ILCCr0uEGMfcfruOEg4XNs0TGuNcbyB4V6wtcxz04LdiQe', '', NULL, 'ADMINISTRACIÓN', 1, 1, '2026-11-10', 1, 1, '2026-11-10 15:14:24', '2026-11-10 15:14:24');

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

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
-- AUTO_INCREMENT de la tabla `user_sucursals`
--
ALTER TABLE `user_sucursals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
