--------------------------------------------------------
-- Create the CandySalesDB Database and its tables
--------------------------------------------------------

-- Create and use the database
CREATE DATABASE CandySalesDB;
GO

USE CandySalesDB;
GO

-- Initial table to load Candy_Sales.csv
CREATE TABLE SalesInitial (
    [Row ID] INT,
    [Order ID] VARCHAR(50),
    [Order Date] VARCHAR(50),
    [Ship Date] VARCHAR(50),
    [Ship Mode] VARCHAR(50),
    [Customer ID] VARCHAR(20),
    [Country/Region] VARCHAR(50),
    [City] VARCHAR(100),
    [State/Province] VARCHAR(50),
    [Postal Code] VARCHAR(50),
    [Region] VARCHAR(50),
    [Product ID] VARCHAR(25),
    [Sales] DECIMAL(18, 2),
    [Units] INT,
    [Cost] DECIMAL(18, 2),
    [Gross Profit] DECIMAL(18, 2)
);
GO

---------------------------------------
-- Create the Final Normalized Tables 
---------------------------------------

-- Create ShipModes table
CREATE TABLE ShipModes (
    ShipModeID INT IDENTITY(1,1) NOT NULL,
    ShipModeName VARCHAR(50),
    PRIMARY KEY (ShipModeID)
);
GO

-- Create Customers table
CREATE TABLE Customers (
    CustomerID VARCHAR(20) NOT NULL,
    RegionID INT,
    Zip VARCHAR(50),
    PRIMARY KEY (CustomerID)
);
GO

-- Create Orders table
CREATE TABLE Orders (
    OrderID VARCHAR(50) NOT NULL,
    OrderDate DATE,
    ShipDate DATE,
    CustomerID VARCHAR(20),
    ShipModeID INT,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ShipModeID) REFERENCES ShipModes(ShipModeID)
);
GO

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT NOT NULL, -- This comes from the source "Row ID"
    OrderID VARCHAR(50),
    ProductID VARCHAR(50),
    UnitsSold INT,
    Cost DECIMAL(18, 2),
    GrossProfit DECIMAL(18, 2),
    PRIMARY KEY (OrderDetailID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
GO