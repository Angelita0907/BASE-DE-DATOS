use banco;

/*1. Mostrar el id y saldo de todas las cuentas cuyo interés es positivo*/
select cod_cuenta, saldo from cuenta where interes > 0;

/*2. Muestra aquellas sucursales cuya dirección contiene la A y además el capital del
año anterior supera los 10.000 euros*/
select * from sucursal where direccion like 'A%' and capital_anio_anterior > 10000;

/*3. Muestra todos los movimientos realizados en enero.*/
select * from movimiento where mes = 1;

/*4. Muestra los movimientos realizados antes de las 12 horas*/
select * from movimiento where hour(fecha_hora) < 12;

/*5. Muestra los movimientos de salida realizados*/
select * from tipo_movimiento where salida = 'Si';

/*6. Muestra el nombre y los apellidos del cliente sin repetir en un mismo campo llamado
nombre completo*/
select concat(nombre, ' ' ,apellidos) as NombreCompleto, direccion from cliente;

/*7.  Muestra en mayúsculas todos los tipos de movimientos existentes de los que se ha
hecho algún movimiento. No debe haber valores repetidos*/
select upper(descripcion) from tipo_movimiento where salida = 'Si';

/*8. Muestra aquellos apellidos con más de 5 letras.*/
select apellidos from cliente where length(apellidos) > 5;

/*9. Muestra un nick para cada cliente formado por las dos primeras letras del nombre y
el primer apellido*/
select *, concat( substring(nombre, 1,2), ' ',apellidos ) as nick from cliente; 

/*10. Muestra la dirección de la sucursal 1*/
select direccion from sucursal where cod_sucursal = 1;

/*11. Muestra aquellos clientes cuyo nombre sea un palíndromo.*/
select * from cliente where nombre = reverse(nombre);

/*12. Añade el campo fecha de nacimiento a la tabla cliente con el día de hoy de valor por
defecto*/
alter table cliente
add column fecha_nacimiento date default (current_date());

/*13. Incrementa dos días a cada cliente en su fecha de nacimiento*/
update cliente
set fecha_nacimiento = date_add(fecha_nacimiento, interval 2 day);

/*14. Muestra su fecha de nacimiento en días*/
-- select datediff(day , fecha_nacimiento, current_date()) from cliente;  

/*15. Muestra su nombre en mayúsculas y el año de nacimiento.*/
select upper(nombre), year(fecha_nacimiento) from cliente;

/*16. Muestra un mensaje de felicitación para cada cliente, del tipo “¡Felicidades NOMBRE
por tus AÑOS cumpleaños!” y llama a ese campo felicitación*/
select concat('¡Felicidades ', nombre, ' por tus ', fecha_nacimiento - current_date(), ' cumpleaños!') as felicitacion from cliente ;

/*17. Muestra aquellos clientes que su edad sea mayor de 18 años y que además su
nombre o su apellido terminen por S*/
select * from cliente where /*mayor de 18*/ nombre like '%s' || apellidos like '%s';