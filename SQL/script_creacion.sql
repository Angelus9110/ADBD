DROP DATABASE IF EXISTS Control_animales;
CREATE DATABASE Control_animales;
USE Control_animales;

DROP TABLE IF EXISTS SANCION;
DROP TABLE IF EXISTS TITULARIDAD;
DROP TABLE IF EXISTS ANIMAL_CENSADO;
DROP TABLE IF EXISTS ANIMAL;
DROP TABLE IF EXISTS LICENCIA;
DROP TABLE IF EXISTS TITULAR;

CREATE TABLE TITULAR( dni_cif varchar(9) NOT NULL, domicilio varchar(255) NOT NULL,
cp int, nombre varchar(255), apellidos varchar(255), fecha_nacimiento date,
nombre_empresa varchar(255), PRIMARY KEY (dni_cif));

CREATE TABLE LICENCIA( numero_licencia int NOT NULL, dni_cif varchar(9),
tipo_licencia ENUM('Animal peligroso','Explotacion'), fecha_expedicion DATE,
PRIMARY KEY (numero_licencia), FOREIGN KEY (dni_cif) REFERENCES TITULAR(dni_cif));

CREATE TABLE ANIMAL( numero_identificacion int NOT NULL,
especie ENUM('Perro','Gato','Otros'), animal_peligroso BOOLEAN, domicilio varchar(255),
cp int, pais_origen varchar(255), PRIMARY KEY (numero_identificacion));

CREATE TABLE ANIMAL_CENSADO( numero_identificacion int NOT NULL, raza varchar(255),
aptitud varchar(255), capa varchar(255), numero_censo varchar(255),
numero_microchip int, anno_nacimiento YEAR,
PRIMARY KEY (numero_identificacion), FOREIGN KEY (numero_identificacion) REFERENCES ANIMAL (numero_identificacion));

CREATE TABLE TITULARIDAD( numero_identificacion int NOT NULL, dni_cif varchar(9) NOT NULL,
fecha_inicio DATE NOT NULL, fecha_fin DATE, PRIMARY KEY(numero_identificacion, dni_cif, fecha_inicio),
FOREIGN KEY(numero_identificacion) REFERENCES ANIMAL (numero_identificacion), FOREIGN KEY (dni_cif) REFERENCES TITULAR (dni_cif));

CREATE TABLE SANCION( numero_sancion int NOT NULL PRIMARY KEY, numero_identificacion int,
dni_cif varchar(9), cuantia float, fecha_sancion DATE, id_legal_infraccion varchar(255),
gravedad varchar(255), descripcion varchar(1000),
tipo_medida_cautelar ENUM('Retirada preventiva','Clausura preventiva','Ninguna'),
fecha_inicio_medida_cautelar DATE, fecha_fin_medida_cautelar DATE,
FOREIGN KEY(numero_identificacion, dni_cif)
REFERENCES TITULARIDAD (numero_identificacion, dni_cif));


