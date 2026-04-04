Customer Review & Satisfaction Analysis
-----------------------------------------------------------------------------------------------------------------------
Objective
-----------------------------------------------------------------------------------------------------------------------
1. Measure customer satisfaction
2. Analyze impact of delivery on ratings
3. Identify category-wise feedback

Logic
------------------------------------------------------------------------------------------------------------------------  
1. Average rating using AVG()
2. Linked delivery status with reviews
3. Category-wise rating aggregation

<Details>
  
-- Average Rating
Select 
  	Round(avg(Review_score),1) as Average_Ratings
from Reviews

-- Delivery impact on ratings
Select
	Case
	 	When Date(o.order_delivered_customer_date) > Date(o.order_estimated_delivery_date) Then 'Delayed'
		When Date(o.order_delivered_customer_date) < Date(o.order_estimated_delivery_date) Then 'Early'
		Else 'On-Time'
	End As Delivery_Status,
	Round(avg(r.review_score),1) as Average_review_score,
	Count(*) as Total_orders
from Orders o 
join Reviews r
on r.order_id = o.order_id
group by Delivery_status
Order by total_orders desc

-- Category wise Rating
Select
	 pt.Product_category,
	 Round(Avg(R.review_score),1) As Average_review_score,
	 Count(*) as Total_orders
From Reviews R
Join 
	Orders o ON r.order_id = o.order_id
Join
	Order_items oi ON o.order_id = oi.order_id
Join 
	Product_category pt on Oi.product_id = pt.product_id
Group by pt.Product_category
order by Average_review_score

</details>  

Key Insights
-------------------------------------------------------------------------------------------------------------------------  
1. Delayed and On-time deliveries lead to lower ratings
2. Most ratings fall within a specific range (2-4)
3. Some categories consistently receive better reviews
