create database proyecto_ipc2

create table usuario(
	idUsuario int auto_increment,
	nombres varchar(50) not null,
	apellidos varchar(50) not null,
	tipoUsuario varchar(15) not null default 'Freelancer',
	cuentaBancaria varchar(50) not null default 'Pendiente de agregar',
	nombreBanco varchar(50) not null default 'Pendiente de Agregar',
	apodo varchar(50) not null unique,
	constraint usuario_pk primary key (idUsuario)
);
select * from usuario
alter table usuario add contraseña blob
alter table usuario add numSesion int
alter table usuario add column tipoUsuario varchar(15)
insert into usuario(nombres, apellidos, tipoUsuario, apodo, contraseña) values('NombreAdmin1', 'ApellidoAdmin1', 'Administrador', 'Admin1', AES_ENCRYPT('contraseña','llave'));

create table conocimiento(
	idConocimiento int auto_increment,
	nombre varchar(50) not null unique,
	descripcion varchar(200) not null default 'Pendiente de agregar',
	constraint conocimiento_pk primary key (idConocimiento)
);

insert into conocimiento (nombre, descripcion) values ('con1', 'descripcion con 1')

CREATE TABLE conocimientoAdquirido(
	idConocimientoAdquirido int,
	idConocimiento int,
	idUsuario int,
	karma int,
	dominio int,
	formaAprendido varchar(50),
	comentario varchar(50)
);
alter table conocimientoAdquirido drop column idConocimientoAdquirido
ALTER TABLE conocimientoAdquirido add constraint conocimientoAdquirido_fk_usuario foreign key (idUsuario) references usuario(idUsuario) on delete cascade on update cascade
ALTER TABLE conocimientoAdquirido add constraint conocimientoAdquirido_fk_Conocimiento foreign key (idConocimiento) references conocimiento(idConocimiento) on delete cascade on update cascade

alter table conocimientoAdquirido add constraint conocimientoAdquirido_pk primary key (idConocimientoAdquirido)

alter table conocimientoAdquirido add constraint conocimientoAdquirido_pkAuxiliar primary key (idUsuario, idConocimiento)

select * from conocimientoAdquirido


select * from usuario where apodo= 'Admin1' 

select AES_DECRYPT(contraseña,'llave') from usuario where apodo = 'Admin1'

update usuario set contraseña = EAS_ENCRYPT('asdf','llave') where apodo = 'Admin1'
select * from usuario where contraseña = AES_DECRYPT('contraseña','llave')

select * from usuario where apodo = 'Admin1' and contraseña = AES_ENCRYPT('asdf','llave')

select apodo from usuario where apodo = 'Admin1' and contraseña = AES_ENCRYPT('asdf','llave')

select * from usuario

select tipoUsuario from usuario where apodo = 'Admin1'

update usuario  set numSesion = 123 where apodo = 'Admin1'

alter table usuario drop column numSesion
practicas
alter table usuario add numSesion bigint
select * from usuario
alter table usuario modify numSesion int
alter table usuario modify contraseña blob not null
insert into usuario(nombres, apellidos, apodo, contraseña) values('nombre1', 'apellido1', 'apodo1', AES_ENCRYPT('contraseña','llave'));
update usuario set tipoUsuario = 'Freelancer' where idUsuario >1
alter table usuario alter tipoUsuario set default 'Freelancer'
alter table usuario modify tipoUsuario varchar (40) not null 

select numSesion from usuario where apodo='Admin1'
insert into usuario(nombres, apellidos, apodo, contraseña)values('nombreP1','apellidoP1', 'apodoP1', AES_ENCRYPT('contraseña','llave'))

select * from conocimiento

insert into conocimiento(nombre) values('con2')

select * from conocimientoadquirido

alter table conocimientoadquirido modify karma int not null

alter table conocimientoadquirido alter karma set default 0
alter table conocimientoadquirido modify dominio int not null
alter table conocimientoadquirido alter dominio set default 0

alter table conocimientoadquirido modify formaAprendido varchar(20) not null
alter table conocimientoadquirido alter formaAprendido set default 'Pendiente de Agregar'


alter table conocimientoadquirido modify comentario varchar(500) not null
alter table conocimientoadquirido alter comentario set DEFAULT 'Pendiente de agregar'


select * from conocimientoadquirido

insert into conocimientoadquirido (idConocimiento, idUsuario) values (1,1)

create table contactos(
	usuarioUno int,
	usuarioDos int,
	constraint contactos_fk_usuarioUno foreign key (usuarioUno) references usuario(idUsuario) on delete cascade on update cascade,
	constraint contactos_fk_usuarioDos foreign key (usuarioDos) references usuario(idUsuario) on delete cascade on update cascade,
	constraint contactos_pk primary key (usuarioUno, usuarioDos)
);

create table publicacion(
	idPublicacion int auto_increment,
	publicacion varchar(500) not null,
	idUsuario int,
	estado varchar (20) not null default 'Sin Estado',
	constraint publicacion_pk primary key(idPublicacion),
	constraint publicacion_fk_usuario foreign key (idUsuario) references usuario(idUsuario) on delete cascade on update cascade
);

create table conversacion (
	idConversacion int unsigned not null auto_increment,
	nombre varchar(20) not null default 'Conversacion',
	fecha timestamp default current_timestamp not null,
	constraint conversacion_pk primary key(idConversacion)
);

create table participanteConversacion (
	idUsuario int,
	idConversacion int unsigned not null,
	constraint participanteConversacion_fk_Usuario foreign key (idUsuario) references usuario(idUsuario) on update cascade on delete cascade,
	constraint participanteConversacion_fk_conversacion foreign key (idConversacion) references conversacion(idConversacion) on update cascade on delete cascade,
	constraint participanteConversacion_pk primary key (idUsuario, idConversacion)
);

create table mensaje(
	idMensaje int unsigned not null auto_increment,
	mensaje varchar(500) not null,
	fecha timestamp DEFAULT CURRENT_TIMESTAMP() not null,
	idUsuario int,
	idConversacion int unsigned not null,
	constraint mensajePK primary key(idMensaje),
	constraint mensaje_FK_participanteConversacion foreign key(idUsuario, idConversacion) references participanteconversacion(idUsuario, idConversacion) on update cascade on delete cascade
);

select * from usuario
create table proyecto(
	idProyecto int unsigned not null auto_increment,
	nombre varchar(25) not null unique,
	
);


select * from usuario

select * from contactos

select usuario.apodo from contactos inner join usuario on contactos.usuarioUno = usuario.idUsuario where contactos.idUsuarioDos = 2



insert into contactos(usuarioUno, usuarioDos) values(1,2),(1,5),(1,7)








