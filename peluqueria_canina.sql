-- Ejecutando esta linea creamos la base de datos de la peluquería canina, SI NO existe otra que se llame así.
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

-- En los id, para que funcione el auto_increment, no tiene que tener el "not null" cuando se crea la tabla. 
-- Para que funcione el auto_increment hay que poner "null" en ese dato de la columna.

-- Una vez creadas las tablas empezamos a agregar datos a las mismas con los siguientes bloques de codigo:
-- NOTA DE RECORDATORIO PROPIA: El formato de la fecha es: 'AAAA-MM-DD'
-- Ingreso de datos para la tabla Dueño:
INSERT INTO Dueno (DNI, Nombre, Apellido, Telefono, Direccion) VALUES
(13208729, 'Donatello', 'Mendez', '3517981249', 'Buenos aires 257'),
(33268486, 'Pedro', 'Mcgyver', '3515903574', 'Av. Gral Paz 604'),
(26159357, 'Raphael', 'Estelar', '3515371985', '27 de abril 2578'),
(15247169, 'Leonardo', 'Ramirez', '3515658207', 'Sanzio 458'),
(22824167, 'Pedro', 'Momoa', '3516006781', 'Independencia 25'),
(27581034, 'Michelangelo', 'Ramirez', '3516948755', 'Roma 953');

-- Ingreso de datos para la tabla Perro:
INSERT INTO Perro (ID_Perro, Nombre, Fecha_nac, Sexo, DNI_Dueno) VALUES 
(null, 'Fidel', '2012-03-06', 'Macho', 13208729),
(null, 'Dorotea', '2015-09-15', 'Hembra', 33268486),
(null, 'Luna', '2013-06-25', 'Hembra', 26159357),
(null, 'Moncholo', '2014-11-03', 'Macho', 15247169),
(null, 'Brisa', '2017-01-13', 'Hembra', 22824167),
(null, 'Merequetengue', '2018-12-22', 'Macho', 27581034);

-- Antes de ingresar los datos a la tabla Historial, hay que ver el id nos devuelve la tabla Perro.
-- SELECT h.descripcion, p.nombre, p.ID_Perro 
-- FROM Historial h
-- INNER JOIN Perro p ON h.ID_Perro= p.ID_Perro;

-- Con esta consulta se ve la relación entre dueño, perro y el historial de los datos ingresados.
-- SELECT h.descripcion, p.nombre AS Perro, p.ID_Perro, d.Nombre AS "Nombre Dueño"
-- FROM Historial h
-- INNER JOIN Perro p ON h.ID_Perro= p.ID_Perro
-- INNER JOIN Dueno d ON d.DNI = p.DNI_Dueno;

-- Ingreso de datos para la tabla Historial:
INSERT INTO Historial (ID_Historial, Fecha, ID_Perro, Descripcion, Monto) VALUES
(null, '2022-01-04', '7', 'Corte', 1500),
(null, '2022-01-07', '11', 'Corte', 1500),
(null, '2022-02-19', '8', 'Baño', 1000),
(null, '2022-02-22', '12', 'Corte', 1500),
(null, '2022-03-10', '9', 'Baño', 1000),
(null, '2022-03-13', '10', 'Baño', 1000),
(null, '2022-04-01', '11', 'Corte', 1500),
(null, '2022-04-07', '12', 'Baño y Corte', 2000),
(null, '2022-05-11', '7', 'Baño y Corte', 2000),
(null, '2022-05-17', '8', 'Baño', 1000),
(null, '2022-06-16', '9', 'Corte', 1500),
(null, '2022-06-22', '11', 'Baño', 1000),
(null, '2022-07-02', '10', 'Baño', 1000),
(null, '2022-07-20', '12', 'Baño y Corte', 2000);


-- MI ACTIVIDAD PARA LA VALORACION FINAL DE BASE DE DATOS FUE LA SIGUIENTE:
-- 5) Realice una consulta multitabla que arroje el nombre de todos los perros cuyos dueños se llaman Pedro.

SELECT *
FROM perro AS a
INNER JOIN dueno AS b
ON a.DNI_Dueno = b.DNI
AND B.Nombre = 'Pedro'

-- Documento y ejercicio realizado por PABLO J. NOVILLO.

