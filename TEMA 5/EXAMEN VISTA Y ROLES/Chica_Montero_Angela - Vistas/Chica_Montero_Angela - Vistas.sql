-- Angela Chica Montero
-- usuario root
use banco;

/*1. Crea el usuario cajero con los permisos necesarios para trabajar con banco*/
create user 'cajero'@'localhost' identified by 'cajero1223';
grant select, create view, insert, delete, update, drop on banco.* to 'cajero'@'localhost';

-- volvemos con root para el ultimo ejercicio
/*6. */
create user 'usuario_vistas2'@'localhost' identified by 'vistas123';
grant select on intereses7 to 'usuario_vistas2'@'localhost';
grant select on nombre_apellidos to 'usuario_vistas2'@'localhost';
grant select on nombre_apellidos_sucursal4 to 'usuario_vistas2'@'localhost';
grant select on saldomenor5 to 'usuario_vistas2'@'localhost';