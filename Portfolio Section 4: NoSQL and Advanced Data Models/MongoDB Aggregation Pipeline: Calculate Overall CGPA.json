db.students.aggregate([
  { $match: { "matric_no": "EC/2023/CS/042" } },
  { $unwind: "$academic_records" },
  { $unwind: "$academic_records.courses" },
  {
    $group: {
      _id: "$_id",
      total_quality_points: {
        $sum: {
          $multiply: [
            "$academic_records.courses.credit_units",
            "$academic_records.courses.grade_point"
          ]
        }
      },
      total_credits: { $sum: "$academic_records.courses.credit_units" }
    }
  },
  {
    $project: {
      cgpa: { $divide: ["$total_quality_points", "$total_credits"] }
    }
  }
]);