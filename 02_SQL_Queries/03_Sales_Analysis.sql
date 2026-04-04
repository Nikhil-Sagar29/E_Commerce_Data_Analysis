Sales & Revenue Trend Analysis
-----------------------------------------------------------------------------------------------------------
Objective
---------------------------------------------------------------------------------------------------------- 
1. Analyze revenue trends over time
2. Identify growth patterns
3. Understand peak sales periods

Logic
------------------------------------------------------------------------------------------------------------
1. Monthly aggregation using EXTRACT and TO_CHAR
2. Yearly trend using LAG() window function
3. Ranking months based on revenue

<Details>
  --- Total Revenue
select Round(sum(payment_value),0) as Total_Revenue from Payments

--- Montly wise Sales
select 
	To_char( o.order_purchase_timestamp,'FMMonth' ) as Month_name,
	sum(p.payment_value) As Total_Sales,
	Rank() over(Order by sum(p.payment_value) Desc) as Revenue_rank
from orders o 
join Payments p
on 
o.order_id = P.order_id
group by Month_name
order by total_sales desc

-- Trend Analysis (Year wise Growth)
Create View Trend_analysis as
with Trend_analysis as (
Select
	extract(year from o.order_purchase_timestamp) as Years,
	Rank() over(order by sum(p.payment_value) desc) as Revenue_rank,
	Round(sum(p.payment_value),0) as Total_sales
from Orders o
join payments p
on
o.order_id = p.order_id
group by  years
)
select * , 
	Round(
	Coalesce(Lag(Total_sales) over(order by years),0),0) as prev_years,
	Round(
	Coalesce(Total_sales - Lag(total_sales) over (order by years), 0 ),0) as growth,
	ROUND(
    COALESCE(
        (total_sales - LAG(total_sales) OVER (ORDER BY years)) 
        * 100.0 / LAG(total_sales) OVER (ORDER BY years),
    0), 2
) AS growth_percent
from trend_analysis
order by total_sales desc

-- Trend Analysis Short 
Select * from Trend_analysis

</Details>  

Key Insights
-----------------------------------------------------------------------------------------------------------
1. Certain months consistently generate higher revenue
2. Year-on-year growth trend identified
3. Revenue spikes indicate seasonal demand
