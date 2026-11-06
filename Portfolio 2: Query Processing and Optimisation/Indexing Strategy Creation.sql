SQL
-- Composite index for course offering filtering
CREATE INDEX idx_offerings_term ON course_offerings (academic_year, semester);

-- Index for registration foreign key lookups
CREATE INDEX idx_registrations_offering ON registrations (offering_id, student_id);

-- Index for fast matriculation number queries
CREATE INDEX idx_students_matric ON students (matric_no);