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













