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
    Balance INT,
    PANID VARCHAR(20),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);


-- Stock table
CREATE TABLE Stock (
    StockID INT PRIMARY KEY,
    StockName VARCHAR(100),
    StockPrice INT,
    ChangePercentage INT
);


-- Portfolio table
CREATE TABLE Portfolio (
    PortfolioID INT auto_increment KEY,
    UserID INT,
    DematID INT,
    StockID INT,
    StockName varchar(100),
    StockPrice INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (DEMATID) REFERENCES DematAccount(accountno),
    FOREIGN KEY (StockID) REFERENCES Stock(StockID)
);

-- Inserting into User table
INSERT INTO User (ContactInfo, Name) VALUES
('user1@example.com', 'John Doe'),
('user2@example.com', 'Alice Smith');

-- Inserting into AuthorizationCredentials table
INSERT INTO AuthorizationCredentials (EmailAddress, Password, UserID) VALUES
('user1@example.com', 'password123', 1),
('user2@example.com', 'securepwd456', 2);

-- Inserting into DematAccount table
INSERT INTO DematAccount (AccountNo, Balance, PANID, UserID) VALUES
(123456789, 5000, 'ABCDE1234F', 1),
(987654321, 7500, 'FGHIJ5678K', 2);

-- Inserting into Stock table
INSERT INTO Stock (StockID, StockName, StockPrice, ChangePercentage) VALUES
(1, 'AAPL', 150, 1),
(2, 'GOOGL', 2800, 2),
(3, 'MSFT', 300, 0.5);

-- Inserting into Portfolio table
INSERT INTO Portfolio (PortfolioID, UserID, DematID, StockID, StockName, StockPrice) VALUES
(1, 1, 123456789, 1, 'AAPL', 150),
(2, 2, 987654321, 3, 'MSFT', 300);



