CREATE TABLE Titular( DNI_CIF varchar(9) NOT NULL, Domicilio varchar(255) NOT NULL,
CP int, Nombre varchar(255), Apellidos varchar(255), Nombre_empresa varchar(255),
Fecha_nacimiento date, PRIMARY KEY (DNI_CIF));

CREATE TABLE Licencia( Numero_licencia int NOT NULL,
Tipo_licencia ENUM('Animal peligroso','Explotacion'), Fecha_expedicion DATE,
DNI_CIF varchar(9), PRIMARY KEY (Numero_licencia), FOREIGN KEY (DNI_CIF)
REFERENCES Titular(DNI_CIF));

CREATE TABLE Animal( Numero_identificacion int NOT NULL,
Especie ENUM('Perro','Gato','Otros'), Animal_peligroso BOOLEAN, Domicilio varchar(255),
CP int, Pais_origen varchar(255), Raza varchar(255), Aptitud varchar(255),
Capa varchar(255), Numero_censo varchar(255), Numero_microchip int,
Anio_de_nacimiento DATE, PRIMARY KEY (Numero_identificacion));

CREATE TABLE Titularidad( Numero_identificacion int NOT NULL, DNI_CIF varchar(9) NOT NULL,
Fecha_inicio DATE, Fecha_fin DATE, PRIMARY KEY(Numero_identificacion, DNI_CIF),
FOREIGN KEY(Numero_identificacion) REFERENCES Animal (Numero_identificacion),
FOREIGN KEY(DNI_CIF) REFERENCES Titular (DNI_CIF));


CREATE TABLE Sancion( Numero_sancion int NOT NULL PRIMARY KEY, Cuantia float,
Fecha_sancion DATE, ID_legal_infraccion varchar(255), Gravedad varchar(255),
Descripcion varchar(1000), Tipo_medida_cautelar ENUM('Retirada preventiva','Clausura preventiva','Ninguna'),
Fecha_inicio_medida_cautelar DATE, Fecha_fin_medida_cautelar DATE, DNI_CIF varchar(9),
Numero_identificacion int, FOREIGN KEY(Numero_identificacion) REFERENCES Titularidad (Numero_identificacion),
FOREIGN KEY(DNI_CIF) REFERENCES Titularidad (DNI_CIF));
