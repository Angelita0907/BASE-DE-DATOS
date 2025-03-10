USE academia;

/*1. Realiza una vista que muestre el nombre y el apellido de todos los alumnos*/
create view Nombre_Apellidos as select nombre, apellido from instituto.alumnos;
select * from Nombre_Apellidos;

/*2. Realiza una vista que muestre el nombre del alumno junto a la asignatura que está matriculada */

-- He usado los alias ya que si no da un error por el duplicado en la columna nombre y así poder distingirlos
create view Alumno_Aisgnatura as SELECT Alumnos.nombre AS Nombre_Alumno, Asignaturas.nombre AS Nombre_Asignatura
from alumnos, asignaturas, matriculas
where alumnos.id_alumno = matriculas.id_alumno
and asignaturas.id_asignatura = matriculas.id_asignatura;

select * from Alumno_Aisgnatura;

/*3. Realiza una vista que muestre todas las matrículas con más de 100 horas*/
create view Masde100Horas as select * from matriculas where horas > 100;

select * from Masde100Horas;

/*4. Realiza una vista que muestre el nombre de la asignatura y el profesor que la imparte.*/
create view Profesores_Asignarura as select profesores.nombre AS Nombre_Profesor, asignaturas.nombre as Nombre_Asignatura
from profesores, asignaturas
where profesores.id_profesor = asignaturas.id_profesor;

select * from Profesores_Asignarura;

/*5. crea un usuario en base de datos que tenga acceso de consulta a todas las vistas creadas anteriormente*/
create user 'Usuario1'@'localhost' identified by 'usuario';
grant select on Nombre_Apellidos to Usuario1;
grant select on Alumno_Aisgnatura to Usuario1;
grant select on Masde100Horas to Usuario1;
grant select on Profesores_Asignarura to Usuario1;

