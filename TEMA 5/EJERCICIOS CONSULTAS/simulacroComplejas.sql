-- Consultas complejas simulacro

/*1. Muestra todos los datos de los jugadores, cuyo nombre empieza por A y termina por e,
juegan en la división central y su peso está por encima de la media.*/
SELECT * FROM jugadores, equipos  where jugadores.nombre lIKE 'M%c' and equipos.division="Central" and peso> (select avg(peso) from jugadores); 

/*2. Muestra la mayor y menor asistencia por partido total de entre aquellos jugadores cuyo
equipo juega en la conferencia East.*/
select greatest()

/*3. Muestra los datos de los partidos de aquellos equipos en el que juega el jugador con mayor
peso de la liga.*/


/*4. Muestra todos los datos de los equipos de aquellos que nunca han jugado un
partido, ni como local ni como visitante.*/


/*5. Muestra el nombre del jugador, la posición que ocupa y la media de rebotes por
partido a lo largo de la historia, para cada jugador siempre y cuando dicha media sea
superior a 8 puntos. Redondea el valor de la media.*/


/*6. Cuenta el número de jugadores que tiene cada equipo y ordena el listado de mayor a
menor. No olvides que en dicho listado, si el equipo tiene 0 jugadores también debe
aparecer. En caso de empate en la ordenación por número de jugadores, ordena por
el nombre del equipo.*/