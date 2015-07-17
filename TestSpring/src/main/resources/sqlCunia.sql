CREATE DATABASE `LosCunia` ;
CREATE TABLE `Cliente` (
`ClienteID` int(6) NOT NULL AUTO_INCREMENT,
`Nombre` varchar(40) NOT NULL,  
`Apellido` varchar(40) NOT NULL,
`TelMovil` varchar(40) NOT NULL,
`Email` varchar(40) NOT NULL,
`Direccion` varchar(40) NOT NULL,

  PRIMARY KEY (`ClienteID`)

) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
