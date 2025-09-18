-- Crear la base de datos
CREATE DATABASE catalogo;
USE catalogo;

CREATE TABLE usuario_admin(
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar (40) not null,
    apellido varchar (60)not null,
    telefono VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL,
    psw VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    apellido varchar (40) not null,
    telefono VARCHAR(20),
    direccion VARCHAR(200),
    suscripcion_boletin BOOLEAN DEFAULT TRUE
);
-- Tabla de categorías
CREATE TABLE categoria(
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla de productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    imagen VARCHAR(255), -- URL o ruta de la imagen
    id_categoria INT,
    id_usuario INT, -- administrador que cargó el producto
    fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    FOREIGN KEY (id_usuario) REFERENCES usuario_admin(id_usuario)
    
);
create table descuento(
id_descuento INT AUTO_INCREMENT PRIMARY KEY,
id_producto int,
descuento DECIMAL(5,2),
fecha_inicio DATE,
fecha_fin DATE
);


CREATE TABLE promociones (
    id_promocion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descripcion TEXT,
    descuento DECIMAL(5,2), -- porcentaje de descuento, ej: 15.50
    fecha_inicio DATE,
    fecha_fin DATE
);

CREATE TABLE envios_promociones (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_promocion INT,
    id_usuario INT,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_promocion) REFERENCES promociones(id_promocion),
    FOREIGN KEY (id_usuario) REFERENCES usuario_admin(id_usuario)
);

