// See https://aka.ms/new-console-template for more information
using ExpenseTrackerMiniProject.ConsoleApp;
using System.ComponentModel;

Console.WriteLine("Hello, World!");
CategoryEFCoreService categoryEFCoreService = new CategoryEFCoreService();
TransactionEFCoreService transactionEFCoreService = new TransactionEFCoreService();

while (true)
{
    Console.WriteLine();
    Console.WriteLine("1. Add Income.");
    Console.WriteLine("2. Add Expense.");
    Console.WriteLine("3. View All Transactions");
    Console.WriteLine("4. View Monthly Transaction Report");
    Console.WriteLine("5. Manage Category.");
    Console.WriteLine("6. Exit.");

    string? menuNo = Console.ReadLine();

    switch (menuNo)
    {
        case "1":
            transactionEFCoreService.Create("Income");
            break;
        case "2":
            transactionEFCoreService.Create("Expense");
            break;
        case "3":
            transactionEFCoreService.ViewAllTransactions();
            break;
        case "4":
            transactionEFCoreService.ViewMonthlySummary();
            break;
        case "5":
            categoryEFCoreService.Menu();
            break;
        case "6":
            Console.WriteLine("You have exited the program.");
            return;
        default:
            Console.WriteLine("Invalid Option.");
            break;
    }
}