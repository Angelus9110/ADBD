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
numero_microchip int, anno_nacimiento DATE,
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


INSERT INTO TITULAR VALUES ('12052808A','Calle Cerrada Alajuela 37', 13001, 'Gabriel', 'Muñoz Perez', '11-01-1975', null);
INSERT INTO TITULAR VALUES ('01021428K','Calle Calvario 23', 13004, 'Miguel Angel', 'Trillo Carro', '03-06-1985', null);
INSERT INTO TITULAR VALUES ('65477863Z','Calle Mayor 12', 13006, 'Luis', 'Recuero Nogues', '25-01-1975', null);
INSERT INTO TITULAR VALUES ('38866604P','Calle Real 34', 13010, 'Ricardo', 'Diez Vilaplana', '02-08-1965', null);
INSERT INTO TITULAR VALUES ('67505087N','Avenida Diagonal 6', 13004, 'Armando', 'Bronca Segura', '07-03-1973', null);
INSERT INTO TITULAR VALUES ('95244324J','Calle del Molino 9', 13012, 'Domingo', 'Diaz Festivo', '06-05-1984', null);
INSERT INTO TITULAR VALUES ('05821682Z','Calle del Castillo 4', 13007, 'Melchor', 'Gaspar Baltasar', '25-06-1963', null);
INSERT INTO TITULAR VALUES ('06588617Z','Plaza España 23', 13001, 'Ricardo', 'Tello Castro', '13-02-1986', null);
INSERT INTO TITULAR VALUES ('86587415M','Paseo de los sauces 34', 13005 , 'Daniel', 'Dios Satan', '25-04-1984', null);
INSERT INTO TITULAR VALUES ('44729765D','Calle Evergreen Terrace 743', 13024, 'Esteban', 'Dios Espino', '12-12-1972', null);
INSERT INTO TITULAR VALUES ('27441023E','Calle Obregon 21', 13006, 'Vicente', 'Marato Berlanga', '15-11-1976', null);
INSERT INTO TITULAR VALUES ('35185176Y','Calle Falsa 123', 13013, 'Felipe', 'Abreu Lapuerto', '12-07-1956', null);
INSERT INTO TITULAR VALUES ('38485868M','Calle Alarcos 34', 13017, 'Elena', 'Nito Del Bosque', '14-07-1992', null);
INSERT INTO TITULAR VALUES ('11331763P','Calle Mayor 13', 13006, 'Lucia', 'Cuervo Aguilar', '16-05-1990', null);
INSERT INTO TITULAR VALUES ('58996810Q','Plaza Rinconada 5', 13013, 'Montserrat', 'Curto Batallas', '06-05-18-1989', null);
INSERT INTO TITULAR VALUES ('48826660Y','Calle San Miguel 6', 13015, 'Alicia', 'Nuñez Bonillo', '12-03-1886', null);
INSERT INTO TITULAR VALUES ('59358825B','Paseo de Belen 15', 13004, 'Maria', 'Dolores de Cospedal', '14-06-1969', null);
INSERT INTO TITULAR VALUES ('37558515K','Calle Platero 34', 13009, 'Juana', 'Danza Infatiles', '14-12-1992', null);
INSERT INTO TITULAR VALUES ('70595906M','Avenida Miguel de Unamuno 51', 13005, 'Olga', 'Raposo Brenes', '17-04-1988', null);
INSERT INTO TITULAR VALUES ('88337440Y','Calle del Castillo 9', 13004, 'Marta', 'Capo Corleone', '26-05-1967', null);
INSERT INTO TITULAR VALUES ('33167590A','Plaza Mayor 3', 13006, 'Maria Pilar', 'Valladares Poyatos', '13-06-1972', null);
INSERT INTO TITULAR VALUES ('26645581N','Calle Alondras 19', 13006, 'Antonia', 'Casade Chamizo', '17-08-1988', null);
INSERT INTO TITULAR VALUES ('11477333B','Plaza de la Iglesia 3', 13002, 'Ana Isabel', 'Alvarez Barrado', '05-05-1995', null);
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
INSERT INTO ANIMAL_CENSADO VALUES (27 'Bengalí', 'no', 'Marrón', '12', 69995, '2015');

