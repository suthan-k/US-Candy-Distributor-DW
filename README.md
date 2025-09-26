# **End-to-End Data Warehouse for US Candy Distributor**

## **Project Overview**

This project is a comprehensive, end-to-end implementation of a business intelligence and data warehousing solution. The primary goal was to analyze and enhance **supply chain efficiency** for a fictional US Candy Distributor. The project encompasses the entire BI lifecycle, from raw data ingestion and database normalization to ETL processing, data warehousing, and the final creation of operational reports and a strategic, interactive dashboard.

## **1\. Data Architecture & Schema Design**

The project followed a multi-layered architectural approach to ensure data integrity and analytical performance.

#### **Source Files \-\> Operational Databases \-\> Data Warehouse**

* **Operational Databases:** Raw source files were first normalized into three distinct OLTP databases (CandyManufacturingDB, CandySalesDB, CandyLogisticsDB) to simulate a real-world enterprise environment.  
* **Data Warehouse:** A dimensional model was designed using a **Star Schema**. This model is optimized for fast analytical queries and is the industry standard for BI tools.

## **2\. ETL Process using SSIS**

A robust ETL (Extract, Transform, Load) pipeline was developed in SQL Server Integration Services (SSIS) to populate the data warehouse from the operational databases.

#### **Key Transformations:**

* **Aggregate Transformation:** Resolved data quality issues by grouping transactional data to prevent primary key violations.  
* **Script Component:** Implemented a custom C\# script using the **Haversine formula** to calculate ShippingDistanceKM—a vital new metric that did not exist in the source data.  
* **Lookups:** Matched business keys to the surrogate keys in all six dimension tables to ensure referential integrity.

## **3\. Business Intelligence & Visualization**

The final BI solution was delivered through SSRS reports and an interactive Tableau dashboard.

### **SSRS Reports**

Four detailed, operational reports were created to answer specific business questions for stakeholders. This included parameterized, grouped, and matrix-style reports.  
(See the [5_SSRS_Reports folder](/5_SSRS_Reports) for the final PDFs.)

### **Tableau Dashboard**

A strategic, interactive dashboard was created to provide a high-level overview of supply chain efficiency. The live dashboard can be viewed on Tableau Public.  
(The packaged workbook (.twbx) is also available in the [6_Tableau_Dashboard folder.](/6_Tableau_Dashboard))

## **Project Links & Resources**

* **Tableau Public Dashboard:** [Tableau Dashboard](https://public.tableau.com/views/USCandyDistributor-SupplyChainEfficiencyAnalysis/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)  
* **Dataset Source:** [US Candy distributor Dataset](https://mavenanalytics.io/data-playground/us-candy-distributor?order=date_added%2Cdesc&search=US+Candy+Distributor&tags=Transportation)

## **Technologies Used**

* **Database:** Microsoft SQL Server  
* **ETL:** SQL Server Integration Services (SSIS)  
* **Reporting:** SQL Server Reporting Services (SSRS)  
* **Visualization:** Tableau  
* **Language:** T-SQL
