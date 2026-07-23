# 📊 Executive Regional Sales & Performance Analytics (Excel & Power Pivot)

## 📌 Project Overview
This module focuses on building an **automated, interactive executive dashboard** in Microsoft Excel using **Power Query**, **Power Pivot (Data Modeling)**, and **VBA Macro Automation**. 

The main objective is to analyze **Regional Sales, Expenses, and Budget Variance** to help management make fast, data-driven business decisions regarding profitability and regional performance.

---

## 🛠️ Data Pipeline & Technical Architecture

```text
Raw Synthetic Data ➡️ Power Query (ETL & M-Code) ➡️ Power Pivot (Star Schema) ➡️ Dynamic Visuals & VBA ➡️ Executive Dashboard
```
---
1) ETL & Data Transformation: Importing multi-table raw data directly through the Excel Data Tab into Power Query. 
<br>
<br>
<img width="960" height="501" alt="ETL" src="https://github.com/user-attachments/assets/a1a12d56-021e-4996-840b-b21bde7ae3fd" />
<br>
<br>
2) Custom Date Dimension: Creating a continuous 3-year Calendar table using custom M-Code.
<br>
<br>
<img width="956" height="486" alt="EXCEL_ETL CUSTOM" src="https://github.com/user-attachments/assets/5b07d1f4-720b-439b-8779-95e055a44e65" />
<br>
<br>
---
3) Data Modeling: Establishing relationships in Power Pivot using a Star Schema architecture.
<br>
<br>
<img width="960" height="368" alt="sales relationship" src="https://github.com/user-attachments/assets/d616283c-5f2b-4797-8dee-e737a5f6fa6e" />
<br>
<br>
4) Interactive Dashboarding: Designing KPI Cards, Pivot Charts, and a dynamic VBA Macro-enabled button for manager-level        reporting.
<br>
<br>
<img width="900" height="400" alt="sales dashbord high light" src="https://github.com/user-attachments/assets/22f08282-5833-4838-85d3-c5d3e8631e46" />
<br>
<br>
🔄 Phase 1: Data Cleaning & Transformation (Power Query)
<br>
Data Ingestion: Imported raw datasets (sales_data, expense_data, budget_data, customer_data, region_table) into Power Query.
<br>
<br>
<img width="960" height="501" alt="ETL" src="https://github.com/user-attachments/assets/aea885d1-304a-4201-8941-dededced5cc6" />
<br>
<br>
Transformation Steps: Promoted headers, fixed data types and corrected column name mismatches.
<br>
<br>
<img width="951" height="496" alt="uwx1q5Dwig" src="https://github.com/user-attachments/assets/da293238-4f50-47bb-9cf9-014fa5a71ba0" />
<br>
<br>
Custom Calendar Table Creation: Generated a dynamic Date table spanning 3 years using the following M-Code:

