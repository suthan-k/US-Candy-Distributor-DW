-------------------------------------------------------
-- Check the data before and after the ETL with SSIS
-------------------------------------------------------

SELECT * FROM CandyDistributionDW.dbo.FactoryDim
SELECT * FROM CandyDistributionDW.dbo.LocationDim
SELECT * FROM CandyDistributionDW.dbo.CustomerDim
SELECT * FROM CandyDistributionDW.dbo.ProductDim
SELECT * FROM CandyDistributionDW.dbo.ShipModeDim
SELECT * FROM CandyDistributionDW.dbo.DateDim

SELECT * FROM CandyDistributionDW.dbo.DistributionFact