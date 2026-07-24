# 🐘 Enterprise Financial & Profitability Analysis (PostgreSQL)

## 📌 Project Overview
This project focuses on performing deep-dive **Financial, Sales, and Profitability Analytics** using **PostgreSQL (pgAdmin 4)**. 

After cleaning and structuring multi-table datasets (Sales, Expenses, Budget, Customer, Region), the data was imported into a relational PostgreSQL database named `finance_project`. Advanced SQL concepts—including **Views, Common Table Expressions (CTEs), Window Functions (`RANK()`, `LAG()`), and Variance Analytics**—were applied to answer key business performance questions.

---

## 🛠️ Tech Stack & Database Architecture
* **Database Engine:** PostgreSQL (pgAdmin 4)
* **SQL Concepts Used:**
  * **DDL / Data Definition:** Table Schema creation (`CREATE TABLE`), Data Type casting (`CAST`).
  * **Data Aggregation & Views:** `CREATE VIEW`, `SUM()`, `COUNT()`, `GROUP BY`, `CASE WHEN`.
  * **Advanced Window Functions:** `RANK() OVER (PARTITION BY ...)` for customer ranking, `LAG() OVER ()` for MoM growth, running totals.
  * **CTEs & Relational Joins:** `WITH` clauses, `INNER JOIN`, `LEFT JOIN`, `COALESCE()`.

### 📂 Relational Tables Imported:
1. `sales_data` - Transaction-level sales, quantities, discounts, and revenue.
<br>
<br>
<img width="286" height="300" alt="pgAdmin4_ic7mdsales create" src="https://github.com/user-attachments/assets/be353c20-27f9-401d-87b3-aac472907808" />
<br>
<br>
2. `customer_data` - Customer details, segments (Corporate, Small Business, Consumer).
<br>
<br>
<img width="282" height="242" alt="pgAdmin4_ customer" src="https://github.com/user-attachments/assets/c748f838-02db-4989-9a47-bd79a0515cf1" />
<br>
<br>
3. `expense_data` - Operational expenses categorized by Marketing, Logistics, Salaries, etc.
 <br>
 <br>
 <img width="349" height="87" alt="pgAdmin4_U1q38g3NK4" src="https://github.com/user-attachments/assets/296b8b7f-cf9e-447f-bd38-8bf8dd148b0a" />
 <br>
 <br>
 <br>
4. `budget_data` - Regional and annual budget targets.
<br>
<br>
<img width="535" height="126" alt="pgAdmin4_budget and curstomer" src="https://github.com/user-attachments/assets/2021a5d1-5014-409f-8c75-f68d414b1b56" />

<br>

<br><br>

---

## 📊 Key Business Analysis & SQL Implementation

### 1️⃣ Revenue & Discount Analysis (Product, Category & Region)
* Created modular Views (`total_revenue_by_product`, `total_revenue_by_category`, `total_revenue_by_region`) to aggregate total sales, total orders, discount percentages, and net revenue.
* Implemented automated validation checks (`CASE WHEN ... END AS validation_check`) to verify calculation accuracy across transactions.
 <br>
 <br>
  <img width="685" height="156" alt="pgAdmin4_smYPaC1glS" src="https://github.com/user-attachments/assets/8e60d0fb-fa54-42a2-ad04-e12e6eab9d77" />
