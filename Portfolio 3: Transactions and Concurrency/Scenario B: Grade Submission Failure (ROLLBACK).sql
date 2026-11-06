BEGIN TRANSACTION;

-- Step 1: Verify student registration exists
SELECT registration_id FROM registrations WHERE registration_id = 999;

-- Step 2: Attempt grade entry with invalid score (>100)
INSERT INTO grades (registration_id, score, letter_grade, grade_point)
VALUES (999, 105.00, 'A', 4.00); 
-- ERROR: check constraint "grades_score_check" violated!

-- Step 3: Transaction automatically enters aborted state; explicit ROLLBACK executes
ROLLBACK;