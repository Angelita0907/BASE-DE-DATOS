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
-- select ciudad from proveedor, pieza, proyecto group by ciudad;

select pieza.ciudad from pieza
join proveedor
on proveedor.ciudad = pieza.ciudad
join proyecto
on proyecto.ciudad = pieza.ciudad;

/*23. Obtener todas las posibles combinaciones entre piezas y proveedores*/
select * from pieza
cross join proveedor;

/*24. Obtener todos los posibles tríos de código de proveedor, código de pieza y código de
proyecto en los que el proveedor, pieza y proyecto estén en la misma ciudad*/
select pieza.codpie, proveedor.codpro, proyecto.codpj from pieza
cross join proveedor
cross join proyecto;

/*25. Obtener los códigos de proveedor, de pieza y de proyecto de aquellos cargamentos
en los que proveedor, pieza y proyecto estén en la misma ciudad.*/
select pieza.codpie, proveedor.codpro, proyecto.codpj from pieza
join proveedor
on proveedor.ciudad = pieza.ciudad
join proyecto
on proyecto.ciudad = pieza.ciudad;

/*26. Obtener todos los posibles tríos de código de proveedor, código de pieza y código de
proyecto en los que el proveedor, pieza y proyecto no estén todos en la misma
ciudad*/
SELECT V.codpro, V.codpie, V.codpj
FROM ventas V
JOIN proveedor P ON V.codpro = P.codpro
JOIN pieza PI ON V.codpie = PI.codpie
JOIN proyecto PR ON V.codpj = PR.codpj
WHERE NOT (P.ciudad = PI.ciudad AND PI.ciudad = PR.ciudad);

/*27. Obtener todos los posibles tríos de código de proveedor, código de pieza y código de
proyecto en los que el proveedor, pieza y proyecto no están ninguno en la misma
ciudad*/
-- mirar el fallo
select pieza.codpie, proveedor.codpro, proyecto.codpj from pieza
join proveedor
on proveedor.ciudad != pieza.ciudad
join proyecto
on proyecto.ciudad != pieza.ciudad;

/*28. Obtener los códigos de las piezas suministradas por proveedores de Londres.*/
-- select codpie from pieza where ciudad = (select codpro from proveedor where ciudad = 'Londres');
select pieza.codpie from pieza
join ventas
on ventas.codpie = pieza.codpie
join proveedor
on proveedor.codpro = ventas.codpro
where proveedor.ciudad = 'Londres';

/*29. Obtener los códigos de las piezas suministradas por proveedores de Londres a
proyectos en Londres*/
-- cambiar 
select pieza.codpie from pieza
join ventas
on ventas.codpie = pieza.codpie
join proveedor
on proveedor.codpro = ventas.codpro
where proveedor.ciudad = 'Londres';

/*30. Obtener todos los pares de nombres de ciudades en las que un proveedor de la
primera sirva a un proyecto de la segunda*/
select proveedor.ciudad from  proveedor
join proyecto
on proyecto.ciudad = proveedor.ciudad;

/*31. Obtener códigos de piezas que sean suministradas a un proyecto por un proveedor
de la misma ciudad del proyecto*/
/*select pieza.codpie from pieza
join ventas
on ventas.codpie = pieza.codpie
join proyecto
on proyecto.ciudad = proveedor.ciudad;*/
select pieza.codpie from pieza, proveedor
join proyecto
on proyecto.ciudad = proveedor.ciudad;

/*32. Obtener códigos de proyectos que sean suministrados por un proveedor de una
ciudad distinta a la del proyecto. Visualizar el código de proveedor y el del proyecto.*/
-- terminar
select distinct ventas.codpro, ventas.codpj from ventas
join proveedor
on proveedor.codpro = ventas.codpro
join proyecto
on proyecto.codpj = ventas.codpj;

/*33. Obtener todos los pares de códigos de piezas suministradas por el mismo
proveedor.*/
select pieza.codpie from pieza, ventas
join proveedor
on proveedor.codpro = ventas.codpro;

/*34. Obtener todos los pares de códigos de piezas suministradas por el mismo proveedor
(eliminar pares repetidos).*/
SELECT DISTINCT LEAST(V1.codpie, V2.codpie) AS pieza1, 
                GREATEST(V1.codpie, V2.codpie) AS pieza2
FROM ventas V1
JOIN ventas V2 ON V1.codpro = V2.codpro AND V1.codpie < V2.codpie;

/*35. Obtener para cada pieza suministrada a un proyecto, el código de pieza, el código
de proyecto y la cantidad total correspondiente.*/
select ventas.codpie, ventas.codpro, ventas.cantidad from ventas;

