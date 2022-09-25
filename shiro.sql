-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.22 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 shiro 的数据库结构
CREATE DATABASE IF NOT EXISTS `shiro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shiro`;

-- 导出  表 shiro.permissions 结构
CREATE TABLE IF NOT EXISTS `permissions` (
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  shiro.permissions 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT IGNORE INTO `permissions` (`name`, `description`) VALUES
	('DELETE', 'delete'),
	('READ', 'read'),
	('user-create', 'user-create'),
	('user-delete', 'user-delete'),
	('user-index', 'user-index'),
	('user-update', 'user-update'),
	('WRITE', 'write');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- 导出  表 shiro.roles 结构
CREATE TABLE IF NOT EXISTS `roles` (
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  shiro.roles 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT IGNORE INTO `roles` (`name`, `description`) VALUES
	('ADMIN', 'Administrator role'),
	('USER_P1', 'Perfil 1'),
	('USER_P2', 'Perfil 2');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- 导出  表 shiro.roles_permissions 结构
CREATE TABLE IF NOT EXISTS `roles_permissions` (
  `role_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`role_name`,`permission`),
  KEY `RP_1` (`role_name`),
  KEY `RP_2` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  shiro.roles_permissions 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `roles_permissions` DISABLE KEYS */;
INSERT IGNORE INTO `roles_permissions` (`role_name`, `permission`) VALUES
	('ADMIN', 'user-create'),
	('ADMIN', 'user-delete'),
	('ADMIN', 'user-index'),
	('ADMIN', 'user-update'),
	('USER_P1', 'user-create'),
	('USER_P1', 'user-index'),
	('USER_P2', 'user-index'),
	('USER_P2', 'user-update');
/*!40000 ALTER TABLE `roles_permissions` ENABLE KEYS */;

-- 导出  表 shiro.users 结构
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  shiro.users 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`username`, `password`) VALUES
	('admin', '$shiro1$SHA-256$500000$N96V7blDKhZUkEo7OrWBJQ==$yqeiYAelWwG7D3XnpdKyRunMfjI65C3T+9+5zEaerpw='),
	('test', '$shiro1$SHA-256$500000$ZRBuLtdU8zzOHJvMR0VOlw==$TVcAcabDvsNwmWwZxBQy5QSZ8kh1Da1xauAyVO0c8pI='),
	('u1', '$shiro1$SHA-256$500000$QmLtx8PaCMe72i+yVuqH+A==$P5ohK5uWi30u38ujuTnmmeUK2gPwqhxTnke2wd9fZXw='),
	('u2', '$shiro1$SHA-256$500000$QmLtx8PaCMe72i+yVuqH+A==$P5ohK5uWi30u38ujuTnmmeUK2gPwqhxTnke2wd9fZXw=');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- 导出  表 shiro.users_roles 结构
CREATE TABLE IF NOT EXISTS `users_roles` (
  `username` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`username`,`role_name`),
  KEY `UR_1` (`username`),
  KEY `UR_2` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  shiro.users_roles 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT IGNORE INTO `users_roles` (`username`, `role_name`) VALUES
	('admin', 'ADMIN'),
	('u1', 'USER_P1'),
	('u2', 'USER_P2');
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
