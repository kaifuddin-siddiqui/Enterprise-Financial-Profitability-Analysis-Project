# 📊 Enterprise Financial & Profitability Analysis (Power BI Dashboard)

## 📌 Project Overview
This project presents an interactive **Enterprise Financial & Profitability Analysis Dashboard** built using **Power BI**, **Power Query**, **data modelling** and **DAX**. 

The goal of this project is to analyze enterprise-wide business performance, including Revenue, Operational Expenses, Profit Margins (EBITDA), Regional Intelligence, Basic Customer Lifetime Value (CLV) Based on 3 years lifespan , and Budget Variances. Furthermore, it incorporates dynamic **What-If Scenario Analysis** to allow leadership to test sales growth and cost-reduction strategies in real time.

---

## 🏗️ Architecture & Technical Setup

### 1️⃣ Data Transformation (Power Query & M-Code)
 **1) ETL Pipeline:** Imported structured multi-table financial data (Sales, Expenses, Budget, Customer).
<br>
<br>
<img width="960" height="503" alt="PBIDesktop_vuu8E1ke1d" src="https://github.com/user-attachments/assets/67bba526-6fdc-4c59-9767-af47a979db6f" />
<br>
<br>
<br>

**2) Custom M-Code Date Table:** Generated a clean, continuous Calendar table in Power Query using custom M-code:

  ```m

= {Number.From(#date(2023,1,1))..Number.From(#date(2025,12,1))} 
```
<br>
<br>
<img width="960" height="503" alt="date bi " src="https://github.com/user-attachments/assets/18574464-e8de-4fa9-a8fe-c3e7756e44c7" />
<br>
<br>
<br>

**3) Data Cleaning:** updated data types, promoted headers, and verified foreign keys across dimension and fact tables.
<br>
<br>
<br>
<img width="960" height="505" alt="power query bi" src="https://github.com/user-attachments/assets/d1feae97-491f-4cb8-b413-fe296f4988e8" />
<br>
<br>
<br>

### **2️⃣ Data Modeling (Star Schema)**
<br>
1) Designed a clean Star Schema Data Model to ensure fast report responsiveness and accurate filtering:

2) Fact Tables: Sales_Data, Expense_Data, Budget_Data

3) Dimension Tables: Customer_Data, Date_Table

4) Relationships: Configured 1-to-Many (1:*) single-direction relationships between dimension primary keys and fact foreign     keys.
<br>
<br>
<br>
<img width="960" height="469" alt="data modling" src="https://github.com/user-attachments/assets/d46477cb-44ab-4c9e-975a-b4405c3d3c80" />
<br>

## 🧮 Key DAX & Dynamic Features

### **1️⃣ Core Metrics (all_measures)**
<br>
<img width="960" height="481" alt="mesure shot1" src="https://github.com/user-attachments/assets/53e0af63-78b9-41fe-a7c4-9bc679c82e65" />
<br>
<br>

 ```m
Total_sales: SUM(Sales_Data[Sales_Amount])

Total Expenses: SUM(Expense_Data[Amount])

Actual EBITDA:  [Total_sales]-[Total_expense]
 ```
<img width="676" height="117" alt="1)Executive Financial Overview basic messures" src="https://github.com/user-attachments/assets/3f69380d-4cfb-4435-b5b5-3627e33e0be6" />
<br>
<br>
<img width="960" height="116" alt="PBIDesktop_6kp0Ro7WcN" src="https://github.com/user-attachments/assets/df97cf82-7fe1-4b94-bd62-d7023ff02aa6" />
<br>
<br>
<br>

 ```m
EBITDA Margin %:

DAX
actual_EBITDA_MARGIN_% = 
DIVIDE(([Total_sales]-[Total_expense]),[Total_sales],0)
 ```
---
<br>
<br>
<img width="713" height="347" alt="XCRb0f28LX" src="https://github.com/user-attachments/assets/c51ecdfa-251f-4a20-b748-4045c50b5d15" />
<br>
<br>

---
---

