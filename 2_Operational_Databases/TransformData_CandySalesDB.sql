------------------------------------------------------
-- Clean and Transform Data into CandySalesDB Tables
------------------------------------------------------

-- Switch to the correct database context
USE CandySalesDB;
GO

-- Populate the ShipModes Table with unique Ship Mode names
INSERT INTO ShipModes (ShipModeName)
SELECT DISTINCT [Ship Mode] 
FROM SalesInitial 
WHERE [Ship Mode] IS NOT NULL;
GO

-- Populate the Customers Table, filtering for US only
INSERT INTO Customers (CustomerID, RegionID, Zip)
SELECT DISTINCT
    s_init.[Customer ID],
    reg.RegionID,
    s_init.[Postal Code]
FROM
    SalesInitial s_init
JOIN
    CandyLogisticsDB.dbo.Regions reg ON s_init.Region = reg.RegionName
WHERE 
    s_init.[Customer ID] IS NOT NULL
	AND s_init.[Country/Region] = 'United States'; -- Filter for US data only
GO


-- Populate the Orders table, , filtering for US only
INSERT INTO Orders (OrderID, OrderDate, ShipDate, CustomerID, ShipModeID)
SELECT DISTINCT
    s_init.[Order ID],
    CAST(s_init.[Order Date] AS DATE), -- Converts from text to the correct format DATE
    CAST(s_init.[Ship Date] AS DATE),  -- Converts from text to the correct format DATE
    s_init.[Customer ID],
    sm.ShipModeID
FROM 
    SalesInitial s_init
JOIN 
    ShipModes sm ON s_init.[Ship Mode] = sm.ShipModeName
WHERE 
    s_init.[Country/Region] = 'United States';
GO

-- Populate the OrderDetails table (Line Items), , filtering for US only
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, UnitsSold, Cost, GrossProfit)
SELECT
    s_init.[Row ID],
    s_init.[Order ID],
    s_init.[Product ID],
    s_init.[Units],
    s_init.[Cost],
    s_init.[Gross Profit]
FROM 
    SalesInitial s_init
WHERE 
    s_init.[Country/Region] = 'United States';
GO