INSERT INTO LICENCIA VALUES (1, '12052808A', 'Animal peligroso', '10-11-1999');
INSERT INTO LICENCIA VALUES (2, '01021428K', 'Animal peligroso', '05-07-2008');
INSERT INTO LICENCIA VALUES (3, '48826660Y', 'Animal peligroso', '09-03-2000');
INSERT INTO LICENCIA VALUES (4, '59358825B', 'Animal peligroso', '18-12-2014');
INSERT INTO LICENCIA VALUES (5, 'A16837239', 'Explotacion', '16-08-2000');
INSERT INTO LICENCIA VALUES (6, 'D48985279', 'Explotacion', '24-01-2002');
INSERT INTO LICENCIA VALUES (7, 'P94928678', 'Explotacion', '25-06-2013');

INSERT INTO SANCION VALUES (1, 00423, '12052808A', 100.0, '03-08-2013', '005244F', 'Leve', 'Incumplimiento del artículo 10 sobre autorización de tenencia', null, null, null);
INSERT INTO SANCION VALUES (2, 04784, '12052808A', 100.0, '21-11-2015', '005235F', 'Leve', 'Incumplimiento del artículo 13.3 sobre limpieza urbana y salud pública', null, null, null);
INSERT INTO SANCION VALUES (3, 05319, '48826660Y', 450.0, '10-04-2014', '004674L', 'Grave', 'Incumplimiento del artículo 9.1 referente a prohibiciones específicas', null, null, null);

INSERT INTO TITULARIDAD VALUES (1, '12052808A', '03-12-2002', null);
INSERT INTO TITULARIDAD VALUES (2, '12052808A', '21-06-2010', null);
INSERT INTO TITULARIDAD VALUES (3, '01021428K', '30-05-2009', null);
INSERT INTO TITULARIDAD VALUES (4, '65477863Z', '13-03-2014', null);
INSERT INTO TITULARIDAD VALUES (5, '38866604P', '22-08-2016', null);
INSERT INTO TITULARIDAD VALUES (6, '67505087N', '08-04-1999', '19-10-2012');
INSERT INTO TITULARIDAD VALUES (7, '95244324J', '05-07-2006', null);
INSERT INTO TITULARIDAD VALUES (8, '05821682Z', '09-11-2007', '21-04-2016');
INSERT INTO TITULARIDAD VALUES (9, '06588617Z', '31-03-2013', null);
INSERT INTO TITULARIDAD VALUES (10, '86587415M', '24-09-2006', null);
INSERT INTO TITULARIDAD VALUES (11, '44729765D', '29-03-2003', null);
INSERT INTO TITULARIDAD VALUES (12, '27441023E', '23-12-2007' null);
INSERT INTO TITULARIDAD VALUES (13, '35185176Y', '14-07-2014', null);
INSERT INTO TITULARIDAD VALUES (14, '38485868M', '04-06-2014', null);
INSERT INTO TITULARIDAD VALUES (15, '11331763P', '21-06-2004', null);
INSERT INTO TITULARIDAD VALUES (16, '58996810Q', '13-12-2008', null);
INSERT INTO TITULARIDAD VALUES (17, '48826660Y', '03-06-2001', '07-05-2012');
INSERT INTO TITULARIDAD VALUES (18, '59358825B', '15-06-2009', null);
INSERT INTO TITULARIDAD VALUES (19, '37558515K', '22-02-2002', null);
INSERT INTO TITULARIDAD VALUES (20, '70595906M', '1-1-2005', null);
INSERT INTO TITULARIDAD VALUES (21, '88337440Y', '26-03-2001', null);
INSERT INTO TITULARIDAD VALUES (22, '33167590A', '31-06-2011', '04-03-2016');
INSERT INTO TITULARIDAD VALUES (23, '26645581N', '24-12-2008', null);
INSERT INTO TITULARIDAD VALUES (24, '11477333B', '09-08-20010', null);
INSERT INTO TITULARIDAD VALUES (25, 'A16837239', '02-12-2011', null);
INSERT INTO TITULARIDAD VALUES (26, 'D48985279', '04-05-2004', null);
INSERT INTO TITULARIDAD VALUES (27, 'P94928678', '03-09-2015', null);
