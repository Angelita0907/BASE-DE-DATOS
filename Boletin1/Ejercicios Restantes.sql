use empresa;
/* Ejercicio 2 */

-- Apartado A
	-- Empleado
insert into empleado (DNI,NOMBRE, APELLIDO1, APELLIDO2 , DIRECCIÓN, CIUDAD, MUNICIPIO,COD_POSTAL ,SEXO ,FECHA_NAC)
values ('38803400P', 'Pedro', 'Martin', 'Sanchez', 'Calle Burbon 2', 'Sevilla', 'Algaba', '41980', 'H', '98-10-21');
insert into empleado (DNI,NOMBRE, APELLIDO1, APELLIDO2 , DIRECCIÓN, CIUDAD, MUNICIPIO,COD_POSTAL ,SEXO ,FECHA_NAC)
values ('75038742T', 'Maria', 'Lara', 'Montero', 'Calle Estrella 5', 'Sevilla', 'Sevilla', '41015', 'M', '03-07-09');
insert into empleado (DNI,NOMBRE, APELLIDO1, APELLIDO2 , DIRECCIÓN, CIUDAD, MUNICIPIO,COD_POSTAL ,SEXO ,FECHA_NAC)
values ('07061181C', 'Roberto', 'Martinez', 'Gonzalez', 'Calle Zaparo 4', 'Sevilla', 'Tomares', '41910', 'H', '84-03-10');

	-- Historial Salarial
insert into historial_salarial(DNI_EMPLE, SALARIO, FECHA_INICIO, FECHA_FIN)
values ('38803400P', '1200', '08-09-22', '18-11-22');
insert into historial_salarial(DNI_EMPLE, SALARIO, FECHA_INICIO, FECHA_FIN)
values ('75038742T', '2000', '08-07-20', '20-11-22');
insert into historial_salarial(DNI_EMPLE, SALARIO, FECHA_INICIO, FECHA_FIN)
values ('07061181C', '1500', '08-12-02', '17-11-22');

	-- Universidad
insert into universidad (COD_UNIV, NOMBRE, CIUDAD, COD_POSTAL)
values('121', 'Pablo Olavide', 'Sevilla', '41015');
insert into universidad (COD_UNIV, NOMBRE, CIUDAD, COD_POSTAL)
values('124', 'Loyola', 'Bormujos', '41930');
insert into universidad (COD_UNIV, NOMBRE, CIUDAD, COD_POSTAL)
values('128', 'Complutense', 'Madrid', '28040');

	-- Estudio
insert into estudio (DNI_EMPLE, COD_UNIV, FECHA_FIN, TITULO, ESPECIALIDAD)
values('38803400P', '121', '94-06-21', 'Ing. Software', 'Programación' ); 
insert into estudio (DNI_EMPLE, COD_UNIV, FECHA_FIN, TITULO, ESPECIALIDAD)
values('75038742T', '124', '92-06-21', 'Aeronáutica', 'Física'); 
insert into estudio (DNI_EMPLE, COD_UNIV, FECHA_FIN, TITULO, ESPECIALIDAD)
values('07061181C', '128', '91-06-21', 'Ing. Informática', 'Redes');  

	-- Departamento
insert into departamento (COD_DPTO, NOMBRE, DNI_JEFE, PRESUPUESTO)
values('101','Ciberseguridad', '38803400P', '1000'); 
insert into departamento (NOMBRE, DNI_JEFE, PRESUPUESTO)
values('Ciberseguridad', '38803400P', '1000'); 
insert into departamento (NOMBRE, DNI_JEFE, PRESUPUESTO)
values('Ciberseguridad', '38803400P', '1000');  

	-- Trabajo
insert into trabajo(COD_TRABAJO, NOMBRE, SALARIO_MAX, SALARIO_MIN)
values('1', 'Pedro', '250', '50'); 
insert into trabajo( NOMBRE, SALARIO_MAX, SALARIO_MIN)
values('Maria', '300', '100'); 
insert into trabajo( NOMBRE, SALARIO_MAX, SALARIO_MIN)
values('Roberto', '500', '70'); 
 
	-- Historial Laboral
