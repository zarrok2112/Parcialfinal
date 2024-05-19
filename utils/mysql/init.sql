CREATE DATABASE myflaskapp;
use myflaskapp;

CREATE TABLE users (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255),
    email varchar(255),
    username varchar(255),
    password varchar(255)
);

CREATE TABLE product (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2)
);

INSERT INTO users VALUES(null, "juan", "juan@gmail.com", "juan", "123"),
    (null, "maria", "maria@gmail.com", "maria", "456");

INSERT INTO product VALUES(null,'Laptop', 'Laptop de última generación', 1000.00),
(null,'Teléfono', 'Teléfono inteligente con cámara de alta resolución', 800.00),
(null,'Auriculares', 'Auriculares inalámbricos de alta calidad', 150.00),
(null,'Tablet', 'Tablet con pantalla HD', 300.00),
(null,'Smartwatch', 'Smartwatch con monitoreo de salud', 200.00);