use centro_educativo;
/*1. Mostrar el nombre de las provincias*/
select * from provincia;

/*2. 2. Mostrar el nombre y apellidos de los alumnos*/
select nombre, apellidos from alumno;

/*3. 3. Mostrar el código y el nombre de todas las asignaturas*/
select id_asig, nombre from asignatura;

/*4. Mostrar el DNI, nombre y apellidos de los profesores, ordenados por DNI
ascendentemente*/
select id_prof, nombre, apellidos from profesor order by dni asc;

/*5. Mostrar los datos de los alumnos de mayor a menor edad, de forma que en la
columna de la fecha de nacimiento aparezca el encabezado “Fecha_de_nacimiento” */
select ID_ALUM, dni,NOMBRE,APELLIDOS,fecha_nac as Fecha_de_Nacimiento, NACIDO_EN from alumno order by fecha_nac asc;

/*6. Mostrar los datos del alumno cuyo DNI es 56846315M.*/
select * from alumno where DNI = '56846315M';

/*7. Mostrar los alumnos nacidos en las provincias cuyos códigos estén comprendidos
entre 3 y 7*/
select nombre, apellidos from alumno where NACIDO_EN between 3 and 7;

/*8. Mostrar los profesores nacidos en alguna de estas provincias: 1, 3, 5, 7.*/
select nombre, apellidos from profesor where NACIDO_EN in (1, 3, 5, 7);

/*9. Mostrar los alumnos nacidos entre el 19/02/1980 y el 20/07/1984.*/
select nombre, apellidos from alumno where FECHA_NAC between '1980-02-19' and '1984-07-20';

/*10. Mostrar los registros de la tabla “Matriculado” del alumno 7.*/
select * from matriculado where ID_ALUM = 7;

/*11. Mostrar el nombre y apellidos de los alumnos mayores de 24 años*/
select nombre, apellidos from alumno where FECHA_NAC < '2025-02-25';

/*12. Mostrar aquellos alumnos cuyo DNI contenga la letra ‘Y’.*/
select * from alumno where DNI like '%Y%' ;

/*13. Mostrar aquellos alumnos cuyo nombre empiece por ‘S’*/
select * from alumno where NOMBRE like 'S%' ;

/*14. Mostrar el nombre de aquellos alumnos cuyo nombre contenga la letra ‘n’, ya sea
mayúscula o minúscula.*/
select nombre from alumno where NOMBRE like '%n%' or '%N%';

/*15. Mostrar el nombre de aquellos alumnos cuyo apellido contenga la letra ‘z’,
mayúscula o minúscula.*/
select nombre from alumno where APELLIDOS like '%z%' or '%Z%';

/*16. Mostrar aquellos alumnos que tengan por primer nombre “Manuel”.*/
select * from alumno where NOMBRE like 'Manuel%';

/*17. Mostrar aquellos alumnos que se llamen “Manuel” o “Cristina”.*/
select * from alumno where NOMBRE like 'Manuel%' or NOMBRE like 'Cristina%';

/*18. Mostrar los datos de los alumnos cuyo DNI empiece por 2.*/
select * from alumno where dni like '2%';

/*19. Mostrar los identificadores de provincia en las que han nacido los alumnos, sin que
estos identificadores se repitan.*/
select nombre, apellidos from alumno where NACIDO_EN in (select distinct nacido_en from alumno);

/*20. Mostrar la tabla de “Matriculado” y añadir una columna más que sea la media de las
tres notas de cada alumno, ordenados de la mejor nota a la peor*/
select id_alum, id_asig, (nota1+nota2+nota3)/3 as Nota_Media from matriculado order by Nota_Media desc;

/*21. Mostrar los registros de la tabla “Matriculado” en los que un alumno haya superado
los 3 exámenes de la asignatura 1.*/
select * from matriculado where ID_ASIG=1 and nota1 >= 5 and NOTA2 >= 5 and NOTA3>= 5;

/*22. Mostrar los registros de la tabla “Matriculado” en los que un alumno haya sacado un
10 en alguna de las 3 notas en cualquier asignatura*/
select * from matriculado where NOTA1 = 10 or NOTA2 = 10 or  NOTA3=10;

/*23. Mostrar aquellos registros de la tabla “Matriculado” en los que un alumno haya
superado alguno de los 3 exámenes de la asignatura 2.*/
select * from matriculado where ID_ASIG=2 order by nota1 >= 5 or NOTA2 >= 5 or NOTA3>= 5;

/*24. Mostrar los registros de la tabla “Matriculado” en los que un alumno haya superado
el primer examen ordenando los registros por “nota2” y “nota3” de menor a mayor
para ambos campos.*/
select * from matriculado where NOTA1 >=5 order by NOTA3 asc;

/*25. Mostrar aquellos alumnos nacidos en el 1985*/
select * from alumno where FECHA_NAC like '1985%';

/*26. Mostrar los datos de los alumnos y además una columna calculada “mes” que
represente el mes en el que nació el alumno. Además se debe ordenar por dicha
columna.*/
select id_alum, dni, nombre, APELLIDOS, NACIDO_EN, month(FECHA_NAC) as Mes from alumno order by MES ASC;

/*27. Mostrar los datos de los alumnos y además una columna calculada “fecha_de_
nacimiento” que represente el día en el que nació el alumno con el siguiente formato
“Nacido el día xx del xx de xxxx”*/
select id_alum, dni, nombre, APELLIDOS, NACIDO_EN,
concat("Nacido el dia ", day(FECHA_NAC), " del ", month(fecha_nac), " de ", year(Fecha_nac)) as Fecha_de_Nacimiento from alumno;

/**/