insert into historial_laboral(DNI_EMPLE,COD_TRABAJO,COD_DPTO, FECHA_INICIO, FECHA_FIN, DNI_SUPERIOR)
values ('38803400P', '1','101', '08-09-22', '18-11-22', '38803400P');
insert into historial_laboral(DNI_EMPLE,COD_TRABAJO,COD_DPTO, FECHA_INICIO, FECHA_FIN, DNI_SUPERIOR)
values ('75038742T', '1','101', '08-07-20', '20-11-22', '75038742T');
insert into historial_laboral(DNI_EMPLE,COD_TRABAJO,COD_DPTO, FECHA_INICIO, FECHA_FIN, DNI_SUPERIOR)
values ('07061181C', '1','101', '08-12-02', '17-11-22', '07061181C');

-- Apartado B
insert into empleado (NOMBRE, APELLIDO1, APELLIDO2, DNI, SEXO)
values ('Segio','Palma', 'Entrena', 111222, 'H');

-- Debemos hacer lo siguiente antes de poder insertar los valors en la tabla historial laboral
insert INTO DEPARTAMENTO (NOMBRE, presupuesto)
VALUES('Finanzas', 2000);
insert into trabajo (nombre, salario_max, salario_min)
values('Sergio', '100','20');

insert into HISTORIAL_LABORAL (COD_TRABAJO,cod_dpto,DNI_EMPLE,FECHA_INICIO, DNI_SUPERIOR)
VALUES(4,104,111222, '96-06-16', '222333');

/*Ejercicio 3*/

-- Apatado A
alter table trabajo
add column DIFICULTAD INT, 
ADD constraint numdifcultad check (DIFICULTAD <=5);

-- Apartado B
alter table departamento
add column PLANTA INT NOT NULL default 0, ADD column NÚMERO INT NOT NULL default 1;

-- Apartado C
alter table empleado
add constraint sevilla check (fecha_nac is not null);

-- Apartado D
alter table empleado
rename column localidad to LOCALIDAD;

-- Apartado E
alter table empresa.historial_salarial
add constraint positivo check (SALARIO>0);

ALTER TABLE empresa.trabajo
ADD constraint positivo2 check (SALARIO_MAX > 0 and SALARIO_MIN > 0);

-- Apartado F
alter table empresa.empleado
modify column NOMBRE VARCHAR(20);

-- Apartado G
alter table empresa.empleado
modify column DIRECCIÓN VARCHAR(50);


/*Ejercicio 4*/

-- Apartado A
-- Borramos la relacion de la tabla estudio de la que depende de universidad
alter table empresa.estudio
drop constraint fk_univ2;

-- Eliminar un registro de universidad
delete from empresa.universidad where nombre = 'Pablo Olavide';

-- Apartado B
drop table empresa.universidad;

-- Apartado C
-- Cambiamos el codigo de un empleado en estudio
update empresa.estudio
set cod_univ = '121', cod_univ = '123'
where dni_emple = '38803400P';

-- Apartado D
-- Borramos restrincciones o condiciones con la tabla empleado 
alter table empresa.historial_salarial
drop constraint fk_dni1;

alter table empresa.estudio
drop constraint fk_dni2;

alter table empresa.historial_laboral
drop constraint fk_dni4;

-- Error ya que debemos de eliminar la relacion con la tabla historial salarial
delete from empresa.empleado where nombre = 'Roberto';

/*Ejericicio 5*/

-- Apartado A
create table INFORMACION_UNI (
NOMBRE_COMPLETO VARCHAR(50),
UNIVERSIDAD INT
);
ALTER TABLE INFORMACION_UNI
ADD constraint pk_info1 primary key(UNIVERSIDAD);

-- Añadimos los valores nombre y apellidos de empleados a informacion uni
insert into empresa.informacion_uni (NOMBRE_COMPLETO)
select concat(nombre, ' ', apellido1, ' ', apellido2) from empresa.empleado;
-- UPDATE para los valores cod uni de cada empleado


-- Apartado B
alter table empresa.empleado
add column Emp_juvenil boolean default false;

update empresa.empleado
set Emp_juvenil = true
where (current_date() - fecha_nac) < 30;

-- Apartado C
drop table departamento, empleado, estudio, historial_laboral, historial_salarial, informacion_uni, trabajo;