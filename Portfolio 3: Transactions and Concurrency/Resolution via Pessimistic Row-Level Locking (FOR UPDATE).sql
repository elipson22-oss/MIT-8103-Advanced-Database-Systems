-- Transaction 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT grade_id, score 
FROM grades 
WHERE grade_id = 50 
FOR UPDATE; -- Acquires Exclusive Row Lock

UPDATE grades 
SET score = 75, letter_grade = 'B', grade_point = 3.00 
WHERE grade_id = 50;

COMMIT; -- Releases Lock