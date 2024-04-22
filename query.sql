create database StockPortfolioManagement;
use StockPortfolioManagement;

-- User table
CREATE TABLE User (
    UserID INT auto_increment key,
    ContactInfo VARCHAR(100),
    Name VARCHAR(100)
);

-- Authorization Credentials table
CREATE TABLE AuthorizationCredentials (
    EmailAddress VARCHAR(100) PRIMARY KEY,
    Password VARCHAR(50),
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

-- Portfolio table
CREATE TABLE Portfolio (
    PortfolioID INT PRIMARY KEY,
    UserID INT,
    DematID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (DEMATID) REFERENCES DematAccount(accountno),
    PortfolioValue INT
);

-- Stock table
CREATE TABLE Stock (
    StockID INT PRIMARY KEY,
    StockName VARCHAR(100) PRIMARY KEY,
    CurrentPrice INT,
    ChangePercentage INT
);

-- Portfolio_Stock table for one-to-many relation between Portfolio and Stock
CREATE TABLE Portfolio_Stock (
    PortfolioID INT,
    StockID INT,
    StockName varchar(100),
    FOREIGN KEY (PortfolioID) REFERENCES Portfolio(PortfolioID),
    FOREIGN KEY (StockID) REFERENCES Stock(StockID)
);




