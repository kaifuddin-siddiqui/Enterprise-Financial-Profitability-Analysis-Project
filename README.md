# Enterprise-Financial-Profitability-Analysis-Project
End-to-End Analysis of Regional Sales &amp; Expenses using **Excel** (VBA Macros, Cleaning &amp; Pivot), **SQL** (Complex Querying), and **Power BI** (Enterprise Financial &amp; Profitability Dashboard) to **drive business decisions**.

# 💼 Enterprise Financial & Profitability Analysis (End-to-End Data Project)

## **📌 Project Overview**
This repository contains a complete, **Enterprise Financial & Profitability Analysis project**. The project demonstrates a real-world data analytics pipeline—starting from raw data processing in **Excel**, advanced relational querying in **PostgreSQL**, to interactive data modeling and dashboarding in **Power BI**.

---

## 🗂️ Project Modules & Sub-Folder Documentation

**This project is organized into 3 main modules. You can click on the links below to view full details for each tool:**

### 1️⃣ Excel Data Processing & Analysis (`1-Regional Sales & Expense Performance Analysis`)
* **What was done:**
<br>

* **Data Cleaning**: Imported raw data into Power Query inside Excel for initial transformation.
  <br>
  <br>
<table>
  <tr>
 <td><img width="960" height="501" alt="ETL" src="https://github.com/user-attachments/assets/2ae8c397-ba3e-45c7-bc0e-d0f058da3d9c" /></td>
 <td><img width="956" height="486" alt="EXCEL_ETL CUSTOM hi" src="https://github.com/user-attachments/assets/a8b4c87b-e61c-4a84-9e86-f55c3c5af655" /></td>
  <td><img width="960" height="540" alt="EXCEL_AcjNeyvibv" src="https://github.com/user-attachments/assets/60136537-f438-41ef-ba44-483ebf490cb8" /></td>
  </tr>
</table>
<br>
<br>

* **Data Modeling**: Loaded the data into Excel and built a Star Schema relationship.
<br>
<table>
  <tr>
 <td><img width="960" height="368" alt="sales relationship" src="https://github.com/user-attachments/assets/924ea953-8ab2-447c-851a-d3f7f835bc5c" /></td>
 <td><img width="542" height="368" alt="sales relationship2" src="https://github.com/user-attachments/assets/8c9731d2-ba53-470a-817f-fe1f3c5e3f38" /></td>
  </tr>
</table>
<br>
<br>

* **Analysis & Visualization**: Created Pivot Tables to analyze performance and built an interactive Excel Dashboard.
<br>
<table>
  <tr>
 <td><img width="690" height="292" alt="pivot analysis" src="https://github.com/user-attachments/assets/d1180257-dd39-4aa4-aa02-a6564427e07f" /></td>
 <td><img width="541" height="267" alt="sales dashbord" src="https://github.com/user-attachments/assets/56ae0d37-b5a6-4c89-9099-2eebe7a5ca03" /></td>
  </tr>
</table>
<br>

* 🔗 **For full details & step-by-step documentation:**
  
  👉 **[Click here to view Excel README](<./Excel_Regional Sales & Expense Performance Analysis/README.md>)**

---

### 2️⃣ PostgreSQL Database & Advanced SQL Queries (`2-SQL-Enterprise Financial & Profitability Analysis`)
* **What was done:**
<br>

* **Schema Creation**: Exported Excel tables into separate files and created matching tables in PostgreSQL (`finance_project`).
<br>
<br>
<table>
  <tr>
 <td><img width="286" height="300" alt="pgAdmin4_ic7mdsales create" src="https://github.com/user-attachments/assets/7751f0d2-2740-43fa-bf2c-b01e835dc506" /></td>
 <td><img width="960" height="540" alt="pgAdmin4_FFCEpYhl3o" src="https://github.com/user-attachments/assets/ce901d19-79bd-4114-835e-d75f362c5668" /></td>
 <td><img width="282" height="242" alt="pgAdmin4_ customer" src="https://github.com/user-attachments/assets/c237c217-fa49-4c73-a268-cac9d9a1e55a" /></td>
  </tr>
</table>
 <br>
  
* **Data Loading**: Imported the data files directly into the PostgreSQL database.
  <br>
  <br>
  <img width="960" height="503" alt="Zn55n6U7zh" src="https://github.com/user-attachments/assets/fc20f915-cccd-417e-a17d-b1adf6185757" />
 <br>
 
* **SQL Querying**: Wrote SQL queries & analytical Views to answer business questions, such as finding Total Revenue by Category, performed Budget vs. Actual variance analytics, and used advanced Window Functions (`RANK() OVER`, `LAG() OVER`) for MoM growth tracking.
 <br>
<table>
  <tr>
 <td><img width="685" height="156" alt="pgAdmin4_smYPaC1glS" src="https://github.com/user-attachments/assets/0d30b346-d53e-480a-a81b-1c0bc85da95e" /></td>
 <td><img width="702" height="210" alt="pgAdmin4_xlLIIZoqVi" src="https://github.com/user-attachments/assets/2932f29c-7822-42ac-be8a-aba49e3baadc" /></td>
 <td><img width="389" height="284" alt="1XChnXLUe5" src="https://github.com/user-attachments/assets/5e84277c-09c0-4df1-a6c7-dde341710173" /></td>
 <td><img width="600" height="384" alt="pgAdmin4_PrRwrKk2YI" src="https://github.com/user-attachments/assets/4dd3150b-6a1a-4c8a-9547-3f31a74fffc9" /></td>
  </tr>
</table>
 <br>
  
