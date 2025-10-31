using System;
using System.Collections.Generic;

namespace ExpenseTrackerMiniProject.Database.AppDbContextModels;

public partial class TblCategory
{
    public int CategoryId { get; set; }

    public string? Type { get; set; }

    public string? CategoryName { get; set; }

    public DateTime? CreatedDateTime { get; set; }

    public DateTime? ModifiedDateTime { get; set; }

    public bool? DeleteFlag { get; set; }
}
