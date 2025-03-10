use centro_educativo;

/*1. Muestra la información de aquellas matrículas cuya nota1 es igual a la suma del
resto de notas*/
select * from matriculado where nota1 = (nota2+nota3);

/*2. Muestra la información de aquellas matrículas cuya nota media es superior a 8*/
select * from matriculado where (nota1+nota2+nota3)/3 > 8;

/*3. Muestra la información de todos los alumnos nacidos en el mes de febrero*/
select * from alumno where month(fecha_nac) = 2;

/*4. Muestra la información de los alumnos junto a un campo que indique, “Quedan
X_DIAS días para el cumpleaños de NOMBRE_ALUMNO”*/
--  Acabae
select concat("Quedan", datediff(concat("2025-",month(fecha_nac),"-", day(fecha_nac)), curdate()), " dias para el cumpleaños de ", nombre) as diascumpleaños from alumno;

/*5. Muestra el nombre y los apellidos de aquellos profesores con DNI par.*/
select nombre, apellidos from alumno where dni%2 = 0;

/*6. Muestra el nombre de los apellidos junto a su identificador de Séneca, sabiendo que
está formado por la primera letra de su nombre, y las tres primeras letras de cada
uno de los apellidos junto a las tres últimas cifras de su DNI (Sin contar la letra)*/
select id_alum, nombre, apellidos, dni, 
concat(substring(nombre,1,1), substring(nombre,1,3), SUBSTRING(APELLIDOS, LOCATE(' ', APELLIDOS) + 1, 3), substring(dni, length(dni) - 3, 3)) as Identificador  
from alumno;

-- substring para extraer lo que queramos de una cadena (cadena, desde donde cogemos, hasta cuando)

/*7. Muestra la información de los profesores que nacieron en la provincia 1 y ademas
contienen la letra A en el nombre o los apellidos*/
select * from profesor where nacido_en = 1 and (nombre like '%a%' or '%A%' or APELLIDOS like '%a%' or '%A%');

/*8. Muestra el identificador de aquellas asignaturas que son impartidas por algún
profesor cuyo código de profesor es par*/
select id_asig from imparte where ID_PROF%2=0;

/*9. Muestra el nombre de la última provincia por orden alfabético*/
select max(nombre) from provincia;

/*10. Muestra la media de notas para cada matriculado junto al valor nominal de la misma
en función a si se trata de Insuficiente (0-5), Suficiente (5), Bien (6), Notable (7-8) y
Sobresaliente (9-10).*/
select id_alum, id_asig, round((NOTA1 + NOTA2 + NOTA3)/3,2) as NotaMedia ,
case 
when round((NOTA1 + NOTA2 + NOTA3)/3,2) < 5 then 'Insuficiente'
when round((NOTA1 + NOTA2 + NOTA3)/3,2) = 5 then 'Suficiente'
when round((NOTA1 + NOTA2 + NOTA3)/3,2) = 6 then 'Bien'
when round((NOTA1 + NOTA2 + NOTA3)/3,2) between 7 and 8 then 'Notable'
when round((NOTA1 + NOTA2 + NOTA3)/3,2) > 8 then 'Sobresaliente'
end as Evaluacion
from matriculado;

/*11. Ahora, muestra la mayor nota media de todas. Solo la nota, llamada
Record_de_calificaciones*/
select max(round((NOTA1+NOTA2+NOTA3)/3,2)) as Record_De_Calificaciones from matriculado;
