DROP DATABASE IF EXISTS rentavehiculoshn;
GO
GO
CREATE DATABASE rentavehiculoshn;
GO
GO
USE rentavehiculoshn;
DROP TABLE IF EXISTS surcusales;
GO
CREATE TABLE surcusales (
id INT PRIMARY KEY IDENTITY NOT NULL,
descripcion VARCHAR(100) NOT NULL,
direccion VARCHAR(100) NOT NULL,
telefono INT NOT NULL,
fecha_registro DATE NOT NULL,
fecha_actualizacion DATE NOT NULL
);

DROP TABLE IF EXISTS empleados;
GO
CREATE TABLE empleados (
id INT PRIMARY KEY IDENTITY NOT NULL,
nombres VARCHAR(100) NOT NULL,
apellidos VARCHAR(100) NOT NULL,
telefono INT  NOT NULL,
email VARCHAR(50) NOT NULL,
id_sucursal INT NOT NULL,
dni INT NOT NULL,
sexo VARCHAR(10) NOT NULL,
fecha_nacimiento DATE NOT NULL,
fecha_registro DATE NOT NULL,
fecha_actualizacion DATE NOT NULL 
);

ALTER TABLE empleados
ADD CONSTRAINT FK_empleado_sucursal
FOREIGN KEY(id_sucursal) REFERENCES surcusales (id)
go

DROP TABLE IF EXISTS clientes;
GO
CREATE TABLE clientes(
id INT PRIMARY KEY IDENTITY NOT NULL,
nombres VARCHAR(100) NOT NULL,
apellidos VARCHAR(100) NOT NULL,
telefono INT  NOT NULL,
email VARCHAR(50) NOT NULL,
dni INT NOT NULL,
sexo VARCHAR(1) NOT NULL,
fecha_nacimiento DATE NOT NULL,
fecha_registro DATE NOT NULL,
fecha_actualizacion DATE NOT NULL
);

DROP TABLE IF EXISTS marcas;
GO
CREATE TABLE marcas(
id INT PRIMARY KEY IDENTITY NOT NULL,
descripcion VARCHAR(150) NOT NULL,
fecha_registro DATE NOT NULL,
fecha_actualizacion DATE NOT NULL
);

DROP TABLE IF EXISTS modelos;
GO
CREATE TABLE modelos(
id INT PRIMARY KEY IDENTITY NOT NULL,
id_marca INT NOT NULL,
descripcion VARCHAR(50) NOT NULL,
fecha_registro DATE NOT NULL,
fecha_actualizacion DATE NOT NULL
);


ALTER TABLE modelos
ADD CONSTRAINT FK_modelo_marca
FOREIGN KEY(id_marca) REFERENCES marcas (id)
go

DROP TABLE IF EXISTS vehiculos;
GO
CREATE TABLE vehiculos(
id INT PRIMARY KEY IDENTITY NOT NULL,
id_modelo INT NOT NULL,
placa VARCHAR(50) NOT NULL,
precio_renta FLOAT(10) NOT NULL,
estado CHAR(1) NOT NULL,
fecha_registro DATE NOT NULL,
fecha_actualizacion DATE NOT NULL
);

ALTER TABLE vehiculos
ADD CONSTRAINT FK_vehiculo_modelo
FOREIGN KEY(id_modelo) REFERENCES modelos (id)
go

DROP TABLE IF EXISTS vehiculosrentas;
GO
CREATE TABLE vehiculosrentas(
id INT PRIMARY KEY IDENTITY NOT NULL,
id_cliente INT NOT NULL,
id_vehiculo INT NOT NULL,
nota VARCHAR(100) NOT NULL,
total FLOAT(10) NOT NULL,
fecha_entrega DATE NOT NULL,
id_empleado_entrega INT NOT NULL,
empleado_entrega DATE NOT NULL,
empleado_recibe DATE NOT NULL,
id_empleado_recibe INT NOT NULL,
fecha_registro DATE NOT NULL,
fecha_actualizacion DATE NOT NULL
);

ALTER TABLE vehiculosrentas
ADD CONSTRAINT FK_vehiculosrenta_cliente
FOREIGN KEY(id_cliente) REFERENCES clientes (id)
go

ALTER TABLE vehiculosrentas
ADD CONSTRAINT FK_vehiculosrenta_vehiculo
FOREIGN KEY(id_vehiculo) REFERENCES vehiculos (id)
go

