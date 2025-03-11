use pokemon;

-- Ángela Chica Montero

/*1. Muestra las ciudades que pertenecen a la region de Hoenn*/
select * from ciudad where region = 2;

/*2. Para cada generacion tienes que mostrar una columna donde apareza textualmente 
"Esta es la generacion X y fue descubierta en el anio YYYY"*/
select concat('Esta es la generación ', id_generacion, ' y fue descubierta en el anio ',anyo_descubrimiento ) as fechaDescubrimiento from generacion;

/*3. Seleccionar todos los pokemon que tengan nivel superior a 50 y cuyo ataque sea mayor que 100*/
select pokemon.nombre, entrenamiento.nivel, entrenamiento.ataque from pokemon, entrenamiento
where nivel >= 50 and ataque >= 100; 

/*4. selecionar todos los niveles que tengan un nivel par*/
select pokemon.nombre, entrenamiento.nivel from pokemon, entrenamiento where nivel%2=0;

/*5. Seleccionar todos los entrenadores cuyo nombre tenga la letra 'a' en la segunda posicion*/
select * from entrenador where substring(nombre,2,1) like '%a%';

/*6. Seleccionar todos los pokemon cuya longitud del nombre sea mayor que 5 y que su origen sea kanto*/
select pokemon.nombre, region.nombre from pokemon, region
where length(pokemon.nombre) >5 and region.nombre = 'Kanto';

-- otra forma
select nombre, originario from pokemon where length(pokemon.nombre) >5 and originario = 1;

/*7. Seleccionar todos los pokemon cuyo nombre empiece con 'Ch' 
y tengan un ataque o ataques especial mayor que 80*/
select pokemon.nombre, entrenamiento.ataque_esp from pokemon, entrenamiento
where nombre like 'Ch%' and ataque_esp > 80;

/*8. Seleccionar todos los pokemon cuyo ataque especial sea al menos un 20% mayor a su ataque normal*/
select * from entrenamiento where ataque < (ataque_esp+(ataque_esp*0.2));

/*9. Seleccionar todos los pokemon que tengan un ataque menor a 100 y una velocidad mayor 
a 120, o un ataque mayor a 120 y una velocidad menor a 100*/
select * from entrenamiento where (ataque < 100 and velocidad > 120) or (ataque > 120 and velocidad < 100);

/*10. Seleccionar todos los pokemon que tengan un ataque especial mayor a 100 o una defensa mayor a 90,
pero no ambos*/
select * from entrenamiento where ataque_esp >100 or defensa > 90;

/*11. Selecionar todos lo poemon que tengan un ataque especial entre 80 y 120 y una velocidad wentre 90 y 100*/
select * from entrenamiento where (ataque_esp between 80 and 120) and (velocidad between 90 and 110);

/*12. Selecionar todos los entrenadores cuyo nombre empiece por 'J' y termine por 'o'*/
select * from entrenador where nombre like 'J%' and '%o';

/*13. Seleccionar todos los entrenadores cuyo nombre tenga al menos 6 caracteres*/
select * from entrenador where length(nombre) >=6;

/*14. Muestra solo la ultima generacion descubierta*/
select * from generacion order by anyo_descubrimiento desc limit 1;

/*15. Muestra primer pokemon entrenador del que se tiene constancia en el sistema*/
-- supongo que el primer pokemon es el que tiene id = 1
select * from entrenamiento order by inicio_entrenamiento asc limit 1;

/*16. Muestra los pokemon cuyo ataque especial es mayor a la defensa y defensa especial juntas*/
select * from entrenamiento where ataque_esp > (defensa+defensa_esp);
-- no hay ninguno que cumpla esa condicion actualmente

/*17. Muestra todos los entrenadores con menos de 1000 euros o que tengan mas de 1000 
pero que en su nombre no estén las letras 'p' ni 'b'*/
select * from entrenador where (dinero < 10000) or (dinero > 10000 and nombre not like '%p%' and '%b%');

/*18. Muestra todos los movimientos que puedan fallar*/
select * from movimiento where precision_mov <100;

/*19. Muestra los identificadores sin repetir todos los pokemon que no son salvajes, es decir, que tienen entrenamiento*/
select distinct id_pokemon from entrenamiento where inicio_entrenamiento is not null;

/*20. Muestra un mensaje de felicitacion al entrenador con más dinero, indicando:
'Enhorabuena 'nombre' has ganado un total de 'dinero'  dinero llevando/sin llevar zapatillas' 
esto ultimo depende si el campo es activo o no*/
select case
	when  lleva_zapatillas = 0 then concat('Enhorabuena ',nombre ,' has ganado un total de ', dinero, ' dinero sin tus zapatillas')
    when lleva_zapatillas   = 1 then concat('Enhorabuena ',nombre ,' has ganado un total de ', dinero, ' dinero llevando tus zapatillas')
end as Felcicitaciones
from entrenador;

