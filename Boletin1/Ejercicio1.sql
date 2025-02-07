create database EMPRESA;
use empresa;

create table EMPLEADO(
DNI CHAR(9),
NOMBRE VARCHAR(20) NOT NULL,
APELLIDO1 VARCHAR(20),
APELLIDO2 VARCHAR(20),
DIRECCIÓN VARCHAR(20),
CIUDAD VARCHAR(20),
MUNICIPIO varchar(20),
COD_POSTAL char(5),
SEXO CHAR(1) constraint sexo check(SEXO = 'H' || SEXO = 'M'),
FECHA_NAC DATE,
constraint pk_dni primary key (DNI)
);

CREATE TABLE HISTORIAL_SALARIAL(
DNI_EMPLE CHAR(9),
SALARIO decimal(6,2) NOT NULL unique,
FECHA_INICIO DATE NOT NULL,
FECHA_FIN DATE,
constraint fk_dni1 foreign key (DNI_EMPLE) references EMPLEADO(DNI),
constraint pk_dniEmp1 primary key (DNI_EMPLE),
constraint fechas check (FECHA_INICIO < FECHA_FIN)
);

CREATE TABLE UNIVERSIDAD(
COD_UNIV INT,
NOMBRE varchar(30) NOT NULL,
CIUDAD varchar(20),
COD_POSTAL CHAR(5),
constraint pk_uni1 primary key (COD_UNIV)
);

create TABLE ESTUDIO(
DNI_EMPLE CHAR(9),
COD_UNIV INT,
FECHA_FIN DATE,
TITULO VARCHAR(30) NOT NULL,
ESPECIALIDAD varchar(30),
constraint fk_dni2 foreign key (DNI_EMPLE) references EMPLEADO(DNI),
constraint fk_univ2 foreign key (COD_UNIV) references UNIVERSIDAD(COD_UNIV),
constraint pk_DniUni2 primary key (DNI_EMPLE,COD_UNIV)
);

CREATE TABLE DEPARTAMENTO(
COD_DPTO INT auto_increment,
NOMBRE varchar(30) NOT NULL,
DNI_JEFE CHAR(9),
PRESUPUESTO decimal(6,2) NOT NULL,
constraint pk_dpto1 primary key (COD_DPTO),
constraint fk_dni3 foreign key (DNI_JEFE)references EMPLEADO(DNI)
);

CREATE TABLE TRABAJO(
COD_TRABAJO INT UNIQUE auto_increment,
NOMBRE VARCHAR(20) NOT NULL,
SALARIO_MAX decimal(6,2) NOT NULL,
SALARIO_MIN decimal(6,2) NOT NULL,
constraint pk_cod1 primary key (COD_TRABAJO)
);

CREATE TABLE HISTORIAL_LABORAL(
DNI_EMPLE CHAR (9),
COD_TRABAJO INT,
COD_DPTO INT,
FECHA_INICIO DATE NOT NULL,
FECHA_FIN DATE,
DNI_SUPERIOR CHAR(9),
constraint fk_dni4 foreign key (DNI_EMPLE) references EMPLEADO(DNI),
constraint fk_cod1 foreign key (COD_TRABAJO) references TRABAJO(COD_TRABAJO),
constraint fk_dpto1 foreign key (COD_DPTO) references DEPARTAMENTO(COD_DPTO),
constraint pk_histo primary key(DNI_EMPLE, COD_TRABAJO, COD_DPTO)
);