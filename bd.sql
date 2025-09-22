-- Crear la base de datos
CREATE DATABASE transformers_MP_BV;
USE transformers_MP_BV;

-- Tabla de Facciones
CREATE TABLE Facciones (
    id_faccion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
);

-- Tabla de Personajes
CREATE TABLE Personajes (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    id_faccion INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    imagen VARCHAR(255), -- Se puede guardar la URL de la imagen
    FOREIGN KEY (id_faccion) REFERENCES Facciones(id_faccion)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Tabla de Vehículos/Transformaciones
CREATE TABLE Vehiculos (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_personaje INT NOT NULL,
    tipo VARCHAR(50) NOT NULL, -- auto, avión, camión, etc.
    modelo VARCHAR(100),
    FOREIGN KEY (id_personaje) REFERENCES Personajes(id_personaje)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Datos iniciales de ejemplo
INSERT INTO Facciones (nombre, descripcion)
VALUES 
('Autobots', 'Protectores de la paz y defensores de los humanos.'),
('Decepticons', 'Buscan conquistar y dominar el universo.');

INSERT INTO Personajes (id_faccion, nombre, imagen)
VALUES 
(1, 'Optimus Prime', 'https://example.com/optimus.jpg'),
(2, 'Megatron', 'https://example.com/megatron.jpg');

INSERT INTO Vehiculos (id_personaje, tipo, modelo)
VALUES 
(1, 'Camión', 'Freightliner FL86'),
(2, 'Avión', 'Caza F-22 Raptor');
