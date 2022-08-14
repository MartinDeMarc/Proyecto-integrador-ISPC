CREATE DATABASE IF NOT EXISTS peluqueria_canina;

-- Con esta línea seleccionamos BD peluqueria_canina
USE peluqueria_canina;

-- Creamos la tabla Dueño
CREATE TABLE IF NOT EXISTS Dueno (
    DNI INT NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20) NULL,
    Direccion VARCHAR (100) NOT NULL,
    PRIMARY KEY (DNI)
);

-- Creamos la tabla Perro 
CREATE TABLE IF NOT EXISTS Perro (
	ID_Perro INT AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Fecha_nac DATE NOT NULL,
    Sexo VARCHAR(25),
    DNI_Dueno INT NOT NULL,
    PRIMARY KEY (ID_Perro),
    CONSTRAINT fk_DNI_Dueno
		FOREIGN KEY (DNI_Dueno)
		REFERENCES Dueno (DNI)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

-- Creamos la tabla historial
CREATE TABLE IF NOT EXISTS Historial (
	ID_Historial INT AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    ID_Perro INT NOT NULL,
    Descripcion VARCHAR(100) NULL,
    Monto FLOAT NOT NULL,
    PRIMARY KEY (ID_Historial),
    CONSTRAINT fk_ID_Perro
		FOREIGN KEY (ID_Perro)
		REFERENCES Perro (ID_Perro)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

-- Ingresamos los datos para la tabla dueño 
INSERT INTO Dueno (DNI, Nombre, Apellido, Telefono, Direccion) VALUES
(32372166,'Daniela', 'Rossi', '154662589', 'Niceto Vega 123'),
(17890075,'Paula', 'Suarez', '152356980', 'Altolaguirre 2908'),
(34356098, 'Carla', 'Diaz', '156456298', 'León y Pizarro 2022'),
(20155239, 'Roberto', 'Sosa', '156890734', 'Celestino Vidal 2450'),
(38278356, 'Daniela', 'Gomez', '153278903', 'Julio de Vedia 2539');

SELECT *
FROM Perro;

-- Ingresamos los datos para la tabla perro
INSERT INTO Perro (ID_Perro, Nombre, Fecha_nac, Sexo, DNI_Dueno) VALUES
(null, 'Pulguita', '2010-01-04', 'Hembra', 17890075), 
(null, 'Oso', '2018-10-20', 'Macho', 32372166),
(null, 'Peluca', '2015-12-03', 'Hembra', 34356098),
(null, 'Luna', '2020-09-12', 'Hembra', 20155239),
(null, 'Thor', '2012-05-15', 'Macho', 38278356);

-- Ingresamos los datos para la tabla historial
INSERT INTO Historial (ID_Historial, Fecha, ID_Perro, Descripcion, Monto) VALUES
(null, '2015-10-20', '1', 'Baño Completo', 1600),
(null, '2022-01-29', '3', 'Corte y Baño', 1500),
(null, '2022-06-15', '4', 'Baño Completo', 1600),
(null, '2022-03-13', '2', 'Desparasitación', 2000),
(null, '2022-05-02', '5', 'Corte Uñas y Baño', 3000);

-- Escriba una consulta que permita actualizar la dirección de un dueño. Su nueva dirección es Libertad 123

UPDATE Dueno
SET Direccion = 'Libertad 123'
WHERE DNI = '34356098';

SELECT *
FROM Dueno;


