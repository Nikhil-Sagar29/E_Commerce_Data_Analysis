Order Delivery Performance & Delay Analysis
---------------------------------------------------------------------------------------------------------------------------
Objective
--------------------------------------------------------------------------------------------------------------------------  
1. Evaluate delivery efficiency
2. Identify delays and their causes
3. Analyze delivery time patterns

Logic
------------------------------------------------------------------------------------------------------------------------- 
1. Created delivery status using CASE:
                  Early / On-Time / Delayed
2. Calculated delivery time using:
                  (delivered_customer - delivered_carrier)
3. Split analysis into:
                  Normal deliveries (<60 days)
                  Extreme delays (>60 days)

<Details>

-- Calculate Delivery time
Select 
	Order_id,
	Order_purchase_timestamp,
	Order_delivered_customer_date,
	Order_estimated_delivery_date,
    Round
	(Extract(Epoch From (order_delivered_customer_date - order_purchase_timestamp))/86400,
	0) As delivery_days,
	Order_Status
from Orders
where Order_delivered_customer_date is NOT NULL

-- Classifying the delivery Date
Create View Delivery_classification as
Select 
	pt.Product_category,
	Case
	  When Date(o.Order_delivered_customer_date) > Date(o.Order_estimated_delivery_date) then 'Delayed'
	  When Date(o.Order_delivered_customer_date) < Date(o.order_estimated_delivery_date) then 'Early'
	Else 'On-Time'  
	End As Delivery_status,
	count(*) As total_orders
from Orders	o
   Join order_items oi 
   on o.order_id = oi.order_id
   join product_category pt
   on oi.product_id = pt.product_id
where o.order_delivered_customer_date is not null
group by Pt.product_category, Delivery_status
order by Delivery_status,total_orders desc

-- Short View for Delivery_classification
select * from Delivery_classification
	
--- Normal Delivery days (<60 days)
Create View Normal_delivery_days as
Select 
	pt.product_category,
	ROUND(AVG(Extract(EPOCH from (o.order_delivered_customer_date - o.order_Delivered_carrier_date)) / 86400),
	0) AS avg_delivery_time,
    Round(MAX(Extract(EPOCH from (o.order_delivered_customer_date - o.order_Delivered_carrier_date)) / 86400),
	0) AS max_delivery_time
from Orders o 
join Order_items oi
on o.order_id = oi.order_id
join product_category pt
on pt.product_id = oi.product_id
Where
	o.order_delivered_customer_date is not null
	And o.order_delivered_carrier_date is not null
	And o.order_Delivered_customer_date > o.order_delivered_carrier_date
	And o.order_Delivered_customer_date - o.order_delivered_carrier_date < interval '60 Days'
group by pt.Product_category
order by max_Delivery_time desc

-- Easy View for Normal delivery analysis
Select * from Normal_delivery_days

-- Extreme Delay Analysis (>60 days)
Create View Extreme_delay_analysis as
Select 
	pt.product_category,
	Count(*) as Extreme_orders,
    Round(MAX(Extract(EPOCH from (o.order_delivered_customer_date - o.order_Delivered_carrier_date)) / 86400),
	0) AS max_delivery_time,
	ROUND(
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 
    0
) AS percentage
from Orders o 
join Order_items oi
on o.order_id = oi.order_id
join product_category pt
on pt.product_id = oi.product_id
Where
	o.order_delivered_customer_date is not null
	And o.order_delivered_carrier_date is not null
	And o.order_Delivered_customer_date > o.order_delivered_carrier_date
	And o.order_Delivered_customer_date - o.order_delivered_carrier_date >= interval '60 Days'
group by pt.Product_category
order by max_Delivery_time desc

-- Easy view for extreme delay analysis
select * from extreme_delay_analysis

</Details>

Key Insights
--------------------------------------------------------------------------------------------------------------------- 
1. Majority deliveries fall under normal range
2. Extreme delays are rare but significant
3. Certain product categories show higher delays
4. Delivery delays impact customer satisfaction





