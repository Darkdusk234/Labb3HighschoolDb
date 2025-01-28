using System;
using System.Collections.Generic;

namespace Labb3HighschoolDb.Models;

public partial class Grade
{
    public int GradeId { get; set; }

    public int? StudentId { get; set; }

    public int? TeacherId { get; set; }

    public string SubjectCode { get; set; } = null!;

    public string StudentGrade { get; set; } = null!;

    public DateOnly GradeSet { get; set; }

    public virtual Student? Student { get; set; }

    public virtual Employee? Teacher { get; set; }
}
