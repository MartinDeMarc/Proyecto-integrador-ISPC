# Creo la Base de datos si no existe
CREATE DATABASE IF NOT EXISTS Pelu_Cani;

#Selecciono la BD Pelu_Cani
USE Pelu_Cani;

#creo tabla dueno
create table Dueno(
DNI int primary key not null,
Nombre varchar(25) not null,
Apellido varchar(25) not null,
Telefono bigint not null,
Dirección varchar(50)
);

USE Pelu_Cani;

#Ingreso datos y nuevo dueño llamado gabriel nardi
INSERT INTO Dueno (DNI, Nombre, Apellido, Telefono, Dirección) VALUE
(28957346, 'Juan', 'Perez', 4789689, 'Belgrano 101'),
(23546987, 'Maria', 'Perez', 23546987, 'Pueyrredon  811'),
(39068895, 'Gabriel', 'Nardi', 35254888, 'Independencia 350');


#Creo la Tabla Perro 
CREATE TABLE IF NOT EXISTS Perro (
ID_Perro int primary key auto_increment,
Nombre varchar(25) not null,
Fecha_Nac date,
Sexo varchar(25),
DNI_Dueno int,
foreign key(DNI_Dueno) references Dueno(DNI)	
);

USE Pelu_Cani;
##Ingreso datos y nuevo perro llamado liam
INSERT INTO Perro (ID_Perro, Nombre, Fecha_Nac, Sexo, DNI_Dueno) VALUE
(1, 'Puppy', '2012-12-11', 'M', 28957346),
(2, 'Fido', '2012-12-12', 'M', 23546987),
(3, 'Liam', '2022-05-22', 'F', 39068895);


#Creo la Tabla Historial
CREATE TABLE IF NOT EXISTS Historial(
ID_Historial int primary key auto_increment,
Fecha date,
Perro int,
Descripcion varchar(30),
Monto decimal,
foreign key (Perro) references  Perro(ID_Perro)
);

#actividad n°4 Actualice la fecha de nacimiento de algún animal (Puppy) que usted considere.

UPDATE Perro 
SET Fecha_Nac='2012-12-22'
where ID_Perro=1;

