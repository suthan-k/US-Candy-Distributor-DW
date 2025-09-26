------------------------------------------------------------
-- Create the CandyManufacturingDB Database and its tables
------------------------------------------------------------

-- Create and use the database
CREATE DATABASE CandyManufacturingDB;
GO

USE CandyManufacturingDB;
GO

-- Initial table to load Candy_Products.csv
CREATE TABLE ProductsInitial (
    [Product ID] VARCHAR(100),
    [Product Name] VARCHAR(100),
    [Division] VARCHAR(50),
    [Unit Cost] DECIMAL(10, 2),
    [Unit Price] DECIMAL(10, 2),
    [Factory] VARCHAR(100)
);
GO

-- Initial table to load Candy_Factories.csv
CREATE TABLE FactoriesInitial (
    Factory VARCHAR(100),
    Latitude FLOAT,
    Longitude FLOAT
);
GO

---------------------------------------
-- Create the Final Normalized Tables 
---------------------------------------

-- Create ProductCategories table
CREATE TABLE ProductCategories (
    CategoryID INT IDENTITY(1,1) NOT NULL,
    CategoryName VARCHAR(50),
    PRIMARY KEY (CategoryID)
);
GO

-- Create Factories table
CREATE TABLE Factories (
    FactoryID INT IDENTITY(1,1) NOT NULL,
    FactoryName VARCHAR(100),
    Latitude FLOAT,
    Longitude FLOAT,
    PRIMARY KEY (FactoryID)
);
GO

-- Create Products table
CREATE TABLE Products (
    ProductID VARCHAR(100) NOT NULL,
    ProductName VARCHAR(100),
    UnitCost DECIMAL(10, 2),
    UnitPrice DECIMAL(10, 2),
    FactoryID INT,
    CategoryID INT,
    PRIMARY KEY (ProductID),
    FOREIGN KEY (FactoryID) REFERENCES Factories(FactoryID),
    FOREIGN KEY (CategoryID) REFERENCES ProductCategories(CategoryID)
);
GO