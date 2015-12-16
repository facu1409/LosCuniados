# --------------------------------------------------------
# Host:                         localhost
# Database:                     loscuniados
# Server version:               5.5.24-log
# Server OS:                    Win64
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2015-07-03 19:49:27
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
# Dumping database structure for loscuniados
CREATE DATABASE IF NOT EXISTS `loscuniados` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `loscuniados`;


# Dumping structure for table loscuniados.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,  
  `dniCuit` varchar(30) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `nombre` varchar(30) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `apellido` varchar(30) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `fechaNacimiento` varchar(30) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',  
  `domicilio` varchar(50) COLLATE latin1_spanish_ci NOT NULL DEFAULT '', 
  `telefono` varchar(30) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `mail` varchar(40) COLLATE latin1_spanish_ci DEFAULT '', 
  `activo` bit NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

# Dumping data for table loscuniados.cliente: 0 rows
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;


# Dumping structure for table loscuniados.compra
CREATE TABLE IF NOT EXISTS `compra` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(8) NOT NULL DEFAULT '0',
  `fecha` date NOT NULL,
  `monto` float NOT NULL DEFAULT '0',
  `activo` bit NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

# Dumping data for table loscuniados.compra: 0 rows
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;


# Dumping structure for table loscuniados.factura
CREATE TABLE IF NOT EXISTS `factura` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `id_tipoFactura` char(1) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'C',
  `id_Cliente` int(8) NOT NULL DEFAULT '0',
  `activo` bit NOT NULL DEFAULT 1,
  `fecha` varchar(30) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `monto` float NOT NULL DEFAULT '0',
  `clienteNombre` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

# Dumping data for table loscuniados.factura: 0 rows
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;


# Dumping structure for table loscuniados.lineacompra
CREATE TABLE IF NOT EXISTS `lineacompra` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `id_producto` int(8) NOT NULL DEFAULT '0',
  `cantidad` int(6) NOT NULL DEFAULT '0',
  `precio_unitario` float NOT NULL DEFAULT '0',
  `total` float NOT NULL DEFAULT '0',
  `id_compra` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

# Dumping data for table loscuniados.lineacompra: 0 rows
/*!40000 ALTER TABLE `lineacompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineacompra` ENABLE KEYS */;


# Dumping structure for table loscuniados.lineafactura
CREATE TABLE IF NOT EXISTS `lineafactura` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `id_producto` int(8) NOT NULL DEFAULT '0',
  `cantidad` int(8) NOT NULL DEFAULT '0',
  `precio_unitario` float NOT NULL DEFAULT '0',
  `id_factura` int(8) NOT NULL DEFAULT '0',
  `total` float NOT NULL DEFAULT '0',
  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

ALTER TABLE `loscuniados`.`lineafactura` 
ADD CONSTRAINT `fk_id_factura`
  FOREIGN KEY (`id_factura`)
  REFERENCES `loscuniados`.`factura` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
# Dumping data for table loscuniados.lineafactura: 0 rows
/*!40000 ALTER TABLE `lineafactura` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineafactura` ENABLE KEYS */;


# Dumping structure for table loscuniados.pago
CREATE TABLE IF NOT EXISTS `pago` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(8) NOT NULL DEFAULT '0',
  `id_tipoDePago` int(8) NOT NULL DEFAULT '0',
  `fecha` varchar(30) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `monto` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

# Dumping data for table loscuniados.pago: 0 rows
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;


# Dumping structure for table loscuniados.pagofactura
CREATE TABLE IF NOT EXISTS `pagofactura` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `id_Pago` int(8) NOT NULL DEFAULT '0',
  `id_Factura` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

# Dumping data for table loscuniados.pagofactura: 0 rows
/*!40000 ALTER TABLE `pagofactura` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagofactura` ENABLE KEYS */;


# Dumping structure for table loscuniados.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `detalle` varchar(256) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `stock` int(6) NOT NULL DEFAULT '0',
  `activo` bit NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

# Dumping data for table loscuniados.producto: 0 rows
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;


# Dumping structure for table loscuniados.productoproveedor
CREATE TABLE IF NOT EXISTS `productoproveedor` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `id_producto` int(8) NOT NULL DEFAULT '0',
  `id_proveedor` int(8) NOT NULL DEFAULT '0',
  `precio` float NOT NULL DEFAULT '0', 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

ALTER TABLE `loscuniados`.`productoproveedor` 
ADD CONSTRAINT `fk_id_producto`
  FOREIGN KEY (`id_producto`)
  REFERENCES `loscuniados`.`producto` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_id_proveedor`
  FOREIGN KEY (`id_proveedor`)
  REFERENCES `loscuniados`.`proveedor` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

# Dumping data for table loscuniados.productoproveedor: 0 rows
/*!40000 ALTER TABLE `productoproveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `productoproveedor` ENABLE KEYS */;


# Dumping structure for table loscuniados.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `cuit` varchar(15) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `nombre` varchar(40) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `telefono` varchar(20) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `mail` varchar(50) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `domicilio` varchar(50) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `activo` bit NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

# Dumping data for table loscuniados.proveedor: 0 rows
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;


# Dumping structure for table loscuniados.tipodepago
CREATE TABLE IF NOT EXISTS `tipodepago` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

# Dumping data for table loscuniados.tipodepago: 0 rows
/*!40000 ALTER TABLE `tipodepago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipodepago` ENABLE KEYS */;


# Dumping structure for table loscuniados.tipofactura
CREATE TABLE IF NOT EXISTS `tipofactura` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `nombre` char(1) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

# Dumping data for table loscuniados.tipofactura: 0 rows
/*!40000 ALTER TABLE `tipofactura` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipofactura` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
