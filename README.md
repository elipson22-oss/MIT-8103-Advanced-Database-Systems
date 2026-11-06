# MIT-8103-Advanced-Database-Systems
 Advanced Database Systems
Eli College (EC) - Student Result Portal
A database design and implementation project built for Eli College (EC) to manage student academic records, course enrollments, grade entries, and transcript generations.

What It Does
Course Registration: Allows students to register for course offerings each semester.

Grade Entry: Enables lecturers to enter numerical scores for enrolled students.

GPA Computation: Automatically computes Semester GPA (SGPA) and Cumulative GPA (CGPA).

Transcript Generation: Generates full academic transcripts showing course history and grades.

Main Entities
Departments: Academic units offering programs (e.g., Computer Science).

Students: Enrolled students linked to their primary department.

Lecturers: Academic staff teaching course offerings.

Courses: Subject modules with assigned credit units.

Registration Records: Connects students to specific course offerings.

Grades: Scores, letter grades (A–F), and grade points (0.00–4.00) assigned to registrations.

Project Structure
This repository includes the core portfolio work:

01_design_and_modelling/: Case study overview, ER diagram, DDL schema, and 3NF normalization breakdown.

02_queries_and_optimization/: Core SQL queries (GPA calculation, transcript lookup) and PostgreSQL execution plans with indexing evidence.

03_transactions/: SQL transaction scripts demonstrating COMMIT, ROLLBACK, and row-level pessimistic locking (FOR UPDATE) to handle concurrency.

04_nosql/: MongoDB document model, shell queries, and aggregation pipeline for low-latency student dashboard feeds.

05_cloud_and_distributed/: AWS RDS Multi-AZ replication setup, range partitioning strategy, and CAP theorem trade-offs.

Tech Stack
Primary RDBMS: PostgreSQL

NoSQL / Document Store: MongoDB

Cloud Architecture: AWS RDS PostgreSQL (Multi-AZ)

How to Set Up & Run
Run DDL Schema: Execute the SQL creation script in PostgreSQL to create tables, keys, and check constraints.

Load Sample Data: Populate the departments, courses, lecturers, and students tables.

Run Queries: Use the transcript and dynamic GPA queries to test score aggregation and performance.