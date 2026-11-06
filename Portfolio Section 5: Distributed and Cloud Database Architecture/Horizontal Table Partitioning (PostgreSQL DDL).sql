-- Partition Master Table Creation
CREATE TABLE registrations_partitioned (
    registration_id SERIAL,
    student_id INT NOT NULL,
    offering_id INT NOT NULL,
    academic_year INT NOT NULL,
    registration_date DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (registration_id, academic_year)
) PARTITION BY RANGE (academic_year);

-- Year-Specific Partition Creation
CREATE TABLE registrations_2025 PARTITION OF registrations_partitioned
    FOR VALUES FROM (2025) TO (2026);

CREATE TABLE registrations_2026 PARTITION OF registrations_partitioned
    FOR VALUES FROM (2026) TO (2027);