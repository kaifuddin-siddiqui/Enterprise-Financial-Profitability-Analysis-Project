SELECT * FROM sales_data;
SELECT * FROM customer_data;
SELECT * FROM budget_data;
SELECT * FROM expense_data;


--1)Total Revenue
--i)Total Revenue by product
CREATE view total_Revenue_by_product as 
SELECT product,SUM(quantity)as total_order,
SUM(before_discount_amount)as total_revenue_before_discount,
SUM(discount_amount)as total_discount,
 CAST(SUM(discount_amount)/SUM(before_discount_amount)*100 AS DECIMAL(10,0))||'%'AS discount_percent,
SUM(sales_amount)as Total_revenue,
CASE
WHEN(sum(before_discount_amount)-SUM(sales_amount))=SUM(discount_amount)THEN
'correct'ELSE'not' END AS validation_check
FROM sales_data
group by product
order by total_revenue desc;

SELECT*FROM total_Revenue_by_product;


--ii)Total Revenue by category

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

select * from total_revenue_by_category;

--iii)Total Revenue by region
create view total_revenue_by_region as
SELECT region,sum(quantity)as total_orders,
sum(before_discount_amount) as total_revenue_before_discount,
sum(discount_amount)as total_discount,
cast(sum(discount_amount)/sum(before_discount_amount)*100 as decimal(10,2))||'%' as discount_in_percent,
sum(sales_amount) as total_revenue,
case
when(sum(before_discount_amount)-sum(sales_amount))= sum(discount_amount)
then 'correct'else'not' end as checking
from sales_data
group by region
order by total_revenue desc;

select * from total_revenue_by_region;

--2)total_expenses
--i)total_expense_by_region
create view total_expense_by_region as
select region,sum(amount)as total_expense from expense_data
group by region
order by total_expense desc;

select*from total_expense_by_region;

--ii)total_expense_by_category
create view total_expense_by_category as
select expense_category, 
sum(amount)as total_expense from expense_data
group by  expense_category
order by total_expense desc;

select*from total_expense_by_category;


--3)Region Wise Revenue vs Expense vs Profit_and_loss
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


select *from actual_revenue;


---4)rigion_wise_budget_revenue_vs_expense_vs_profit_and_loss
create view budget_revenue as
select region,sum(budget_revenue)as budget_revenue,sum(budget_expense) 
as budget_expense,
case
when sum(budget_revenue)>sum(budget_expense)
then sum(budget_revenue)-sum(budget_expense)else sum(budget_expense)-sum(budget_revenue)
end as profit_and_loss_EBITDA,
case
when sum(budget_revenue)>sum(budget_expense)then'profit'else'loss' end as statement
from budget_data
group by region;

SELECT*FROM budget_revenue;

--i)budget_revenue_in_percent
select *, cast((budget_expense)/(budget_revenue)*100 as decimal(10,2))||'%'
as expense_percent,
cast((profit_and_loss_ebitda)/(budget_revenue)*100 as decimal(10,2))||'%'
as profit_percent_EBITDA from budget_revenue;

---5)regionwise_budget_data_vs_actual_data

 select a.region, e.budget_revenue as budget_revenue,a.revenue as actual_revenue,
 a.revenue-e.budget_revenue as difference_revenue,
e.budget_expense as budget_expense, a.expense as actual_expense,
a.expense-e.budget_expense as differnece_expense,
 e. profit_and_loss_EBITDA as budget_profit_and_loss,
 e.statement as budget_statement,
 a. profit_and_loss_EBITDA as actual_profit_and_loss,
 a.statement as acutal_statement
  from actual_revenue a
 join budget_revenue e
 on a.region=e.region;

