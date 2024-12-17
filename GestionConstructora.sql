CREATE TABLE Categorias (
    CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Direcciones (
    DireccionID INT IDENTITY(1,1) PRIMARY KEY,
    Provincia NVARCHAR(50) DEFAULT 'San José',
    Canton NVARCHAR(50) NULL,
    Distrito NVARCHAR(50) NULL,
    OtrasSenas NVARCHAR(100) NULL
);

CREATE TABLE Empleados (
    EmpleadoID INT IDENTITY(1,1) PRIMARY KEY,
    Carnet NVARCHAR(20) UNIQUE NOT NULL,
    Nombre NVARCHAR(50) NOT NULL,
    Apellido1 NVARCHAR(50) NOT NULL,
    Apellido2 NVARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    DireccionID INT FOREIGN KEY REFERENCES Direcciones(DireccionID),
    Telefono NVARCHAR(15) NULL,
    Correo NVARCHAR(50) UNIQUE NOT NULL,
    Salario DECIMAL(10,2) CHECK (Salario BETWEEN 250000 AND 500000) NOT NULL,
    CategoriaID INT FOREIGN KEY REFERENCES Categorias(CategoriaID)
);

CREATE TABLE Proyectos (
    ProyectoID INT IDENTITY(1,1) PRIMARY KEY,
    CodigoProyecto NVARCHAR(20) UNIQUE NOT NULL,
    Nombre NVARCHAR(50) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinalizacion DATE NULL
);

CREATE TABLE Asignaciones (
    AsignacionID INT IDENTITY(1,1) PRIMARY KEY,
    EmpleadoID INT NOT NULL FOREIGN KEY REFERENCES Empleados(EmpleadoID),
    ProyectoID INT NOT NULL FOREIGN KEY REFERENCES Proyectos(ProyectoID),
    FechaAsignacion DATE DEFAULT GETDATE()
);

CREATE TABLE Contactos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Correo NVARCHAR(20) NOT NULL,
    Mensaje NVARCHAR(MAX) NOT NULL,
    Fecha DATETIME NOT NULL
);

INSERT INTO Categorias (Nombre) VALUES ('Construcción Residencial');
INSERT INTO Categorias (Nombre) VALUES ('Construcción Comercial');
INSERT INTO Categorias (Nombre) VALUES ('Infraestructura');

INSERT INTO Direcciones (Provincia, Canton, Distrito, OtrasSenAs)
VALUES ('San José', 'Central', 'Hospital', 'Avenida Central, Calle 1');

INSERT INTO Direcciones (Provincia, Canton, Distrito, OtrasSenAs)
VALUES ('Cartago', 'El Guarco', 'Tejar', 'Calle 21, Casa Amarilla');

INSERT INTO Direcciones (Provincia, Canton, Distrito, OtrasSenAs)
VALUES ('Alajuela', 'Alajuela', 'San José', 'Frente al parque central');

INSERT INTO Direcciones (Provincia, Canton, Distrito, OtrasSenAs)
VALUES ('Heredia', 'Heredia', 'San Francisco', 'Del centro comercial 300m norte');

INSERT INTO Direcciones (Provincia, Canton, Distrito, OtrasSenAs)
VALUES ('Guanacaste', 'Liberia', 'Liberia', 'A 500m del aeropuerto');

INSERT INTO Proyectos (CodigoProyecto, Nombre, FechaInicio, FechaFinalizacion)
VALUES ('PROY-001', 'Construcción de Edificio Central', '2024-04-01', '2024-10-01');

INSERT INTO Proyectos (CodigoProyecto, Nombre, FechaInicio, FechaFinalizacion)
VALUES ('PROY-002', 'Desarrollo de Condominio Residencial', '2024-05-01', '2024-11-01');

INSERT INTO Proyectos (CodigoProyecto, Nombre, FechaInicio, FechaFinalizacion)
VALUES ('PROY-003', 'Ampliación de Infraestructura Vial', '2024-06-15', NULL);

INSERT INTO Proyectos (CodigoProyecto, Nombre, FechaInicio, FechaFinalizacion)
VALUES ('PROY-004', 'Renovación de Oficinas Corporativas', '2024-07-01', '2024-12-31');

INSERT INTO Proyectos (CodigoProyecto, Nombre, FechaInicio, FechaFinalizacion)
VALUES ('PROY-005', 'Construcción de Planta Industrial', '2024-03-20', NULL);

INSERT INTO Empleados (Carnet, Nombre, Apellido1, Apellido2, FechaNacimiento, DireccionID, Telefono, Correo, Salario, CategoriaID)
VALUES ('C001', 'Juan', 'Perez', 'Lopez', '1990-05-15', 1, '2222-1111', 'juan.perez@empresa.com', 300000, 1);

INSERT INTO Empleados (Carnet, Nombre, Apellido1, Apellido2, FechaNacimiento, DireccionID, Telefono, Correo, Salario, CategoriaID)
VALUES ('C002', 'Maria', 'Gomez', 'Martinez', '1985-08-21', 2, '2222-2222', 'maria.gomez@empresa.com', 350000, 2);

INSERT INTO Empleados (Carnet, Nombre, Apellido1, Apellido2, FechaNacimiento, DireccionID, Telefono, Correo, Salario, CategoriaID)
VALUES ('C003', 'Carlos', 'Rodriguez', 'Fernandez', '1992-01-10', 3, '2222-3333', 'carlos.rodriguez@empresa.com', 400000, 3);

INSERT INTO Empleados (Carnet, Nombre, Apellido1, Apellido2, FechaNacimiento, DireccionID, Telefono, Correo, Salario, CategoriaID)
VALUES ('C004', 'Ana', 'Sanchez', 'Gutierrez', '1995-11-30', 4, '2222-4444', 'ana.sanchez@empresa.com', 450000, 1);

INSERT INTO Empleados (Carnet, Nombre, Apellido1, Apellido2, FechaNacimiento, DireccionID, Telefono, Correo, Salario, CategoriaID)
VALUES ('C005', 'Luis', 'Ramirez', 'Hernandez', '1988-06-25', 5, '2222-5555', 'luis.ramirez@empresa.com', 500000, 2);

INSERT INTO Contactos (Nombre, Correo, Mensaje, Fecha)
VALUES ('Pedro Alvarado', 'pedro.alvarado@cliente.com', 'Consulta sobre el proyecto de infraestructura.', GETDATE());

INSERT INTO Contactos (Nombre, Correo, Mensaje, Fecha)
VALUES ('Laura Hernandez', 'laura.hernandez@cliente.com', 'Requerimiento de información sobre edificios comerciales.', GETDATE());

INSERT INTO Asignaciones (EmpleadoID, ProyectoID, FechaAsignacion)
VALUES (10, 1, '2024-04-01'); -- Juan asignado al Proyecto 1

INSERT INTO Asignaciones (EmpleadoID, ProyectoID, FechaAsignacion)
VALUES (11, 2, '2024-05-01'); -- Maria asignada al Proyecto 2

INSERT INTO Asignaciones (EmpleadoID, ProyectoID, FechaAsignacion)
VALUES (12, 3, '2024-06-15'); -- Carlos asignado al Proyecto 3

INSERT INTO Asignaciones (EmpleadoID, ProyectoID, FechaAsignacion)
VALUES (13, 4, '2024-07-01'); -- Ana asignada al Proyecto 4

INSERT INTO Asignaciones (EmpleadoID, ProyectoID, FechaAsignacion)
VALUES (14, 5, '2024-03-20'); -- Luis asignado al Proyecto 5




