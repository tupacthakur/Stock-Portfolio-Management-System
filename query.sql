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

INSERT INTO Stock (StockID, StockName, StockPrice, ChangePercentage) VALUES
(4, 'AMZN', 3500, 1.5),
(5, 'TSLA', 750, 3),
(6, 'NFLX', 600, -0.5),
(7, 'FB', 340, 1.2),
(8, 'NVDA', 700, 2.5);

INSERT INTO Stock (StockID, StockName, StockPrice, ChangePercentage) VALUES
(9, 'Microsoft Corporation', 305, 1.8),
(10, 'Alphabet Inc.', 2900, -0.7),
(11, 'Tesla, Inc.', 760, 2.3),
(12, 'Amazon.com, Inc.', 3550, 0.9),
(13, 'Meta Platforms, Inc.', 345, -1.5),
(14, 'Netflix, Inc.', 610, 0.2),
(15, 'NVIDIA Corporation', 720, -0.3),
(16, 'The Walt Disney Company', 150, 0.8),
(17, 'JPMorgan Chase & Co.', 140, -0.2),
(18, 'Johnson & Johnson', 170, 1.1);



