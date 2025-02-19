use biblioteca;
/*1. Ver todos los libros con sus autores */
select autores.nombre, libros.titulo from autores,libros;

/*2. Obtener los préstamos activos con los nombres de los usuarios y libros */
select usuarios.nombre, libros.titulo, prestamos.fecha_prestamo from usuarios, libros, prestamos
where prestamos.fecha_devolucion is not null;

/*3. Ver cuántos libros ha tomado prestado cada usuario*/
select count(id_prestamo), usuarios.nombre from usuarios, prestamos
where prestamos.id_usuario = usuarios.id_usuario group by usuarios.id_usuario;