---6)Budget vs Actual Revenue_by_region
with
actual_revenue as
(select region,sum(sales_amount) as actual_revenue from sales_data group by region),
budget_revenue as
(select region, sum(budget_revenue)as budget_revenue from budget_data group by region)
select a.region, a.actual_revenue,b.budget_revenue,
(a.actual_revenue-b.budget_revenue) as variance_or_difference,
cast((a.actual_revenue-b.budget_revenue)/b.budget_revenue*100 as decimal(10,2))||'%' as variance_or_difference_percentage,
case
when a.actual_revenue>b.budget_revenue then 'achive'else'miss_target'end as status
from actual_revenue a
join budget_revenue b
on a.region=b.region;

 --7)monthly_revenue
SELECT to_char(date,'yyyy-mm') AS Month,
       SUM(Sales_Amount) AS Monthly_Revenue
FROM Sales_Data
GROUP BY Month
ORDER BY Month;

--8)monthly_budget_vs_actual_revenue
create view month_budget_vs_actual_revenue as 
with
actual_revenue as
(select to_char(date,'yyyy-mm') as month,sum(sales_amount) as actual_revenue from sales_data group by month),
budget_revenue as
(select to_char(month,'yyyy-mm')as month, sum(budget_revenue)as budget_revenue from budget_data group by month)
select a.month, coalesce (a.actual_revenue,0)as actual_revenue,coalesce (b.budget_revenue,0)as budget_revenue,
coalesce(a.actual_revenue-b.budget_revenue,0) as variance_or_difference,
coalesce(cast((a.actual_revenue-b.budget_revenue)/b.budget_revenue*100 as decimal(10,2)),0)||'%' as variance_or_difference_percentage
from actual_revenue a
left join budget_revenue b
on a.month=b.month
order by month;

select * from month_budget_vs_actual_revenue;

--i)month_budget_vs_actual_revenue with status
select month,actual_revenue,budget_revenue,variance_or_difference,
variance_or_difference_percentage,
case
when actual_revenue>budget_revenue then 'achive'else 'miss_target' end as status
from  month_budget_vs_actual_revenue;

--9)segment_revenue_with_customers
create view segment_revenue as
with
sale_and_revenue as
(select customer_name,sum(sales_amount)as revenue from sales_data group by customer_name),
customer_segment as
(select customer_name,segment from customer_data group by customer_name,segment)
select c.customer_name,c.segment, coalesce(s.revenue,0)as revenue
from sale_and_revenue s
right join customer_segment c
on s.customer_name=c.customer_name
order by revenue;

select * from segment_revenue order by customer_name ;

---i)segment_revenue
 select segment,sum(revenue)as revenue from segment_revenue group by segment
 order by revenue;


--10)Top Customer in Each Region
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

--11)Running Total_by_year
select to_char(date,'yyyy')as year,sum(sales_amount)as revenue,
sum(sum(sales_amount)) over ( order by to_char(date,'yyyy')asc)as running_total
from sales_data group by to_char(date,'yyyy')
order by year asc;

--12)Running Total_by_month
select to_char(date,'yyyy-mm')as month,sum(sales_amount)as revenue,
sum(sum(sales_amount)) over (partition by to_char(date,'yyyy') order by to_char(date,'yyyy-mm')asc)as running_total
from sales_data group by to_char(date,'yyyy-mm'),to_char(date,'yyyy')
order by month asc;


select to_char(date,'yyyy') as year,sum(sales_amount)as total_revenue from sales_data
where to_char(date,'yyyy')='2023'group by to_char(date,'yyyy');

--13)Month-over-Month Growth_and_down %
	with 
	monthly_sales as
	(select to_char(date,'yyyy-mm')as month,sum(sales_amount)as revenue from sales_data group by month)
	select month,revenue,coalesce(lag(revenue)over(order by month),0)as privious_revenue,
	coalesce(revenue-lag(revenue)over(order by month),0)as differnce_revenue,
	coalesce(round((revenue - lag(revenue)over(order by month))/(lag(revenue)over(order by month))*100,2 ),0)||'%'as percentage
	from monthly_sales order by month;

















	




