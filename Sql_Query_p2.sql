-- 1. Database Design & Table Creation (DDL)
-- CREATING A DATABASE --
CREATE DATABASE Personal_tracker;
USE Personal_tracker;

-- CREATING A 6 TABLES--
-- TABLE 1 --
CREATE TABLE Users(
  UserID INT PRIMARY KEY,
  FullName VARCHAR(150),
  Email VARCHAR(100),
  PasswordHash VARCHAR(255));

-- TABLE 2 --
CREATE TABLE Categories(
  CategoryID INT PRIMARY KEY,
  CategoryName VARCHAR(100),
  Type VARCHAR(20));

-- TABLE 3 --
CREATE TABLE Expenses(
  ExpenseID INT PRIMARY KEY,
  UserID INT ,
  CategoryID INT ,
  Amount DECIMAL(10, 2),
  Description TEXT,
  ExpenseDate DATE,
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID));
  
-- TABLE 4 --
CREATE TABLE Incomes(
  IncomeID INT PRIMARY KEY,
  UserID INT,
  Amount DECIMAL(10, 2),
  Source VARCHAR(100),
  ReceivedDate DATE );
  
-- TABLE 5 --
CREATE TABLE Budgets(
  BudgetID INT PRIMARY KEY,
  UserID INT,
  CategoryID INT,
  AmountLimit DECIMAL(10, 2),
  Month VARCHAR(10));

-- TABLE 6 --
CREATE TABLE Recurring_Transactions(
  RecurringID INT Primary Key,
  UserID INT,
  Title VARCHAR(100),
  Amount DECIMAL(10, 2),
  Frequency VARCHAR(20),
  NextDueDate DATE );
  
-- Drop a column or rename a table:
ALTER TABLE Recurring_Transactions RENAME AS Recurring_Data;

