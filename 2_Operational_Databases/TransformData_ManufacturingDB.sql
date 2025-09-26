--------------------------------------------------------------
-- Clean and Transform Data into CandyManufacturingDB Tables
--------------------------------------------------------------

-- Switch to the correct database context
USE CandyManufacturingDB;
GO

-- Populate the final Factories table from the initial data
INSERT INTO Factories (FactoryName, Latitude, Longitude)
SELECT DISTINCT 
    [Factory], 
    [Latitude], 
    [Longitude] 
FROM FactoriesInitial;
GO

-- Populate the ProductCategories table with unique Division names
INSERT INTO ProductCategories (CategoryName)
SELECT DISTINCT Division
FROM ProductsInitial 
WHERE Division IS NOT NULL;
GO

-- Populate the final Products table
INSERT INTO Products (ProductID, ProductName, UnitCost, UnitPrice, FactoryID, CategoryID)
SELECT
    p_init.[Product ID],
    p_init.[Product Name],
    p_init.[Unit Cost],
    p_init.[Unit Price],
    fact.FactoryID,
    cat.CategoryID
FROM
    ProductsInitial p_init
JOIN
    Factories fact ON p_init.[Factory] = fact.FactoryName
JOIN
    ProductCategories cat ON p_init.Division = cat.CategoryName;
GO