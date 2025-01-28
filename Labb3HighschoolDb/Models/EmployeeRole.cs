using System;
using System.Collections.Generic;

namespace Labb3HighschoolDb.Models;

public partial class EmployeeRole
{
    public int RoleId { get; set; }

    public string RoleName { get; set; } = null!;

    public virtual ICollection<Employee> Employees { get; set; } = new List<Employee>();
}
