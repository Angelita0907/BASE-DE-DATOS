-- Consultas complejas simulacro

/*1. Muestra todos los datos de los jugadores, cuyo nombre empieza por A y termina por e,
juegan en la división central y su peso está por encima de la media.*/
SELECT * FROM jugadores, equipos  where jugadores.nombre lIKE 'M%c' and equipos.division="Central" and peso> (select avg(peso) from jugadores); 

/*2. Muestra la mayor y menor asistencia por partido total de entre aquellos jugadores cuyo
equipo juega en la conferencia East.*/
select max(estadisticas.asistencias_por_partido), min(estadisticas.asistencias_por_partido) from estadisticas
join jugadores 
on jugadores.codigo = estadisticas.jugador
join equipos
on equipos.nombre = jugadores.nombre_equipo
where equipos.conferencia = 'East';

/*3. Muestra los datos de los partidos de aquellos equipos en el que juega el jugador con mayor
peso de la liga.*/
select * from partido 
join jugadores on partidos.temporada = estadisticas.temporada 
join jugadores on jugadores.codigo = estadisticas.jugador 
where jugadores.peso > (select max(peso) from jugadores );

/*4. Muestra todos los datos de los equipos de aquellos que nunca han jugado un
partido, ni como local ni como visitante.*/


/*5. Muestra el nombre del jugador, la posición que ocupa y la media de rebotes por
partido a lo largo de la historia, para cada jugador siempre y cuando dicha media sea
superior a 8 puntos. Redondea el valor de la media.*/
select jugadores.nombre, jugadores.posicion, avg(estadisticas.rebotes_por_partido) from jugadores
join estadisticas
on jugadores.codigo = estadisticas.jugador
group by jugadores.nombre, jugadores.posicion
having avg(estadisticas.rebotes_por_partido) > 8;


/*6. Cuenta el número de jugadores que tiene cada equipo y ordena el listado de mayor a
menor. No olvides que en dicho listado, si el equipo tiene 0 jugadores también debe
aparecer. En caso de empate en la ordenación por número de jugadores, ordena por
el nombre del equipo.*/
select jugadores.nombre_equipo, count(*) as jugadoresTotal from jugadores
group by nombre_equipo 
order by jugadoresTotal desc;