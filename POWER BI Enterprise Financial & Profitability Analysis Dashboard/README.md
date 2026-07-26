# 📊 Enterprise Financial & Profitability Analysis (Power BI Dashboard)

## 📌 Project Overview
This project presents an interactive **Enterprise Financial & Profitability Analysis Dashboard** built using **Power BI**, **Power Query**, **data modelling** and **DAX**. 

The goal of this project is to analyze enterprise-wide business performance, including Revenue, Operational Expenses, Profit Margins (EBITDA), Regional Intelligence, Basic Customer Lifetime Value (CLV) Based on 3 years lifespan , and Budget Variances. Furthermore, it incorporates dynamic **What-If Scenario Analysis** to allow leadership to test sales growth and cost-reduction strategies in real time.

---

## 🏗️ Architecture & Technical Setup

### 1️⃣ Data Transformation (Power Query & M-Code)
* **ETL Pipeline:** Imported structured multi-table financial data (Sales, Expenses, Budget, Customer).
* **Custom M-Code Date Table:** Generated a clean, continuous Calendar table in Power Query using custom M-code:
  ```m
= {Number.From(#date(2023,1,1))..Number.From(#date(2025,12,1))}

  
Data Cleaning: updated data types, promoted headers, and verified foreign keys across dimension and fact tables.

2️⃣ Data Modeling (Star Schema)
Designed a clean Star Schema Data Model to ensure fast report responsiveness and accurate filtering:

Fact Tables: Sales_Data, Expense_Data, Budget_Data

Dimension Tables: Customer_Data, Date_Table

Relationships: Configured 1-to-Many (1:*) single-direction relationships between dimension primary keys and fact foreign keys.

🧮 Key DAX & Dynamic Features

1️⃣ Core Metrics (all_measures)

Total_sales: SUM(Sales_Data[Sales_Amount])

Total Expenses: SUM(Expense_Data[Amount])

Actual EBITDA:  [Total_sales]-[Total_expense]


EBITDA Margin %:

DAX
actual_EBITDA_MARGIN_% = 
DIVIDE(([Total_sales]-[Total_expense]),[Total_sales],0)

Customer Lifetime & Repeat Metrics: Basic CLV, Repeat Customer Count, and Repeat Customer %.

2️⃣ Field Parameters (Total_all)
Created Field Parameters to allow users to dynamically switch metrics across visuals using a single slicer selection:

Code snippet
Total_all = {
    ("Total order", NAMEOF('all_measures'[total_order]), 0),
    ("Total sales", NAMEOF('all_measures'[total_sales]), 1),
    ("Total expense", NAMEOF('all_measures'[total_expense]), 2),
    ("A_EBITDA", NAMEOF('all_measures'[A_EBITDA]), 3)
}


3️⃣ What-If Scenario Analysis (what_if_measures)
Configured Numeric Range Parameters (%_s_analysis for Sales Growth and %_e_analysis for Expense Reduction) to model dynamic future financial outcomes:

What-If Sales:

Code snippet
W_total_sales = [total_sales] * (1 + '%_s_analysis'[%_s_analysis Value])
What-If Expenses:

Code snippet
W_total_expense = [total_expense] * (1 - '%_e_analysis'[%_e_analysis Value])
What-If EBITDA: [W_total_sales] - [W_total_expense]

🖥️ Dashboard Layout & Pages
The dashboard consists of 6 specialized report pages:

📈 Executive Financial Overview: Comprehensive KPI summary showing Total Sales, Expenses, EBITDA, Budget Targets, and Revenue Variance across time periods.

💰 Profitability Analysis: Product and category performance, discount impact, and margin contribution.

🌐 Regional Performance Intelligence: Regional sales breakdown, order volume, and Year-over-Year (YoY) growth comparison.

👥 Customer Segmentation Analysis: Customer Lifetime Value (CLV), segment analysis (Corporate, Small Business, Consumer), and Top 10 customer rankings.

⚖️ Variance Analysis: Side-by-side comparison of Actual vs. Budgeted Revenue and Expenses across regions and expense types.

🔮 What-If Analysis: Interactive sensitivity testing where management can adjust sales and expense sliders to see what combination makes EBITDA positive.

💡 Key Business Takeaways
Expense Impact: High logistics and marketing expenses significantly impacted profitability in specific quarters.

Sensitivity Insight: Using What-If modeling, increasing sales by +15% while lowering operational expenses by -10% successfully turns negative operating profit into a positive EBITDA.

Key Segments: The Corporate segment and West Region generated the highest average order value and customer retention.