**Customer Lifetime & Repeat Metrics**: Basic CLV, Repeat Customer Count, and Repeat Customer %.
<br>
<br>
### **2️⃣ Field Parameters (Total_all)**

**Created Field Parameters to allow users to dynamically switch metrics across visuals using a single slicer selection:**

 ```m
Code 
Total_all = {
    ("Total_order", NAMEOF('all_measures'[Total_order]), 0),
    ("Total_sales", NAMEOF('all_measures'[Total_sales]), 1),
    ("Total_expense", NAMEOF('all_measures'[Total_expense]), 2),
     ("A_EBITDA", NAMEOF('all_measures'[A_EBITDA]), 3)
}
 ```
<table>
  <tr>
 <td> <img width="960" height="513" alt="fild " src="https://github.com/user-attachments/assets/de3590aa-66e4-4d5c-85a1-449fd2f60c7a" /></td>
<td><img width="960" height="473" alt="parmeter data bi" src="https://github.com/user-attachments/assets/5897a7de-9077-442f-b4ba-1f349f0a1fb1" /></td>
  </tr>
</table>
<br>
<br>

**dynamically switch metrics across visuals using a single slicer selection**:
<br>
<br>
<table>
  <tr>
  <td><img width="335" height="129" alt="3)Regional Performance Intelligence1png" src="https://github.com/user-attachments/assets/f3eda936-fb15-4bb2-bb5e-e120d45cc449" /></td>
 <td><img width="354" height="304" alt="4)Customer Segmentation Analysis2" src="https://github.com/user-attachments/assets/49b3c5da-b6b0-451c-b740-7571130be99f" /></td>
  </tr>
</table>
<br>
<br>

### **3️⃣ What-If Scenario Analysis (what_if_measures)**
<br>
<br>
<table>
  <tr>
 <td> <img width="960" height="475" alt="1 bi" src="https://github.com/user-attachments/assets/65bdf341-ef18-43a4-905f-6df35299f912" /></td>
<td><img width="960" height="482" alt="PBIDesktop_HLSMoqwZN3" src="https://github.com/user-attachments/assets/9f2af95c-7424-4a01-ab01-c57bf2c5a940" /></td>
<td><img width="960" height="492" alt="SqaTR5qoMd" src="https://github.com/user-attachments/assets/94efa11b-86aa-4f73-8e4a-330934fa89b8" /></td>
  </tr>
</table>
<br>
<br>

**Configured Numeric Range Parameters (%_s_analysis for Sales Growth and %_e_analysis for Expense Reduction) to model dynamic future financial outcomes**:
<br>
<table>
  <tr>
<td><img width="181" height="49" alt="6)What if analysis twse" src="https://github.com/user-attachments/assets/82587976-29ca-4d86-b0de-0c162dc93f7c" /></td>
<td><img width="181" height="55" alt="6)What if analysist wse" src="https://github.com/user-attachments/assets/0a6d4109-0740-457a-b856-b6cd0a7edee1" /></td>
<td><img width="181" height="50" alt="6)What if analysis wse ebtda" src="https://github.com/user-attachments/assets/7f058714-d663-4bfa-a542-eccf6ad09c42" /></td>
  </tr>
</table>
<br>

 ```m
What-If Sales:
DAX
W_Total_sales = [Total_sales]*(1+'%_anlysis'[%_anlysis Value])
 ```
<br>
<br>
<img width="692" height="88" alt="6)What if analysis sales" src="https://github.com/user-attachments/assets/836c9450-b995-422e-96c6-e67ddfc2ee13" />
<br>
<br>

 ```m
What-If Expenses:
DAX
W_total_expense = [Total_expense]*(1-'%_E_anlysis'[%_E_anlysis Value] )
 ```
 <br>
<br>
<img width="692" height="89" alt="6)What if analysis expense" src="https://github.com/user-attachments/assets/614bf72b-f9c6-481c-b1b6-59de9fb9e210" />

<br>
<br>
<br>

 ```m
DAX
Wse_EBITDA = what_if_messures[W_Total_sales]-what_if_messures[W_total_expense]
 ```

