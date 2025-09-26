------------------------------------------------------------------------------------------
-- Check initial tables data insertation ater importing data from the relevant CSV files
------------------------------------------------------------------------------------------

-- CandyManufacturingDB
SELECT * FROM CandyManufacturingDB.dbo.ProductsInitial
SELECT * FROM CandyManufacturingDB.dbo.FactoriesInitial

-- CandyLogisticsDB
SELECT * FROM CandyLogisticsDB.dbo.LocationsInitial

-- CandySalesDB
SELECT * FROM CandySalesDB.dbo.SalesInitial


---------------------------------------------------------------------------------------------------
-- Check data insertation in our final normalized tables after running the transformation scripts
---------------------------------------------------------------------------------------------------

-- CandyManufacturingDB
SELECT * FROM CandyManufacturingDB.dbo.Factories
SELECT * FROM CandyManufacturingDB.dbo.ProductCategories
SELECT * FROM CandyManufacturingDB.dbo.Products

-- CandyLogisticsDB
SELECT * FROM CandyLogisticsDB.dbo.Regions
SELECT * FROM CandyLogisticsDB.dbo.Locations

-- CandySalesDB
SELECT * FROM CandySalesDB.dbo.ShipModes
SELECT * FROM CandySalesDB.dbo.Customers
SELECT * FROM CandySalesDB.dbo.Orders
SELECT * FROM CandySalesDB.dbo.OrderDetails