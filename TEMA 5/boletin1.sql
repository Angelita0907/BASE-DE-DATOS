/* 1. Con MySQL Workbench nos conectamos como root y tratamos de ver aquellos roles
o privilegios que tenemos asignados.*/
show grants for 'root'@'localhost';

/* 2. Creamos un usuario llamado administrador al cual le vamos a conceder todos los
privilegios. La contraseña de este usuario debe ser pass_admin*/


/* 3. Ahora, cerramos sesión y nos conectamos con este nuevo usuario guardando su
conexión*/


/* 4. Mostramos un listado con todos los usuarios disponibles en el sistema y
posteriormente sólo aquél que se encuentra conectado actualmente.*/


/* 5. Muestra los permisos asociados al usuario conectado a la base de datos*/


/* 6. Crea una tabla “Alumno” que contenga dos campos Identificador y nombre e
introduce 5 registros*/


/* 7. Crea la tabla comentarios que tenga 3 campos, Identificador, comentario y alumno
relacionado (fk) e introduce tres comentarios.*/


/* 8. Crea la vista llamado comentarios_por_alumno que muestre un listado de
comentarios realizados por alumnos.*/


/* 9. Quita a tu usuario los permisos para realizar consultas sobre la vista e intenta
realizar una llamada a la vista anterior.*/


/* 10. Crea un nuevo usuario llamado alumno con la contraseña pass_alum. Explica qué
ocurre y que debemos hacer para poder crearlos.*/


/* 11. Otorga a este nuevo usuario permiso de conexión y consulta de datos.*/


/* 12. Con el usuario alumno, modifica la tabla alumno creada anteriormente e intenta
añadir la columna apellidos de tipo Varchar analizando en todo momento lo que
ocurre*/


/* 13. Elimina al usuario alumno. */