USE academia;

/*1. Realiza una vista que muestre el nombre y el apellido de todos los alumnos*/
create view Nombre_Apellidos as select nombre, apellido from alumnos;
select * from Nombre_Apellidos;

/*2. Realiza una vista que muestre el nombre del alumno junto a la asignatura que está matriculada */
create view Alumno_Asignatura as select alumnos.nombre as NombreAlumno, asignaturas.nombre as AsignaturaNombre from alumnos, asignaturas;
select * from Alumno_Asignatura;

/*3. Realiza una vista que muestre todas las matrículas con más de 100 horas*/
create view Matriculas100 as select * from matriculas
where horas > 100;
select * from Matriculas100;

create view Matriculas1002 as select alumnos.nombre as AlumnoNombre, asignaturas.nombre as NombreAsignatura,
matriculas.horas from alumnos, asignaturas, matriculas
where alumnos.id = matriculas.alumno_id and asignaturas.id = matriculas.asignatura_id
and horas > 100;
select * from Matriculas1002;

/*4. Realiza una vista que muestre el nombre de la asignatura y el profesor que la
imparte*/
create view Profesor_Asignatura as select asignaturas.nombre as NombreAsigantura, profesores.nombre as NombreProfesor
from asignaturas, profesores, asignaturas_profesores
where profesores.id = asignaturas_profesores.profesor_id;

select * from Profesor_Asignatura;

/*5. Por último crea un usuario en base de datos que tenga acceso de consulta a todas
las vistas creadas anteriormente.*/
create user usuarioVistas identified by 'usuario';
grant select on Nombre_Apellidos to usuarioVistas;
grant select on Alumno_Asignatura to usuarioVistas;
grant select on Matriculas100 to usuarioVistas;
grant select on Profesor_Asignatura to usuarioVistas;
