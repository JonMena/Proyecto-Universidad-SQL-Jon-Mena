SELECT p.id_profesor,
       p.nombre_profesor,
       p.apellido_profesor,
       ROUND(AVG(c.calificacion), 2) AS nota_media_dada
FROM profesores p
JOIN cursos cu        ON cu.id_profesor_curso = p.id_profesor
JOIN calificaciones c ON c.id_curso_calificacion = cu.id_curso
GROUP BY p.id_profesor, p.nombre_profesor, p.apellido_profesor
ORDER BY nota_media_dada DESC;

-- Consulta 2: la mejor calificación de cada estudiante
SELECT id_estudiante, nombre_estudiante, apellido_estudiante,
       nombre_curso, mejor_calificacion
FROM (
    SELECT e.id_estudiante, e.nombre_estudiante, e.apellido_estudiante,
           cu.nombre_curso,
           c.calificacion AS mejor_calificacion,
           RANK() OVER (PARTITION BY e.id_estudiante
                        ORDER BY c.calificacion DESC) AS puesto
    FROM estudiantes e
    JOIN calificaciones c ON c.id_estudiante_calificacion = e.id_estudiante
    JOIN cursos cu        ON cu.id_curso = c.id_curso_calificacion
) t
WHERE puesto = 1
ORDER BY id_estudiante;

-- Consulta 3: estudiantes ordenados por los cursos en los que están matriculados
SELECT cu.nombre_curso AS curso,
       e.apellido_estudiante,
       e.nombre_estudiante,
       c.calificacion
FROM estudiantes e
JOIN calificaciones c ON c.id_estudiante_calificacion = e.id_estudiante
JOIN cursos cu        ON cu.id_curso = c.id_curso_calificacion
ORDER BY cu.nombre_curso, e.apellido_estudiante, e.nombre_estudiante;

-- Variante de la consulta 3: estudiantes ordenados por número de cursos matriculados
SELECT e.id_estudiante,
       e.nombre_estudiante,
       e.apellido_estudiante,
       COUNT(DISTINCT c.id_curso_calificacion) AS cursos_matriculados
FROM estudiantes e
JOIN calificaciones c ON c.id_estudiante_calificacion = e.id_estudiante
GROUP BY e.id_estudiante, e.nombre_estudiante, e.apellido_estudiante
ORDER BY cursos_matriculados DESC, e.apellido_estudiante;

-- Consulta 4: informe de cursos y nota media, del más difícil al más fácil
SELECT cu.id_curso,
       cu.nombre_curso,
       ROUND(AVG(c.calificacion), 2) AS nota_media
FROM cursos cu
JOIN calificaciones c ON c.id_curso_calificacion = cu.id_curso
GROUP BY cu.id_curso, cu.nombre_curso
ORDER BY nota_media ASC;   -- ASC = la media más baja (curso más difícil) primero

-- Consulta 5: estudiante y profesor con más cursos en común
SELECT e.id_estudiante,
       e.nombre_estudiante,
       e.apellido_estudiante,
       p.id_profesor,
       p.nombre_profesor,
       p.apellido_profesor,
       COUNT(DISTINCT c.id_curso_calificacion) AS cursos_en_comun
FROM calificaciones c
JOIN estudiantes e ON e.id_estudiante = c.id_estudiante_calificacion
JOIN cursos cu     ON cu.id_curso = c.id_curso_calificacion
JOIN profesores p  ON p.id_profesor = cu.id_profesor_curso
GROUP BY e.id_estudiante, e.nombre_estudiante, e.apellido_estudiante,
         p.id_profesor, p.nombre_profesor, p.apellido_profesor
ORDER BY cursos_en_comun DESC
LIMIT 1;