<br>
<br>
```sql
-- View: Total Revenue by Product Category
CREATE VIEW total_revenue_by_category as
SELECT category,SUM(quantity)as total_order,
SUM(before_discount_amount)as total_revenue_before_discount,
SUM(discount_amount)as total_discount,
 CAST(SUM(discount_amount)/SUM(before_discount_amount)*100 AS DECIMAL(10,2))||'%'AS discount_in_percent,
SUM(sales_amount)as Total_revenue,
CASE
WHEN(sum(before_discount_amount)-SUM(sales_amount))=SUM(discount_amount)THEN
'correct'ELSE'not' END AS checking
FROM sales_data
group by category
order by total_revenue desc;
<br>
<br>
<br>
2️⃣ Expense vs. Revenue & Regional Profitability (EBITDA)
Calculated regional net profitability by comparing actual sales against operational expenses.

Used conditional logic to flag performance status as profit or loss.
<br>
<br>
<img width="462" height="203" alt="jZF0aS3rzl" src="https://github.com/user-attachments/assets/8fd75dcd-9469-4245-bfbe-21918bc3aa8f" />
<br>
<br>
-- Region-wise Actual Revenue vs Expense & Profitability
create view actual_revenue as
with
 region_sales as
(select region,sum(sales_amount)as revenue from sales_data group by region),
region_expense as
(select region,sum(amount)as expense from expense_data group by region )
select r. region, r. revenue, e.expense,
case
 when
r.revenue>e.expense then r.revenue-e.expense
else e.expense-r.revenue end as profit_and_loss_EBITDA,
case
when r.revenue>e.expense then 'profit'else'loss'end as statement
from region_sales r
 join region_expense e
 on r.region = e.region;
<br>
<br>
<br>
3️⃣ Budget vs. Actual Variance Analytics
Analyzed performance targets by comparing budgeted revenue against actual revenue per region and per month.

Calculated variance percentage and automatically flagged targets as achieve or miss_target.
<br>
<br>
<img width="702" height="210" alt="pgAdmin4_xlLIIZoqVi" src="https://github.com/user-attachments/assets/ef91722d-a16e-4452-a4d1-3896f1e6fdd3" />
<br>
<br>
<img width="600" height="384" alt="pgAdmin4_PrRwrKk2YI" src="https://github.com/user-attachments/assets/a2ebc012-df12-417f-92b7-6bfbfccd6ee9" />

<br>
<br>

4️⃣ Customer Segmentation & Top Performer Ranking (RANK())
Used RANK() OVER (PARTITION BY Region ORDER BY Revenue DESC) window function to identify the #1 Top Customer in each geographic region.

Segmented customer performance across Corporate, Small Business, and Consumer groups.
<br>
<br>
<img width="389" height="284" alt="1XChnXLUe5" src="https://github.com/user-attachments/assets/ae734845-a0eb-4464-b115-dde6158e1431" />
<br>
<br>
SQL
-- Top Customer in Each Region using Window Function
SELECT *
FROM (
    SELECT s.Region,
           s.Customer_Name,
           SUM(s.Sales_Amount) AS Revenue,
           RANK() OVER (PARTITION BY s.Region ORDER BY SUM(s.Sales_Amount) DESC) AS rnk
    FROM Sales_Data s
    GROUP BY s.Region, s.Customer_Name
) ranked
WHERE rnk = 1;
<br>
<br>
<img width="330" height="269" alt="jyKV9qPd4k" src="https://github.com/user-attachments/assets/d1b813cc-39e9-470e-9424-2867ba9fcfff" />
<br>
<br>
<img width="195" height="211" alt="pgAdmin4_7f3UATAbzn" src="https://github.com/user-attachments/assets/f2948dbe-ad46-4588-aa25-d3aa8ee18b65" />
<br>
<br>
<br>

5️⃣ Time-Series & Month-over-Month (MoM) Growth Analysis (LAG())
Computed cumulative running totals for revenue across consecutive years and months.

Employed the LAG() window function to calculate month-over-month revenue growth rate (%) and trend directional changes.
<br>
<br>
<img width="960" height="450" alt="pgAdmin4_zEpz60tvzR" src="https://github.com/user-attachments/assets/d7795f51-46a7-40b3-ae5f-c8ec37386f31" />
<br>
<br>
SQL
-- Month-over-Month Revenue Growth Percentage using LAG()
	with 
	monthly_sales as
	(select to_char(date,'yyyy-mm')as month,sum(sales_amount)as revenue from sales_data group by month)
	select month,revenue,coalesce(lag(revenue)over(order by month),0)as privious_revenue,
	coalesce(revenue-lag(revenue)over(order by month),0)as differnce_revenue,
	coalesce(round((revenue - lag(revenue)over(order by month))/(lag(revenue)over(order by month))*100,2 ),0)||'%'as percentage
	from monthly_sales
  order by month;
<br>
<br>
<br>

💡 Key Business Insights Uncovered
1) Top Revenue Driver: The West Region generated the highest total sales volume, while maintaining strong profit margins.
<br>
<br>
<img width="462" height="203" alt="jZF0aS3rzl" src="https://github.com/user-attachments/assets/0c49c645-7566-4903-bd0c-9f1c49fe7353" />
<br>
<br>
2) MoM Trend:  instantly see how the business is performing this month compared to the previous month.
<br>
<br>
<img width="960" height="450" alt="pgAdmin4_zEpz60tvzR" src="https://github.com/user-attachments/assets/2523902c-137e-4307-b527-2f1c1e597da4" />
<br>
<br>
3) Customer Value: Top-ranked enterprise customers contributed significantly to overall revenue, highlighting key accounts       for VIP retention programs.
<br>
<br>
<img width="389" height="284" alt="1XChnXLUe5" src="https://github.com/user-attachments/assets/b80b833f-1cb2-4225-9785-623e7abf7422" />
<br>
<br>
4) Target Tracking: Budget variance queries pinpointed regions that missed quarterly target goals, allowing operations to       reallocate marketing spending.
