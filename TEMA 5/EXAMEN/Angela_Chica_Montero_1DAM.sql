-- Ángela Chica Montero

/*1. Consulta con los nombrs, altura y peso de jugadores que pesen mas que la media*/
select nombre, altura, peso from jugadores where peso > (select avg(peso) from jugadores);

/*2. REaliza busqueda de jugadores que su nombre empiece por la letra w o z y muestre el 
nombre, procedencia y equipo donde juega. Debe aparecer la información de aquellos jugadores
que no tengan equipo*/
select nombre, procedencia, nombre_equipo from jugadores where nombre like 'W%' or nombre like 'Z%' or jugadores.nombre_equipo is null;

/*3. Lista todos los posibles valores del campo conferencia de la tabla equipos de
aquellos equipos que alguna vez han jugado como equipo local*/
select conferencia from equipos
join partidos
on partidos.equipo_local = equipos.nombre;

/*4. Camisetas con el nick en mayúsculas. Formado por las 3 primeras letras de su equipo,
3 primeras de la ciudad del equipo y las 3 primeras de su nombre. Listado de todos los nicks
ordenado alfabeticamente*/
select upper(concat(substr(jugadores.nombre_equipo,1,3),'-',substr(equipos.ciudad, 1,3),'-',substr(jugadores.nombre,1,3))) as Nick from jugadores,equipos
order by Nick asc;

/*5. Mostrar información de jugadores incluyendo una columna llamada TipoJugador para que
en aquellos jugadores que su peso sea 200 libras o menos indique BajoPeso y para el resto En peso
de jugadores de Houston*/
select *, case
	when jugadores.peso < 200 then 'BAJO PESO'
    when jugadores.peso >= 200 then 'EN PESO'
end as TipoJugador
from jugadores
where jugadores.procedencia = 'Houston';

/*6. Realiza una consulta que muestre el peso medio de los jugadores de cada equipo,
mostrando solo aquellos cuyo peso supera los 230 libras*/
select avg(jugadores.peso) as PesoMedioEquipo from jugadores
join equipos on equipos.nombre =  jugadores.nombre_equipo
where jugadores.peso > 230
group by equipos.nombre;

/*7. Realiza la misma consulta anterior pero agrupando esta vez por ciudad en lugar
de por peso y filtrando aquellos jugadores cuyo nombre contiene más de 15 caracteres y 
redondeando dicha media a un decimal*/
-- no esta acabado
select round(count(jugadores.nombre),1) as mediaNombre from jugadores
where mediaNombre > 15;

/*8. Realiza una consulta que muestre el equipo que más partidos ha ganado como visitante*/
select distinct equipos.nombre from equipos, partidos
where partidos.puntos_visitante >= (select max(puntos_visitante) from partidos); 

/*9. Realiza una consulta que muestre numero de puntos, como local obtenidos por años del
equipo rockets*/
select partidos.puntos_local from partidos
join equipos on equipos.nombre = partidos.equipo_local
where equipos.nombre = 'rockets';

/*10. Realiza una consulta que muestre aquellos equipos que han ganado algun partido 
como visitante*/
select distinct equipos.nombre from equipos
join partidos on partidos.equipo_visitante = equipos.nombre
where partidos.puntos_visitante > partidos.puntos_local;

/*11. Realiza una consulta que muestre el nombre del jugador, nombre del equipo y la division 
de aquellos que sea Central o Atlantic*/
select jugadores.nombre, jugadores.nombre_equipo, equipos.division from jugadores
join equipos on equipos.nombre = jugadores.nombre_equipo
where equipos.division = 'Central' or equipos.division = 'Atlantic';

/*12. Realiza una consulta que muestre por cada temporada la media de puntos por partido
siempre y cuando la media supere los 10 puntos*/
-- falta filtrar por media de 10
select estadisticas.temporada, round(avg(estadisticas.Puntos_por_partido),2) as MediaTemporada from estadisticas
join partidos on partidos.temporada = estadisticas.temporada
-- where MediaTemporada > 10
group by estadisticas.temporada;

/*13. Consulta que muestre media de tapones por partido y puntos por partido de cada
jugador, cuya procedencia sea serbia*/
select estadisticas.Tapones_por_partido, estadisticas.Puntos_por_partido from estadisticas
join jugadores on jugadores.codigo = estadisticas.jugador
where jugadores.procedencia = 'Serbia';

/*14. Realiza consulta que cuente numeros de jugadores que empiza por T o S por cada
equipo que empiece por R o S*/
select count(jugadores.nombre) from jugadores
where jugadores.nombre like 'T%' or jugadores.nombre like 'S%'
and jugadores.nombre_equipo in 
(select equipos.nombre from equipos where nombre like 'R%' or jugadores.nombre like 'S%');

/*15. Consulta que muestre nombre equipo, nombre jugador y estadisticas de media tapones
por partido de aquellos jugadores que miden exactamente 6-11 para los clippers o 6-5 para
los grizzlies evitando las estadisticas que son 0*/
-- falta meter jugadores por equipo
select equipos.nombre, jugadores.nombre, estadisticas.Tapones_por_partido from equipos,jugadores, estadisticas
where  (equipos.nombre = 'Clippers' and jugadores.altura = '6-11') 
or (equipos.nombre = 'Grizzlies' and jugadores.altura = '6-5');

/*16. Muestra toda la informacion de aquellos jugadores que no estén asociados a ningun
equipo (en caso que los haya)*/
select * from jugadores where nombre_equipo is null;

/*17. Muestra toda la informacion de aquellos jugadores que no tienen asociadoas 
estadisticas (en caso de que los haya)*/
select * from jugadores 
where jugadores.codigo not in (select estadisticas.jugador from estadisticas);
