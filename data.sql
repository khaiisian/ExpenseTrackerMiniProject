-- Tbl_Category
CREATE TABLE [dbo].[Tbl_Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NULL,
	[CategoryName] [nvarchar](150) NULL,
	[CreatedDateTime] [datetime] NULL,
	[ModifiedDateTime] [datetime] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Tbl_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Tbl_Transaction
CREATE TABLE [dbo].[Tbl_Transaction](
	[ExpenseId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Type] [nvarchar](100) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Remark] [nvarchar](500) NULL,
	[TransactionDate] [datetime] NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Tbl_Transaction] PRIMARY KEY CLUSTERED 
(
	[ExpenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Insert Script for Tbl_Category
INSERT INTO Tbl_Category (CategoryId, Type, CategoryName, CreatedDateTime, ModifiedDateTime, DeleteFlag) VALUES
(1, 'Income', 'Salary', '2025-11-01 01:54:22.113', NULL, 0),
(2, 'Income', 'Freelance Work', '2025-11-01 01:54:22.113', NULL, 0),
(3, 'Income', 'Investment Returns', '2025-11-01 01:54:22.113', NULL, 0),
(4, 'Expense', 'Groceries', '2025-11-01 01:54:22.113', NULL, 0),
(5, 'Expense', 'Utilities', '2025-11-01 01:54:22.113', NULL, 0),
(6, 'Expense', 'Entertainment', '2025-11-01 01:54:22.113', NULL, 0),
(7, 'Expense', 'Transportation', '2025-11-01 01:54:22.113', NULL, 0),
(8, 'Expense', 'Healthcare', '2025-11-01 01:54:22.113', NULL, 0),
(9, 'Expense', 'Education', '2025-11-01 01:54:22.113', NULL, 0),
(10, 'Expense', 'Savings', '2025-11-01 01:54:22.113', NULL, 0);

-- Insert Script for Tbl_Transaction
INSERT INTO [dbo].[Tbl_Transaction] ([CategoryId], [Type], [Amount], [Remark], [TransactionDate], [DeleteFlag])
VALUES
-- 2024 Records (50 records)
-- January 2024 (5 records)
(1, 'Income', 3500.00, 'Monthly Salary', '2024-01-15', 0),
(4, 'Expense', 245.75, 'Weekly Groceries', '2024-01-05', 0),
(5, 'Expense', 120.50, 'Electricity Bill', '2024-01-10', 0),
(6, 'Expense', 75.00, 'Movie Night', '2024-01-12', 0),
(7, 'Expense', 60.25, 'Gas Refill', '2024-01-18', 0),

-- February 2024 (5 records)
(1, 'Income', 3500.00, 'Monthly Salary', '2024-02-15', 0),
(4, 'Expense', 280.30, 'Supermarket Shopping', '2024-02-07', 0),
(5, 'Expense', 135.75, 'Water Bill', '2024-02-12', 0),
(8, 'Expense', 150.00, 'Doctor Visit', '2024-02-20', 0),
(9, 'Expense', 200.00, 'Online Course', '2024-02-25', 0),

-- March 2024 (5 records)
(1, 'Income', 3500.00, 'Monthly Salary', '2024-03-15', 0),
(4, 'Expense', 195.50, 'Grocery Run', '2024-03-06', 0),
(5, 'Expense', 110.25, 'Internet Bill', '2024-03-10', 0),
(6, 'Expense', 120.00, 'Concert Tickets', '2024-03-22', 0),
(10, 'Expense', 500.00, 'Monthly Savings', '2024-03-28', 0),

-- April 2024 (5 records)
(1, 'Income', 3500.00, 'Monthly Salary', '2024-04-15', 0),
(4, 'Expense', 265.80, 'Easter Groceries', '2024-04-08', 0),
(5, 'Expense', 125.40, 'Gas Bill', '2024-04-11', 0),
(7, 'Expense', 85.00, 'Public Transport', '2024-04-19', 0),
(8, 'Expense', 75.50, 'Pharmacy', '2024-04-26', 0),

-- May 2024 (5 records)
(1, 'Income', 3500.00, 'Monthly Salary', '2024-05-15', 0),
(4, 'Expense', 220.65, 'Weekly Shopping', '2024-05-03', 0),
(5, 'Expense', 140.80, 'Electricity Bill', '2024-05-09', 0),
(6, 'Expense', 90.00, 'Dinner Out', '2024-05-17', 0),
(9, 'Expense', 180.00, 'Books', '2024-05-24', 0),

-- June 2024 (5 records)
(1, 'Income', 3500.00, 'Monthly Salary', '2024-06-15', 0),
(4, 'Expense', 275.90, 'Grocery Stockup', '2024-06-07', 0),
(5, 'Expense', 115.30, 'Water Bill', '2024-06-12', 0),
(7, 'Expense', 95.75, 'Car Maintenance', '2024-06-20', 0),
(10, 'Expense', 500.00, 'Monthly Savings', '2024-06-27', 0),

-- July 2024 (5 records)
(1, 'Income', 3500.00, 'Monthly Salary', '2024-07-15', 0),
(4, 'Expense', 240.25, 'Summer Groceries', '2024-07-05', 0),
(5, 'Expense', 130.45, 'Internet Bill', '2024-07-11', 0),
(6, 'Expense', 150.00, 'Beach Trip', '2024-07-19', 0),
(8, 'Expense', 120.00, 'Dental Checkup', '2024-07-25', 0),

-- August 2024 (5 records)
(1, 'Income', 3500.00, 'Monthly Salary', '2024-08-15', 0),
(4, 'Expense', 260.70, 'Back to School', '2024-08-08', 0),
(5, 'Expense', 125.90, 'Electricity Bill', '2024-08-13', 0),
(7, 'Expense', 70.50, 'Bus Pass', '2024-08-21', 0),
(9, 'Expense', 250.00, 'Workshop Fee', '2024-08-29', 0),

-- September 2024 (5 records)
(1, 'Income', 3500.00, 'Monthly Salary', '2024-09-15', 0),
(4, 'Expense', 230.40, 'Weekly Groceries', '2024-09-04', 0),
(5, 'Expense', 135.20, 'Gas Bill', '2024-09-10', 0),
(6, 'Expense', 80.00, 'Movie Tickets', '2024-09-18', 0),
(10, 'Expense', 500.00, 'Monthly Savings', '2024-09-26', 0),

-- October 2024 (5 records)
(1, 'Income', 3500.00, 'Monthly Salary', '2024-10-15', 0),
(4, 'Expense', 285.60, 'Halloween Shopping', '2024-10-09', 0),
(5, 'Expense', 120.75, 'Water Bill', '2024-10-14', 0),
(7, 'Expense', 88.25, 'Fuel', '2024-10-22', 0),
(8, 'Expense', 95.00, 'Eye Exam', '2024-10-30', 0),

-- 2025 Records (50 records)
-- January 2025 (5 records)
(1, 'Income', 3700.00, 'Monthly Salary + Bonus', '2025-01-15', 0),
(4, 'Expense', 255.80, 'New Year Groceries', '2025-01-06', 0),
(5, 'Expense', 130.45, 'Electricity Bill', '2025-01-12', 0),
(6, 'Expense', 100.00, 'New Year Party', '2025-01-01', 0),
(7, 'Expense', 72.50, 'Taxi Fares', '2025-01-20', 0),

-- February 2025 (5 records)
(1, 'Income', 3700.00, 'Monthly Salary', '2025-02-15', 0),
(4, 'Expense', 270.35, 'Valentine Shopping', '2025-02-08', 0),
(5, 'Expense', 140.80, 'Internet Bill', '2025-02-11', 0),
(8, 'Expense', 160.00, 'Medical Checkup', '2025-02-19', 0),
(9, 'Expense', 220.00, 'Online Subscription', '2025-02-26', 0),

-- March 2025 (5 records)
(1, 'Income', 3700.00, 'Monthly Salary', '2025-03-15', 0),
(4, 'Expense', 210.90, 'Spring Groceries', '2025-03-05', 0),
(5, 'Expense', 125.60, 'Gas Bill', '2025-03-10', 0),
(6, 'Expense', 110.00, 'Weekend Getaway', '2025-03-23', 0),
(10, 'Expense', 600.00, 'Monthly Savings', '2025-03-29', 0),

-- April 2025 (5 records)
(1, 'Income', 3700.00, 'Monthly Salary', '2025-04-15', 0),
(4, 'Expense', 275.45, 'Easter Celebration', '2025-04-07', 0),
(5, 'Expense', 135.25, 'Water Bill', '2025-04-13', 0),
(7, 'Expense', 92.80, 'Car Wash & Service', '2025-04-21', 0),
(8, 'Expense', 85.75, 'Prescription', '2025-04-28', 0),

-- May 2025 (5 records)
(1, 'Income', 3700.00, 'Monthly Salary', '2025-05-15', 0),
(4, 'Expense', 235.70, 'Weekly Shopping', '2025-05-04', 0),
(5, 'Expense', 145.90, 'Electricity Bill', '2025-05-09', 0),
(6, 'Expense', 95.00, 'Cinema', '2025-05-16', 0),
(9, 'Expense', 190.00, 'Professional Course', '2025-05-25', 0),

-- June 2025 (5 records)
(1, 'Income', 3700.00, 'Monthly Salary', '2025-06-15', 0),
(4, 'Expense', 290.20, 'Summer BBQ', '2025-06-08', 0),
(5, 'Expense', 118.40, 'Internet Bill', '2025-06-12', 0),
(7, 'Expense', 105.60, 'Road Trip Fuel', '2025-06-20', 0),
(10, 'Expense', 600.00, 'Monthly Savings', '2025-06-27', 0),

-- July 2025 (5 records)
(1, 'Income', 3700.00, 'Monthly Salary', '2025-07-15', 0),
(4, 'Expense', 250.85, 'Vacation Supplies', '2025-07-06', 0),
(5, 'Expense', 142.35, 'Gas Bill', '2025-07-11', 0),
(6, 'Expense', 180.00, 'Amusement Park', '2025-07-18', 0),
(8, 'Expense', 110.00, 'Physiotherapy', '2025-07-24', 0),

-- August 2025 (5 records)
(1, 'Income', 3700.00, 'Monthly Salary', '2025-08-15', 0),
(4, 'Expense', 265.90, 'Back to Work', '2025-08-07', 0),
(5, 'Expense', 138.75, 'Electricity Bill', '2025-08-14', 0),
(7, 'Expense', 78.90, 'Monthly Pass', '2025-08-22', 0),
(9, 'Expense', 275.00, 'Certification Exam', '2025-08-30', 0),

-- September 2025 (5 records)
(1, 'Income', 3700.00, 'Monthly Salary', '2025-09-15', 0),
(4, 'Expense', 225.60, 'Weekly Groceries', '2025-09-03', 0),
(5, 'Expense', 128.45, 'Water Bill', '2025-09-10', 0),
(6, 'Expense', 85.00, 'Restaurant', '2025-09-19', 0),
(10, 'Expense', 600.00, 'Monthly Savings', '2025-09-26', 0),

-- October 2025 (5 records)
(2, 'Income', 850.00, 'Freelance Project', '2025-10-08', 0),
(3, 'Income', 320.50, 'Dividend Payment', '2025-10-12', 0),
(4, 'Expense', 295.75, 'Halloween Decorations', '2025-10-09', 0),
(5, 'Expense', 132.80, 'Internet Bill', '2025-10-15', 0),
(7, 'Expense', 96.40, 'Fuel Top-up', '2025-10-23', 0);