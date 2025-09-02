CREATE TABLE instructors (
    instructor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    certification VARCHAR(15) NOT NULL,
    specialization VARCHAR(10) NOT NULL,
    schedule TEXT
);

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    level VARCHAR(20) NOT NULL,
    preferences VARCHAR(30) NOT NULL,
    medical_info TEXT
);

CREATE TABLE slopes (
    slope_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    difficult VARCHAR(30) NOT NULL
);

CREATE TABLE lessons (
    lesson_id SERIAL PRIMARY KEY,
    instructor_id INT REFERENCES instructors(instructor_id),
    student_id INT REFERENCES students(student_id),
    slope_id INT REFERENCES slopes(slope_id),
    datetime DATE DEFAULT NOW(),
    lesson_type VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) CHECK ( price > 0 )
);

CREATE TABLE progress (
    progress_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    lesson_id INT REFERENCES lessons(lesson_id),
    skills_learned TEXT NOT NULL,
    instructor_notes TEXT NOT NULL,
    next_goal TEXT NOT NULL DEFAULT '-'
);

CREATE TABLE lesson_slopes (
    lesson_id INT REFERENCES lessons(lesson_id),
    slope_id INT REFERENCES slopes(slope_id)
);