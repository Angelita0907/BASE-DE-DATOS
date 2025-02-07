-- Prueba usuarios
use instituto;
create user 'Administrador' identified by 'admin123';
create role 'admin';
grant all privileges on instituto to 'admin';
show grants for 'admin';

grant 'admin' to 'Administrador';
show grants for 'Administrador';

create user 'UsuarioSimple' identified by 'usuario123';
create role 'simple';
grant create,select,update,delete on instituto to 'simple';
grant 'simple' to 'UsuarioSimple';
show grants for 'simple';