ALTER TABLE vehiculosrentas
ADD CONSTRAINT FK_vehiculosrenta_empleado
FOREIGN KEY(id_empleado_entrega) REFERENCES empleados (id)
go

ALTER TABLE vehiculosrentas
ADD CONSTRAINT FK_vehiculosrenta_empleadorecibe
FOREIGN KEY(id_empleado_recibe) REFERENCES empleados (id)
go


--INSERTAR DATOS DE TABLAS SUCURSALES
-- DATE - format YYYY-MM-DD
INSERT INTO surcusales (descripcion,direccion,telefono,fecha_registro,fecha_actualizacion) 
VALUES('San Pedro Sula', 'Barrio Rio Piedras 9 Calle', '205651452', '20200325','20220325');
INSERT INTO surcusales (descripcion,direccion,telefono,fecha_registro,fecha_actualizacion) 
VALUES('Tegucigalpa','La Cañada','205652165','20200325','20220325');
INSERT INTO surcusales (descripcion,direccion,telefono,fecha_registro,fecha_actualizacion) 
VALUES('Ceiba','Hotel el Atlantico,Contiguo','205658943','20200325','20220325');
INSERT INTO surcusales (descripcion,direccion,telefono,fecha_registro,fecha_actualizacion) 
VALUES('Olancho','Centro Olancho,3 Calle,6 Ave','205658967','20200325','20220325');
INSERT INTO surcusales (descripcion,direccion,telefono,fecha_registro,fecha_actualizacion) 
VALUES('Puerto Cortes','1 Calle,12 Avenida Contiguo a Municipalidad','205658964','20200325','20220325');
GO
--INSERTAR DATOS DE EMPLEADO
-- DATE - format YYYY-MM-DD
INSERT INTO empleados (nombres,apellidos,telefono,email,id_sucursal,dni,sexo,fecha_nacimiento,fecha_registro,fecha_actualizacion) 
VALUES
('Carlos','Ortez','96225973','carlos@gmail.com','8','123456','M','20221122','20221122','20221122');
INSERT INTO empleados (nombres,apellidos,telefono,email,id_sucursal,dni,sexo,fecha_nacimiento,fecha_registro,fecha_actualizacion) 
VALUES
('Jose','Moreno','88653578','Jose@gmail.com','8','05011994','M','19861121','20221122','20221122');
INSERT INTO empleados (nombres,apellidos,telefono,email,id_sucursal,dni,sexo,fecha_nacimiento,fecha_registro,fecha_actualizacion) 
VALUES
('Katherine','Elizabeth','88045356','Katherine@gmail.com','15','05011994','M','19861121','20221122','20221122');
INSERT INTO empleados (nombres,apellidos,telefono,email,id_sucursal,dni,sexo,fecha_nacimiento,fecha_registro,fecha_actualizacion) 
VALUES
('Katherine','Elizabeth','88045356','Katherine@gmail.com','15','0501199465','M','19861121','20221122','20221122');
INSERT INTO empleados (nombres,apellidos,telefono,email,id_sucursal,dni,sexo,fecha_nacimiento,fecha_registro,fecha_actualizacion) 
VALUES
('Edmi','Corea','89006864','Edmi@gmail.com','11','12201465','M','19861121','20221122','20221122');
GO
--INSERTAR DATOS DE CLIENTES
-- DATE - format YYYY-MM-DD
INSERT INTO clientes (nombres,apellidos,telefono,email,dni,sexo,fecha_nacimiento,fecha_registro,fecha_actualizacion) 
VALUES
('Amy','Ortez','84563621','Amy@gmail.com','050116657','M','19941125','20221122','20221122');
INSERT INTO clientes (nombres,apellidos,telefono,email,dni,sexo,fecha_nacimiento,fecha_registro,fecha_actualizacion) 
VALUES
('Melquita','Caballero','88543214','Melquita@gmail.com','1225667','F','19900131','20221122','20221122');
INSERT INTO clientes (nombres,apellidos,telefono,email,dni,sexo,fecha_nacimiento,fecha_registro,fecha_actualizacion) 
VALUES
('Daniel','Ramos','96517896','Daniel@gmail.com','15216579','M','19960521','20221122','20221122');
INSERT INTO clientes (nombres,apellidos,telefono,email,dni,sexo,fecha_nacimiento,fecha_registro,fecha_actualizacion) 
VALUES
('Suyapa','Medina','81324965','Daniel@gmail.com','17521146','F','19910201','20221122','20221122');
GO
--INSERTAR DATOS DE MARCAS
-- DATE - format YYYY-MM-DD
INSERT INTO marcas (descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('CARTEPILLAR','20221122','20221122');
INSERT INTO marcas (descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('KOMATSU','20221122','20221122');
INSERT INTO marcas (descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('TEREX','20221122','20221122');
INSERT INTO marcas (descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('VOLVO','20221122','20221122');
INSERT INTO marcas (descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('LIEBHERR','20221122','20221122');
INSERT INTO marcas (descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('HITACHI','20221122','20221122');
INSERT INTO marcas (descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('HYUNDAI','20221122','20221122');
GO
--INSERTAR DATOS DE MODELOS
-- DATE - format YYYY-MM-DD
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('1','CJ16S','20221122','20221122');
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('1','CW24','20221122','20221122');
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('1','CB1','20221122','20221122');
GO
--KOMATSU
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('2','PC100-6','20221122','20221122');
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('2','PC1002-6','20221122','20221122');
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('2','PC20-7','20221122','20221122');
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('2','PC128U-1','20221122','20221122');
GO
--TEREX
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('3','S45-XC','20221122','20221122');
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('3','fDC400','20221122','20221122');
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('3','CTT222-10','20221122','20221122');
GO
--VOLVO
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('4','EC950E','20221122','20221122');
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('4','L350H','20221122','20221122');
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('4','R70D','20221122','20221122');
GO
--LIEBEHERR
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('5','LH18M','20221122','20221122');
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('5','PR176','20221122','20221122');
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('5','L504','20221122','20221122');
GO
--HITACHI
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('6','EX8000','20221122','20221122');
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('6','ZW180-5','20221122','20221122');
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('6','EX200-1','20221122','20221122')
GO
--HYUNDAI
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('7','HX65AMT','20221122','20221122');
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('7','HX220S','20221122','20221122');
INSERT INTO modelos (id_marca,descripcion,fecha_registro,fecha_actualizacion) 
VALUES
('7','HW65A','20221122','20221122')
GO
--INSERTAR DATOS DE VEHICULOS
-- DATE - format YYYY-MM-DD
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('1','HX256','1263.50','B','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('2','HX257','3800','B','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('3','HX258','5000','B','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('4','HX259','128000','B','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('5','HX260','45411.69','B','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('6','HX261','329457.63','B','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('7','HX262','981245.69','B','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('8','HX263','524687.11','B','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('9','HX248','584610.98','M','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('10','HX298','1807931','B','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('11','HX285','476481','M','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('12','HX211','476481','B','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('13','HX226','393788','B','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('14','HX231','711407','B','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('15','HX215','420100','B','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('16','HX218','1759662','B','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('17','HX290','1114227','B','20221122','20221122');
INSERT INTO vehiculos (id_modelo,placa,precio_renta,estado,fecha_registro,fecha_actualizacion) 
VALUES
('18','HX217','1351196','M','20221122','20221122');
GO
GO
--INSERTAR DATOS DE VEHICULOS RENTA
-- DATE - format YYYY-MM-DD
INSERT INTO vehiculosrentas (id_cliente,id_vehiculo,nota,total,fecha_entrega,id_empleado_entrega,empleado_entrega,empleado_recibe,id_empleado_recibe,fecha_registro,fecha_actualizacion) 
VALUES
('12','1','NOTA1','3060.50','20221122','3','20221122','20221122','3','20221127','20221127');
INSERT INTO vehiculosrentas (id_cliente,id_vehiculo,nota,total,fecha_entrega,id_empleado_entrega,empleado_entrega,empleado_recibe,id_empleado_recibe,fecha_registro,fecha_actualizacion) 
VALUES
('13','2','NOTA2','90065.98','20221122','4','20221122','20221122','4','20221127','20221127');
INSERT INTO vehiculosrentas (id_cliente,id_vehiculo,nota,total,fecha_entrega,id_empleado_entrega,empleado_entrega,empleado_recibe,id_empleado_recibe,fecha_registro,fecha_actualizacion) 
VALUES
('14','3','NOTA3','46541.58','20221122','5','20221122','20221122','5','20221127','20221127');
INSERT INTO vehiculosrentas (id_cliente,id_vehiculo,nota,total,fecha_entrega,id_empleado_entrega,empleado_entrega,empleado_recibe,id_empleado_recibe,fecha_registro,fecha_actualizacion) 
VALUES
('15','4','NOTA4','14664.69','20221122','6','20221122','20221122','6','20221127','20221127');