INSERT INTO TITULAR VALUES ('12052808A','Calle Cerrada Alajuela 37', 13001, 'Gabriel', 'Muñoz Perez', '1975-01-11', null);
INSERT INTO TITULAR VALUES ('01021428K','Calle Calvario 23', 13004, 'Miguel Angel', 'Trillo Carro', '1985-03-06', null);
INSERT INTO TITULAR VALUES ('65477863Z','Calle Mayor 12', 13006, 'Luis', 'Recuero Nogues', '1975-07-01', null);
INSERT INTO TITULAR VALUES ('38866604P','Calle Real 34', 13010, 'Ricardo', 'Diez Vilaplana', '1965-02-17', null);
INSERT INTO TITULAR VALUES ('67505087N','Avenida Diagonal 6', 13004, 'Armando', 'Bronca Segura', '1973-07-03', null);
INSERT INTO TITULAR VALUES ('95244324J','Calle del Molino 9', 13012, 'Domingo', 'Diaz Festivo', '1984-06-05', null);
INSERT INTO TITULAR VALUES ('05821682Z','Calle del Castillo 4', 13007, 'Melchor', 'Gaspar Baltasar', '1963-08-06', null);
INSERT INTO TITULAR VALUES ('06588617Z','Plaza España 23', 13001, 'Ricardo', 'Tello Castro', '1986-11-02', null);
INSERT INTO TITULAR VALUES ('86587415M','Paseo de los sauces 34', 13005 , 'Daniel', 'Dios Satan', '1984-02-24', null);
INSERT INTO TITULAR VALUES ('44729765D','Calle Evergreen Terrace 743', 13024, 'Esteban', 'Dios Espino', '1972-12-12', null);
INSERT INTO TITULAR VALUES ('27441023E','Calle Obregon 21', 13006, 'Vicente', 'Marato Berlanga', '1976-03-11', null);
INSERT INTO TITULAR VALUES ('35185176Y','Calle Falsa 123', 13013, 'Felipe', 'Abreu Lapuerto', '1956-12-07', null);
INSERT INTO TITULAR VALUES ('38485868M','Calle Alarcos 34', 13017, 'Elena', 'Nito Del Bosque', '1992-04-30', null);
INSERT INTO TITULAR VALUES ('11331763P','Calle Mayor 13', 13006, 'Lucia', 'Cuervo Aguilar', '1990-08-05', null);
INSERT INTO TITULAR VALUES ('58996810Q','Plaza Rinconada 5', 13013, 'Montserrat', 'Curto Batallas', '1958-05-16', null);
INSERT INTO TITULAR VALUES ('48826660Y','Calle San Miguel 6', 13015, 'Alicia', 'Nuñez Bonillo', '1959-12-03', null);
INSERT INTO TITULAR VALUES ('59358825B','Paseo de Belen 15', 13004, 'Maria', 'Dolores de Cospedal', '1969-05-19', null);
INSERT INTO TITULAR VALUES ('37558515K','Calle Platero 34', 13009, 'Juana', 'Danza Infatiles', '1992-11-12', null);
INSERT INTO TITULAR VALUES ('70595906M','Avenida Miguel de Unamuno 51', 13005, 'Olga', 'Raposo Brenes', '1988-12-04', null);
INSERT INTO TITULAR VALUES ('88337440Y','Calle del Castillo 9', 13004, 'Marta', 'Capo Corleone', '1967-05-05', null);
INSERT INTO TITULAR VALUES ('33167590A','Plaza Mayor 3', 13006, 'Maria Pilar', 'Valladares Poyatos', '1972-03-26', null);
INSERT INTO TITULAR VALUES ('26645581N','Calle Alondras 19', 13006, 'Antonia', 'Casade Chamizo', '1988-04-08', null);
INSERT INTO TITULAR VALUES ('11477333B','Plaza de la Iglesia 3', 13002, 'Ana Isabel', 'Alvarez Barrado', '1995-05-05', null);
INSERT INTO TITULAR VALUES ('A16837239','Avenida del Hierro 23', 13016, null, null, null, 'Cooperativa Ganaderos Alcolea de Calatrava');
INSERT INTO TITULAR VALUES ('D48985279','Calle del Plomo 45', 13016, null, null, null, 'Industrias Pesadas Piedrabuena');
INSERT INTO TITULAR VALUES ('P94928678','Calle del Acero 7', 13016, null, null, null, 'Explotacion Malagon');

