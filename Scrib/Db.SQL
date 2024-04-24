create database GastosPersonales;

CREATE TABLE IF NOT EXISTS GastosPersonales.Usuarios(
ID_USUARIO varchar(20)not null,
Nombre VARCHAR(50) not null,
Apellido VARCHAR(50) not null,
CORREO_ELECTRONICO VARCHAR(50)not null,
CONTRASEÑA VARCHAR(16) not null,

primary key(ID_USUARIO)
);

CREATE TABLE IF NOT EXISTS GastosPersonales.CategoriadeGastos(
ID_Categoria varchar(20)not null,
Categoria varchar(30) not null,
Descripcion VARCHAR(100) not null,

primary key(ID_Categoria)
);


CREATE TABLE IF NOT EXISTS GastosPersonales.Gastos(
ID_gastos varchar(20)not null,
ID_USUARIO varchar (30)not null,
ID_Categoria varchar (30)not null,
Monto int not null,
FECHA CHAR(8) not null,
Descripcion VARCHAR(16) not null,

primary key(ID_gastos)
);
ALTER TABLE gastospersonales.gastos add foreign key (ID_USUARIO) references GastosPersonales.Usuarios(ID_USUARIO) ON update CASCADE ON delete CASCADE;
ALTER TABLE gastospersonales.gastos add foreign key (ID_Categoria) references GastosPersonales.CategoriadeGastos(ID_Categoria) ON update CASCADE ON delete CASCADE;

INSERT INTO GastosPersonales.Usuarios (ID_USUARIO, Nombre, Apellido, CORREO_ELECTRONICO, CONTRASEÑA) 
VALUES 
('1', 'Juan', 'Pérez', 'juan@example.com', 'contraseña1'),
('2', 'María', 'López', 'maria@example.com', 'contraseña2'),
('3', 'Pedro', 'González', 'pedro@example.com', 'contraseña3'),
('4', 'Ana', 'Martínez', 'ana@example.com', 'contraseña4'),
('5', 'Luis', 'Rodríguez', 'luis@example.com', 'contraseña5'),
('6', 'Laura', 'Sánchez', 'laura@example.com', 'contraseña6'),
('7', 'Carlos', 'Fernández', 'carlos@example.com', 'contraseña7'),
('8', 'Sofía', 'Ramírez', 'sofia@example.com', 'contraseña8'),
('9', 'Jorge', 'Díaz', 'jorge@example.com', 'contraseña9'),
('10', 'Elena', 'Torres', 'elena@example.com', 'contraseña10');

INSERT INTO GastosPersonales.CategoriadeGastos (ID_Categoria, Categoria, Descripcion) 
VALUES 
('1', 'Comida', 'bebidas.'),
('2', 'Transporte', ' transporte.'),
('3', 'Entretenimiento', ' netflix.'),
('4', 'Salud', 'medicamentos.'),
('5', 'Educación', '  cursos.'),
('6', 'Hogar', ' servicios.'),
('7', 'Ropa', 'accesorios.'),
('8', 'Viajes', 'alojamiento.'),
('9', 'Regalos', 'obsequios.'),
('10', 'Otros', 'Otros gastos.');

INSERT INTO GastosPersonales.Gastos (ID_gastos, ID_USUARIO, ID_Categoria, Monto, FECHA, Descripcion) 
VALUES 
('1', '1', '1', 50, '20220401', 'Almuerzo'),
('2', '2', '2', 20, '20220402', 'Taxi'),
('3', '3', '3', 30, '20220403', ' cine'),
('4', '4', '4', 100, '20220404', 'Consulta médica'),
('5', '5', '5', 50, '20220405', 'Libros'),
('6', '6', '6', 200, '20220406', 'Compra'),
('7', '7', '7', 80, '20220407', 'Camisa '),
('8', '8', '8', 150, '20220408', 'Reserva '),
('9', '9', '9', 40, '20220409', ' cumpleaños'),
('10', '10', '10', 25, '20220410', 'Otros gastos ');
select *from GastosPersonales.Gastos;
select *from GastosPersonales.Usuarios;
select *from GastosPersonales.CategoriadeGastos;

-- delete from GastosPersonales.Usuarios where ID_USUARIO in ('001', '002', 'valor_ID_USUARIO');

