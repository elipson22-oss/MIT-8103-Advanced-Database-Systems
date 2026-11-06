SQL
EXPLAIN ANALYZE
SELECT s.matric_no, c.course_code, g.score, g.letter_grade
FROM registrations r
JOIN students s ON r.student_id = s.student_id
JOIN course_offerings co ON r.offering_id = co.offering_id
JOIN courses c ON co.course_id = c.course_id
JOIN grades g ON r.registration_id = g.registration_id
WHERE co.semester = 'Fall' AND co.academic_year = 2026;