CREATE TABLE estudiantes (
    id_estudiante INTEGER PRIMARY KEY,
    nombre_estudiante VARCHAR(50)  NOT NULL,
    apellido_estudiante VARCHAR(50)  NOT NULL,
    email_estudiante VARCHAR(100) UNIQUE,
    fecha_inscripcion_estudiante DATE
);

CREATE TABLE profesores (
    id_profesor INTEGER PRIMARY KEY,
    nombre_profesor VARCHAR(50) NOT NULL,
    apellido_profesor VARCHAR(50) NOT NULL,
    departamento_profesor VARCHAR(80)
);

CREATE TABLE cursos (
    id_curso INTEGER PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL,
    creditos_curso INTEGER DEFAULT 3,
    id_profesor_curso INTEGER NOT NULL,
    CONSTRAINT foreing_key_cursos_profesor
        FOREIGN KEY (id_profesor_curso) REFERENCES profesores(id_profesor)
);

CREATE TABLE calificaciones (
    id_calificacion INTEGER PRIMARY KEY,
    id_estudiante_calificacion INTEGER NOT NULL,
    id_curso_calificacion INTEGER NOT NULL,
    calificacion DECIMAL(4,2) CHECK (calificacion BETWEEN 0 AND 100),
    fecha_calificacion DATE,
    CONSTRAINT foreing_key_calificaciones_estudiantes
        FOREIGN KEY (id_estudiante_calificacion) REFERENCES estudiantes(id_estudiante),
    CONSTRAINT foreing_key_calificaciones_curso
        FOREIGN KEY (id_curso_calificacion)  REFERENCES cursos(id_curso)
);