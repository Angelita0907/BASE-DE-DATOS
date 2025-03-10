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
--  Acabar
select dni,nombre,apellidos,concat('Quedan ', (day(fecha_nac)) , ' dias para el cumpleanios de ', nombre) as Cumpleanios from alumno ;

/*5. Muestra el nombre y los apellidos de aquellos profesores con DNI par.*/
select nombre, apellidos from alumno where dni%2 = 0;

/*6. Muestra el nombre de los apellidos junto a su identificador de Séneca, sabiendo que
está formado por la primera letra de su nombre, y las tres primeras letras de cada
uno de los apellidos junto a las tres últimas cifras de su DNI (Sin contar la letra)*/
select nombre, apellidos, id_alum  from alumno;
-- completar

/*7. Muestra la información de los profesores que nacieron en la provincia 1 y ademas
contienen la letra A en el nombre o los apellidos*/
select * from profesor where nacido_en = 1 and apellidos like '%a%' || '%A%';

/*8. Muestra el identificador de aquellas asignaturas que son impartidas por algún
profesor cuyo código de profesor es par*/
