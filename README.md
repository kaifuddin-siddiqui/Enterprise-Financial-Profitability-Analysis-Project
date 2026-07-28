# Enterprise-Financial-Profitability-Analysis-Project
End-to-End Analysis of Regional Sales &amp; Expenses using Excel (VBA Macros, Cleaning &amp; Pivot), SQL (Complex Querying), and Power BI (Enterprise Financial &amp; Profitability Dashboard) to drive business decisions.

# 💼 Enterprise Financial & Profitability Analysis (End-to-End Data Project)

# **📌 Project Overview**
This repository contains a complete, Enterprise Financial & Profitability Analysis project. The project demonstrates a real-world data analytics pipeline—starting from raw data processing in Excel, advanced relational querying in PostgreSQL, to interactive data modeling and dashboarding in Power BI.
---

## 🗂️ Project Modules & Sub-Folder Documentation

**This project is organized into 3 main modules. You can click on the links below to view full details for each tool:**

### 1️⃣ Excel Data Processing & Analysis (`1-Regional Sales & Expense Performance Analysis`)
* **What was done:**
* **Data Cleaning**: Imported raw data into Power Query inside Excel for initial cleaning and transformation.
* **Data Modeling**: Loaded the data into Excel and built a Star Schema relationship.
* **Analysis & Visualization**: Created Pivot Tables to analyze performance and built an interactive Excel Dashboard.

  
* 🔗 **For full details & step-by-step documentation:**
  
  👉 **[Click here to view Excel README](./1-Excel-Analysis/README.md)**

---

### 2️⃣ PostgreSQL Database & Advanced SQL Queries (`2-SQL-Enterprise Financial & Profitability Analysis`)
* **What was done:**
* **Schema Creation**: Exported Excel tables into separate files and created matching tables in PostgreSQL (`finance_project`).
* **Data Loading**: Imported the data files directly into the PostgreSQL database.
* **SQL Querying**: Wrote SQL queries & analytical Views to answer business questions, such as finding Total Revenue by Category, performed Budget vs. Actual variance analytics, and used advanced Window Functions (`RANK() OVER`, `LAG() OVER`) for MoM growth tracking.
  
* 🔗 **For full SQL query code & database screenshots:**

  
  👉 **[Click here to view SQL Analysis README](./2-SQL-Analysis/README.md)**

---

### 3️⃣ Power BI Interactive Dashboard & Scenario Modeling (`3-PowerBI-Enterprise Financial & Profitability Analysis Dashbord`)
* **What was done:**
* Built a 6-page interactive dashboard based on a Star Schema data model. Implemented DAX measures, Field Parameters for dynamic metric switching, and What-If Parameters to simulate EBITDA sensitivity.
* ETL Pipeline: Connected the raw Excel data to Power BI and used Power Query to fix and optimize data types.
* Advanced Modeling: Created a robust Star Schema using data modeling best practices.
* DAX & Insights: Wrote DAX queries (measures and calculated columns) to compute key business metrics.
* Interactive Dashboard: Built a dynamic, user-friendly Power BI Dashboard to visualize regional sales and expense performance.
* 🔗 **For full Power BI dashboard layout & DAX measures:**  
  👉 **[Click here to view Power BI README](./3-PowerBI-Dashboard/README.md)**

---

## 🛠️ Tech Stack & Tools
* **Excel:** Data Audit, Cleaning, Formatting
* **PostgreSQL (pgAdmin 4):** Relational Schema, DDL, DML, CTEs, Views, Window Functions (`RANK`, `LAG`)
* **Power BI & Power Query:** M-Code Date Table, Star Schema Data Modeling, DAX, Field Parameters, What-If Parameters

---

## 📁 Repository Directory Structure

```text
📁 Enterprise-Financial-Analysis/
 │
 ├── 📁 1-Excel-Analysis/
 │    ├── 📄 Financial_Data_Cleaned.xlsx
 │    └── 📄 README.md                      <-- Excel Sub-README
 │
 ├── 📁 2-SQL-Analysis/
 │    ├── 📄 Enterprise_Financial_Queries.sql
 │    └── 📄 README.md                      <-- SQL Sub-README
 │
 ├── 📁 3-PowerBI-Dashboard/
 │    ├── 📊 Financial_Profitability_Dashboard.pbix
 │    └── 📄 README.md                      <-- Power BI Sub-README
 │
 └── 📄 README.md                            <-- Main Repository README (This File)