<table>
  <tr>
<td><img width="181" height="292" alt="6)What if analysis wse" src="https://github.com/user-attachments/assets/022bd1ce-273a-4196-bfdb-397886601b7b" /></td>
<td><img width="181" height="152" alt="6)What if analysis wse1" src="https://github.com/user-attachments/assets/03424e02-9931-4c8d-9284-a65dd0b80647" /></td>
  </tr>
</table>


# **🖥️ Dashboard Layout & Pages**

**The dashboard consists of 6 specialized report pages:**

**📈 Executive Financial Overview: Comprehensive KPI summary showing Total Sales, Expenses, EBITDA, Budget Targets, and Revenue Variance across time periods**.
<br>
<br>
<img width="676" height="407" alt="1)Executive Financial Overview" src="https://github.com/user-attachments/assets/5abfa6bd-2676-4f10-b28a-7b989a35cc0c" />
<br>
<br>
**💰 Profitability Analysis: Product and category performance, discount impact, and margin contribution**.
<br>
<br>
<img width="701" height="431" alt="2)Profitability Analysis" src="https://github.com/user-attachments/assets/db315e79-ec76-4c4a-88a4-c0037444f865" />
<br>
<br>
**🌐 Regional Performance Intelligence: Regional sales breakdown, order volume, and Year-over-Year (YoY) growth comparison**.
<br>
<br>
<img width="712" height="425" alt="3)Regional Performance Intelligence" src="https://github.com/user-attachments/assets/73024729-b205-4c30-a41e-501d3a5c1b15" />
<br>
<br>
**👥 Customer Segmentation Analysis: Basic Customer Lifetime Value (CLV) Based on 3 years lifespan, segment analysis (Corporate, Small Business, Consumer), and Top 10 customer rankings**.
<br>
<br>
<img width="707" height="420" alt="4)Customer Segmentation Analysis" src="https://github.com/user-attachments/assets/b9491b14-4f27-4d7b-a422-3bd33a5f443b" />
<br>
<br>
**⚖️ Variance Analysis: Side-by-side comparison of Actual vs. Budgeted Revenue and Expenses across regions and expense types**.
<br>
<br>
<img width="689" height="427" alt="5)Variance" src="https://github.com/user-attachments/assets/7b0b57c8-e2fb-466b-8989-88f97266caca" />
<br>
<br>
**🔮 What-If Analysis: Interactive sensitivity testing where management can adjust sales and expense sliders to see what combination makes EBITDA positive**.
<br>
<br>
<img width="692" height="462" alt="6)What if analysis" src="https://github.com/user-attachments/assets/9be23fc0-2d48-44bf-a64f-7677128b0053" />
<br>
<br>
# **💡 Key Business Takeaways**
**Expense Impact: High logistics and marketing expenses significantly impacted profitability in specific quarters**.
<br>
<br>
<table>
  <tr>
<td><img width="354" height="288" alt="PBIDesktop_vWkaal12UY" src="https://github.com/user-attachments/assets/b844d20f-50b4-48f9-b175-04a08ef8ada3" /></td>
<td><img width="692" height="190" alt="6)What if analysis diffrence" src="https://github.com/user-attachments/assets/37fc80dd-9122-4150-bd3b-2790a8842b18" /></td>
  </tr>
</table>
<br>
<br>

**Sensitivity Insight: Using What-If modeling, increasing sales by +X% while lowering operational expenses by -Y% successfully turns negative operating profit into a positive EBITDA**.
<br>
<br>
<img width="684" height="407" alt="PBIDesktop_SEkuz0B98M" src="https://github.com/user-attachments/assets/d61da04f-a419-4bfd-a3d4-f95ca184be54" />
<br>
<br>
**Key Segments: The Individual segment and West Region generated the highest average order value and customer retention**.
<br>
<br>
<img width="705" height="431" alt="UB8l9UBoQH" src="https://github.com/user-attachments/assets/a4cf3817-18fa-411f-8ff9-86d1a4871288" />
<br>
<br>