/*36. Obtener los códigos de proyectos y los códigos de piezas en los que la cantidad
media suministrada a algún proyecto sea superior a 320.*/
select ventas.codpj, ventas.codpie from ventas where cantidad > 320;

/*37. Obtener un listado ascendente de los nombres de todos los proveedores que hayan
suministrado una cantidad superior a 100 de la pieza p1. Los nombres deben
aparecer en mayúsculas.*/
select upper(nompro) from proveedor where codpro in (select codpro from ventas where codpie = 'P1' and cantidad >100)
order by nompro asc;

/*38. Obtener los nombres de los proyectos a los que suministra s1.*/
select nompj from proyecto where codpj in (select codpj from ventas where codpro = 's1' );

/*39. Obtener los colores de las piezas suministradas por s1.*/
select color from pieza where codpie in (select codpie from ventas where codpro = 's1');

/*40. Obtener los códigos de las piezas suministradas a cualquier proyecto de Londres.*/
select codpie from ventas where codpj in (select codpj from proyecto where ciudad = 'Londres');

/*41. Obtener los códigos de los proveedores con estado menor que el proveedor con
código s1.*/


/*42. Obtener los códigos de los proyectos que usen la pieza pl en una cantidad media
mayor que la mayor cantidad en la que cualquier pieza sea suministrada al proyecto
j1.*/
SELECT codpj
FROM ventas
WHERE codpie = 'P1'
GROUP BY codpj
HAVING AVG(cantidad) > (SELECT MAX(cantidad) FROM ventas WHERE codpj = 'J1');

/*43. Obtener códigos de proveedores que suministren a algún proyecto la pieza p1 en
una cantidad mayor que la cantidad media en la que se suministra la pieza p1 a
dicho proyecto.*/
select codpj, avg(cantidad) from ventas where codpie = 'P1' group by codpj;

/*44. Obtener los códigos de los proyectos que usen al menos una pieza suministrada por s1.*/
select codpj from proyecto where codpj in (select codpj from ventas where codpro = 's1');

/*45. Obtener los códigos de los proveedores que suministren al menos una pieza
suministrada al menos por un proveedor que suministre al menos una pieza roja.*/
-- terminar
select codpro from proveedor where codpro in (select codpro from ventas);

/*46. Obtener los códigos de las piezas suministradas a cualquier proyecto de Londres
usando EXISTS.*/
select codpie from ventas where exists (select codpro from proveedor where ciudad = 'Londres');

/*47. Obtener los códigos de los proyectos que usen al menos una pieza suministrada por
s1 usando EXISTS.*/
select codpj from proyecto where exists (select codpj from ventas where codpro = 's1' );

/*48. Obtener los códigos de los proyectos que no reciban ninguna pieza roja suministrada
por algún proveedor de Londres.*/
SELECT DISTINCT PR.codpj
FROM proyecto PR
WHERE NOT EXISTS (
    SELECT 1 FROM ventas V
    JOIN proveedor P ON V.codpro = P.codpro
    JOIN pieza PI ON V.codpie = PI.codpie
    WHERE PR.codpj = V.codpj AND P.ciudad = 'Londres' AND PI.color = 'Rojo'
);

/*49. Obtener los códigos de los proyectos suministrados únicamente por s1.*/
select codpj from proyecto where codpj in (select codpj from ventas where codpro = 's1');

/*50. Obtener los códigos de las piezas suministradas a todos los proyectos en Londres.*/
select codpie from pieza where codpie in 
(select codpie from ventas where codpro in (select codpro from proveedor where ciudad = 'Londres'));

/*51. Obtener los códigos de los proveedores que suministren la misma pieza a todos los
proyectos.*/


/*52. Obtener los códigos de los proyectos que reciban al menos todas las piezas que
suministran s1.*/
select proyecto.codpj from proyecto
join ventas
on ventas.codpj = proyecto.codpj
where codpro = 's1';

/*53. Cambiar el color de todas las piezas rojas a naranja.*/
update pieza
set color = 'naranja' where color = 'rojo';

/*54. Borrar todos los proyectos para los que no haya cargamentos.*/
delete from proyecto where codpj = (select codpj from ventas where cantidad is null);

/*55. Borrar todos los proyectos en Roma y sus correspondientes cargamentos.*/
delete from ventas where codpj in (select codpj from proyecto where ciudad = 'Roma');

/*56. Insertar un nuevo suministrador s lo en la tabla S. El nombre y la ciudad son 'White'
y ‘New York' respectivamente. El estado no se conoce todavía.*/


/*57. Construir una tabla conteniendo una lista de los códigos de las piezas suministrada.s
a proyectos en Londres o suministradas por un suministrador de Londres.*/


/*58. Construir una tabla conteniendo una lista de los códigos de los proyectos de Londres
o que tengan algún suministrador de Londres.*/
