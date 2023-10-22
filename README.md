## Overview

The primary goal of this project is to help our retail client to use data for better decision-making. We have built a strong data system that includes an Operational Data Store (ODS) and a Data Warehouse. This project includes the tasks of combining, refining, and organizing data, developing analytical models, and showcasing the outcomes in a user-friendly manner using data visualizations and dashboards.

## Software requirements:
- MS SQL Server, SSMS, SSIS, SSAS, SSRS, Power BI, Tableau
- Windows OS

## Enterprise Data Warehouse was built in MSSQL Server using SSMS
- Completed database lifecycle management including installation, upgrade, troubleshooting, migration, and security.
- Work closely with Managers, Project Managers, Technical Product Managers, clients, and subject-matter experts to obtain requirements, objectives, and business rules for projects.
- Conducted stakeholder analysis and requirements gathering sessions, aligning data with business needs.
- Designed Conceptual and Logical data models for the OLTP Operational Data Store (ODS) and implemented Physical Data models using Bill Inmon’s Relational Modeling Techniques in the MS SQL Server using SSMS.
- Created the opportunity/stakeholder Matrix (it helps identify which business groups should be invited to the collaborative design sessions for each process-centric row).
- Created Bus Matrix (composition of Business process, Granularity, Facts, Fact Tables, and Dimensions).
- Designed and implemented Enterprise Data Warehouse (EDW) using Ralph Kimball’s Dimensional Modelling approach.
- Created and configured Staging, EDW, and Control Framework databases on MS SQL Server. 

  ![Purchase Analysis](https://github.com/sshahidul29/Supply-Chain-Data-Modernization/blob/main/Figures/SCODS.PNG)  

Figure 1: OLTP Operational Data Store (ODS) using Bill Inmon’s Relational Modeling Techniques (Normalized to 3NF).

  ![Purchase Analysis](https://github.com/sshahidul29/Supply-Chain-Data-Modernization/blob/main/Figures/SCEDW.PNG)  

Figure 2: Enterprise Data Warehouse using Ralph Kimball’s Dimensional Modelling Approach.

## ETL Pipeline was built in Visual Studio using SSIS

- The project aimed to create an ETL (Extract, Transform, and Load) pipeline for data extraction, transformation, and loading into SQL Server Databases from the CSV and OLE DB data sources.
- Designed SQL Server Integration Service (SSIS) packages and wrote T-SQL scripts for extraction, transformation, and loading (ETL) of data from different data sources to ODS, ODS to a staging area, and eventually to the 
  data warehouse.
- Design and Implement Ralph Kimball slowly changing dimension (SCD) Type 1 and 2 using SQL Server Integration Services (SSIS) data flow transformation.
- Created a metric table for an audit of Source Count, Pre-Count, Destination Count, and Post Count for ODS, Source Count, and Destination Count Staging database, and Pre, Current, Post, Type1, and Type2 Counts for EDW using the Control framework database.
- Troubleshooting and root cause analysis activities to fix bugs in the data integration process. 
- Implemented server agent for automated data loading and scheduling.
  
![Purchase Analysis](https://github.com/sshahidul29/Supply-Chain-Data-Modernization/blob/main/Figures/ODSETL1.PNG) 

 Figure 3: Control-flow diagram for ETL Pipeline from flat file source to ODS

  ![Purchase Analysis](https://github.com/sshahidul29/Supply-Chain-Data-Modernization/blob/main/Figures/ODSETL2.PNG) 

 Figure 4: Data-flow diagram of ETL Pipeline from flat file source to ODS Product table

  ![Purchase Analysis](https://github.com/sshahidul29/Supply-Chain-Data-Modernization/blob/main/Figures/ODSETL3.PNG) 

Figure 5: Data-flow diagram for Incremental load of ETL Pipeline from flat file source to ODS Purchase transactions table

![Purchase Analysis](https://github.com/sshahidul29/Supply-Chain-Data-Modernization/blob/main/Figures/SCETL4.PNG) 

 Figure 6: Control-flow diagram for ETL Pipeline for EDW

  ![Purchase Analysis](https://github.com/sshahidul29/Supply-Chain-Data-Modernization/blob/main/Figures/SCETL5.PNG) 

 Figure 7: Data-flow diagram of ETL Pipeline for EDW Dimension table

  ![Purchase Analysis](https://github.com/sshahidul29/Supply-Chain-Data-Modernization/blob/main/Figures/SCETL6.PNG) 

Figure 8: Data-flow diagram for Incremental load of ETL Pipeline EDW Fact table

![Sales Analysis](https://github.com/sshahidul29/Sales-and-Procurement-Data-Integration-and-Analytics-Framework/blob/main/Figures/Control.PNG)

Figure 9: Control-flow diagram for ETL Pipeline to automate the system through SQL Server Agent

## Datamart was built using SSAS for Business Users

- Cubes were built using SQL Server Analysis Services (SSAS) for multi-dimensional and Tabular analysis for business users. These cubes supported interactive dashboards and data visualizations for informed decision-making.

![Purchase Analysis](https://github.com/sshahidul29/Supply-Chain-Data-Modernization/blob/main/Figures/SCM.PNG)  

Figure 10: Purchase Cube for Multidimensional Analysis

![Purchase Analysis](https://github.com/sshahidul29/Supply-Chain-Data-Modernization/blob/main/Figures/SCT.PNG)  

Figure 11: Purchase Cube for Tabular Analysis
