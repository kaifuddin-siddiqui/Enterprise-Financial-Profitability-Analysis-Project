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
2. `customer_data` - Customer details, segments (Corporate, Small Business, Consumer).
3. `expense_data` - Operational expenses categorized by Marketing, Logistics, Salaries, etc.
4. `budget_data` - Regional and annual budget targets.

<br>

<!-- Upload pgAdmin Database & Schema View Screenshot Below -->
<img width="960" alt="PostgreSQL pgAdmin Database Schema" src="https://github.com/user-attachments/assets/YOUR_IMAGE_ID_HERE" />

<br><br>

---

## 📊 Key Business Analysis & SQL Implementation

### 1️⃣ Revenue & Discount Analysis (Product, Category & Region)
* Created modular Views (`total_revenue_by_product`, `total_revenue_by_category`, `total_revenue_by_region`) to aggregate total sales, total orders, discount percentages, and net revenue.
* Implemented automated validation checks (`CASE WHEN ... END AS validation_check`) to verify calculation accuracy across transactions.

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

2️⃣ Expense vs. Revenue & Regional Profitability (EBITDA)
Calculated regional net profitability by comparing actual sales against operational expenses.

Used conditional logic to flag performance status as profit or loss.

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

3️⃣ Budget vs. Actual Variance Analytics
Analyzed performance targets by comparing budgeted revenue against actual revenue per region and per month.

Calculated variance percentage and automatically flagged targets as achieve or miss_target.



4️⃣ Customer Segmentation & Top Performer Ranking (RANK())
Used RANK() OVER (PARTITION BY Region ORDER BY Revenue DESC) window function to identify the #1 Top Customer in each geographic region.

Segmented customer performance across Corporate, Small Business, and Consumer groups.

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


5️⃣ Time-Series & Month-over-Month (MoM) Growth Analysis (LAG())
Computed cumulative running totals for revenue across consecutive years and months.

Employed the LAG() window function to calculate month-over-month revenue growth rate (%) and trend directional changes.

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


💡 Key Business Insights Uncovered
1) Top Revenue Driver: The West Region generated the highest total sales volume, while maintaining strong profit margins.

2) MoM Trend:  instantly see how the business is performing this month compared to the previous month.

3) Customer Value: Top-ranked enterprise customers contributed significantly to overall revenue, highlighting key accounts       for VIP retention programs.

4) Target Tracking: Budget variance queries pinpointed regions that missed quarterly target goals, allowing operations to       reallocate marketing spending.
