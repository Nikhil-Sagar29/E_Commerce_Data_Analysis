Exploratory Data Analysis (EDA) & Basic Metrics
-----------------------------------------------------------------------------------------------------------------
Objectives
-----------------------------------------------------------------------------------------------------------------
1. Understand dataset size and structure
2. Identify top cities and product categories
3. Analyze overall sales distribution
	
Logic
------------------------------------------------------------------------------------------------------------------  
1. Used joins across orders, customers, payments, products
2. Aggregations:
    COUNT → volume
    SUM → revenue
    Grouping by city, category, and reviews
  
<Details>
  
-- Dataset Preview
Select 
	o.order_id, o.order_purchase_timestamp, c.customer_id, c.customer_city,
	pt.product_category ,sum(p.payment_value) as Total_Payment
From 
    orders o 
	join customers c 
	ON o.customer_id = c.customer_id
	join Order_items oi 
	on O.order_id = oi.order_id
	join product_category pt 
	on pt.product_id = oi.product_id
	join payments p 
	on p.order_id = o.order_id
	group by o.order_id, o.order_purchase_timestamp, c.customer_id, c.customer_city,
		pt.product_category


--- Total Orders
select count(*) as Total_Orders from orders

--- Top 10 Cities with most product sold
select customer_city,count(customer_city) as Total_City from customers
group by customer_city
order by Total_city desc
limit 10

--- Total Quantity sold
select count(*) as Total_items_sold from order_items

--- Most number of product category sold with sales
Select 
    pt.product_category, 
    Sum(p.payment_value) As total_sales
From Order_items o
Join product_category pt
    On o.product_id = pt.product_id
Join payments p
    On o.order_id = p.order_id
Group By pt.product_category
Order By total_sales Desc
Limit 20

--- Total quantity sold in each city with Category
Select 
    c.customer_city,
    COUNT(*) AS total_items_sold
From customers c
Join orders o ON c.customer_id = o.customer_id
Join order_items oi ON o.order_id = oi.order_id
Group By c.customer_city
Order By total_items_sold DESC
Limit 20;

--- Ratings Scores
select review_score, count(*) As Total_score
from reviews
group by review_score
order by total_score desc

</details>

Key Insights
------------------------------------------------------------------------------------------------------- 
1. Identified top cities with highest order volume
2. Found most sold product categories
3. Total items sold gives platform scale
4. Review distribution shows customer sentiment trend



