-- Ejecuto un primer comando para crear la base de datos en caso de que no exista una con ese mismo nombre
CREATE DATABASE IF NOT EXISTS peluqueria_canina;

-- Con éste comando, selecciono la base de datos creada en el paso anterior para proceder a trabajarla
USE peluqueria_canina;

-- Utilizo comando para crear la tabla DUEÑO
CREATE TABLE IF NOT EXISTS Dueno (
    DNI INT NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20) NULL,
    Direccion VARCHAR (100) NOT NULL,
    PRIMARY KEY (DNI)
);

-- Utilizo comando para crear la tabla PERRO
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

-- Utilizo comando para crear la tabla HISTORIAL
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

-- Utilizo comando para proceder a la carga de datos en tabla DUEÑO
INSERT INTO Dueno (DNI, Nombre, Apellido, Telefono, Direccion) VALUES
(35386181, 'Santiago', 'Lopez', '425236', 'La Paz 75'),
(34245879, 'Astor', 'Gonzalez', '425417', 'Sarmiento 65'),
(12644548, 'Candela', 'Tamame', '435379', 'Monferrand 1385'),
(23548579, 'David', 'Williams', '485423', 'Rivadavia 754'),
(24253679, 'Barbara', 'Thompson', '431825', 'Pellegrini 37');

-- Utilizo comando para proceder a la carga de datos en tabla PERRO
INSERT INTO Perro (ID_Perro, Nombre, Fecha_nac, Sexo, DNI_Dueno) VALUES 
(null, 'Samy', '2022-03-06', 'Hembra', 35386181),
(null, 'Tito', '2018-05-04', 'Macho', 24253679),
(null, 'Kuky', '2020-08-21', 'Hembra', 34245879),
(null, 'Pachuchi', '2021-01-01', 'Macho', 12644548),
(null, 'Coqueta', '2017-05-12', 'Hembra', 24253679),
(null, 'Manzano', '2018-08-02', 'Macho', 23548579);

-- Utilizo comandos para proceder a la carga de datos en tabla HISTORIAL
INSERT INTO Historial (ID_Historial, Fecha, ID_Perro, Descripcion, Monto) VALUES
(null, '2022-05-12', '2', 'Baño completo', 1500),
(null, '2022-08-20', '1', 'Corte de uñas', 1500),
(null, '2022-01-05', '3', 'Baño de burbujas', 1000),
(null, '2022-04-02', '5', 'Baño anti garrapatas', 1500),
(null, '2022-09-01', '4', 'Corte de pelo', 1000),
(null, '2022-05-07', '6', 'Peinado', 1000),
(null, '2022-07-02', '7', 'Baño completo', 1500);

-- Ejercicio 12: Obtener todos los perros de sexo “Macho” nacidos entre 2020 y 2022
SELECT * 
FROM Perro 
WHERE Sexo='Macho' AND Fecha_nac BETWEEN '2020-01-01' AND '2022-12-31';
