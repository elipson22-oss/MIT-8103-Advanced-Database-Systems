erDiagram
    DEPARTMENTS ||--o{ STUDENTS : "enrolls"
    DEPARTMENTS ||--o{ LECTURERS : "employs"
    DEPARTMENTS ||--o{ COURSES : "offers"
    LECTURERS ||--o{ COURSE_OFFERINGS : "teaches"
    COURSES ||--o{ COURSE_OFFERINGS : "instantiates"
    STUDENTS ||--o{ REGISTRATIONS : "places"
    COURSE_OFFERINGS ||--o{ REGISTRATIONS : "receives"
    REGISTRATIONS ||--one GRADES : "earns"

    DEPARTMENTS {
        int dept_id PK
        string dept_code UK
        string dept_name
    }
    STUDENTS {
        int student_id PK
        string matric_no UK
        string first_name
        string last_name
        string email UK
        int dept_id FK
        int enrollment_year
    }
    LECTURERS {
        int lecturer_id PK
        string staff_no UK
        string first_name
        string last_name
        string email UK
        int dept_id FK
    }
    COURSES {
        int course_id PK
        string course_code UK
        string course_title
        int credit_units
        int dept_id FK
    }
    COURSE_OFFERINGS {
        int offering_id PK
        int course_id FK
        int lecturer_id FK
        string semester
        int academic_year
        int max_capacity
    }
    REGISTRATIONS {
        int registration_id PK
        int student_id FK
        int offering_id FK
        date registration_date
        string status
    }
    GRADES {
        int grade_id PK
        int registration_id FK, UK
        decimal score
        string letter_grade
        decimal grade_point
    }
