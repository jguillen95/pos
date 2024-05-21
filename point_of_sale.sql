-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para point_of_sale
CREATE DATABASE IF NOT EXISTS `point_of_sale` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `point_of_sale`;

-- Volcando estructura para tabla point_of_sale.advance_salaries
CREATE TABLE IF NOT EXISTS `advance_salaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `date` date NOT NULL,
  `advance_salary` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.advance_salaries: ~0 rows (aproximadamente)
INSERT IGNORE INTO `advance_salaries` (`id`, `employee_id`, `date`, `advance_salary`, `created_at`, `updated_at`) VALUES
	(1, 1, '2024-05-10', 100, '2024-05-10 21:40:55', '2024-05-10 21:40:55');

-- Volcando estructura para tabla point_of_sale.attendences
CREATE TABLE IF NOT EXISTS `attendences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `date` date NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.attendences: ~0 rows (aproximadamente)
INSERT IGNORE INTO `attendences` (`id`, `employee_id`, `date`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, '2024-05-10', 'present', '2024-05-10 21:40:35', '2024-05-10 21:40:35');

-- Volcando estructura para tabla point_of_sale.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.categories: ~2 rows (aproximadamente)
INSERT IGNORE INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'SERVICIOS', 'servicios', '2024-05-11 00:13:55', '2024-05-11 00:13:55'),
	(2, 'CERAS', 'ceras', '2024-05-16 02:54:28', '2024-05-16 02:54:28');

