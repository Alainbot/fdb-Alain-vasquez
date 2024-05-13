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
('1', 'Juan', 'Pérez', 'juan@example.com', ''),
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

select * from GastosPersonales.Gastos;
select ID_gastos, Monto from GastosPersonales.Gastos;
select * from GastosPersonales.Usuarios where ID_USUARIO = '1';
select * from GastosPersonales.Gastos order by Monto desc;
select * from GastosPersonales.Gastos order by Monto asc;
select COUNT(*) from GastosPersonales.CategoriadeGastos;
select SUM(Monto) from GastosPersonales.Gastos;
select MAX(Monto), MIN(Monto) from GastosPersonales.Gastos;

select g.ID_gastos,g.FECHA,u.Nombre,u.Apellido
from gastospersonales.gastos as g
inner join  gastospersonales.usuarios as u on u.ID_gastos = g.ID_gastos;


SELECT u.Nombre AS empleado, c.Categoria AS categoria_de_gastos
FROM GastosPersonales.Gastos AS g
JOIN GastosPersonales.Usuarios AS u ON g.ID_USUARIO = u.ID_USUARIO
JOIN GastosPersonales.CategoriadeGastos AS c ON g.ID_Categoria = c.ID_Categoria
WHERE g.Monto < 50000;

SELECT u.Nombre AS usuario, g.Monto AS gasto_personal
FROM GastosPersonales.Gastos AS g
JOIN GastosPersonales.Usuarios AS u ON g.ID_USUARIO = u.ID_USUARIO
WHERE g.Monto > (
    SELECT AVG(g2.Monto) FROM GastosPersonales.Gastos AS g2 WHERE g.ID_Categoria = g2.ID_Categoria
);

SELECT ID_Categoria, AVG(Monto) AS gasto_promedio
FROM GastosPersonales.gastos
GROUP BY ID_Categoria;

SELECT Nombre, 'Usuario' AS tipo
FROM GastosPersonales.Usuarios;

SELECT Nombre
FROM GastosPersonales.Usuarios
WHERE Nombre LIKE '%Pedro%';

SELECT u.Nombre AS usuario, c.Categoria AS categoria_de_gastos
FROM GastosPersonales.gastos AS g
JOIN GastosPersonales.Usuarios AS u ON g.ID_USUARIO = u.ID_USUARIO
JOIN GastosPersonales.CategoriadeGastos AS c ON g.ID_Categoria = c.ID_Categoria
WHERE g.Monto > 50;

SELECT Nombre
FROM GastosPersonales.Usuarios
ORDER BY Nombre ASC
LIMIT 5;
