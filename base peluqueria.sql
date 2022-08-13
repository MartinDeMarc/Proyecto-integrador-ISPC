-- Se utiliza este código para crear la base de datos
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
	ID_Perro INT NOT NULL AUTO_INCREMENT,
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
	ID_Historial INT NOT NULL AUTO_INCREMENT,
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
INSERT INTO Dueno (DNI, Nombre,Apellido,Telefono, Direccion) VALUES
(26396138,'Juan Carlos', 'Ojeda', '3794591291', 'Ecuador 3439'),
(4717808, 'Josefina', 'Centurion', '3794337849', 'Gdor Ruiz 2687'),
(26247477, 'Ariel', 'Romero', '3624379906', 'Guemes 155'),
(22641763,'Leonardo', 'Valenzuela', '3795171010', 'Bolivar 114');

-- Ingresamos los datos para la tabla perro
INSERT INTO Perro (ID_Perro, Nombre, Fecha_nac, Sexo, DNI_Dueno) VALUES 
(512, 'Felipa', '2012-08-02', 'Hembra', 263961388),
(456, 'Perlita', '2013-03-01', 'Hembra', 4717809),
(662, 'Ferguson', '2014-11-10', 'Macho', 26247477),
(045, 'Jack', '2010-10-10', 'Macho', 22641763);

-- Ingresamos los datos para la tabla historial
INSERT INTO Historial (ID_Historial, Fecha, ID_Perro, Descripcion, Monto) VALUES
(11, '2022-01-02', '123', 'Baño Completo', 1600),
(05, '2022-02-03', '789', 'Corte y Uñas', 2000),
(25, '2022-03-04', '654', 'Corte y Baño', 1500),
(35, '2022-04-05', '456', 'Corte Uñas y Baño', 3000);

-- EJERCICIO 7 CONSULTA 
SELECT Fecha, Monto FROM Historial WHERE Fecha BETWEEN '2022-07-01' and '2022-07-31';
SELECT Fecha, Monto FROM Historial WHERE Fecha BETWEEN '2022-01-02' and '2022-04-05';