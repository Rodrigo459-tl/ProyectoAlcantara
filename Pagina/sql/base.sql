CREATE DATABASE ExpedienteMedico;
USE ExpedienteMedico;

-- Tabla Paciente
CREATE TABLE Paciente (
    idPaciente INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    AP VARCHAR(50),
    AM VARCHAR(50),
    FechaN DATE,
    Edad INT GENERATED ALWAYS AS (YEAR(CURDATE()) - YEAR(FechaN)),
    Correo_Electronico VARCHAR(100),
    Direccion VARCHAR(200),
    Municipio VARCHAR(100),
    Colonia VARCHAR(100),
    Calle VARCHAR(100),
    Estado VARCHAR(50)
);

-- Tabla Historial
CREATE TABLE Historial (
    idHistorial INT PRIMARY KEY AUTO_INCREMENT,
    idPaciente INT NOT NULL,
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- Tabla Antecedentes_Patologicos
CREATE TABLE Antecedentes_Patologicos (
    idAntecedenteP INT PRIMARY KEY AUTO_INCREMENT,
    idHistorial INT NOT NULL,
    Descripcion VARCHAR(255),
    Estado BOOLEAN NOT NULL,
    FOREIGN KEY (idHistorial) REFERENCES Historial(idHistorial)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- Tabla Antecedentes_NO_Patologicos
CREATE TABLE Antecedentes_NO_Patologicos (
    idAntecedenteNP INT PRIMARY KEY AUTO_INCREMENT,
    idHistorial INT NOT NULL,
    Descripcion VARCHAR(255),
    Estado BOOLEAN NOT NULL,
    FOREIGN KEY (idHistorial) REFERENCES Historial(idHistorial)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- Tabla Tratamiento
CREATE TABLE Tratamiento (
    idTratamiento INT PRIMARY KEY AUTO_INCREMENT,
    idPaciente INT NOT NULL,
    Tipo VARCHAR(100),
    Descripcion TEXT,
    Fecha_Inicio DATE,
    Fecha_Finalizacion DATE,
    Estado BOOLEAN NOT NULL,
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- Tabla Cita
CREATE TABLE Cita (
    idCita INT PRIMARY KEY AUTO_INCREMENT,
    idPaciente INT NOT NULL,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    Metodo_Agenda VARCHAR(100),
    Estado VARCHAR(50),
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- Tabla Citas_Previas
CREATE TABLE Citas_Previas (
    idCitaPrevia INT PRIMARY KEY AUTO_INCREMENT,
    idCita INT NOT NULL,
    Fecha DATE,
    Hora TIME,
    Metodo_Agenda VARCHAR(100),
    FOREIGN KEY (idCita) REFERENCES Cita(idCita)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- Tabla Recordatorio
CREATE TABLE Recordatorio (
    idRecordatorio INT PRIMARY KEY AUTO_INCREMENT,
    idCita INT NOT NULL,
    Medio_Envio VARCHAR(100),
    Estado_Envio VARCHAR(50),
    FOREIGN KEY (idCita) REFERENCES Cita(idCita)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- Tabla Factura
CREATE TABLE Factura (
    idFactura INT PRIMARY KEY AUTO_INCREMENT,
    idPaciente INT NOT NULL,
    Fecha_Emision DATE NOT NULL,
    Monto_Total DECIMAL(10, 2) NOT NULL,
    Estado_Pago VARCHAR(50),
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- Tabla Inventario
CREATE TABLE Inventario (
    idInventario INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Cantidad INT NOT NULL,
    Nivel_Minimo INT,
    Fecha_Reposicion DATE
);

DROP  DATABASE IF EXISTS ExpedienteMedico;
CREATE DATABASE IF NOT EXISTS ExpedienteMedico DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE ExpedienteMedico;

CREATE TABLE Paciente (
    idPaciente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    AP VARCHAR(50),
    AM VARCHAR(50),
    Nombre_Completo VARCHAR(150),
    Correo_Electronico VARCHAR(100),
    FechaN DATE,
    Edad INT,
    Direccion VARCHAR(100),
    Municipio VARCHAR(50),
    Colonia VARCHAR(50),
    Calle VARCHAR(50),
    Estado VARCHAR(50)
);

CREATE TABLE Historial (
    idHistorial INT AUTO_INCREMENT PRIMARY KEY,
    idPaciente INT,
    Estado VARCHAR(50),
    Descripcion TEXT,
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Antecedentes_Patologicos (
    idAntecedenteP INT AUTO_INCREMENT PRIMARY KEY,
    idHistorial INT,
    Estado VARCHAR(50),
    Descripcion TEXT,
    FOREIGN KEY (idHistorial) REFERENCES Historial(idHistorial)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Antecedentes_NO_Patologicos (
    idAntecedenteNP INT AUTO_INCREMENT PRIMARY KEY,
    idHistorial INT,
    Estado VARCHAR(50),
    Descripcion TEXT,
    FOREIGN KEY (idHistorial) REFERENCES Historial(idHistorial)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Factura (
    idFactura INT AUTO_INCREMENT PRIMARY KEY,
    idPaciente INT,
    Fecha_Emision DATE,
    Monto_Total DECIMAL(10, 2),
    Estado_Pago VARCHAR(50),
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Recordatorio (
    idRecordatorio INT AUTO_INCREMENT PRIMARY KEY,
    idPaciente INT,
    Medio_Envio VARCHAR(50),
    Estado_Envio VARCHAR(50),
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Cita (
    idCita INT AUTO_INCREMENT PRIMARY KEY,
    idPaciente INT,
    Fecha DATE,
    Hora TIME,
    Metodo_Agenda VARCHAR(50),
    Estado VARCHAR(50),
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Tratamiento (
    idTratamiento INT AUTO_INCREMENT PRIMARY KEY,
    idPaciente INT,
    Tipo VARCHAR(50),
    Descripcion TEXT,
    Estado VARCHAR(50),
    Fecha_Inicio DATE,
    Fecha_Finalizacion DATE,
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)
    ON DELETE CASCADE ON UPDATE CASCADE
);
