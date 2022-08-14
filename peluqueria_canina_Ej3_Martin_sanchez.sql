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
(26213806,'Martin', 'Sanchez', '123454678', 'La Cordillera 120'),
(23285987, 'David', 'Guiso', '23456789', 'Independencia 528'),
(33270490, 'Pablo', 'Estelar', '34567890', 'Av. Colón 346'),
(30313790, 'Martina', 'Ramirez', '45678901', 'Obispo Trejo 1547');

-- Ingresamos los datos para la tabla perro
INSERT INTO Perro (ID_Perro, Nombre, Fecha_nac, Sexo, DNI_Dueno) VALUES 
(NULL, 'Logan', '2013-08-02', 'Macho', 26213806),
(NULL, 'Negrito', '2014-03-01', 'Macho', 23285987),
(NULL, 'Laika', '2013-10-12', 'Hembra', 33270490),
(NULL, 'Jack', '2015-07-09', 'Macho', 30313790);

-- Ingresamos los datos para la tabla historial
INSERT INTO Historial (ID_Historial, Fecha, ID_Perro, Descripcion, Monto) VALUES
(NULL, '2022-01-02', '1', 'Baño Completo', 1600),
(NULL, '2022-02-03', '4', 'Desparasitación', 2000),
(NULL, '2022-03-04', '3', 'Corte y Baño', 1500),
(NULL, '2022-04-05', '2', 'Corte Uñas y Baño', 3000);

SELECT * FROM Historial; 

DELETE FROM Historial 
WHERE ID_Perro = 1;

DELETE FROM Perro WHERE ID_Perro = 1;

SELECT * FROM Perro;



