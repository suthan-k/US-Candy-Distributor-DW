-----------------------------------------------------------------
-- Create the CandyDistributionDW Data Warehouse and its tables
-----------------------------------------------------------------

-- Create and use the database
CREATE DATABASE CandyDistributionDW
GO

USE CandyDistributionDW
GO

----------------------------
-- Create Dimension Tables
----------------------------

-- Create DateDim table
CREATE TABLE DateDim
(
    DateKey INT NOT NULL IDENTITY(1,1),
    FullDate DATE,
    DayName VARCHAR(20),
    DayOfMonth INT,
    MonthName VARCHAR(20),
    MonthNumber INT,
    Quarter VARCHAR(2),
    Year INT,
    PRIMARY KEY (DateKey)
);
GO

-- Create FactoryDim table
CREATE TABLE FactoryDim
(
    FactoryKey INT NOT NULL IDENTITY(1,1),
    FactoryID INT,
    FactoryName VARCHAR(100),
	Latitude FLOAT,
    Longitude FLOAT,
    PRIMARY KEY (FactoryKey)
);
GO

-- Create LocationDim table
CREATE TABLE LocationDim
(
    LocationKey INT NOT NULL IDENTITY(1,1),
    Zip VARCHAR(10),
    City VARCHAR(100),
    StateName VARCHAR(50),
	Latitude FLOAT,
    Longitude FLOAT,
    PRIMARY KEY (LocationKey)
);
GO

-- Create CustomerDim table
CREATE TABLE CustomerDim
(
    CustomerKey INT NOT NULL IDENTITY(1,1),
    CustomerID VARCHAR(20),
    RegionName VARCHAR(50),
    PRIMARY KEY (CustomerKey)
);
GO

-- Create ProductDim table
CREATE TABLE ProductDim
(
    ProductKey INT NOT NULL IDENTITY(1,1),
    ProductID VARCHAR(50),
    ProductName VARCHAR(100),
    CategoryName VARCHAR(50),
    PRIMARY KEY (ProductKey)
);
GO

-- Create ShipModeDim table
CREATE TABLE ShipModeDim
(
    ShipModeKey INT NOT NULL IDENTITY(1,1),
	ShipModeID INT,
    ShipModeName VARCHAR(50),
    PRIMARY KEY (ShipModeKey)
);
GO

----------------------
-- Create Fact Table
----------------------

-- Create DistributionFact table
CREATE TABLE DistributionFact
(
    -- Foreign Keys to the Dimension Tables
    DateKey INT,
    ProductKey INT,
    CustomerKey INT,
    LocationKey INT,
    FactoryKey INT,
    ShipModeKey INT,

    OrderID VARCHAR(50) NOT NULL,

    -- Measures
    UnitsSold INT,
    Cost DECIMAL(20, 2),
    Profit DECIMAL(20, 2),
	ShippingDistanceKM DECIMAL(20, 2),

    -- Define Primary and Foreign Keys
    PRIMARY KEY (OrderID, ProductKey),
    FOREIGN KEY (DateKey) REFERENCES DateDim (DateKey),
    FOREIGN KEY (ProductKey) REFERENCES ProductDim (ProductKey),
    FOREIGN KEY (CustomerKey) REFERENCES CustomerDim (CustomerKey),
    FOREIGN KEY (LocationKey) REFERENCES LocationDim (LocationKey),
    FOREIGN KEY (FactoryKey) REFERENCES FactoryDim (FactoryKey),
    FOREIGN KEY (ShipModeKey) REFERENCES ShipModeDim (ShipModeKey)
);
GO