-- 2. Data Insertion & Manipulation (DML)
-- INSERT COMMAND 
-- INSERTING ROWS IN TO TABLE 1
INSERT INTO Users (UserID, FullName, Email, PasswordHash) VALUES
(1, 'Akshitha Gundala', 'akshitha@example.com', '5f4dcc3b5aa7'),
(2, 'Ravi Kumar', 'ravi.kumar@example.com', 'e99a18c428cb38d5f260853678922e03'),
(3, 'Priya Sharma', 'priya.sharma@example.com', 'd8578edf8458ce06fbc5bb76a58c5ca4'),
(4, 'Anjali Mehta', 'anjali.mehta@example.com', '25d55ad283aa400af464c76d713c07ad'),
(5, 'Siddharth Joshi', 'sid.joshi@example.com', '098f6bcd4621d373cade4e832627b4f6'),
(6, 'Neha Verma', 'neha.v@example.com', '5ebe2294ecd0e0f08eab7690d2a6ee69'),
(7, 'Aarav Desai', 'aarav.desai@example.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(8, 'Kriti Sen', 'kriti.sen@example.com', 'e10adc3949ba59abbe56e057f20f883e'),
(9, 'Manoj Patil', 'manoj.patil@example.com', '6c569aabbf7775ef8fc570e228c16b98'),
(10, 'Divya Bhatt', 'divya.bhatt@example.com', '45c48cce2e2d7fbdea1afc51c7c6ad26'),
(11, 'Vikram Rao', 'vikram.rao@example.com', '21232f297a57a5a743894a0e4a801fc3'),
(12, 'Megha Kapoor', 'megha.kapoor@example.com', '5f4dcc3b5aa765d61d8327deb882cf99'),
(13, 'Rohit Singh', 'rohit.singh@example.com', '098f6bcd4621d373cade4e832627b4f6'),
(14, 'Simran Kaur', 'simran.kaur@example.com', '5ebe2294ecd0e0f08eab7690d2a6ee69'),
(15, 'Karan Malhotra', 'karan.malhotra@example.com', '25d55ad283aa400af464c76d713c07ad'),
(16, 'Isha Jain', 'isha.jain@example.com', 'e99a18c428cb38d5f260853678922e03'),
(17, 'Rahul Roy', 'rahul.roy@example.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(18, 'Tanya Saxena', 'tanya.saxena@example.com', 'd8578edf8458ce06fbc5bb76a58c5ca4'),
(19, 'Amit Trivedi', 'amit.trivedi@example.com', '5f4dcc3b5aa765d61d8327deb882cf99'),
(20, 'Sneha Reddy', 'sneha.reddy@example.com', '21232f297a57a5a743894a0e4a801fc3'),
(21, 'Yash Vyas', 'yash.vyas@example.com', '45c48cce2e2d7fbdea1afc51c7c6ad26'),
(22, 'Lavanya Nair', 'lavanya.nair@example.com', 'e10adc3949ba59abbe56e057f20f883e'),
(23, 'Gaurav Bhatia', 'gaurav.b@example.com', '6c569aabbf7775ef8fc570e228c16b98'),
(24, 'Reena Das', 'reena.das@example.com', 'd8578edf8458ce06fbc5bb76a58c5ca4'),
(25, 'Nikhil Menon', 'nikhil.menon@example.com', '25d55ad283aa400af464c76d713c07ad'),
(26, 'Pooja Agrawal', 'pooja.agrawal@example.com', '5ebe2294ecd0e0f08eab7690d2a6ee69'),
(27, 'Ayaan Khan', 'ayaan.khan@example.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(28, 'Sanya Dubey', 'sanya.dubey@example.com', 'e99a18c428cb38d5f260853678922e03'),
(29, 'Rajeev Iyer', 'rajeev.iyer@example.com', '5f4dcc3b5aa765d61d8327deb882cf99'),
(30, 'Chaitanya Rao', 'chaitanya.rao@example.com', '21232f297a57a5a743894a0e4a801fc3');

-- INSERTING ROWS INTO TABLE 2
INSERT INTO Categories (CategoryID, CategoryName, Type) VALUES
(1, 'Salary', 'Income'),
(2, 'Freelancing', 'Income'),
(3, 'Investments', 'Income'),
(4, 'Rental Income', 'Income'),
(5, 'Gifts Received', 'Income'),
(6, 'Interest Earned', 'Income'),
(7, 'Food & Groceries', 'Expense'),
(8, 'Dining Out', 'Expense'),
(9, 'Utilities', 'Expense'),
(10, 'Electricity Bill', 'Expense'),
(11, 'Water Bill', 'Expense'),
(12, 'Internet', 'Expense'),
(13, 'Mobile Recharge', 'Expense'),
(14, 'Transportation', 'Expense'),
(15, 'Fuel', 'Expense'),
(16, 'Public Transport', 'Expense'),
(17, 'Car Maintenance', 'Expense'),
(18, 'Rent', 'Expense'),
(19, 'EMI Payments', 'Expense'),
(20, 'Medical Expenses', 'Expense'),
(21, 'Insurance Premium', 'Expense'),
(22, 'Entertainment', 'Expense'),
(23, 'Streaming Subscriptions', 'Expense'),
(24, 'Online Shopping', 'Expense'),
(25, 'Clothing & Accessories', 'Expense'),
(26, 'Travel', 'Expense'),
(27, 'Education', 'Expense'),
(28, 'Books & Courses', 'Expense'),
(29, 'Child Care', 'Expense'),
(30, 'Charity/Donations', 'Expense');

-- INSERTING ROWS INTO TABLE 3
INSERT INTO Expenses (ExpenseID, UserID, CategoryID, Amount, Description, ExpenseDate) VALUES
(1, 1, 7, 2500.00, 'Monthly groceries', '2025-06-01'),
(2, 2, 8, 800.00, 'Dinner with friends', '2025-06-02'),
(3, 3, 10, 1200.00, 'Electricity bill payment', '2025-06-03'),
(4, 1, 14, 600.00, 'Uber rides to office', '2025-06-04'),
(5, 4, 18, 15000.00, 'Flat rent for June', '2025-06-01'),
(6, 2, 13, 249.00, 'Monthly phone recharge', '2025-06-06'),
(7, 5, 20, 500.00, 'Doctor consultation', '2025-06-05'),
(8, 6, 22, 999.00, 'Movie tickets', '2025-06-07'),
(9, 3, 23, 499.00, 'Netflix subscription', '2025-06-03'),
(10, 1, 25, 2000.00, 'New jeans and shirt', '2025-06-08'),
(11, 7, 12, 999.00, 'Internet bill', '2025-06-09'),
(12, 8, 15, 2500.00, 'Petrol for the month', '2025-06-04'),
(13, 9, 27, 8000.00, 'MBA course installment', '2025-06-02'),
(14, 10, 26, 15000.00, 'Trip to Goa', '2025-06-10'),
(15, 11, 24, 4500.00, 'Amazon shopping', '2025-06-12'),
(16, 12, 17, 1200.00, 'Car servicing', '2025-06-13'),
(17, 13, 28, 1200.00, 'Online course on SQL', '2025-06-06'),
(18, 14, 9, 1500.00, 'Gas and utility bill', '2025-06-07'),
(19, 15, 21, 4000.00, 'Health insurance', '2025-06-05'),
(20, 16, 30, 1000.00, 'NGO donation', '2025-06-15'),
(21, 2, 11, 300.00, 'Water bill', '2025-06-06'),
(22, 1, 16, 450.00, 'Metro pass recharge', '2025-06-04'),
(23, 3, 19, 7500.00, 'Loan EMI', '2025-06-09'),
(24, 4, 8, 1300.00, 'Anniversary dinner', '2025-06-14'),
(25, 6, 7, 3200.00, 'Weekly groceries at Dmart', '2025-06-08'),
(26, 7, 26, 9000.00, 'Flight to Delhi', '2025-06-11'),
(27, 8, 29, 3000.00, 'Daycare fees', '2025-06-03'),
(28, 5, 22, 799.00, 'Zee5 annual subscription', '2025-06-05'),
(29, 9, 13, 349.00, 'Jio recharge plan', '2025-06-06'),
(30, 10, 15, 2700.00, 'Diesel for SUV', '2025-06-09');

-- INSERTING ROWS INTO TABLE 4
INSERT INTO Incomes (IncomeID, UserID, Amount, Source, ReceivedDate) VALUES
(1, 1, 50000.00, 'Salary', '2025-06-01'),
(2, 2, 20000.00, 'Freelance Writing', '2025-06-03'),
(3, 3, 15000.00, 'Stock Dividends', '2025-06-05'),
(4, 4, 18000.00, 'Part-time Tutoring', '2025-06-04'),
(5, 5, 45000.00, 'Salary', '2025-06-01'),
(6, 6, 2500.00, 'Interest Income', '2025-06-07'),
(7, 7, 30000.00, 'Salary', '2025-06-01'),
(8, 8, 8000.00, 'Photography Gig', '2025-06-06'),
(9, 9, 12000.00, 'Consulting', '2025-06-03'),
(10, 10, 55000.00, 'Salary', '2025-06-01'),
(11, 11, 5000.00, 'YouTube Monetization', '2025-06-05'),
(12, 12, 6000.00, 'Rental Income', '2025-06-02'),
(13, 13, 25000.00, 'Freelance Coding', '2025-06-06'),
(14, 14, 47000.00, 'Salary', '2025-06-01'),
(15, 15, 12000.00, 'Affiliate Marketing', '2025-06-04'),
(16, 16, 1500.00, 'Gift Received', '2025-06-08'),
(17, 17, 16000.00, 'Content Creation', '2025-06-03'),
(18, 18, 50000.00, 'Salary', '2025-06-01'),
(19, 19, 4000.00, 'Interest Income', '2025-06-06'),
(20, 20, 19000.00, 'Part-time Job', '2025-06-04'),
(21, 21, 8000.00, 'Freelance Design', '2025-06-07'),
(22, 22, 3200.00, 'Savings Interest', '2025-06-05'),
(23, 23, 45000.00, 'Salary', '2025-06-01'),
(24, 24, 17000.00, 'Tutoring', '2025-06-03'),
(25, 25, 15000.00, 'Content Editing', '2025-06-06'),
(26, 26, 10000.00, 'Online Workshop', '2025-06-08'),
(27, 27, 9000.00, 'Pet Sitting', '2025-06-02'),
(28, 28, 38000.00, 'Salary', '2025-06-01'),
(29, 29, 12000.00, 'Blogging', '2025-06-07'),
(30, 30, 13000.00, 'Stock Earnings', '2025-06-06');

-- INSERTING ROWS INTO TABLE 5
INSERT INTO Budgets (BudgetID, UserID, CategoryID, AmountLimit, Month) VALUES
(1, 1, 7, 5000.00, 'Jun-2025'),
(2, 1, 14, 2000.00, 'Jun-2025'),
(3, 2, 8, 1500.00, 'Jun-2025'),
(4, 2, 13, 300.00, 'Jun-2025'),
(5, 3, 10, 1200.00, 'Jun-2025'),
(6, 4, 18, 15000.00, 'Jun-2025'),
(7, 4, 9, 1800.00, 'Jun-2025'),
(8, 5, 15, 3000.00, 'Jun-2025'),
(9, 6, 24, 4000.00, 'Jun-2025'),
(10, 7, 12, 1000.00, 'Jun-2025'),
(11, 8, 22, 2000.00, 'Jun-2025'),
(12, 9, 21, 4000.00, 'Jun-2025'),
(13, 10, 23, 600.00, 'Jun-2025'),
(14, 11, 20, 2500.00, 'Jun-2025'),
(15, 12, 17, 2000.00, 'Jun-2025'),
(16, 13, 19, 8000.00, 'Jun-2025'),
(17, 14, 26, 12000.00, 'Jun-2025'),
(18, 15, 28, 1000.00, 'Jun-2025'),
(19, 16, 30, 1500.00, 'Jun-2025'),
(20, 17, 25, 2500.00, 'Jun-2025'),
(21, 18, 27, 6000.00, 'Jun-2025'),
(22, 19, 11, 500.00, 'Jun-2025'),
(23, 20, 16, 800.00, 'Jun-2025'),
(24, 21, 7, 4500.00, 'Jun-2025'),
(25, 22, 14, 2200.00, 'Jun-2025'),
(26, 23, 29, 3500.00, 'Jun-2025'),
(27, 24, 26, 10000.00, 'Jun-2025'),
(28, 25, 22, 1800.00, 'Jun-2025'),
(29, 26, 8, 1600.00, 'Jun-2025'),
(30, 27, 10, 1000.00, 'Jun-2025');

-- INSERTING ROWS INTO TABLE 6
INSERT INTO Recurring_data (RecurringID, UserID, Title, Amount, Frequency, NextDueDate) VALUES
(1, 1, 'Netflix Subscription', 499.00, 'Monthly', '2025-07-01'),
(2, 2, 'Rent Payment', 15000.00, 'Monthly', '2025-07-01'),
(3, 3, 'Gym Membership', 1500.00, 'Monthly', '2025-07-05'),
(4, 4, 'Mobile Recharge', 299.00, 'Monthly', '2025-06-25'),
(5, 5, 'Savings Auto-transfer', 2000.00, 'Monthly', '2025-07-01'),
(6, 6, 'Spotify Subscription', 199.00, 'Monthly', '2025-06-28'),
(7, 7, 'Fuel Allowance', 3000.00, 'Monthly', '2025-07-02'),
(8, 8, 'Child Care Fee', 4000.00, 'Monthly', '2025-06-30'),
(9, 9, 'Magazine Subscription', 350.00, 'Monthly', '2025-07-01'),
(10, 10, 'Water Purifier Service', 1000.00, 'Quarterly', '2025-07-15'),
(11, 11, 'Electricity Bill Advance', 1200.00, 'Monthly', '2025-07-01'),
(12, 12, 'Parking Rent', 500.00, 'Monthly', '2025-07-03'),
(13, 13, 'Insurance Premium', 4500.00, 'Monthly', '2025-06-29'),
(14, 14, 'Student Loan EMI', 8000.00, 'Monthly', '2025-07-05'),
(15, 15, 'Zee5 Subscription', 599.00, 'Monthly', '2025-07-02'),
(16, 16, 'Credit Card Payment', 6500.00, 'Monthly', '2025-06-27'),
(17, 17, 'Weekly Groceries', 1200.00, 'Weekly', '2025-06-22'),
(18, 18, 'Data Recharge', 249.00, 'Monthly', '2025-06-25'),
(19, 19, 'Music Class Fee', 2000.00, 'Monthly', '2025-06-30'),
(20, 20, 'Cloud Storage', 150.00, 'Monthly', '2025-06-26'),
(21, 21, 'Donation to NGO', 1000.00, 'Monthly', '2025-07-01'),
(22, 22, 'Laundry Service', 500.00, 'Weekly', '2025-06-24'),
(23, 23, 'Amazon Prime', 999.00, 'Yearly', '2026-06-01'),
(24, 24, 'Bike EMI', 4000.00, 'Monthly', '2025-07-03'),
(25, 25, 'Adobe Suite', 3200.00, 'Monthly', '2025-07-01'),
(26, 26, 'WiFi Bill', 899.00, 'Monthly', '2025-06-28'),
(27, 27, 'Tuition Fee', 5000.00, 'Monthly', '2025-07-04'),
(28, 28, 'Weekend Cooking Class', 1800.00, 'Weekly', '2025-06-23'),
(29, 29, 'Newsletter Fee', 199.00, 'Monthly', '2025-07-01'),
(30, 30, 'Child Tuition EMI', 6000.00, 'Monthly', '2025-07-05');

-- DATA EXPLORATION
SELECT COUNT(*) AS total_expenses 
FROM Expenses;

SELECT COUNT(DISTINCT UserID) AS total_users 
FROM Users;

SELECT DISTINCT CategoryName 
FROM Categories;

SELECT * 
FROM Expenses
WHERE 
    ExpenseID IS NULL OR
    UserID IS NULL OR
    CategoryID IS NULL OR
    Amount IS NULL OR
    ExpenseDate IS NULL;
    
-- QUESTIONS:
-- 1.Q Update the monthly budget limit to ₹6000 for category 'Food & Groceries' for user with UserID = 1?
-- 2.Q Delete all expenses older than January 1, 2024?
-- 3.Q Insert 3 new users into the Users table using a single statement?
-- 4.Q Change the recurrence interval to 'Quarterly' for all Spotify subscriptions?
-- 5.Q Lock the Budgets table for writing while updating all rent-related budgets?
-- 6.Q  Retrieve all expense records and classify each as 'LOW', 'MEDIUM', or 'HIGH' based on the amount:
		-- 'Low' if under ₹1000,
        -- 'Medium' if between ₹1000–₹5000,
        -- 'High' if above ₹5000?
-- 7.Q Show users who have spent more than ₹10,000 in total for June 2025, along with their total spend?
-- 8.Q Find users whose total income is greater than the average income of all users?
-- 9 Q Show all recurring data where the title starts with 'S' and convert it to UPPERCASE?
-- 10 Q Retrieve all expense records where the amount is greater than ₹5000?

-- DATA ANALYSIS
-- 1.Q Update the monthly budget limit to ₹6000 for category 'Food & Groceries' for user with UserID = 1?
UPDATE Budgets SET Amountlimit = 6000
WHERE UserID=1 
AND 
CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName= "Food & Groceries");

-- IF YOU ARE GETTING ERROR 1175 USE THIS CODE
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM Budgets;

-- 2.Q Delete all expenses older than January 1, 2024?
DELETE FROM Expenses 
WHERE ExpenseDate < "2024-01-01";

-- 3.Q Insert 3 new users into the Users table using a single statement?
INSERT INTO Users(UserID,FullName ,Email ,PasswordHash) 
VALUES 
(32,"Srinivas","srinivas@mail.com","2r4666ybe8888"),
(36,"Reena","reena@mail.com","2em789je344"),
(37,"Damon salvotre","damon@mail.com","34revdh5768hag");
SELECT * FROM Users;

-- 4.Q Change the recurrence Frequency to 'Quarterly' for all Spotify subscription?
UPDATE Recurring_data SET Frequency ="Quarterly" 
WHERE Title="Spotify subscription";
SELECT * FROM Recurring_data;

-- 5.Q Lock the Budgets table for writing while updating all rent-related budgets?
START TRANSACTION;
LOCK TABLE Budgets WRITE;

UPDATE Budgets
SET AmountLimit = AmountLimit + 1000
WHERE CategoryID = (
  SELECT CategoryID FROM Categories WHERE CategoryName = 'Rental Income'
);

UNLOCK TABLES;
COMMIT;

-- 6.Q  Retrieve all expense records and classify each as 'LOW', 'MEDIUM', or 'HIGH' based on the amount:
		-- 'Low' if under ₹1000,
        -- 'Medium' if between ₹1000–₹5000,
        -- 'High' if above ₹5000?
SELECT *,
CASE
   WHEN Amount < 1000 THEN "LOW"
   WHEN Amount BETWEEN 1000 AND 5000 THEN "MEDIUM"
   ELSE "HIGH"
END AS Expenses_level
FROM Expenses
ORDER BY 7;

-- 7.Q Show users who have spent more than ₹10,000 in total for June 2025, along with their total spend?
SELECT u.FullName, SUM(e.Amount) AS TotalSpent
FROM Users u
JOIN Expenses e ON u.UserID = e.UserID
WHERE MONTH(e.ExpenseDate) = 6 AND YEAR(e.ExpenseDate) = 2025
GROUP BY u.FullName
HAVING SUM(e.Amount) > 10000;

-- 8.Q Find users whose total income is greater than the average income of all users?
SELECT u.FullName, SUM(i.Amount) AS TotalIncome
FROM Users u
JOIN Incomes i ON u.UserID = i.UserID
GROUP BY u.UserID, u.FullName
HAVING SUM(i.Amount) > (
  SELECT AVG(Amount) FROM Incomes
);

-- 9 Q Show all recurring data where the title starts with 'S' and convert it to UPPERCASE?
SELECT RecurringID,Amount,Frequency,UPPER(Title) AS Upper_title 
FROM Recurring_data
WHERE Title LIKE "S%";

-- 10 Q  Retrieve all expense records where the amount is greater than ₹5000?
SELECT * FROM Expenses 
WHERE Amount > 5000;
