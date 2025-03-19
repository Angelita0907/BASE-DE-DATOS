/* 1. Con MySQL Workbench nos conectamos como root y tratamos de ver aquellos roles
o privilegios que tenemos asignados.*/
show grants for 'root'@'localhost';

/* 2. Creamos un usuario llamado administrador al cual le vamos a conceder todos los
privilegios. La contraseña de este usuario debe ser pass_admin*/
create user 'administrador'@'localhost' identified by 'pass_admin';
grant all privileges on *.*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999 to 'administrador'@'localhost'; 

/* 3. Ahora, cerramos sesión y nos conectamos con este nuevo usuario guardando su
conexión*/


/* 4. Mostramos un listado con todos los usuarios disponibles en el sistema y
posteriormente sólo aquél que se encuentra conectado actualmente.*/
select user from mysql.user;

/* 5. Muestra los permisos asociados al usuario conectado a la base de datos*/
show grants for 'administrador'@'localhost';

/* 6. Crea una tabla “Alumno” que contenga dos campos Identificador y nombre e
introduce 5 registros*/
use angela;
create table Alumno(
Identificador char(9) primary key,
Nombre varchar(50)
);

insert into Alumno(Identificador,Nombre)
values('1','Pedro'),('2','Maria'),('3','Ana'),('4','Juan'),('5','Luis');

/* 7. Crea la tabla comentarios que tenga 3 campos, Identificador, comentario y alumno
relacionado (fk) e introduce tres comentarios.*/
create table comentarios(
Identificador char(1) primary key,
Comentario varchar(50),
Alumno char(9),
foreign key comentarios(Alumno) references Alumno(Identificador)
);

insert into comentarios(Identificador, Comentario, Alumno)
values('1','Bueno','1'),('2','Regular','3'),('4','Exelente','5');

/* 8. Crea la vista llamado comentarios_por_alumno que muestre un listado de
comentarios realizados por alumnos.*/
create view comentarios_por_alumno as
select alumno.nombre, comentarios.Comentario
from alumno, comentarios
where alumno.identificador = comentarios.identificador;

select * from comentarios_por_alumno;

/* 9. Quita a tu usuario los permisos para realizar consultas sobre la vista e intenta
realizar una llamada a la vista anterior.*/
revoke select on *.* from 'Administrador';

/* 10. Crea un nuevo usuario llamado alumno con la contraseña pass_alum. Explica qué
ocurre y que debemos hacer para poder crearlos.*/
create user 'alumno'@'localhost' identified by 'pass_alum';

/* 11. Otorga a este nuevo usuario permiso de conexión y consulta de datos.*/
create role 'conexion_y_consulta'@'localhost';
grant create, select, update, delete on angela to 'conexion_y_consulta'@'localhost';
grant 'conexion_y_consulta'@'localhost' to 'alumno'@'localhost';

set default role 'conexion_y_consulta'@'localhost' to 'alumno'@'localhost';

set role all;

/* 12. Con el usuario alumno, modifica la tabla alumno creada anteriormente e intenta
añadir la columna apellidos de tipo Varchar analizando en todo momento lo que
ocurre*/
alter table alumno
add column Apellidos varchar(50);

/* 13. Elimina al usuario alumno. */
drop user 'alumno'@'localhost';