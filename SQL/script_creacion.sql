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


INSERT INTO TITULAR VALUES ('12052808A','Calle Cerrada Alajuela 37', 13001, 'Gabriel', 'Muñoz Perez', '11-01-1991', null);
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

INSERT INTO ANIMAL VALUES ('num_id','especie','animal_peligroso','domicilio','cp','pais_origen');
INSERT INTO ANIMAL VALUES ('1','Perro','','Calle Cerrada Alajuela 37', 13001, '');
INSERT INTO ANIMAL VALUES ('2','Perro','','Calle Cerrada Alajuela 37', 13001, '');
INSERT INTO ANIMAL VALUES ('3','Perro','','Calle Calvario 23', 13004, '');
INSERT INTO ANIMAL VALUES ('4','Perro','','Calle Mayor 12', 13006, '');
INSERT INTO ANIMAL VALUES ('5','Gato',FALSE,'Calle Real 34', 13010, '');
INSERT INTO ANIMAL VALUES ('6','Gato',FALSE,'Avenida Diagonal 6', 13004, '');
INSERT INTO ANIMAL VALUES ('7','Gato',FALSE,'Calle del Molino 9', 13012, '');
INSERT INTO ANIMAL VALUES ('8','Gato',FALSE,'Calle del Castillo 4', 13007, '');
INSERT INTO ANIMAL VALUES ('9','Otros','','Plaza España 23', 13001, '');
INSERT INTO ANIMAL VALUES ('10','Otros','','Paseo de los sauces 34', 13005, '');
INSERT INTO ANIMAL VALUES ('11','Otros','','Calle Evergreen Terrace 743', 1302, '');
INSERT INTO ANIMAL VALUES ('12','Otros','','Calle Obregon 21', 13006, '');
INSERT INTO ANIMAL VALUES ('13','Otros','','Calle Falsa 123', 13013, '');
INSERT INTO ANIMAL VALUES ('14','Otros','','Calle Alarcos 34', 13017, '');
INSERT INTO ANIMAL VALUES ('15','Otros','','Calle Mayor 13', 13006, '');
INSERT INTO ANIMAL VALUES ('16','Otros','','Plaza Rinconada 5', 13013, '');
INSERT INTO ANIMAL VALUES ('17','Otros','','Calle San Miguel 6', 13015, '');
INSERT INTO ANIMAL VALUES ('18','Otros','','Paseo de Belen 15', 13004, '');
INSERT INTO ANIMAL VALUES ('19','Otros','','Calle Platero 34', 13009, '');
INSERT INTO ANIMAL VALUES ('20','Otros','','Avenida Miguel de Unamuno 51', 13005, '');
INSERT INTO ANIMAL VALUES ('21','Otros','','Calle del Castillo 9', 13004, '');
INSERT INTO ANIMAL VALUES ('22','Perro','','Plaza Mayor 3', 13006, '');
INSERT INTO ANIMAL VALUES ('23','Perro','','Calle Alondras 19', 13006, '');
INSERT INTO ANIMAL VALUES ('24','Otros','','Plaza de la Iglesia 3', 13002, '');
INSERT INTO ANIMAL VALUES ('25','Otros','','Avenida del Hierro 23', 13016, '');
INSERT INTO ANIMAL VALUES ('26','Gato','','Calle del Plomo 45', 13016, '');
INSERT INTO ANIMAL VALUES ('27','Gato','','Calle del Acero 7', 13016, '');
