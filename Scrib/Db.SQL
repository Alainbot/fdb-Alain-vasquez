create database GastosPersonanes;


CREATE TABLE IF NOT EXISTS GastosPersonanes.Usuarios(
ID_USUARIO varchar(20)not null,
Nombre VARCHAR(50) not null,
Apellido VARCHAR(50) not null,
CORREO_ELECTRONICO VARCHAR(50)not null,
CONTRASEÑA VARCHAR(16) not null,

primary key(ID_USUARIO)
);

CREATE TABLE IF NOT EXISTS GastosPersonanes.CategoriadeGastos(
ID_Categoria varchar(20)not null,
Categoria varchar(30) not null,
Descripcion VARCHAR(16) not null,

primary key(ID_CATEGORIADEGASTOS)
);

CREATE TABLE IF NOT EXISTS GastosPersonanes.Gatos(
ID_gastos varchar(20)not null,
ID_USUARIO varchar (30)not null,
ID_CATEGORIA varchar (30)not null,
Montoint not null,
FECHA CHAR(8) not null,
Descripcion VARCHAR(16) not null,

primary key(ID_GASTOS)
);