----------------------------------------------------------
-- Clean and Transform Data into CandyLogisticsDB Tables
----------------------------------------------------------

-- Switch to the correct database context
USE CandyLogisticsDB;
GO

-- Populate the final Locations table
INSERT INTO Locations (Zip, City, StateName, Latitude, Longitude)
SELECT 
    REPLACE(zip, '"', ''),          -- Removes double quotes
    REPLACE(city, '"', ''),         -- Removes double quotes
    REPLACE(state_name, '"', ''),   -- Removes double quotes
    CAST(REPLACE(lat, '"', '') AS FLOAT), -- Removes double quotes & Converts from text to the correct number format FLOAT
    CAST(REPLACE(lng, '"', '') AS FLOAT)  -- Removes double quotes & Converts from text to the correct number format FLOAT
FROM LocationsInitial;
GO

-- Populate the Regions table with unique Region names from the sales data
INSERT INTO Regions (RegionName)
SELECT DISTINCT Region 
FROM CandySalesDB.dbo.SalesInitial 
WHERE Region IS NOT NULL AND [Country/Region] = 'United States'; -- Filter for US data only
GO