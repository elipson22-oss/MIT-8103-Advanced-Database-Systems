SQL
SELECT 
    s.matric_no,
    s.first_name || ' ' || s.last_name AS student_name,
    d.dept_name,
    co.academic_year,
    co.semester,
    c.course_code,
    c.course_title,
    c.credit_units,
    g.score,
    g.letter_grade,
    g.grade_point
FROM students s
JOIN departments d ON s.dept_id = d.dept_id
JOIN registrations r ON s.student_id = r.student_id
JOIN course_offerings co ON r.offering_id = co.offering_id
JOIN courses c ON co.course_id = c.course_id
LEFT JOIN grades g ON r.registration_id = g.registration_id
WHERE s.matric_no = 'EC/2023/CS/042'
ORDER BY co.academic_year ASC, co.semester ASC, c.course_code ASC;