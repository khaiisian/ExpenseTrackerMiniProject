using ExpenseTrackerMiniProject.Database.AppDbContextModels;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExpenseTrackerMiniProject.ConsoleApp;

public class TransactionEFCoreService
{
    #region Add Transaction
    public void Create(string type)
    {
        AppDbContext appDbContext = new AppDbContext();
        while (true)
        {
            Console.WriteLine();
            Console.WriteLine($"Add {type} ---------");
            var categories = appDbContext.TblCategories
                        .Where(x => x.DeleteFlag == false && x.Type == type)
                        .ToList();

            Console.WriteLine("Select Category:");
            foreach (var cat in categories)
            {
                Console.WriteLine($"{cat.CategoryId, 4}. {cat.CategoryName}");
            }

            Console.WriteLine();
            Console.Write("Enter Category ID: ");

            if (!int.TryParse(Console.ReadLine(), out int id))
            {
                Console.WriteLine("Invalid Id!");
                continue;
            }

            var category = appDbContext.TblCategories
                    .Where(x => x.DeleteFlag == false && x.Type == type)
                    .FirstOrDefault(x => x.CategoryId == id);

            if (category == null)
            {
                Console.WriteLine("No category found.");
                continue;
            }

            Console.WriteLine();
            Console.Write("Enter Amount: ");
            if (!decimal.TryParse(Console.ReadLine(), out decimal amount) || amount <= 0)
            {
                Console.WriteLine("Invalid amount!");
                continue;
            }

            Console.WriteLine();
            Console.Write("Enter Remark (optional): ");
            string? remark = Console.ReadLine();

            var transaction = new TblTransaction
            {
                CategoryId = category.CategoryId,
                Type = type,
                Amount = amount,
                Remark = remark,
                TransactionDate = DateTime.Now
            };

            appDbContext.TblTransactions.Add(transaction);
            int result = appDbContext.SaveChanges();

            Console.WriteLine(result > 0 ? $"{type} added successfully!" : "Failed to add transaction.");
            break;
        }

    }
    #endregion

    #region ViewAllTransactions
    public void ViewAllTransactions()
    {
        AppDbContext appDbContext = new AppDbContext();
        Console.WriteLine();
        Console.WriteLine("==== All Transactions ====");
        var transactions = appDbContext.TblTransactions
            .Join(appDbContext.TblCategories,
            t => t.CategoryId,
            cat => cat.CategoryId,
            (t, cat) => new {t, cat}            )
            .OrderByDescending(x => x.t.TransactionDate)
            .Select(x => new
            {
                x.t.TransactionDate,
                x.t.Type,
                x.cat.CategoryName,
                x.t.Amount,
                x.t.Remark,
            })
            .ToList();

        if (transactions.Count == 0)
        {
            Console.WriteLine("No transactions found.");
            return;
        }

        Console.WriteLine("{0,-12} {1,-10} {2,-25} {3,20} {4,-30}",
            "Date", "Type", "Category", "Amount", "Remark");
        Console.WriteLine(new string('-', 100));

        foreach (var t in transactions)
        {
            string amountFormatted = Convert.ToDecimal(t.Amount).ToString("N2") + " Ks";

            Console.WriteLine("{0,-12} {1,-10} {2,-25} {3,20} {4,-30}",
                Convert.ToDateTime(t.TransactionDate).ToString("yyyy-MM-dd"),
                t.Type,
                t.CategoryName,
                amountFormatted,
                t.Remark ?? ""
            );
        }

    }
    #endregion

    #region ViewMonthlySummary
    public void ViewMonthlySummary()
    {
        AppDbContext appDbContext = new AppDbContext();

        while (true)
        {
            Console.WriteLine();
            Console.Write("Enter month (1-12): ");
            if (!int.TryParse(Console.ReadLine(), out int month))
            {
                Console.WriteLine("Invalid Id!");
                continue;
            }

            Console.WriteLine();
            Console.Write("Enter year (e.g. 2025): ");
            if (!int.TryParse(Console.ReadLine(), out int year))
            {
                Console.WriteLine("Invalid Id!");
                continue;
            }
            var transactions = appDbContext.TblTransactions
                .Where(t => t.TransactionDate!.Value.Month == month && t.TransactionDate.Value.Year == year)
                .ToList();

            if (transactions.Count == 0)
            {
                Console.WriteLine("No transactions for selected month.");
                continue;
            }

            var totalIncome = transactions
                .Where(t => t.Type == "Income")
                .Sum(t => t.Amount) ?? 0;

            var totalExpense = transactions
                .Where(t => t.Type == "Expense")
                .Sum(t => t.Amount) ?? 0;

            var balance = totalIncome - totalExpense;

            Console.WriteLine($"\n==== Monthly Summary ({CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(month)} {year}) ====");
            Console.WriteLine("{0,-20} {1,20}", "Total Income:", totalIncome.ToString("N2") + " Ks");
            Console.WriteLine("{0,-20} {1,20}", "Total Expense:", totalExpense.ToString("N2") + " Ks");
            Console.WriteLine("{0,-20} {1,20}", "Net Balance:", balance.ToString("N2") + " Ks");
            Console.WriteLine(new string('-', 50));

            Console.ReadKey();
            break;
        }
    }
    #endregion
}
