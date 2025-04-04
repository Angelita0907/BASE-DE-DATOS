create database Instituto;
use Instituto;

create table ALUMNOS(
NOMBRE VARCHAR (50),
APELLIDO1 VARCHAR(50),
APELLIDO2 VARCHAR(50),
DNI CHAR (9),
DIRECCIÓN VARCHAR(50),
SEXO CHAR(1),
FECHA_NACIMIENTO DATE,
CURSO CHAR(5) NOT NULL,
constraint check_sexo CHECK (SEXO = 'H' || SEXO = 'M'),
CONSTRAINT PRIMARY KEY (DNI)
);

create table CURSOS(
NOMBRE_CURSO VARCHAR(50),
COD_CURSO CHAR (5),
DNI_PROFESOR CHAR (9),
MAXIMO_ALUMNOS INT,
FECHA_INICIO DATE,
FECHA_FIN DATE,
NUM_HORAS int,
CONSTRAINT pk_curso PRIMARY KEY (COD_CURSO),
constraint fk_profe foreign key (DNI_PROFESOR) REFERENCES Profesores(DNI)
);

create table PROFESORES(
NOMBRE VARCHAR(50),
APELLIDO1 VARCHAR(50),
APELLIDO2 VARCHAR(50),
DNI CHAR (9),
DIRECCIÓN VARCHAR(50),
TÍTULO VARCHAR(50),
GANA INT NOT NULL,
constraint pk_profe PRIMARY KEY(DNI)
);

alter table instituto.alumnos 
modify column Curso char(4) not null comment'1';

DROP table cursos;