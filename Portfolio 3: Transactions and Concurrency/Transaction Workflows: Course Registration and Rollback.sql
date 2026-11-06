BEGIN TRANSACTION;

-- 1. Lock the course offering record to prevent race conditions on capacity
SELECT max_capacity 
FROM course_offerings 
WHERE offering_id = 12 
FOR UPDATE;

-- 2. Count current active registrations
SELECT COUNT(*) FROM registrations WHERE offering_id = 12 AND status = 'Enrolled';

-- 3. Insert new registration record
INSERT INTO registrations (student_id, offering_id, registration_date, status)
VALUES (105, 12, CURRENT_DATE, 'Enrolled');

COMMIT;