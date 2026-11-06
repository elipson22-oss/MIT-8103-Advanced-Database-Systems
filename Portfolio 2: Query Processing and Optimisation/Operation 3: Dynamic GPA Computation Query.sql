SQL
SELECT 
    s.matric_no,
    s.first_name || ' ' || s.last_name AS student_name,
    co.semester,
    co.academic_year,
    SUM(c.credit_units) AS total_credits_attempted,
    SUM(c.credit_units * g.grade_point) AS total_quality_points,
    ROUND(
        SUM(c.credit_units * g.grade_point)::numeric / SUM(c.credit_units), 2
    ) AS sgpa
FROM students s
JOIN registrations r ON s.student_id = r.student_id
JOIN course_offerings co ON r.offering_id = co.offering_id
JOIN courses c ON co.course_id = c.course_id
JOIN grades g ON r.registration_id = g.registration_id
WHERE s.student_id = 101 AND co.semester = 'Fall' AND co.academic_year = 2026
GROUP BY s.matric_no, s.first_name, s.last_name, co.semester, co.academic_year;