INSERT INTO ANIMAL VALUES (1,'Perro',TRUE,'Calle Cerrada Alajuela 37', 13001, 'España');
INSERT INTO ANIMAL VALUES (2,'Perro',TRUE,'Calle Cerrada Alajuela 37', 13001, 'España');
INSERT INTO ANIMAL VALUES (3,'Perro',FALSE,'Calle Calvario 23', 13004, 'España');
INSERT INTO ANIMAL VALUES (4,'Perro',FALSE,'Calle Mayor 12', 13006, 'España');
INSERT INTO ANIMAL VALUES (5,'Gato',FALSE,'Calle Real 34', 13010, 'España');
INSERT INTO ANIMAL VALUES (6,'Gato',FALSE,'Avenida Diagonal 6', 13004, 'España');
INSERT INTO ANIMAL VALUES (7,'Gato',FALSE,'Calle del Molino 9', 13012, 'España');
INSERT INTO ANIMAL VALUES (8,'Gato',FALSE,'Calle del Castillo 4', 13007, 'España');
INSERT INTO ANIMAL VALUES (9,'Otros',FALSE,'Plaza España 23', 13001, 'Mexico');
INSERT INTO ANIMAL VALUES (10,'Otros',FALSE,'Paseo de los sauces 34', 13005, 'Mexico');
INSERT INTO ANIMAL VALUES (11,'Otros',FALSE,'Calle Evergreen Terrace 743', 1302, 'Mexico');
INSERT INTO ANIMAL VALUES (12,'Otros',FALSE,'Calle Obregon 21', 13006, 'Argentina');
INSERT INTO ANIMAL VALUES (13,'Otros',FALSE,'Calle Falsa 123', 13013, 'Argentina');
INSERT INTO ANIMAL VALUES (14,'Otros',FALSE,'Calle Alarcos 34', 13017, 'Colombia');
INSERT INTO ANIMAL VALUES (15,'Otros',FALSE,'Calle Mayor 13', 13006, 'Cuba');
INSERT INTO ANIMAL VALUES (16,'Otros',FALSE,'Plaza Rinconada 5', 13013, 'Bolivia');
INSERT INTO ANIMAL VALUES (17,'Otros',TRUE,'Calle San Miguel 6', 13015, 'Vietnam');
INSERT INTO ANIMAL VALUES (18,'Otros',TRUE,'Paseo de Belen 15', 13004, 'Sudáfrica');
INSERT INTO ANIMAL VALUES (19,'Otros',FALSE,'Calle Platero 34', 13009, 'Angola');
INSERT INTO ANIMAL VALUES (20,'Otros',FALSE,'Avenida Miguel de Unamuno 51', 13005, 'Haití');
INSERT INTO ANIMAL VALUES (21,'Otros',FALSE,'Calle del Castillo 9', 13004, 'Estados Unidos');
INSERT INTO ANIMAL VALUES (22,'Perro',FALSE,'Plaza Mayor 3', 13006, 'España');
INSERT INTO ANIMAL VALUES (23,'Perro',FALSE,'Calle Alondras 19', 13006, 'España');
INSERT INTO ANIMAL VALUES (24,'Otros',FALSE,'Plaza de la Iglesia 3', 13002, 'Argelia');
INSERT INTO ANIMAL VALUES (25,'Otros',FALSE,'Avenida del Hierro 23', 13016, 'Kuwait');
INSERT INTO ANIMAL VALUES (26,'Gato',FALSE,'Calle del Plomo 45', 13016, 'España');
INSERT INTO ANIMAL VALUES (27,'Gato',FALSE,'Calle del Acero 7', 13016, 'España');

INSERT INTO ANIMAL_CENSADO VALUES (1, 'Pit Bull Terrier', 'si', 'Blanco', '1', 05151, '2001');
INSERT INTO ANIMAL_CENSADO VALUES (2, 'Rottweiler', 'si', 'Marrón', '2', 40604, '2010');
INSERT INTO ANIMAL_CENSADO VALUES (3, 'Labrador', 'no', 'Amarillo', '3', 34394, '2008');
INSERT INTO ANIMAL_CENSADO VALUES (4, 'San Bernardo', 'si', 'Marrón', '4', 67170, '2014');
INSERT INTO ANIMAL_CENSADO VALUES (5, 'Abisinio', 'no', 'Blanco', '5', 79246, '2016');
INSERT INTO ANIMAL_CENSADO VALUES (6, 'Balinés', 'si', 'Gris', '6', 22228, '1999');
INSERT INTO ANIMAL_CENSADO VALUES (7, 'Mau Egipcio', 'si', 'Blanco', '7', 99029, '2005');
INSERT INTO ANIMAL_CENSADO VALUES (8, 'Persa', 'no', 'Blanco', '8', 69995, '2007');
INSERT INTO ANIMAL_CENSADO VALUES (22, 'Labrador', 'no', 'Amarillo', '9', 69995, '2011');
INSERT INTO ANIMAL_CENSADO VALUES (23, 'Pastor Alemán', 'no', 'Negro', '10', 69995, '2008');
INSERT INTO ANIMAL_CENSADO VALUES (26, 'Scottish Fold', 'no', 'Ocre', '11', 69995, '2004');
INSERT INTO ANIMAL_CENSADO VALUES (27, 'Bengalí', 'no', 'Marrón', '12', 69995, '2015');