* 🔗 **For full SQL query code & database screenshots:**
 <br>
   <br>
    <br>
  👉 **[Click here to view SQL Analysis README](<./SQL_Enterprise Financial & Prfitability Analysis FILE/README.md>)**

---

### 3️⃣ Power BI Interactive Dashboard & Scenario Modeling (`3-PowerBI-Enterprise Financial & Profitability Analysis Dashbord`)
* **What was done:**
  <br>
* **Built a 6-page interactive dashboard based on a Star Schema data model. Implemented DAX measures, Field Parameters for dynamic metric switching, and What-If Parameters to simulate EBITDA sensitivity.**
  <br>
  <br>
<table>
  <tr>
 <td><img width="692" height="462" alt="6)What if analysis" src="https://github.com/user-attachments/assets/abb90301-19fe-44f4-b644-24923743e75f" /></td>
<td><img width="692" height="88" alt="6)What if analysis sales" src="https://github.com/user-attachments/assets/990eb7f0-e63d-45af-8147-5e3ee555352a" /></td>
<td><img width="692" height="89" alt="6)What if analysis expense" src="https://github.com/user-attachments/assets/cd70f704-c879-46aa-bfd3-453d6441e5dc" /></td>
<td><img width="181" height="292" alt="6)What if analysis wse" src="https://github.com/user-attachments/assets/9ff510e5-eea0-45e0-9751-b45a6d3d31c7" /></td>
  </tr>
</table>
  <br>
  
* **ETL Pipeline**: Connected the raw Excel data to Power BI and used Power Query to fix and optimize data types.
   <br>
  <br>
<table>
  <tr>
 <td><img width="960" height="503" alt="PBIDesktop_vuu8E1ke1d" src="https://github.com/user-attachments/assets/3328e573-7af9-4f9a-9a09-d061280c8556" /></td>
<td><img width="960" height="503" alt="date bi " src="https://github.com/user-attachments/assets/4e9508b3-89fe-4bb0-8e51-c30609c5006b" /></td>
<td><img width="960" height="509" alt="2 bi" src="https://github.com/user-attachments/assets/a556e336-86e9-4f35-90fb-9b85d3bc6053" /></td>
<td><img width="960" height="507" alt="3 bi" src="https://github.com/user-attachments/assets/4918d91f-4751-4bff-b3b2-a0da4951b914" /></td>
  </tr>
</table>
 <br>
  
* **Advanced Modeling**: Created a robust Star Schema using data modeling best practices.
  <br>
  <br>
  <img width="960" height="469" alt="data modling" src="https://github.com/user-attachments/assets/87df011b-996d-4d4f-b748-2ba872c85d7d" />
 <br>
 
* **DAX & Insights**: Wrote DAX (calculated measures) to compute key business metrics.
  <br>
  <br>
  <img width="960" height="481" alt="mesure shot1" src="https://github.com/user-attachments/assets/89baf911-57cf-4183-b943-0a6dd87b50c8" />
 <br>

* **Interactive Dashboard**: Built a dynamic, user-friendly Power BI Dashboard to visualize regional sales and expense performance & What-If Parameters to simulate EBITDA sensitivity.
  <br>
 <table>
  <tr>
 <td><img width="676" height="407" alt="1)Executive Financial Overview" src="https://github.com/user-attachments/assets/7e56e15a-55fd-4f59-bf3a-67001212f883" /></td>
 <td><img width="684" height="407" alt="PBIDesktop_SEkuz0B98M" src="https://github.com/user-attachments/assets/715a00e0-bc9a-453d-ba1b-77afbc87d6de" /></td>
  </tr>
</table>
 <br>
  
* 🔗 **For full Power BI dashboard layout & DAX measures:**
   <br>
   <br>
    <br>
    
  👉 **[Click here to view Power BI README](<./POWER BI Enterprise Financial & Profitability Analysis Dashboard/README.md>)**

---

## 🛠️ Tech Stack & Tools
* **Excel:** Power pivot report(Star Schema Data Modeling) & Dashboard
* **PostgreSQL (pgAdmin 4):** Relational Schema, DDL, DML, CTEs, Views, Window Functions (`RANK`, `LAG`)
* **Power BI & Power Query:** M-Code Date Table, Star Schema Data Modeling, DAX, Field Parameters, What-If Parameters

---

## 📁 Repository Directory Structure

```text
📁 Enterprise-Financial-Profitability-Analysis-Project/
 │
 ├── 📁 1-Excel_Regional Sales & Expense Performance Analysis/
 │    ├── 📄 Excel_Regional Sales & Expense Performance Analysis.xlsm
 │    └── 📄 README.md                      <-- Excel Sub-README
 │
 ├── 📁 2-POWER BI Enterprise Financial & Profitability Analysis Dashboard/
 │ │  ├── 📊 Enterprise Financial & Profitability Analysis Dashboard.pbix 
 │    └── 📄 README.md                      <-- Power BI Sub-README

 ├── 📁 3-SQL_Enterprise Financial & Prfitability Analysis FILE/
 │    ├── 📄 Enterprise Financial & Prfitability Analysis.sql
 │    └── 📄 README.md                      <-- SQL Sub-README
 │    └── 📄 budget_data.csv                   <-- Csv files(Synthetic Data)
      └── 📄 customer_data.csv                      
 │    └── 📄 expense_data.csv                     
 │    └── 📄 sales_data.csv  
 └── 📄 README.md                           <-- Main Repository README (This File)  
 │
 ├── 📄 Raw_data_sales_&_expense.xlsx       <-- Raw Excel file(Synthetic Data)
 ```
