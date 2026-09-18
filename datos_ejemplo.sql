INSERT INTO estudiantes (id_estudiante, nombre_estudiante, apellido_estudiante,email_estudiante, fecha_inscripcion_estudiante) VALUES
(1, 'Ana','García','ana.garcia@uni.es','2023-08-15'),
(2, 'Luis', 'Martínez',  'luis.martinez@uni.es', '2023-08-15'),
(3, 'Carmen', 'López', 'carmen.lopez@uni.es', '2022-08-10'),
(4, 'Diego', 'Rodríguez','diego.rodriguez@uni.es','2024-01-10'),
(5, 'María', 'Sánchez',  'maria.sanchez@uni.es', '2022-08-10'),
(6, 'Jorge', 'Pérez', 'jorge.perez@uni.es', '2023-08-15'),
(7, 'Lucía', 'Fernández', 'lucia.fernandez@uni.es', '2021-08-12'),
(8, 'Pablo', 'Gómez', 'pablo.gomez@uni.es', '2024-01-10');

INSERT INTO profesores (id_profesor, nombre_profesor, apellido_profesor,departamento_profesor) VALUES
(1, 'Elena', 'Ruiz', 'Matemáticas'),
(2, 'Miguel', 'Torres', 'Física'),
(3, 'Laura', 'Díaz', 'Ciencias de la Computación'),
(4, 'Carlos', 'Mora', 'Historia');

INSERT INTO cursos (id_curso, nombre_curso, creditos_curso, id_profesor_curso) VALUES
(1, 'Álgebra', 4, 1),
(2, 'Cálculo', 4, 1),
(3, 'Estadística', 3, 1),
(4, 'Física I', 4, 2),
(5, 'Bases de Datos', 3, 3),
(6, 'Programación', 3, 3),
(7, 'Historia Moderna', 3, 4);

INSERT INTO calificaciones (id_calificacion, id_estudiante_calificacion,id_curso_calificacion, calificacion, fecha_calificacion) VALUES
(1,  1, 1, 85, '2024-05-10'), (2,  1, 2, 90, '2024-05-11'),
(3,  1, 3, 78, '2024-05-12'), (4,  1, 5, 92, '2024-05-13'),
(5,  2, 1, 70, '2024-05-10'), (6,  2, 2, 65, '2024-05-11'),
(7,  2, 4, 80, '2024-05-14'), (8,  2, 5, 88, '2024-05-13'),
(9,  3, 4, 95, '2024-05-14'), (10, 3, 5, 89, '2024-05-13'),
(11, 3, 6, 91, '2024-05-15'), (12, 4, 1, 60, '2024-05-10'),
(13, 4, 3, 55, '2024-05-12'), (14, 4, 7, 75, '2024-05-16'),
(15, 5, 2, 88, '2024-05-11'), (16, 5, 5, 94, '2024-05-13'),
(17, 5, 6, 86, '2024-05-15'), (18, 6, 3, 72, '2024-05-12'),
(19, 6, 4, 68, '2024-05-14'), (20, 6, 7, 81, '2024-05-16'),
(21, 7, 1, 93, '2024-05-10'), (22, 7, 2, 87, '2024-05-11'),
(23, 7, 6, 95, '2024-05-15'), (24, 8, 5, 77, '2024-05-13'),
(25, 8, 6, 84, '2024-05-15'), (26, 8, 7, 69, '2024-05-16');