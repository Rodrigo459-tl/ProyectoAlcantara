DROP  DATABASE IF EXISTS ExpedienteMedico;
CREATE DATABASE IF NOT EXISTS ExpedienteMedico DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE ExpedienteMedico;
--Paciente
CREATE TABLE Paciente (
    idPaciente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    AP VARCHAR(50),
    AM VARCHAR(50),
    Correo_Electronico VARCHAR(100),
    FechaN DATE,
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
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente) ON DELETE CASCADE ON UPDATE CASCADE
);

--Cita
CREATE TABLE Cita (
    idCita INT AUTO_INCREMENT PRIMARY KEY,
    idHistorial INT,
    idPaciente INT,
    Fecha DATE,
    Hora TIME,
    Metodo_Agenda VARCHAR(50),
    Estado VARCHAR(50),
    FOREIGN KEY (idHistorial) REFERENCES Historial(idHistorial) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Tratamiento (
    idTratamiento INT AUTO_INCREMENT PRIMARY KEY,
    idPaciente INT,
    Tipo VARCHAR(50),
    Descripcion TEXT,
    Estado VARCHAR(50),
    Fecha_Inicio DATE,
    Fecha_Finalizacion DATE,
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Antecedentes_Patologicos (
    idAntecedenteP INT AUTO_INCREMENT PRIMARY KEY,
    idHistorial INT,
    Estado VARCHAR(50),
    Descripcion TEXT,
    FOREIGN KEY (idHistorial) REFERENCES Historial(idHistorial) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Antecedentes_NO_Patologicos (
    idAntecedenteNP INT AUTO_INCREMENT PRIMARY KEY,
    idHistorial INT,
    Estado VARCHAR(50),
    Descripcion TEXT,
    FOREIGN KEY (idHistorial) REFERENCES Historial(idHistorial) ON DELETE CASCADE ON UPDATE CASCADE
);

--Factura
CREATE TABLE Factura (
    idFactura INT AUTO_INCREMENT PRIMARY KEY,
    idPaciente INT,
    Fecha_Emision DATE,
    Monto_Total DECIMAL(10, 2),
    Estado_Pago VARCHAR(50),
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Recordatorio (
    idRecordatorio INT AUTO_INCREMENT PRIMARY KEY,
    idPaciente INT,
    Medio_Envio VARCHAR(50),
    Estado_Envio VARCHAR(50),
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)
    ON DELETE CASCADE ON UPDATE CASCADE
);
