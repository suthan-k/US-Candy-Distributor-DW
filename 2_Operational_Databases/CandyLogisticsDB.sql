--------------------------------------------------------
-- Create the CandyLogisticsDB Database and its tables
--------------------------------------------------------

-- Create and use the database
CREATE DATABASE CandyLogisticsDB;
GO

USE CandyLogisticsDB;
GO

-- Initial table to load uszips.csv
CREATE TABLE LocationsInitial (
    zip VARCHAR(50),
    city VARCHAR(100),
    state_id VARCHAR(50),
    state_name VARCHAR(50),
    lat VARCHAR(50),
    lng VARCHAR(50)
);
GO

---------------------------------------
-- Create the Final Normalized Tables 
---------------------------------------

-- Create Regions table
CREATE TABLE Regions (
    RegionID INT IDENTITY(1,1) NOT NULL,
    RegionName VARCHAR(50),
    PRIMARY KEY (RegionID)
);
GO

-- Create Locations table
CREATE TABLE Locations (
    Zip VARCHAR(50) NOT NULL,
    City VARCHAR(100),
    StateName VARCHAR(50),
    Latitude FLOAT,
    Longitude FLOAT,
    PRIMARY KEY (Zip)
);
GO