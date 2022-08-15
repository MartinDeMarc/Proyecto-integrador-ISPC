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
(37267360,'Jose', 'Zaragoza', '1132361712', 'Rivadavia 555'),
(23285987, 'Paula', 'Bruno', '23456789', 'Paso de los andes 883'),
(33270490, 'Cesar', 'Gonzalez', '34567890', 'Av. San Martin 218'),
(30313790, 'Victoria', 'Martinez', '26399566', 'Las Pircas 42');
INSERT INTO Perro (ID_Perro, Nombre, Fecha_nac, Sexo, DNI_Dueno) VALUES 
(001, 'Duke', '2018-10-20', 'Macho', 29984320),
(002, 'Laika', '2015-12-03', 'Hembra', 23453245),
(003, 'Monica', '2020-09-12', 'Hembra', 29838566),
(004, 'Sultan', '2012-05-15', 'Macho', 38278356);

-- Ingresamos los datos para la tabla historial
INSERT INTO Historial (ID_Historial, Fecha, ID_Perro, Descripcion, Monto) VALUES
(01, '2022-01-29', '004', 'Corte y Baño', 1500),
(02, '2022-06-15', '003', 'Baño Completo', 1600),
(03, '2022-03-13', '002', 'Desparasitación', 2000),
(04, '2022-05-02', '001', 'Corte Uñas y Baño', 3000);

-- Ejercicio número 9 Sql
UPDATE Dueno SET Direccion="Libertad 123" WHERE Dni=37267360;
Select Nombre, Direccion from Dueno where Dni=37267360;