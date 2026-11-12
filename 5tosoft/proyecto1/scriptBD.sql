-- Modelo de origen: modelob.mwb
-- Base de datos: csn_inventario
-- Compatible con MySQL y MariaDB de XAMPP.
-- Conserva columnas, valores predeterminados, claves e indices del modelo.
-- Solo estructura: no incluye registros ni usuarios de acceso a MySQL.
-- IF NOT EXISTS conserva tablas existentes; no actualiza sus estructuras.

SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS `csn_inventario`
  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `csn_inventario`;

CREATE TABLE IF NOT EXISTS `sga_categorias` (
  `cat_id` INT NOT NULL AUTO_INCREMENT,
  `cat_nombre` VARCHAR(80) NOT NULL,
  `cat_observacion` VARCHAR(100) NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `id_UNIQUE` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `sga_clientes` (
  `cli_id` INT NOT NULL AUTO_INCREMENT,
  `cli_cedula` VARCHAR(10) NULL,
  `cli_nombres` VARCHAR(50) NULL,
  `cli_apellidos` VARCHAR(50) NULL,
  `cli_ecivil` VARCHAR(15) NULL,
  `cli_sexo` VARCHAR(1) NULL,
  `cli_correo` VARCHAR(100) NULL,
  `cli_direcd` VARCHAR(100) NULL,
  `cli_nmovil` VARCHAR(15) NULL,
  `cli_estado` VARCHAR(1) NULL,
  PRIMARY KEY (`cli_id`),
  UNIQUE KEY `cli_id_UNIQUE` (`cli_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `sga_proveedores` (
  `prv_id` INT NOT NULL AUTO_INCREMENT,
  `prv_cedula` VARCHAR(13) NULL,
  `prv_nombres` VARCHAR(50) NULL,
  `prv_apellidos` VARCHAR(50) NULL,
  `prv_ecivil` VARCHAR(15) NULL,
  `prv_sexo` VARCHAR(1) NULL,
  `prv_correo` VARCHAR(100) NULL,
  `prv_direcd` VARCHAR(100) NULL,
  `prv_nmovil` VARCHAR(15) NULL,
  `prv_estado` VARCHAR(1) NULL,
  PRIMARY KEY (`prv_id`),
  UNIQUE KEY `prv_id_UNIQUE` (`prv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `sga_usuarios` (
  `usu_id` INT NOT NULL AUTO_INCREMENT,
  `usu_apenom` VARCHAR(50) NULL,
  `usu_correo` VARCHAR(100) NULL,
  `usu_clave` VARCHAR(20) NULL,
  PRIMARY KEY (`usu_id`),
  UNIQUE KEY `usu_id_UNIQUE` (`usu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `sga_productos` (
  `pro_id` INT NOT NULL AUTO_INCREMENT,
  `pro_nombre` VARCHAR(80) NULL,
  `pro_costo` FLOAT NULL,
  `pro_pvp1` FLOAT NULL,
  `pro_pvp2` FLOAT NULL,
  `pro_pvp4` FLOAT NULL,
  `pro_iva` TINYINT NULL,
  `pro_unimed` VARCHAR(50) NULL DEFAULT 'UNIDAD' COMMENT 'UNIDAD DE MEDIDA',
  `pro_estado` VARCHAR(45) NULL DEFAULT 'ACTIVO',
  `sga_categorias_cat_id` INT NOT NULL,
  `sga_proveedores_prv_id` INT NOT NULL,
  PRIMARY KEY (`pro_id`, `sga_categorias_cat_id`, `sga_proveedores_prv_id`),
  UNIQUE KEY `pro_id_UNIQUE` (`pro_id`),
  KEY `fk_sga_productos_sga_categorias1_idx` (`sga_categorias_cat_id`),
  KEY `fk_sga_productos_sga_proveedores1_idx` (`sga_proveedores_prv_id`),
  CONSTRAINT `fk_sga_productos_sga_categorias1`
    FOREIGN KEY (`sga_categorias_cat_id`)
    REFERENCES `sga_categorias` (`cat_id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sga_productos_sga_proveedores1`
    FOREIGN KEY (`sga_proveedores_prv_id`)
    REFERENCES `sga_proveedores` (`prv_id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
