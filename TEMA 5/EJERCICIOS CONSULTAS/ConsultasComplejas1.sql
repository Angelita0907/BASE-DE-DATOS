use taller;

/*1. Obtener todos los atributos de todos los proyectos*/
select * from proyecto;

/*2. Obtener todos los atributos de todos los proyectos desarrollados en Londres*/
select * from proyecto where ciudad = 'Londres';

/*3. Obtener los códigos de las piezas suministradas por el proveedor s2, ordenados*/
select codpie from ventas where codpro = 's2' order by codpie asc;

/*4. Obtener los códigos de los proveedores del proyecto j1, ordenados*/
select codpro from ventas where codpj = 'j1' order by codpro asc;

/*5. Obtener todas las ocurrencias pieza.color, pieza.ciudad eliminando los pares
duplicados*/
select distinct color, ciudad from pieza;

/*6. Obtener los códigos de las ventas en los que la cantidad no sea nula.*/
select * from ventas where cantidad is not null;

/*7. Obtener códigos de los proyectos y ciudades en las que la ciudad del proyecto tenga
una 'o' en la segunda letra.*/
select codpj, ciudad from proyecto where ciudad like '_o%';

/*8. Obtener un listado ascendente de los nombres de las piezas con más de 5 letras*/
select nompie from pieza where length(nompie) > 5 order by nompie asc;

/*9. Obtener nombres abreviados de proyectos tomando sus primeras 3 letras.*/
select substring(nompj,1,3) as NombreAbreviado from proyecto;

/*10. Obtener los tres últimos caracteres de los nombres de proveedores por orden
alfabético*/
select substring(nompro,-3,3) as NombreAbreviado from proveedor order by nompro asc;

/*11. Hallar cuántas piezas distintas existen*/
select distinct count(codpie) from pieza;

/*12. Hallar cuántas piezas distintas existen dando nombre a la columna resultante
“Número”*/
select distinct count(codpie) as Numero from pieza;

/*13.  Obtener el número total de proyectos suministrados por el proveedor sl.*/
select count(codpj) from ventas where codpro = 's1';

/*14. Obtener la cantidad total de piezas p1 suministrada por s1*/
select count(codpie) from ventas where codpro = 's1';

/*15. Obtener la cantidad media de piezas suministradas, cantidad máxima y mínima
suministrada*/
select avg(cantidad), max(cantidad), min(cantidad) from ventas;

/*16. Obtener las ventas en las que la cantidad de piezas esté entre 300 y 750 inclusive*/
select * from ventas where cantidad between 300 and 750;

/*17. Construir una consulta que devuelva codpie y VERDADERO si en la tabla piezas el
color de la pieza no es ni azul ni gris*/
select codpie , case  when color != 'azul' and color != 'gris' then 'Verdadero' end from pieza;

/*18. Añade una nueva columna llamada fecha que indique la fecha de adquisición de una
pieza por proveedor y proyecto*/
alter table ventas
add column fechaAdquisicion date;

/*19. Modificar la fecha de adquisición de todas las piezas p2 a la fecha actual*/
update ventas
set fecha = current_date() where codpie = 'p2';

/*20. Se desea visualizar la fecha con formato del ejemplo ’11-NOV-2002’ */
-- update ventas set fecha = ;

/*21. Modificar la fecha de adquisición en los que participan los proyectos j1 y j2 a la fecha
12-11-2001 */
update ventas 
set fechaAdquisicion = 12-11-2001 where codpj = 'j1' and codpj = 'j2';

/*22. Construir una lista ordenada de todas las ciudades en las que al menos resida un
proveedor o suministrador, una pieza o un proyecto*/
select ciudad from proveedor, pieza, proyecto group by ciudad;