use instituto;

-- Ejercicio 4 --
alter table instituto.profesores
add column Edad int;

-- Ejercicio 5 --
alter table instituto.profesores
add check (Edad between 18 and 65);

alter table instituto.cursos
add check (MAXIMO_ALUMNOS > 10);

alter table instituto.cursos
add check (NUM_HORAS > 100);

-- Ejercicio 6 --
alter table instituto.alumnos
DROP CONSTRAINT check_sexo   ;

-- Ejercicio 8 --
alter table profesores
modify column GANA INT;

-- Ejercicio 9 --
alter table cursos
modify column FECHA_INICIO date;

-- Ejercicio 10 --
alter table instituto.profesores
drop constraint pk_profe;

-- Ejercicio 11 --
insert into profesores (NOMBRE, APELLIDO1, APELLIDO2, DNI, DIRECCIÓN, TÍTULO, EDAD)
VALUES ('Laura','Jimenez','Sanz','16645806Q','Real 13','Ing. Industrial',19);

insert into alumnos (NOMBRE, APELLIDO1, APELLIDO2, DNI, DIRECCIÓN, SEXO,FECHA_NACIMIENTO ,Curso)
values ('Estanislao','Torres','Cacho','33139426Z', 'Calle 8', 'H','93-12-12',2);

-- Ejercicio 12 --
update instituto.alumnos
set FECHA_NACIMIENTO = '93-12-12', FECHA_NACIMIENTO = '76-12-23'
WHERE NOMBRE = 'Estanislao';

-- Ejercicio 13 --
update instituto.alumnos
set CURSO = 2, CURSO = 1
WHERE NOMBRE = 'Estanislao';

-- Ejercicio 14 --
update instituto.alumnos
set CURSO = 1, CURSO = 7
WHERE NOMBRE = 'Estanislao';

-- Ejercico 15 --
delete from instituto.profesores where NOMBRE = 'Laura';

-- Ejercicio 16 --
alter table cursos 
drop constraint fk_profe;
delete from instituto.profesores where NOMBRE = 'María';

-- Ejercicio 17 --
alter table cursos
drop primary key;

alter table cursos
add constraint pk_curso primary key (FECHA_INICIO);

-- Ejercicio 18 --
create table NOMBRE_ALUMNOS(
NOMBRE_COMPLETO varchar(50)
);

insert into instituto.nombre_alumnos (nombre_completo)
select concat(nombre, ' ', apellido1, ' ', apellido2) from instituto.alumnos;

-- Ejercicio 19 --
drop table alumnos, cursos, nombre_alumnos, profesores;