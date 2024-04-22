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


-- Stock table
CREATE TABLE Stock (
    StockID INT PRIMARY KEY,
    StockName VARCHAR(100) PRIMARY KEY,
    StockPrice INT,
    ChangePercentage INT
);


-- Portfolio table
CREATE TABLE Portfolio (
    PortfolioID INT PRIMARY KEY,
    UserID INT,
    DematID INT,
    StockID INT,
    StockName varchar(100),
    StockPrice INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (DEMATID) REFERENCES DematAccount(accountno),
    FOREIGN KEY (StockID) REFERENCES Stock(StockID)
);