INSERT INTO LICENCIA VALUES (1, '12052808A', 'Animal peligroso', '1999-10-11');
INSERT INTO LICENCIA VALUES (2, '01021428K', 'Animal peligroso', '2008-05-07');
INSERT INTO LICENCIA VALUES (3, '48826660Y', 'Animal peligroso', '2000-03-09');
INSERT INTO LICENCIA VALUES (4, '59358825B', 'Animal peligroso', '2014-12-18');
INSERT INTO LICENCIA VALUES (5, 'A16837239', 'Explotacion', '2000-08-16');
INSERT INTO LICENCIA VALUES (6, 'D48985279', 'Explotacion', '2002-01-24');
INSERT INTO LICENCIA VALUES (7, 'P94928678', 'Explotacion', '2013-06-25');

INSERT INTO TITULARIDAD VALUES (1, '12052808A', '2002-03-12', null);
INSERT INTO TITULARIDAD VALUES (2, '12052808A', '2010-01-06', null);
INSERT INTO TITULARIDAD VALUES (3, '01021428K', '2009-06-05', null);
INSERT INTO TITULARIDAD VALUES (4, '65477863Z', '2014-03-18', null);
INSERT INTO TITULARIDAD VALUES (5, '38866604P', '2016-02-08', null);
INSERT INTO TITULARIDAD VALUES (6, '67505087N', '1999-08-04', '2012-09-10');
INSERT INTO TITULARIDAD VALUES (7, '95244324J', '2006-05-07', null);
INSERT INTO TITULARIDAD VALUES (8, '05821682Z', '2007-09-11', '2016-01-04');
INSERT INTO TITULARIDAD VALUES (9, '06588617Z', '2013-01-31', null);
INSERT INTO TITULARIDAD VALUES (10, '86587415M', '2006-04-09', null);
INSERT INTO TITULARIDAD VALUES (11, '44729765D', '2003-09-03', null);
INSERT INTO TITULARIDAD VALUES (12, '27441023E', '2007-03-12', null);
INSERT INTO TITULARIDAD VALUES (13, '35185176Y', '2014-04-07', null);
INSERT INTO TITULARIDAD VALUES (14, '38485868M', '2014-04-06', null);
INSERT INTO TITULARIDAD VALUES (15, '11331763P', '2004-01-06', null);
INSERT INTO TITULARIDAD VALUES (16, '58996810Q', '2008-11-12', null);
INSERT INTO TITULARIDAD VALUES (17, '48826660Y', '2001-03-26', '2012-07-05');
INSERT INTO TITULARIDAD VALUES (18, '59358825B', '2009-05-06', null);
INSERT INTO TITULARIDAD VALUES (19, '37558515K', '2002-12-02', null);
INSERT INTO TITULARIDAD VALUES (20, '70595906M', '2005-01-01', null);
INSERT INTO TITULARIDAD VALUES (21, '88337440Y', '2001-06-26', null);
INSERT INTO TITULARIDAD VALUES (22, '33167590A', '2011-04-30', '2016-04-03');
INSERT INTO TITULARIDAD VALUES (23, '26645581N', '2008-07-12', null);
INSERT INTO TITULARIDAD VALUES (24, '11477333B', '2001-09-08', null);
INSERT INTO TITULARIDAD VALUES (25, 'A16837239', '2011-02-12', null);
INSERT INTO TITULARIDAD VALUES (26, 'D48985279', '2004-04-22', null);
INSERT INTO TITULARIDAD VALUES (27, 'P94928678', '2015-03-09', null);

INSERT INTO SANCION VALUES (00423, 1, '12052808A', 100.0, '2013-08-03', '005244F', 'Leve', 'Incumplimiento del artículo 10 sobre autorización de tenencia', null, null, null);
INSERT INTO SANCION VALUES (04784, 2, '12052808A', 100.0, '2015-11-21', '005235F', 'Leve', 'Incumplimiento del artículo 13.3 sobre limpieza urbana y salud pública', null, null, null);
INSERT INTO SANCION VALUES (05319, 17, '48826660Y', 450.0, '2014-04-10', '004674L', 'Grave', 'Incumplimiento del artículo 9.1 referente a prohibiciones específicas', null, null, null);

select L.numero_licencia, L.tipo_licencia
from LICENCIA L
where L.dni_cif = '12052808A';

select S.numero_identificacion, count(*) as nsanciones
from SANCION S
where S.numero_identificacion = 2;

select TI.numero_identificacion
from TITULARIDAD TI
where TI.dni_cif = '12052808A' and TI.fecha_fin is null
