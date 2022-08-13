CREATE DATABASE `peluqueria-canina`;

USE `peluqueria-canina`;

CREATE TABLE `dueño` (
  `DNI` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`)
);

CREATE TABLE `perro` (
  `ID_Perro` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Fecha_nac` date NOT NULL,
  `Sexo` varchar(45) NOT NULL,
  `Dueño_DNI` int NOT NULL,
  PRIMARY KEY (`ID_Perro`),
  UNIQUE KEY `ID_Perro_UNIQUE` (`ID_Perro`),
  KEY `fk_Perro_Dueño_idx` (`Dueño_DNI`),
  CONSTRAINT `fk_Perro_Dueño` FOREIGN KEY (`Dueño_DNI`) REFERENCES `dueño` (`DNI`)
);

CREATE TABLE `historial` (
  `ID_Historial` int NOT NULL,
  `Fecha` date NOT NULL,
  `Descripción` text NOT NULL,
  `Monto` float NOT NULL,
  `Perro_ID_Perro` int NOT NULL,
  PRIMARY KEY (`ID_Historial`),
  UNIQUE KEY `ID_Historial_UNIQUE` (`ID_Historial`),
  KEY `fk_Historial_Perro_idx` (`Perro_ID_Perro`),
  CONSTRAINT `fk_Historial_Perro` FOREIGN KEY (`Perro_ID_Perro`) REFERENCES `perro` (`ID_Perro`)
);

INSERT INTO `peluqueria-canina`.`dueño` (`DNI`, `Nombre`, `Apellido`, `Telefono`, `Direccion`) VALUES ('39825999', 'Melisa', 'Garay', '3513809627', 'Sierras Grandes 23');
INSERT INTO `peluqueria-canina`.`dueño` (`DNI`, `Nombre`, `Apellido`, `Telefono`, `Direccion`) VALUES ('22003344', 'Adriana', 'Diaz', '3541236381', 'La Loma 145');
INSERT INTO `peluqueria-canina`.`dueño` (`DNI`, `Nombre`, `Apellido`, `Telefono`, `Direccion`) VALUES ('41238362', 'Esteban', 'Arias', '3543823467', 'Pueyrredon 1560');

INSERT INTO `peluqueria-canina`.`perro` (`ID_Perro`, `Nombre`, `Fecha_nac`, `Sexo`, `Dueño_DNI`) VALUES ('5', 'Pulpa', '2016-07-25', 'Hembra', '39825999');
INSERT INTO `peluqueria-canina`.`perro` (`ID_Perro`, `Nombre`, `Fecha_nac`, `Sexo`, `Dueño_DNI`) VALUES ('10', 'Balto', '2020-02-29', 'Macho', '22003344');
INSERT INTO `peluqueria-canina`.`perro` (`ID_Perro`, `Nombre`, `Fecha_nac`, `Sexo`, `Dueño_DNI`) VALUES ('15', 'Kyra', '2014-11-13', 'Hembra', '41238362');

INSERT INTO `peluqueria-canina`.`historial` (`ID_Historial`, `Fecha`, `Descripción`, `Monto`, `Perro_ID_Perro`) VALUES ('1', '2022-07-02', 'Traslado y baño', '1500', '5');
INSERT INTO `peluqueria-canina`.`historial` (`ID_Historial`, `Fecha`, `Descripción`, `Monto`, `Perro_ID_Perro`) VALUES ('2', '2021-03-22', 'Baño', '500', '10');
INSERT INTO `peluqueria-canina`.`historial` (`ID_Historial`, `Fecha`, `Descripción`, `Monto`, `Perro_ID_Perro`) VALUES ('3', '2021-12-28', 'Traslado, baño y corte', '1500', '15');

INSERT INTO `peluqueria-canina`.`historial` (`ID_Historial`, `Fecha`, `Descripción`, `Monto`, `Perro_ID_Perro`) VALUES ('4', '2022-03-10', 'Traslado y baño', '1500', '10');

SELECT * FROM `dueño`;
SELECT * FROM `perro`;
SELECT * FROM `historial`;