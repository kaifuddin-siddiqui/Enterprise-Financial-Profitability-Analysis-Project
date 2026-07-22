# 📊 Executive Regional Sales & Performance Analytics (Excel & Power Pivot)

## 📌 Project Overview
This module focuses on building an **automated, interactive executive dashboard** in Microsoft Excel using **Power Query**, **Power Pivot (Data Modeling)**, and **VBA Macro Automation**. 

The main objective is to analyze **Regional Sales, Expenses, and Budget Variance** to help management make fast, data-driven business decisions regarding profitability and regional performance.

---

## 🛠️ Data Pipeline & Technical Architecture

```text
Raw Synthetic Data ➡️ Power Query (ETL & M-Code) ➡️ Power Pivot (Star Schema) ➡️ Dynamic Visuals & VBA ➡️ Executive Dashboard
```

1) ETL & Data Transformation: Importing multi-table raw data directly through the Excel Data Tab into Power Query. 
<br>
<br>
<br>
<img width="960" height="501" alt="ETL" src="https://github.com/user-attachments/assets/a1a12d56-021e-4996-840b-b21bde7ae3fd" />


2) Custom Date Dimension: Creating a continuous 3-year Calendar table using custom M-Code.

<img width="956" height="486" alt="EXCEL_ETL CUSTOM" src="https://github.com/user-attachments/assets/5b07d1f4-720b-439b-8779-95e055a44e65" />

3) Data Modeling: Establishing relationships in Power Pivot using a Star Schema architecture.

<img width="960" height="368" alt="sales relationship" src="https://github.com/user-attachments/assets/d616283c-5f2b-4797-8dee-e737a5f6fa6e" />

4) Interactive Dashboarding: Designing KPI Cards, Pivot Charts, and a dynamic VBA Macro-enabled button for manager-level        reporting.

<img width="541" height="267" alt="sales dashbord high light" src="https://github.com/user-attachments/assets/22f08282-5833-4838-85d3-c5d3e8631e46" />

🔄 Phase 1: Data Cleaning & Transformation (Power Query)
Data Ingestion: Imported raw datasets (sales_data, expense_data, budget_data, customer_data, region_table) into Power Query.

<img width="960" height="501" alt="ETL" src="https://github.com/user-attachments/assets/aea885d1-304a-4201-8941-dededced5cc6" />

Transformation Steps: Promoted headers, fixed data types and corrected column name mismatches.

<img width="951" height="496" alt="uwx1q5Dwig" src="https://github.com/user-attachments/assets/da293238-4f50-47bb-9cf9-014fa5a71ba0" />

Custom Calendar Table Creation: Generated a dynamic Date table spanning 3 years using the following M-Code:

Code 
= List.Dates(#date(2023,1,1), 1096, #duration(1,0,0,0))
Converted the list into a structured table and set correct data types for seamless Time-Intelligence analysis.
<img width="956" height="486" alt="EXCEL_ETL CUSTOM" src="https://github.com/user-attachments/assets/ce75194e-14cb-4266-8164-4bc64271f505" />


📐 Phase 2: Data Modeling in Power Pivot (Star Schema)
Instead of relying on heavy VLOOKUP formulas, tables were loaded into the Power Pivot Data Model to ensure faster performance and clean relational structure.

Model Architecture:
Fact Tables: sales_data, expense_data, budget_data

Dimension Tables: customer_data, region_table, date_table

Relationships: Connected Fact and Dimension tables via 1-to-Many relationships, forming a robust Star Schema.

⚙️ Phase 3: Automation via VBA Macro
To make the dashboard interactive for senior management, a VBA Macro was integrated and assigned to an on-screen button.

Functionality: Allows managers to dynamically filter and view Top N Customers by Revenue with a single click.

User Experience (UX): Eliminates manual filtering, giving executives immediate access to top revenue-generating accounts.
