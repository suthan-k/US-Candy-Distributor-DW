## **SSIS ETL Pipeline for Data Warehouse**

This folder contains the documentation and visual representation of the ETL (Extract, Transform, Load) process built using SQL Server Integration Services (SSIS). The package is designed to populate the entire CandyDistributionDW data warehouse from the operational source databases.

### 

### **ETL Workflow Overview**

The ETL process is logically separated into two main stages to ensure referential integrity:

1. **Dimension Table Population:** First, all six dimension tables are loaded with unique, clean data from the source databases.  
2. **Fact Table Population:** Second, the fact table is loaded, using lookups against the newly populated dimension tables to find the correct surrogate keys.

### 

### **Part 1: Dimension Table Population**

Separate Data Flow Tasks were created to populate each of the six dimension tables: DateDim, FactoryDim, LocationDim, CustomerDim, ProductDim, and ShipModeDim.

The general process for each dimension was:

* **Extract:** Pull distinct records from the relevant source tables in the operational databases.  
* **Transform:** Perform any necessary data cleaning or minor transformations (e.g., handling nulls, deriving new columns).  
* **Load:** Load the clean data into the corresponding dimension table in the data warehouse.

This ensures that all master data is in place before the transactional fact data is processed.

### 

### **Part 2: Fact Table Population (DistributionFact)**

The core transactional logic is contained within a dedicated Data Flow Task for the fact table. Below is a step-by-step explanation of its components.

1. **Data Source:**  
   * Data is extracted from the operational databases using a SQL query with JOIN statements to combine all necessary transactional information.  
2. **Aggregate Transformation:**  
   * **Purpose:** To prevent primary key violations in the fact table.  
   * **Logic:** The source data was at a transaction-line level, but the fact table required data to be aggregated. This transformation groups the data by the business keys to ensure each row loaded is unique.  
3. **Script Component (Haversine Formula):**  
   * **Purpose:** To enrich the data by creating a new, valuable metric.  
   * **Logic:** A custom C\# script was implemented to calculate the geographical distance for each shipment. This script applies the **Haversine formula** to the source latitude/longitude data to calculate ShippingDistanceKM.  
4. **Lookup Transformations (x6):**  
   * **Purpose:** To find the correct surrogate keys for each dimension.  
   * **Logic:** Six separate lookup transformations match the business keys from the source data to the surrogate keys in the newly populated dimension tables (DateDim, FactoryDim, LocationDim, CustomerDim, ProductDim, ShipModeDim). This is essential for maintaining referential integrity in the star schema.  
5. **Data Destination:**  
   * The final transformed and enriched data is loaded into the DistributionFact table in the CandyDistributionDW data warehouse.

### 

### **Visual Representation**

Below are screenshots of the individual SSIS Data Flow Tasks for each dimension and the fact table, illustrating the entire ETL process.

**Customer Dimension Flow:**  
  ![Customer Dimension Data Flow](./ETL\_Screenshots/CustomerDim\_dataflow.png) 
  
**Date Dimension Flow:** 
  ![Date Dimension Data Flow](./ETL\_Screenshots/DateDim\_dataflow.png)  
  
**Factory Dimension Flow:**  
  ![Factory Dimension Data Flow](./ETL\_Screenshots/FactoryDim\_dataflow.png)  
  
**Location Dimension Flow:**  
  ![Location Dimension Data Flow](./ETL\_Screenshots/LocationDim\_dataflow.png)  
  
**Product Dimension Flow:**
  ![Product Dimension Data Flow](./ETL\_Screenshots/ProductDim\_dataflow.png)  
  
**Ship Mode Dimension Flow:**
  ![Ship Mode Dimension Data Flow](./ETL\_Screenshots/ShipModeDim\_dataflow.png)
  
**Distribution Fact Table Flow:**  
  ![Distribution Fact Data Flow](./ETL\_Screenshots/DistributionFact\_dataflow.png)
