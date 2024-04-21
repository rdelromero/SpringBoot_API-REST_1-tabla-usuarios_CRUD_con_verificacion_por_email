drop database if exists basedatosusuariosverificacion;
create database basedatosusuariosverificacion;
use basedatosusuariosverificacion;

-- Creación de la tabla de usuarios
DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    direccion_email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(40) NOT NULL,
    apellido2 VARCHAR(40),
	active BOOLEAN,
    otp VARCHAR(6) NOT NULL,
    fecha_generacion_otp DATETIME,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO usuarios (nombre, apellido1, apellido2, password, direccion_email, active, otp, fecha_generacion_otp) VALUES
    ('Andrés', 'Bueno', 'Cuevas', 'andbuecue', 'andbuecue@example.com', true, '000000', CURRENT_TIMESTAMP),
    ('Beatriz', 'Cuevas', 'Deza', 'beacuedez', 'beacuedez@example.com', true, '000000', CURRENT_TIMESTAMP),
    ('Carlos', 'Deza', 'Espada', 'cardezesp', 'cardezesp@example.com', false, '000000', CURRENT_TIMESTAMP),
    ('Dorleta', 'Espada', null, 'dorespnul', 'dorespnul@sqlmail.com', true, '000000', CURRENT_TIMESTAMP),
    ('Elena', 'Fernández', 'Higuera', 'eleferhig', 'eleferhig@sqlmail.com', true, '000000', CURRENT_TIMESTAMP);

SELECT * FROM usuarios;
/*SELECT * FROM usuarios WHERE active = TRUE;*/