-- Volcando estructura para tabla point_of_sale.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `shopname` date DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.customers: ~2 rows (aproximadamente)
INSERT IGNORE INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `shopname`, `photo`, `account_holder`, `account_number`, `bank_name`, `bank_branch`, `city`, `created_at`, `updated_at`) VALUES
	(1, 'JOVANY', 'jovanygc95@gmail.com', '4435510677', 'Rtno 10 86', '2003-02-18', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-11 00:05:23', '2024-05-11 00:05:23'),
	(2, 'CLIENTE MOSTRADOR', 'TEST@TEST.COM', '4444444444', 'CLIENTE GENERICO', '2024-05-01', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 21:30:52', '2024-05-15 21:30:52');

-- Volcando estructura para tabla point_of_sale.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `experience` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `vacation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.employees: ~2 rows (aproximadamente)
INSERT IGNORE INTO `employees` (`id`, `name`, `email`, `phone`, `address`, `experience`, `photo`, `salary`, `vacation`, `city`, `created_at`, `updated_at`) VALUES
	(1, 'PEDRO', 'pedro@hotmail.com', '1234567890', 'X', '1 Year', '1798680721317808.jpg', 2000, NULL, 'MORELIA', '2024-05-10 21:40:07', '2024-05-10 21:40:07'),
	(2, 'Juan', 's', '0', 'X', '1 Year', '1798680721317808.jpg', 2000, NULL, 'MORELIA', '2024-05-10 21:40:07', '2024-05-10 21:40:07'),
	(4, 'CHICARCAS', 'S@S.COM', '1234567890', 'Rtno 10 86', NULL, NULL, NULL, NULL, NULL, '2024-05-16 05:13:01', '2024-05-16 05:13:01');

-- Volcando estructura para tabla point_of_sale.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.failed_jobs: ~0 rows (aproximadamente)

-- Volcando estructura para tabla point_of_sale.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.migrations: ~0 rows (aproximadamente)
INSERT IGNORE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_03_15_044621_add_username_and_photo_to_users', 1),
	(6, '2023_03_24_080143_create_employees_table', 1),
	(7, '2023_03_29_025458_create_customers_table', 1),
	(8, '2023_03_30_020042_create_suppliers_table', 1),
	(9, '2023_03_30_083652_create_advance_salaries_table', 1),
	(10, '2023_04_01_142106_create_pay_salaries_table', 1),
	(11, '2023_04_02_141037_create_attendences_table', 1),
	(12, '2023_04_04_041700_create_categories_table', 1),
	(13, '2023_04_04_052256_create_products_table', 1),
	(14, '2023_04_10_043156_create_orders_table', 1),
	(15, '2023_04_10_044212_create_order_details_table', 1),
	(16, '2023_04_13_222344_create_permission_tables', 1);

-- Volcando estructura para tabla point_of_sale.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.model_has_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla point_of_sale.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.model_has_roles: ~2 rows (aproximadamente)
INSERT IGNORE INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(3, 'App\\Models\\User', 2),
	(2, 'App\\Models\\User', 3);

-- Volcando estructura para tabla point_of_sale.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_products` int NOT NULL,
  `sub_total` int DEFAULT NULL,
  `vat` int DEFAULT NULL,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay` int DEFAULT NULL,
  `due` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employee_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.orders: ~8 rows (aproximadamente)
INSERT IGNORE INTO `orders` (`id`, `customer_id`, `order_date`, `order_status`, `total_products`, `sub_total`, `vat`, `invoice_no`, `total`, `payment_status`, `pay`, `due`, `created_at`, `updated_at`, `employee_id`) VALUES
	(1, '1', '2024-05-10', 'complete', 1, 120, 0, 'INV-000001', 120, 'EFECTIVO', 120, '0', '2024-05-11 01:13:45', '2024-05-11 01:14:04', '1'),
	(2, '1', '2024-05-13', 'complete', 1, 120, 0, 'INV-000002', 120, 'EFECTIVO', 120, '0', '2024-05-11 01:16:40', NULL, '2'),
	(3, '1', '2024-05-14', 'complete', 1, 120, 0, 'VTA-000003', 120, 'Efectivo', 120, NULL, '2024-05-14 20:29:20', NULL, '1'),
	(4, '1', '2024-05-14', 'complete', 1, 120, 0, 'VTA-000004', 120, 'Efectivo', 120, NULL, '2024-05-14 21:24:36', NULL, '1'),
	(5, '2', '2024-05-15', 'complete', 3, 360, 0, 'VTA-000005', 360, 'Efectivo', 360, NULL, '2024-05-15 21:31:44', NULL, '2'),
	(6, '2', '2024-05-15', 'complete', 2, 240, 0, 'VTA-000006', 240, 'Efectivo', 240, NULL, '2024-05-16 00:22:47', NULL, '1'),
	(7, '1', '2024-05-15', 'complete', 2, 240, 0, 'VTA-000007', 240, 'Efectivo', 240, NULL, '2024-05-16 02:26:34', NULL, '1'),
	(8, '2', '2024-05-15', 'complete', 2, 270, 0, 'VTA-000008', 270, 'Transferencia', 270, NULL, '2024-05-16 02:55:53', NULL, '2'),
	(9, '1', '2024-05-16', 'complete', 7, 870, 0, 'VTA-000009', 870, 'Efectivo', 870, NULL, '2024-05-17 03:51:50', NULL, '4');

-- Volcando estructura para tabla point_of_sale.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `unitcost` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.order_details: ~10 rows (aproximadamente)
INSERT IGNORE INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unitcost`, `total`, `created_at`, `updated_at`) VALUES
	(1, '1', '1', 1, 120, 120, '2024-05-11 01:13:45', NULL),
	(2, '2', '1', 1, 120, 120, '2024-05-11 01:16:40', NULL),
	(3, '3', '1', 1, 120, 120, '2024-05-14 20:29:20', NULL),
	(4, '4', '1', 1, 120, 120, '2024-05-14 21:24:36', NULL),
	(5, '5', '1', 3, 120, 360, '2024-05-15 21:31:44', NULL),
	(6, '6', '1', 2, 120, 240, '2024-05-16 00:22:47', NULL),
	(7, '7', '1', 2, 120, 240, '2024-05-16 02:26:34', NULL),
	(8, '8', '2', 1, 150, 150, '2024-05-16 02:55:53', NULL),
	(9, '8', '1', 1, 120, 120, '2024-05-16 02:55:53', NULL),
	(10, '9', '1', 6, 120, 720, '2024-05-17 03:51:50', NULL),
	(11, '9', '2', 1, 150, 150, '2024-05-17 03:51:50', NULL);

-- Volcando estructura para tabla point_of_sale.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.password_reset_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla point_of_sale.pay_salaries
CREATE TABLE IF NOT EXISTS `pay_salaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `date` date DEFAULT NULL,
  `paid_amount` int NOT NULL,
  `advance_salary` int DEFAULT NULL,
  `due_salary` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.pay_salaries: ~0 rows (aproximadamente)

-- Volcando estructura para tabla point_of_sale.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.permissions: ~16 rows (aproximadamente)
INSERT IGNORE INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
	(1, 'pos.menu', 'web', 'pos', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(2, 'employee.menu', 'web', 'employee', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(3, 'customer.menu', 'web', 'customer', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(4, 'supplier.menu', 'web', 'supplier', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(5, 'salary.menu', 'web', 'salary', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(6, 'attendence.menu', 'web', 'attendence', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(7, 'category.menu', 'web', 'category', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(8, 'product.menu', 'web', 'product', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(9, 'orders.menu', 'web', 'orders', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(10, 'stock.menu', 'web', 'stock', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(11, 'roles.menu', 'web', 'roles', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(12, 'user.menu', 'web', 'user', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(13, 'database.menu', 'web', 'database', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(14, 'salesEmployee.menu', 'web', 'salesEmployee', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(15, 'creditClient.menu', 'web', 'creditClient', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(16, 'soldItems.menu', 'web', 'soldItems', '2024-05-10 21:08:53', '2024-05-10 21:08:53');

-- Volcando estructura para tabla point_of_sale.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla point_of_sale.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_garage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_store` int DEFAULT NULL,
  `buying_date` date DEFAULT NULL,
  `expire_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buying_price` decimal(8,2) DEFAULT NULL,
  `selling_price` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.products: ~2 rows (aproximadamente)
INSERT IGNORE INTO `products` (`id`, `product_name`, `category_id`, `supplier_id`, `product_code`, `product_garage`, `product_image`, `product_store`, `buying_date`, `expire_date`, `buying_price`, `selling_price`, `created_at`, `updated_at`) VALUES
	(1, 'CORTE DE CABELLO', 1, 1, 'HDZ1', NULL, NULL, NULL, '2024-05-10', NULL, 80.00, 120.00, '2024-05-11 00:39:36', '2024-05-11 01:14:04'),
	(2, 'CERA DE CABELLO ARAÑA', 2, 1, 'HDZ2', NULL, NULL, NULL, '2024-05-07', NULL, 50.00, 150.00, '2024-05-16 02:55:02', '2024-05-16 02:55:02');

-- Volcando estructura para tabla point_of_sale.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.roles: ~4 rows (aproximadamente)
INSERT IGNORE INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'SuperAdmin', 'web', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(2, 'Admin', 'web', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(3, 'Account', 'web', '2024-05-10 21:08:53', '2024-05-10 21:08:53'),
	(4, 'Manager', 'web', '2024-05-10 21:08:53', '2024-05-10 21:08:53');

-- Volcando estructura para tabla point_of_sale.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.role_has_permissions: ~31 rows (aproximadamente)
INSERT IGNORE INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(1, 2),
	(2, 2),
	(3, 2),
	(4, 2),
	(7, 2),
	(8, 2),
	(12, 2),
	(3, 3),
	(4, 3),
	(12, 3),
	(2, 4),
	(5, 4),
	(8, 4),
	(9, 4),
	(10, 4);

-- Volcando estructura para tabla point_of_sale.suppliers
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `shopname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `suppliers_phone_unique` (`phone`),
  UNIQUE KEY `suppliers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.suppliers: ~0 rows (aproximadamente)
INSERT IGNORE INTO `suppliers` (`id`, `name`, `email`, `phone`, `address`, `shopname`, `photo`, `type`, `account_holder`, `account_number`, `bank_name`, `bank_branch`, `city`, `created_at`, `updated_at`) VALUES
	(1, 'Jose Antonio Dibar', NULL, '4434577930', 'Sargento Manuel De La Rosa 145', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-11 00:19:03', '2024-05-11 00:19:03');

-- Volcando estructura para tabla point_of_sale.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla point_of_sale.users: ~2 rows (aproximadamente)
INSERT IGNORE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `username`, `photo`) VALUES
	(1, 'Admin', 'admin@gmail.com', '2024-05-10 21:08:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vLur8kAm8r5inpBldxgwwurxkBioruVOjMHAsFAEX84PoatU2CNAaGqdK0gS', '2024-05-10 21:08:53', '2024-05-10 21:08:53', 'admin', NULL),
	(2, 'User', 'user@gmail.com', '2024-05-10 21:08:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'NXxQhH5O1O', '2024-05-10 21:08:53', '2024-05-10 21:08:53', 'user', NULL),
	(3, 'HUGO', 'hugo@barberiashdz.com', NULL, '$2y$10$TEJzsc2ZbLlCrGWSATKVLunqjCozAq.HEBxvw/5ZYY6ClvX1kTYQu', NULL, '2024-05-16 01:06:40', '2024-05-16 01:06:40', 'HUGO', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
