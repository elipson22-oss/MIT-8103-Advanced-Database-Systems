db.students.updateOne(
  { "matric_no": "EC/2023/CS/042" },
  {
    $push: {
      "academic_records": {
        "academic_year": 2026,
        "semester": "Spring",
        "courses": [
          {
            "course_code": "CS401",
            "course_title": "Distributed Systems",
            "credit_units": 4,
            "score": 92.0,
            "letter_grade": "A",
            "grade_point": 4.0
          }
        ],
        "sgpa": 4.00
      }
    }
  }
);