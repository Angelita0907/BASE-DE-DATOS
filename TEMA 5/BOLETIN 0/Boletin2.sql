use biblioteca;
/*1. Queremos encontrar todos los libros prestados por un usuario, dado su nombre. 
Vamos a hacer una subconsulta para obtener el ID del usuario y luego encontrar los libros prestados.*/
select prestamos.id_prestamo, prestamos.id_libro from prestamos 
where (select id_usuario from usuarios where nombre = 'Juan Pérez');

/*2.  Obtener los autores que han escrito libros de un género específico - Este ejercicio utiliza 
una subconsulta para encontrar los autores que han escrito libros de un determinado género.*/
select nombre from autores where id_autor =
(select id_autor from libros where genero = 'Terror');

/*3. : Obtener los usuarios que han prestado más de 3 libros
Este ejercicio encuentra los usuarios que han prestado más de 3 libros.*/

select nombre from usuarios where id_usuario in 
(select id_usuario from prestamos group by prestamos.id_usuario 
having count(id_prestamo));

/*4. Obtener los libros más prestados Queremos encontrar cuáles son los libros 
más prestados en la biblioteca. Usamos una subconsulta para contar cuántas veces se ha prestado cada libro.*/

-- select 

/*5.  Obtener los libros que no han sido prestados Este ejercicio te muestra los libros 
que aún no han sido prestados. Usamos una subconsulta para encontrar los libros que
no están en la tabla de préstamos*/



/*6. Obtener el autor más joven Queremos encontrar al autor más joven basándonos en su 
fecha de nacimiento. Usamos una subconsulta para obtener la fecha más reciente de nacimiento*/


