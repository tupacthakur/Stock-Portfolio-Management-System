create database StockPortfolioManagement;
use StockPortfolioManagement;

-- User table
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    ContactInfo VARCHAR(100),
    Name VARCHAR(100)
);

-- Authorization Credentials table
CREATE TABLE AuthorizationCredentials (
    EmailAddress VARCHAR(100) PRIMARY KEY,
    Password VARCHAR(50),
    OTP INT,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Demat Account table
CREATE TABLE DematAccount (
    AccountNo INT PRIMARY KEY,
    Balance DECIMAL(18, 2),
    PANID VARCHAR(20),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Market table
CREATE TABLE Market (
    MarketID INT PRIMARY KEY,
    Name VARCHAR(50),
    TradingHours VARCHAR(100)
);

-- Portfolio table
CREATE TABLE Portfolio (
    PortfolioID INT PRIMARY KEY,
    Name VARCHAR(100),
    MPIN VARCHAR(10),
    CreationDate DATE,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Stock table
CREATE TABLE Stock (
    StockID INT PRIMARY KEY,
    Name VARCHAR(100),
    CurrentPrice DECIMAL(18, 2),
    ChangePercentage DECIMAL(5, 2),
    MarketCap DECIMAL(18, 2),
    Quantity INT,
    AmountInvested DECIMAL(18, 2),
    Graph BLOB,
    MarketID INT,
    FOREIGN KEY (MarketID) REFERENCES Market(MarketID)
);

-- Transaction table
CREATE TABLE Transaction (
    TransactionID INT PRIMARY KEY,
    Date DATE,
    Quantity INT,
    Amount DECIMAL(18, 2),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Buy table (Specialization of Transaction)
CREATE TABLE Buy (
    TransactionID INT PRIMARY KEY,
    FOREIGN KEY (TransactionID) REFERENCES Transaction(TransactionID)
);

-- Sell table (Specialization of Transaction)
CREATE TABLE Sell (
    TransactionID INT PRIMARY KEY,
    FOREIGN KEY (TransactionID) REFERENCES Transaction(TransactionID)
);

-- DematAccount_Stock table for one-to-many relation between Demat Account and Stock
CREATE TABLE DematAccount_Stock (
    AccountNo INT,
    StockID INT,
    PRIMARY KEY (AccountNo, StockID),
    FOREIGN KEY (AccountNo) REFERENCES DematAccount(AccountNo),
    FOREIGN KEY (StockID) REFERENCES Stock(StockID)
);

-- Portfolio_Stock table for one-to-many relation between Portfolio and Stock
CREATE TABLE Portfolio_Stock (
    PortfolioID INT,
    StockID INT,
    PRIMARY KEY (PortfolioID, StockID),
    FOREIGN KEY (PortfolioID) REFERENCES Portfolio(PortfolioID),
    FOREIGN KEY (StockID) REFERENCES Stock(StockID)
);

-- Stock_Transaction table for many-to-many relation between Stock and Transaction
CREATE TABLE Stock_Transaction (
    StockID INT,
    TransactionID INT,
    PRIMARY KEY (StockID, TransactionID),
    FOREIGN KEY (StockID) REFERENCES Stock(StockID),
    FOREIGN KEY (TransactionID) REFERENCES Transaction(TransactionID)
);

-- User table
INSERT INTO User (UserID, ContactInfo, Name) VALUES 
(1, 'john.doe@example.com', 'John Doe'),
(2, 'jane.smith@example.com', 'Jane Smith'),
(3, 'alice@example.com', 'Alice Johnson'),
(4, 'bob@example.com', 'Bob Williams'),
(5, 'emma@example.com', 'Emma Brown'),
(6, 'michael@example.com', 'Michael Davis'),
(7, 'sarah@example.com', 'Sarah Wilson'),
(8, 'chris@example.com', 'Chris Taylor'),
(9, 'amit@example.com', 'Amit Patel'),
(10, 'sneha@example.com', 'Sneha Gupta');

-- Authorization Credentials table
INSERT INTO AuthorizationCredentials (EmailAddress, Password, OTP, UserID) VALUES 
('john.doe@example.com', 'password123', 123456, 1),
('jane.smith@example.com', 'letmein', 789012, 2),
('alice@example.com', 'securepass', 456789, 3),
('bob@example.com', 'pass1234', 987654, 4),
('emma@example.com', 'password', 654321, 5),
('michael@example.com', 'mike123', 321654, 6),
('sarah@example.com', 'sarah@123', 147258, 7),
('chris@example.com', 'chrispass', 852963, 8),
('amit@example.com', 'amit123', 369258, 9),
('sneha@example.com', 'sneha@123', 258369, 10);

-- Demat Account table
INSERT INTO DematAccount (AccountNo, Balance, PANID, UserID) VALUES 
(123456789, 10000.00, 'ABCDE1234F', 1),
(987654321, 5000.00, 'FGHIJ5678K', 2),
(456789123, 7500.00, 'LMNOP9012L', 3),
(321654987, 3000.00, 'QRSTU3456M', 4),
(654321987, 8500.00, 'VWXYZ7890N', 5),
(147258369, 4000.00, 'ABCD1234PQ', 6),
(369258147, 6200.00, 'EFGH5678RS', 7),
(258369147, 5600.00, 'TUVW9012XY', 8),
(963258741, 4800.00, 'ZABC3456DE', 9),
(741852963, 5300.00, 'FGHI7890JK', 10);

-- Market table
INSERT INTO Market (MarketID, Name, TradingHours) VALUES 
(1, 'National Stock Exchange (NSE)', '9:15 AM - 3:30 PM IST'),
(2, 'Bombay Stock Exchange (BSE)', '9:15 AM - 3:30 PM IST');

-- Portfolio table
INSERT INTO Portfolio (PortfolioID, Name, MPIN, CreationDate, UserID) VALUES 
(101, 'Retirement Portfolio', '1234', '2024-03-15', 1),
(102, 'Savings Portfolio', '5678', '2024-03-20', 2),
(103, 'Family Portfolio', '9876', '2024-03-18', 3),
(104, 'Investment Portfolio', '5432', '2024-03-22', 4),
(105, 'Wealth Management Portfolio', '1098', '2024-03-16', 5),
(106, 'Personal Portfolio', '2468', '2024-03-19', 6),
(107, 'Professional Portfolio', '1357', '2024-03-21', 7),
(108, 'Individual Portfolio', '8024', '2024-03-17', 8),
(109, 'Equity Portfolio', '3690', '2024-03-23', 9),
(110, 'Stock Portfolio', '7890', '2024-03-24', 10);

-- Stock table
INSERT INTO Stock (StockID, Name, CurrentPrice, ChangePercentage, MarketCap, Quantity, AmountInvested, MarketID) VALUES 
(1, 'Reliance Industries Ltd.', 2480.50, 0.75, 15960000000000, 10, 24805.00, 1),
(2, 'Tata Consultancy Services Ltd.', 3650.25, -1.25, 12920000000000, 15, 54753.75, 1),
(3, 'HDFC Bank Ltd.', 1435.75, 0.50, 8480000000000, 20, 28715.00, 1),
(4, 'Infosys Ltd.', 1750.80, 2.10, 7390000000000, 12, 21009.60, 2),
(5, 'State Bank of India', 430.90, -0.25, 2790000000000, 30, 12927.00, 2);

-- Transaction table
INSERT INTO Transaction (TransactionID, Date, Quantity, Amount, UserID) VALUES 
(1001, '2024-03-16', 5, 12402.50, 1),
(1002, '2024-03-21', 8, 20805.00, 2),
(1003, '2024-03-18', 7, 10000.25, 3),
(1004, '2024-03-22', 10, 15000.75, 4),
(1005, '2024-03-17', 4, 6000.80, 5),
(1006, '2024-03-19', 6, 9200.30, 6),
(1007, '2024-03-21', 12, 18000.45, 7),
(1008, '2024-03-20', 9, 13500.60, 8),
(1009, '2024-03-23', 15, 20000.90, 9),
(1010, '2024-03-24', 18, 25000.00, 10);

-- Buy table (Specialization of Transaction)
INSERT INTO Buy (TransactionID) VALUES 
(1001),
(1002),
(1003),
(1004),
(1005),
(1006),
(1007),
(1008),
(1009),
(1010);