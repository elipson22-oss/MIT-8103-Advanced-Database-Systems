-- 1. Departments Table
CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_code VARCHAR(10) NOT NULL UNIQUE,
    dept_name VARCHAR(100) NOT NULL
);

-- 2. Lecturers Table
CREATE TABLE lecturers (
    lecturer_id SERIAL PRIMARY KEY,
    staff_no VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    dept_id INT NOT NULL REFERENCES departments(dept_id) ON DELETE RESTRICT
);

-- 3. Students Table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    matric_no VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    dept_id INT NOT NULL REFERENCES departments(dept_id) ON DELETE RESTRICT,
    enrollment_year INT NOT NULL CHECK (enrollment_year >= 2000)
);

-- 4. Courses Table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_code VARCHAR(15) NOT NULL UNIQUE,
    course_title VARCHAR(150) NOT NULL,
    credit_units INT NOT NULL CHECK (credit_units BETWEEN 1 AND 6),
    dept_id INT NOT NULL REFERENCES departments(dept_id) ON DELETE RESTRICT
);

-- 5. Course Offerings Table
CREATE TABLE course_offerings (
    offering_id SERIAL PRIMARY KEY,
    course_id INT NOT NULL REFERENCES courses(course_id) ON DELETE CASCADE,
    lecturer_id INT NOT NULL REFERENCES lecturers(lecturer_id) ON DELETE RESTRICT,
    semester VARCHAR(10) NOT NULL CHECK (semester IN ('Fall', 'Spring', 'Summer')),
    academic_year INT NOT NULL CHECK (academic_year >= 2000),
    max_capacity INT NOT NULL CHECK (max_capacity > 0),
    CONSTRAINT uk_course_offering UNIQUE (course_id, semester, academic_year)
);

-- 6. Registrations Table
CREATE TABLE registrations (
    registration_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL REFERENCES students(student_id) ON DELETE CASCADE,
    offering_id INT NOT NULL REFERENCES course_offerings(offering_id) ON DELETE CASCADE,
    registration_date DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(15) NOT NULL DEFAULT 'Enrolled' CHECK (status IN ('Enrolled', 'Dropped', 'Completed')),
    CONSTRAINT uk_student_offering UNIQUE (student_id, offering_id)
);

-- 7. Grades Table
CREATE TABLE grades (
    grade_id SERIAL PRIMARY KEY,
    registration_id INT NOT NULL UNIQUE REFERENCES registrations(registration_id) ON DELETE CASCADE,
    score NUMERIC(5,2) NOT NULL CHECK (score BETWEEN 0.00 AND 100.00),
    letter_grade VARCHAR(2) NOT NULL CHECK (letter_grade IN ('A', 'B', 'C', 'D', 'F')),
    grade_point NUMERIC(3,2) NOT NULL CHECK (grade_point BETWEEN 0.00 AND 4.00)
);