Code 
= List.Dates(#date(2023,1,1), 1096, #duration(1,0,0,0))
<br>
Converted the list into a structured table and set correct data types for seamless Time-Intelligence analysis.
<br>
<br>
<img width="956" height="486" alt="EXCEL_ETL CUSTOM" src="https://github.com/user-attachments/assets/ce75194e-14cb-4266-8164-4bc64271f505" />
<br>
<br>
📐 Phase 2: Data Modeling in Power Pivot (Star Schema)
<br>
Instead of relying on heavy VLOOKUP formulas, tables were loaded into the Power Pivot Data Model to ensure faster performance and clean relational structure.
<br>
<br>
<img width="690" height="292" alt="pivot analysis" src="https://github.com/user-attachments/assets/75395860-12b4-465c-9e6b-dd21f57d009c" />
<br>
<br>
Model Architecture:
Fact Tables: sales_data, expense_data, budget_data

Dimension Tables: customer_data, region_table, date_table

Relationships: Connected Fact and Dimension tables via 1-to-Many relationships, forming a robust Star Schema.
<br>
<br>
<img width="542" height="368" alt="sales relationship2" src="https://github.com/user-attachments/assets/8c7162c1-1526-4903-b679-469d4ff808dd" />
<br>
<br>
⚙️ Phase 3: Automation via VBA Macro
To make the dashboard interactive for senior management, a VBA Macro was integrated and assigned to an on-screen button.
<br>
<br>
<img width="159" height="226" alt="sales dashbord high light vba" src="https://github.com/user-attachments/assets/6b5dd683-7140-423c-847b-308cdf590d94" />
<br>
<br>
Functionality: Allows managers to dynamically filter and view Top N Customers by Revenue with a single click.

User Experience (UX): Eliminates manual filtering, giving executives immediate access to top revenue-generating accounts.
<br>
<br>
VBA 
Sub TopN_Customers()
    Dim pt As PivotTable
    Dim nValue As Long

    On Error GoTo ErrHandler

    'S39 se value lo, blank hai to 10 default
    If IsNumeric(Sheet2.Range("S39").Value) And Sheet2.Range("S39").Value > 0 Then
        nValue = Sheet2.Range("S39").Value
    Else
        nValue = 10 'Default Top 10
        Sheet2.Range("S39").Value = 10
    End If

    Set pt = Sheets("Sheet2").PivotTables("PivotTable6")

    'Screen update rok do, fast chalega
    Application.ScreenUpdating = False

    With pt.PivotFields("[Customer_Data].[Customer_Name].[Customer_Name]")
       .ClearAllFilters 'Pehle purana filter hatao
       .PivotFilters.Add2 Type:=xlTopCount, _
            DataField:=pt.CubeFields("[Measures].[Sum of Sales_Amount]"), _
            Value1:=nValue
    End With

    Application.ScreenUpdating = True
    Exit Sub

ErrHandler:
    Application.ScreenUpdating = True
    MsgBox "Error: " & Err.Description & vbCrLf & _
           "Check karo: 1. S39 mein number hai? 2. Measure ka naam sahi hai?", vbCritical
End Sub
<br>
<br>
<br>
📈 Phase 4: Final Executive Dashboard Layout
All key metrics were consolidated into a clean, single-sheet Executive Dashboard:
<br>
<br>
<img width="960" height="501" alt="sales dashbord" src="https://github.com/user-attachments/assets/264dee5e-91c0-4ac3-bd8d-478be0064f39" />
<br>
<br>
Key Features:
KPI Header Cards: Displays high-level summaries for Total Sales ($11.81M), Total Expenses ($17.13M), Total Budget Expense ($31.61M), and Net Loss/Profit Status.
<br>
<br>
<img width="960" height="100" alt="kpis" src="https://github.com/user-attachments/assets/b3f793d7-9da0-4ecb-b6aa-98f61953fb1c" />
<br>
<br>
Regional Performance Trackers: Side-by-side comparison of Revenue vs. Budget Target per region (East, West, North, South).
<br>
<br>
<img width="391" height="230" alt="sales dashbord high light3" src="https://github.com/user-attachments/assets/62e4e926-1403-4f00-a2fb-009d5a6d1566" />
<br>
<br>
Category Breakdown: Donut/Pie charts highlighting revenue shares across Product Categories (Electronics, Furniture, Office Supplies).
<br>
<br>
<img width="222" height="167" alt="r 2" src="https://github.com/user-attachments/assets/140c7889-6731-4e46-9054-685280eaefb8" />
<br>
<br>
Target Variance Indicators: Dynamic status cards showing whether regional performance is "GOOD" or "BAD" based on target thresholds.
<br>
<br>
<img width="960" height="146" alt="r3" src="https://github.com/user-attachments/assets/fe908d43-56d3-48d0-908d-2b8d51fbb9e4" />
<br>
<br>
💡 Business Value & Key Insights
Target Tracking: Managers can instantly see which regions are lagging behind budget goals (e.g., West region driving major volume vs. North overshooting expenses).

Expense Control: Pinpoints specific expense categories (Marketing, Logistics, Salaries) contributing to operational losses.

Customer Retention: The dynamic VBA top-customer view helps sales heads identify VIP accounts that generate over 40% of overall sales volume.
<br>
<br>
<img width="960" height="502" alt="sales dashbord" src="https://github.com/user-attachments/assets/2687c28a-9d5d-46ea-b270-ad28690d97e4" />


