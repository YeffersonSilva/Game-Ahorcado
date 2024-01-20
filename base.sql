CREATE TABLE Perfiles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    perfil VARCHAR(255)
);
CREATE TABLE Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255)
);
CREATE TABLE Vacantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255),
    fecha DATE,
    salario DECIMAL(10, 2),
    destacado INT,
    imagen VARCHAR(255),
    estatus VARCHAR(255),
    detalles VARCHAR(255),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    nombre VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    estatus INT,
    fechaRegistro DATE
    -- Relaciones con otras tablas serían manejadas mediante tablas de unión o lógica de aplicación
);
CREATE TABLE Solicitudes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    archivo VARCHAR(255),
    comentarios VARCHAR(255),
    estatus VARCHAR(255),
    vacante_id INT,
    usuario_id INT,
    FOREIGN KEY (vacante_id) REFERENCES Vacantes(id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);
ALTER TABLE Vacantes
ADD COLUMN idCategoria INT,
ADD FOREIGN KEY (idCategoria) REFERENCES Categorias(id);
CREATE TABLE usuarioperfil (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT,
    idPerfil INT,
    -- Aquí agregas más columnas según necesites
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(id),
    FOREIGN KEY (idPerfil) REFERENCES Perfiles(id)
);
-- Verifica si un idPerfil específico existe en la tabla perfiles
SELECT * FROM perfiles WHERE id = TU_ID_PERFIL;

-- Si el idPerfil existe, puedes insertar el registro en usuarioperfil
-- Reemplaza los valores de ejemplo con los datos reales que deseas insertar

INSERT INTO usuarioperfil (idUsuario, idPerfil)
VALUES (ID_USUARIO, ID_PERFIL_EXISTENTE);


INSERT INTO Perfiles (perfil) VALUES ('Administrador'), ('Usuario');
