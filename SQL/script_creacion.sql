CREATE DATABASE Control_animales;
USE Control_animales;

CREATE TABLE TITULAR( dni_cif varchar(9) NOT NULL, domicilio varchar(255) NOT NULL,
cp int, nombre varchar(255), apellidos varchar(255), nombre_empresa varchar(255),
fecha_nacimiento date, PRIMARY KEY (dni_cif));

CREATE TABLE LICENCIA( numero_licencia int NOT NULL,
tipo_licencia ENUM('Animal peligroso','Explotacion'), fecha_expedicion DATE,
dni_cif varchar(9), PRIMARY KEY (numero_licencia), FOREIGN KEY (dni_cif)
REFERENCES TITULAR(dni_cif));

CREATE TABLE ANIMAL( numero_identificacion int NOT NULL,
especie ENUM('Perro','Gato','Otros'), animal_peligroso BOOLEAN, domicilio varchar(255),
cp int, pais_origen varchar(255), raza varchar(255), aptitud varchar(255),
capa varchar(255), numero_censo varchar(255), numero_microchip int,
anno_de_nacimiento DATE, PRIMARY KEY (numero_identificacion));

CREATE TABLE ANIMAL_CENSADO( numero_identificacion int NOT NULL, raza varchar(255),
aptitud varchar(255), capa varchar(255), numero_censo varchar(255),
numero_microchip int, anno_de_nacimiento DATE,
PRIMARY KEY (numero_identificacion), FOREIGN KEY (numero_identificacion) REFERENCES ANIMAL (numero_identificacion));

CREATE TABLE TITULARIDAD( numero_identificacion int NOT NULL, dni_cif varchar(9) NOT NULL,
fecha_inicio DATE NOT NULL, fecha_fin DATE, PRIMARY KEY(numero_identificacion, dni_cif, fecha_inicio),
FOREIGN KEY(numero_identificacion) REFERENCES ANIMAL (numero_identificacion), FOREIGN KEY (dni_cif) REFERENCES TITULAR (dni_cif));


CREATE TABLE SANCION( numero_sancion int NOT NULL PRIMARY KEY, cuantia float,
fecha_sancion DATE, id_legal_infraccion varchar(255), gravedad varchar(255),
descripcion varchar(1000), tipo_medida_cautelar ENUM('Retirada preventiva','Clausura preventiva','Ninguna'),
fecha_inicio_medida_cautelar DATE, fecha_fin_medida_cautelar DATE, dni_cif varchar(9),
numero_identificacion int, FOREIGN KEY(numero_identificacion, dni_cif)
REFERENCES TITULARIDAD (numero_identificacion, dni_cif));
