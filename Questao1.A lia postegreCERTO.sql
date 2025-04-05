CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT,
    enrolled_at DATE,
    course_id INTEGER
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    name TEXT,
    price NUMERIC,
    school_id INTEGER
);

CREATE TABLE schools (
    id SERIAL PRIMARY KEY,
    name TEXT
);

INSERT INTO schools (name) VALUES
('School A'),
('School B');

INSERT INTO courses (name, price, school_id) VALUES
('Data Science', 1500, 1),
('Data Analysis', 1000, 2),
('Software Engineering', 1200, 1);

INSERT INTO students (name, enrolled_at, course_id) VALUES
('Alice', '2024-01-10', 1),
('Bob', '2024-01-15', 2),
('Charlie', '2024-01-18', 1),
('David', '2024-02-01', 3);

SELECT
    sc.name AS school_name,  -- Nome da escola
    st.enrolled_at AS enrollment_date,  -- Data da matrícula
    COUNT(st.id) AS num_students,  -- Número de alunos matriculados
    SUM(c.price) AS total_registration_value  -- Valor total das matrículas
FROM
    students st  -- A tabela que contém os dados dos alunos
JOIN
    courses c ON st.course_id = c.id  -- Junta com a tabela de cursos, através do campo 'course_id'
JOIN
    schools sc ON c.school_id = sc.id  -- Junta com a tabela de escolas, através do campo 'school_id'
WHERE
    c.name ILIKE 'data%'  -- Filtra cursos cujo nome começa com "data" (case-insensitive)
GROUP BY
    sc.name, st.enrolled_at  -- Agrupa por escola e por data de matrícula
ORDER BY
    st.enrolled_at DESC;  -- Ordena pela data de matrícula do mais recente para o mais antigo

